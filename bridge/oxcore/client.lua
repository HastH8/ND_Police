local bridge = {}
local Ox = exports["ox_core"]

-- Send notification to the player
function bridge.notify(...)
    lib.notify(...)
end

-- Check if the player has any of the given groups/jobs
function bridge.hasGroup(groups)
    if not groups then return false end

    local player = Ox.GetPlayer()
    if not player then return false end

    for i = 1, #groups do
        if player.getGroup(groups[i]) then
            return true
        end
    end
    return false
end

-- Get the current player object
function bridge.getPlayer()
    return Ox.GetPlayer()
end

-- Check if a specific player has a specific job/group
function bridge.doesPlayerHaveJob(player, job)
    if not player or not job then return false end
    return player.getGroup(job) ~= nil
end

-- Forward character unload event
AddEventHandler("ND:characterUnloaded", function()
    TriggerEvent("ND_Police:playerUnloaded")
end)

return bridge
