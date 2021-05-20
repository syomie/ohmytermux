# You can put files here to add functionality separated per file, which
# will be ignored by git.
# Files on the custom/ directory will be automatically loaded by the init
# script, in alphabetical order.

# For example: add yourself some shortcuts to projects you often work on.
#
# brainstormr=~/Projects/development/planetargon/brainstormr
# cd $brainstormr

# 取消shell哔哔提示
setopt nobeep
alias q="quit|bye|exit"

function mcdir(){
    mkdir -p $1
    cd $1
}
