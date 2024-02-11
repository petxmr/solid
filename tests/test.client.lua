local solid = require(script.Parent.Parent.solid)

local bake = solid.bake
local render = solid.render

local createSignal = solid.createSignal
local createEffect = solid.createEffect
local createStore = solid.createStore
local createMutable = solid.createMutable

local For = solid.For

local onMount = solid.onMount

local count, setCount = createSignal(0)

local state, setState = createStore({ value = 20 })

print(state.value)

setState({ value = 90 })

print(state.value)

local user; user = createMutable({
    firstName = "John",
    lastName = "Smith",

    getFullName = function()
        return `{user.firstName} {user.lastName}`
    end,

    setFullName = function(value: string)
        local names = value:split(" ")
        user.firstName = names[1]
        user.lastName = names[2]
    end
})

print(user.getFullName())

user.setFullName("Wrong Wick")

print(user.getFullName())

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

            AnchorPoint = Vector2.new(0, 1),
            Position = UDim2.new(0, 10, 1, -10),
            
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
