alias ls='ls -h --color=auto'
alias la='ls -Ah --color=auto'
alias ll='ls -AlhF --color=auto'

# kubectl completer
# https://kubernetes.io/docs/tasks/tools/install-kubectl/#enable-kubectl-autocompletion
source <(kubectl completion bash)
alias k=kubectl
complete -F __start_kubectl k
