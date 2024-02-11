local rs = game:GetService("RunService")
local events = require(script.Parent.events)

function createEffect<T>(fn: ((v: T) -> T), dependency: T?)
    local previousValue = dependency()

    local disconnect = rs.Heartbeat:Connect(function()
        local currentValue = dependency()

        if previousValue ~= currentValue then
            previousValue = currentValue
            fn(currentValue)
        end
    end)

    events:add(disconnect)

    return function()
        disconnect()
    end
end

return createEffect
