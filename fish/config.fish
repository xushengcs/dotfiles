set -g fish_greeting ""

# Yazi
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    command yazi $argv --cwd-file="$tmp"
    if read -z cwd < "$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

# nohup
function nh
    nohup $argv > /dev/null 2>&1 &
end

# ls
function ll
    ls -ahl $argv
end

# Starship
starship init fish | source
