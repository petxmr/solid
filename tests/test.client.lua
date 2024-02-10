local solid = require(script.Parent.Parent.solid)

local bake = solid.bake
local render = solid.render

local function App()
    return bake "ScreenGui" {
        Name = "App",
    
        bake "Frame" { }
    }
end

render(App())
