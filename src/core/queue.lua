local queue = { _ = {} }

function queue:add(v: any)
    if not queue._[v] then
        queue._[#queue._+1] = v
    end
end

function queue:remove(v: any)
    if table.find(queue._, v) then
        table.remove(queue._, table.find(queue._, v))
    end
end

function queue:get()
    return queue._
end

return queue