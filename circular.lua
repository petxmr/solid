local G = {Styles={test="hello"}}

function GStyles()
    return G.Styles
end

local styles = GStyles()

styles.test = "bye"

print(G.Styles.test)
