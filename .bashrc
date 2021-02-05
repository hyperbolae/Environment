PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# My alias
alias ls='ls -h --color=auto'
alias la='ls -Ah --color=auto'
alias ll='ls -AlhF --color=auto'
alias gcc='gcc-9'
alias g++='g++-9'
alias python='python3'

# kubectl completer
# https://kubernetes.io/docs/tasks/tools/install-kubectl/#enable-kubectl-autocompletion
source <(kubectl completion bash)
alias k=kubectl
complete -F __start_kubectl k

# bash parameter completion for the dotnet CLI
# https://stackoverflow.com/questions/36724209/disable-beep-of-linux-bash-on-windows-10
_dotnet_bash_complete()
{
  local word=${COMP_WORDS[COMP_CWORD]}

  local completions
  completions="$(dotnet complete --position "${COMP_POINT}" "${COMP_LINE}" 2>/dev/null)"
  if [ $? -ne 0 ]; then
    completions=""
  fi

  COMPREPLY=( $(compgen -W "$completions" -- "$word") )
}
complete -f -F _dotnet_bash_complete dotnet

# Disable beep in less
# https://stackoverflow.com/questions/36724209/disable-beep-of-linux-bash-on-windows-10
export LESS="$LESS -R -Q"
