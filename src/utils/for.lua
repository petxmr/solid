local types = require(script.Parent.Parent.types)

function For(props: {
    each: {types.Store<any>},
    children: {[types.Item<any>]: types.Store<any>},
    fallback: (() -> ())?,
}, effector: ((item: types.Item<any>) -> ())): (() -> ())
    local each = props.each
    local children = props.children
    local fallback = props.fallback

    if #children == 0 then
        local s, _ = pcall(fallback)
        assert(s, "Failed to call fallback function!")
    end

    for index, item in ipairs(each) do
        local s, _ = pcall(effector, item)
        assert(s, "Failed to call effector function!")
    end

    return children
end

return For