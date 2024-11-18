if status is-interactive
    function sync_history --on-event fish_postexec
        history merge
        history save
    end
end
