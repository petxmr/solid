local solid = require(script.Parent.Parent.solid)

local bake = solid.bake
local render = solid.render

local createSignal = solid.createSignal
local createEffect = solid.createEffect

local onMount = solid.onMount

local count, setCount = createSignal(0)

createEffect(function(v)
    print("Count is:", v)
end, count)

onMount(function()
    print("App has been successfully mounted!")
end)
    
local function App()
    return bake "ScreenGui" {
        Name = "App",
    
        bake "TextButton" {
            Name = "Button",
            Text = "Click Me",
            
            FontFace = Font.new(
                "rbxasset://fonts/families/GothamSSm.json",
                Enum.FontWeight.Medium,
                Enum.FontStyle.Normal
            ),

            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextSize = 16,
            BackgroundColor3 = Color3.fromRGB(42, 94, 191),

            Activated = function()
                setCount(count() + 1)
            end,

            bake "UICorner" { CornerRadius = UDim.new(0, 6), }
        }
    }
end

render(App())
