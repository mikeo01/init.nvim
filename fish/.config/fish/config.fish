if status is-interactive
    # Commands to run in interactive sessions can go here
    set -gx PATH $PATH /opt/nvim-linux-x86_64/bin
    set -gx PATH $PATH ~/google-cloud-sdk/bin

    if not set -q TMUX
         tmux
    end
end

alias --save gpsup='git push --set-upstream origin $(git branch --show-current)'
