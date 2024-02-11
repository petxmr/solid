-- Solid

return {
    bake = require(script.core.bake),
    render = require(script.core.render),
    types = require(script.types),
    createStore = require(script.store.createStore),
    createMutable = require(script.store.createMutable),
    createSignal = require(script.core.createSignal),
    createEffect = require(script.core.createEffect),
    onMount = require(script.life.onMount),

    For = require(script.utils["for"]),
}
