
# Setting PATH for Python 3.4
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Tex/Distributions/Programs/texbin:/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
export PATH
# ALIASES
PS1="\n\[\033[38;5;2m\]\t \[\033[38;5;14m\]\w\[\033[38;5;7m\]:\[\033[38;5;15m\]\n\[\033[38;5;7m\]\\$\[\033[38;5;15m\] \[\033[0m\]"
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ls='ls -hG'
alias py='python'
alias py3='python3'
alias tufts='ssh jfan03@homework.cs.tufts.edu'
alias tuftsl='ssh jfan03@linux.cs.tufts.edu'
alias sublime='open -a /Applications/Sublime\ Text.app '
alias vimr='vim -R'
alias todos='find . | xargs grep -n TODO | grep -v image | grep -v checkpoint'
alias jp='jupyter notebook'

# Virtual Environment aliases
alias mkvenv='mkvirtualenv'
alias lsvenv='lsvirtualenv'
alias rmvenv='rmvirtualenv'
alias vexit='deactivate'

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/dev
export VIRTUALENVWRAPPER_SCRIPT=/usr/local/bin/virtualenvwrapper.sh
export PYTHONPATH=/Users/Jason_Fan/Dev/caffe/python:/usr/local/lib/python2.7/site-packages:$PYTHONPATH
source /usr/local/bin/virtualenvwrapper.sh

