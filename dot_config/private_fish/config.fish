if status is-interactive
    # Commands to run in interactive sessions can go here
    set -U fish_greeting
    fish_vi_key_bindings

    alias cm='chezmoi'
    alias unset 'set --erase'
    alias grep="grep --color=auto"
    alias mkdir="mkdir -p"
    alias rm="rm -i"
    alias mv="mv -i"
    alias cp="cp -i"
    alias ln="ln -i"
    alias ls="ls --color=auto"
    alias df='df -kh'
    alias du='du -kh'
    alias free='free -h'
    alias get='curl --continue-at - --location --progress-bar --remote-name --remote-time'
    alias l='ls -1A'
    alias la='ll -A'
    alias lc='ll -c'
    alias lk='ll -Sr'
    alias ll='ls -lh'
    alias lm='la | less -R'
    alias lr='ll -R'
    alias lt='ll -tr'
    alias lu='lt -u'
    alias lx='ll -XB'
    alias tree='tree -C'

    alias popd='prevd'

    if test -x $(which kitten)
        alias ssh='kitten ssh'
    end

    function fish_title
        set -q argv[1]; or set argv fish
        # Looks like ~/d/fish: git log
        # or /e/apt: fish
        echo (fish_prompt_pwd_dir_length=1 prompt_pwd) : $argv;
    end

    if test -e ~/Xilinx/Vivado/2024.1/settings64.sh
        bass source ~/Xilinx/Vivado/2024.1/settings64.sh
    end

    if command -s chezmoi > /dev/null
        chezmoi completion fish | source
    end

    direnv hook fish | source
    starship init fish | source
end
