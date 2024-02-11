local types = require(script.Parent.Parent.types)

function createStore<T>(initialState: T | types.Store<T>)
    local state = initialState

    local proxy = setmetatable({}, {
        __index = function(_, key)
            return rawget(state, key)
        end,
        __newindex = function(_, key, value)
            rawset(state, key, value)
        end
    })

    local function setState<T>(newState: T | types.Store<T>)
        state = newState
    end

    return proxy, setState
end

return createStore
