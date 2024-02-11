local events = { _ = {} }

function events:add(v: any)
    if not events._[v] then
        events._[#events._+1] = v
    end
end

function events:remove(v: any)
    if table.find(events._, v) then
        table.remove(events._, table.find(events._, v))
    end
end

function events:get()
    return events._
end

return events