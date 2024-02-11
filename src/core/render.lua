--!nostrict

local bake = require(script.Parent.bake)
local queue = require(script.Parent.queue)

function render(instance: Instance, root: Instance?)
    local _root = nil
    if root == nil then
        _root = bake "ScreenGui" {
            Name = "SolidRoot",
            Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"),
        }
    else
        _root = root
    end

    instance.Parent = _root

    if #queue:get() ~= 0 then
        for _, q in queue:get() do 
            if q.kind == "onMount" and typeof(q.fn) == "function" then 
                q.fn()

                queue:remove(q)
            end  
        end
    end

    return function()
        _root:Destroy()
    end
end

return render
