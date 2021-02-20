function unison-sync() {
  # Usage:
  # unison-sync <path-to-your-local-workplace> ssh://<username>@<remote-hostname>/<remote-workplace>
  # e.g. unison-sync /workplace ssh://ztlevi@kuro//workplace
  # You need to remove local or remote ~/.unison cache if failed
  if ! pgrep unison >/dev/null; then
    while :; do
      echo "Starting unison process... " $(date)
      unison -ui text default.prf $1 $2
      echo "Unison process exited.  Sleeping before restarting.  ^C to exit. " $(date)
      sleep 30
    done
  fi
}
