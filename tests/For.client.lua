local solid = require(script.Parent.Parent.solid)

local bake = solid.bake
local render = solid.render

-- For util function example

local For = solid.For

local function CreateDays()
    -- create a table containing test items.
    local days = {
        "Monday",
        "Tuesday",
        "Wednesday",
        "Thursday",
        "Friday",
        "Saturday",
        "Sunday",
    }

    -- create a test container to hold each created element
    local container = bake "Frame" {
        Name = "Container",
        Size = UDim2.fromOffset(0, 400),
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundColor3 = Color3.fromRGB(20, 20, 20),

        bake "UIListLayout" { SortOrder = Enum.SortOrder.LayoutOrder, Wraps = true }
    }

    -- the For function will iterate over the each table, and a fallback function can be called if it fails to.
    For({ each = days }, function(i, item)
        -- create an element, and parent it to the container
        -- sort by index
        -- set text to day (item = days[i])
        bake "TextLabel" {
            Name = item,
            Text = item,
            LayoutOrder = i,
            Parent = container,
        }
    end)

    -- the For function can be used as a condition aswell
    -- you can check if the For iteration has completed successfully:

    if For({ each = days }, function(i, item)
        bake "TextLabel" {
            Name = item,
            Text = item,
            LayoutOrder = i,
            Parent = container,
    } end) then
        print("Day creation passed without fail!")    
    end

    -- but this looks confusing doesn't it, but you can just create the effector function before hand
    -- and just pass it through the arguments

    local function create(i, day)
        return bake "TextLabel" {
            Name = day,
            Text = day,
            LayoutOrder = i,
            Parent = container,
        }
    end

    if For({ each = days }, create) then
        print("Day creation passed without fail!")    
    end

    -- this looks much cleaner, and easier to read.

    return container
end

-- render the container into the root (ScreenGui)
render(CreateDays())
