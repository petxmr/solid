--!nostrict

local defaultFont = Font.new("rbxasset://fonts/families/GothamSSm.json")

local defaultProperties = {
    Frame = {
        BackgroundColor3 = Color3.fromHex("#FFFFFF"),
        BorderSizePixel = 0,
        Size = UDim2.fromOffset(100, 100),
    },

    TextLabel = {
        FontFace = defaultFont,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 16,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Size = UDim2.fromOffset(200, 50),
    },

    TextBox = {
        FontFace = defaultFont,
        PlaceholderColor3 = Color3.fromRGB(172, 172, 172),
        PlaceholderText = "TextBox",
        TextColor3 = Color3.fromRGB(0, 0, 0),
        TextSize = 16,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Size = UDim2.fromOffset(200, 50),
        ClearTextOnFocus = false,
        ShowNativeInput = false,
    },

    TextButton = {
        FontFace = defaultFont,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 16,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Size = UDim2.fromOffset(200, 50),
    },
}

function bake<T>(className: string | T)
    return function(properties): Instance
        local passed, instance = pcall(Instance.new, className)
        assert(passed, `Failed to create instance of class '{className}'`)
    
        local defaults = defaultProperties[className]
        if defaults then
            for property, value in pairs(defaults) do
                instance[property] = value
            end
        end

        if properties then
            for property, value in pairs(properties) do
                if typeof(property) == "RBXScriptSignal" or typeof(value) == "function" then 
                    instance[property]:Connect(value)
                elseif typeof(property) == "Instance" or typeof(property) == "number" then
                    value.Parent = instance
                else
                    instance[property] = value
                end
            end

            if properties["Parent"] then
                instance.Parent = properties["Parent"]
            end
        end

        return instance
    end
end

return bake
 