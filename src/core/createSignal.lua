function createSignal(initialValue: any, options: {[string]: any})
    local signal = {}
    signal.value = initialValue

    local equals = options and options.equals or nil

    function signal.get()
        return signal.value
    end

    function signal.set(newValue: any)
        if equals then
            if equals(signal.value, newValue) then
                return
            end
        else
            if signal.value == newValue then
                return
            end
        end

        signal.value = newValue
    end

    return signal.get, signal.set
end

return createSignal
