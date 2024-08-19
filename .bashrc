# Util
alias ls='exa --icons'
alias la='exa --icons -a'
alias ll='exa --icons -l'
alias lla='exa --icons -la'
alias cat='bat -p'

# Git
alias gap='git add -p'
alias st='git status'
alias cm='git commit'
alias am='git commit --amend'
alias amn='git commit --amend --no-edit'
alias push='git push'
alias diff='git diff'

# Prompt, show user and hostname when connected over SSH.
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    # [hh:mm] user@host directory branch |
    PS1='\[\e]2;\u@\h: \w\a\]\e[0$(fail_colour)m[\A]\e[0;34m \u@\h\e[0;32m \W \e[0;93m$(branch)\e[0m| '
else
    # [hh:mm] directory branch |
    PS1='\[\e]2;\u@\h: \w\a\]\e[0$(fail_colour)m[\A]\e[0;32m \W \e[0;93m$(branch)\e[0m| '
fi

# Output ansi escape red if previous command failed.
alias fail_colour='[ $? -ne 0 ] && echo -n ";31"'

# Output current git branch if any.
alias branch='b=$(git rev-parse --abbrev-ref HEAD 2> /dev/null); [ $? -eq 0 ] && echo -n "$b "'

# Load BMENU_OPTS into env.
if [[ -f "~/.config/bemenu/opts.sh" ]]; then
    source ~/.config/bemenu/opts.sh
fi

export NEOVIDE_FORK=true
