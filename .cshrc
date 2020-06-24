# Add these lines to your ~/.cshrc.mine file on the linux grace machines...

# Colors!
set     red="%{\033[1;31m%}"
set   green="%{\033[0;32m%}"
set  yellow="%{\033[1;33m%}"
set    blue="%{\033[1;34m%}"
set magenta="%{\033[1;35m%}"
set    cyan="%{\033[1;36m%}"
set   white="%{\033[0;37m%}"
set     end="%{\033[0m%}" # This is needed at the end... :(

# Setting the actual prompt

set prompt="${yellow}%n${yellow}@%m${white}:${blue}%~${blue}${end}$ "

# Clean up
unset red green yellow blue magenta cyan yellow white end
