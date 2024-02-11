-- creates a mutable store proxy object, to be used in stores. here updates are triggered only when values actually change.

local types = require(script.Parent.Parent.types)

function createMutable<T>(initialState: T | types.Store<T>)
    local state = initialState

    local proxy = setmetatable({}, {
        __index = function(_, key)
            return rawget(state, key)
        end,
        __newindex = function(_, key, value)
            if rawget(state, key) ~= nil then
                rawset(state, key, value)
            end
        end
    })

    return proxy
end

return createMutable
