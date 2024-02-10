--!nostrict

local make = require(script.Parent.make)

function render(instance: Instance, root: Instance?)
    local _root = nil
    if root == nil then
        _root = make "ScreenGui" {
            Name = "MonsoonRoot",
            Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"),
        }
    else
        _root = root
    end

    instance.Parent = _root
end

return render
