_cache jenv init - --no-rehash
env_rehash_cmds+=("jenv rehash")

_is_callable google-java-format && alias format-all-java='google-java-format -i **/*.java'
alias idea-format="'/Applications/IntelliJ IDEA.app/Contents/bin/format.sh'"
