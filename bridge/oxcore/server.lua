local bridge = {}
local Ox = exports["ox_core"]

-- Send notification to a player
function bridge.notify(src, info)
    TriggerClientEvent("ox_lib:notify", src, info)
end

-- Trigger ShotSpotter dispatch
function bridge.shotSpotter(src, location, coords)
    if GetResourceState("ND_MDT") == "started" then 
        exports["ND_MDT"]:createDispatch({
        location = location,
        callDescription = "Shotspotter detected gunshot",
        coords = coords
    })
    else
        print("Please add dispatch export to bridge/oxcore/server.lua")
    end
end

-- Check if player has any of the required groups/jobs
function bridge.hasJobs(src, groups)
    local player = Ox.GetPlayer(src)
    if not player then return false end

    for i = 1, #groups do
        if player.getGroup(groups[i]) then
            return true
        end
    end
    return false
end


return bridge
