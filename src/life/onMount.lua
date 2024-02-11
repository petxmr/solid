local queue = require(script.Parent.Parent.core.queue)

function onMount(fn: (() -> ()))
    queue:add({ kind = "onMount", fn = fn })
end

return onMount
