-- FishingServer.lua

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local event = Instance.new("RemoteEvent")
event.Name = "ActionEvent"
event.Parent = ReplicatedStorage

-- Ganti dengan UserId kamu
local ADMINS = {
    [YOUR_USER_ID] = true,
}

local function isAdmin(player)
    return ADMINS[player.UserId] == true
end

local loops = {} -- loop fishing tiap player

event.OnServerEvent:Connect(function(player, action, mode)
    if not isAdmin(player) then return end

    -- Stop
    if action == "StopFishing" then
        loops[player] = false
        print(player.Name, "stop fishing")
        return
    end

    -- Start
    if action == "StartFishing" then
        loops[player] = false
        task.wait(0.05)
        loops[player] = true

        local delay = 0.3 -- normal

        if mode == "flash" then
            delay = 0.01
        elseif mode == "ultra" then
            delay = 0
        end

        print(player.Name .. " mulai fishing mode:", mode, "delay:", delay)

        task.spawn(function()
            while loops[player] do
                if player:FindFirstChild("leaderstats") then
                    local fish = player.leaderstats:FindFirstChild("Fish")
                    if fish then
                        fish.Value += 1
                    end
                end
                task.wait(delay)
            end
        end)
    end
end)