alias gpg-restart="gpgconf --kill gpg-agent"

function test-ssh-connection() {
  server=$1         # server IP
  port=22           # port
  connect_timeout=5 # Connection timeout

  timeout $connect_timeout bash -c "</dev/tcp/$server/$port"
  if [[ $? -eq 0 ]]; then
    echo "SSH Connection to $server over port $port is possible"
    return 0
  else
    echo "SSH connection to $server over port $port is not possible"
    return 1
  fi
}

function generate-ssh-gpg-config() {
  # Test the ssh connection before you gneretae the ssh config that enables gpg forwarding
  # Args:
  # connection_name: e.g. kuro
  # hostname: e.g. 10.0.0.3
  # user: e.g. ztlevi
  #
  # Usage: generate-ssh-gpg-config kuro 10.0.0.3 ztlevi
  echo "Generating ssh config that enables gpg forwarding...\n"

  if [[ ${#@} -ne 3 ]]; then
    echo "generate-ssh-gpg-config has wrong input arguments! Your inputs: \`${@}\`"
    echo "Usage: generate-ssh-gpg-config kuro 10.0.0.3 ztlevi"
  fi

  local connection_name=$1
  local hostname=$2
  local user=$3
  test-ssh-connection $hostname || return 1
  # Mapping the remote socket to local's extra socket
  local local_extra_socket=$(gpgconf --list-dir agent-extra-socket)
  local remote_socket=$(ssh "$user@$hostname" "gpgconf --list-dir agent-socket")

  test -f $HOME/.ssh/config || touch $HOME/.ssh/config
  cat <<EOF >>$HOME/.ssh/config
host ${connection_name}
  hostname ${hostname}
  user ${user}
  RemoteForward ${remote_socket} ${local_extra_socket}
  ForwardAgent yes
  ExitOnForwardFailure yes
EOF
}

function ssh-with-gpg-socket-deleted() {
  # You can either add `StreamLocalBindUnlink yes` to your /etc/ssh/sshd_config
  # Or, delete the remote gpg socket file before ssh.
  # Typically, kill gpg-agent will delete the socket files
  #
  # Args:
  #   connection_name: e.g. kuro
  #   hostname: e.g. 10.0.0.3
  #   user: e.g. ztlevi
  #
  # Usage: ssh-with-gpg-socket-deleted kuro 10.0.0.3 ztlevi

  # Start gpg-agent locally if not running
  if ! pgrep -x "gpg-agent" >/dev/null; then
    gpg-agent --homedir $HOME/.gnupg --use-standard-socket --daemon
  fi

  local connection_name=$1
  local hostname=$2
  local user=$3
  ssh "${user}@${hostname}" 'gpgconf --kill gpg-agent; rm -f $(gpgconf --list-dir agent-socket)'
  ssh "${connection_name}"
}
