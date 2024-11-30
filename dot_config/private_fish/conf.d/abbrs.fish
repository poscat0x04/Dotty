if status is-interactive
    alias grep 'grep --color=always'
    alias rg 'rg --color=always'
    alias ip 'ip --color=auto'
    alias bridge 'bridge --color=auto'
    alias tc 'tc -color=auto'
    alias mkdir 'mkdir -p'
    alias rm 'rm -i'
    alias mv 'mv -i'
    alias cp 'cp -i'
    alias ln 'ln -i'
    alias ls 'ls --color=always'
    alias df 'df -kh'
    alias du 'du -kh'
    alias free 'free -h'
    alias get 'curl --continue-at - --location --progress-bar --remote-name --remote-time'
    alias tree 'tree -C'
    abbr -a l 'ls -1A'
    abbr -a la 'll -A'
    abbr -a lA 'll -a'
    abbr -a lc 'll -c'
    abbr -a lk 'll -Sr'
    abbr -a ll 'ls -lh'
    abbr -a lm 'la | less -R'
    abbr -a lr 'll -R'
    abbr -a lt 'll -tr'
    abbr -a lu 'lt -u'
    abbr -a lx 'll -XB'

    abbr -a popd 'prevd'
    abbr -a unset 'set --erase'
    abbr -a which 'type'

    abbr -a pb 'curl --data-binary @- https://pb.nichi.co'

    abbr -a cm 'chezmoi'

    if test -x $(which kitten); and test -n $KITTY_WINDOW_ID
        alias ssh 'kitten ssh'
    end
end
