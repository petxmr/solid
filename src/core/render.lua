--!nostrict

local bake = require(script.Parent.bake)

function render(instance: Instance, root: Instance?)
    local _root = nil
    if root == nil then
        _root = bake "ScreenGui" {
            Name = "MonsoonRoot",
            Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"),
        }
    else
        _root = root
    end

    instance.Parent = _root
end

return render
