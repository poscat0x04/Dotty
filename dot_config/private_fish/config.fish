if status is-interactive
    set -U fish_greeting
    fish_vi_key_bindings

    function fish_title
        set -q argv[1]; or set argv fish
        echo (fish_prompt_pwd_dir_length=1 prompt_pwd) : $argv;
    end

    if test -e ~/Xilinx/Vivado/2024.1/settings64.sh
        bass source ~/Xilinx/Vivado/2024.1/settings64.sh
    end

    if not test -f $__fish_data_dir/vendor_completions.d/chezmoi.fish;
       and command -q chezmoi
        chezmoi completion fish | source
    end

    if command -q direnv
        direnv hook fish | source
    else
        echo warning: direnv not found in path
    end

    if command -q starship
        starship init fish | source
    else
        echo warning: starship not found in path
    end
end
