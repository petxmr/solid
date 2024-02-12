local solid = require(script.Parent.Parent.solid)

-- basic exports, bake (create element), render (mount element to a root)

local bake = solid.bake
local render = solid.render

-- states, reactivity exports

local createSignal = solid.createSignal
local createEffect = solid.createEffect
local createStore = solid.createStore
local createMutable = solid.createMutable

-- helper functions

local For = solid.For

-- events for certain lifecycle actions

local onMount = solid.onMount

-- signal example.

local count, setCount = createSignal(0)

-- store example

local state, setState = createStore({ value = 20 })

print(state.value) -- 20

setState({ value = 90 })

print(state.value) -- 90

-- mutable example

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

print(user.getFullName()) -- John Smith

user.setFullName("Wrong Wick") -- set to Wrong Wick

print(user.getFullName()) -- Wrong Wick

-- create effect example, dependent on the count signal. will fire the function whenever count changes

createEffect(function(v)
    print("Count is:", v)
end, count)

-- on mount lifecycle function

onMount(function()
    print("App has been successfully mounted!")
end)

-- component example

local function App()

    -- button, sets count when pressed

    return bake "TextButton" {
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
            setCount(count() + 1) -- increment the count signal
        end,

        bake "UICorner" { CornerRadius = UDim.new(0, 6), }
    }
end

-- renders the app component to the root (if a root isn't passed, one will be created)

render(App())
