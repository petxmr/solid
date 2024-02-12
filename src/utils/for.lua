local types = require(script.Parent.Parent.types)

function For(props: {
    each: {types.Store<any>},
    fallback: (() -> ())?,
}, effector: ((i: number, item: types.Item<any>) -> ())): (() -> ())
    local each = props.each
    local fallback = props.fallback

    for index, item in pairs(each) do
        local s, _ = pcall(effector, index, item)
        
        assert(s, "Failed to call effector function!")
        if not s then fallback(); return false end
    end

    return true
end

return For