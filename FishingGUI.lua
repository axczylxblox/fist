-- FishingGUI.lua

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local event = ReplicatedStorage:WaitForChild("ActionEvent")

local player = Players.LocalPlayer

-- === GUI ===
local sg = Instance.new("ScreenGui")
sg.Name = "FISHING_PANEL"
sg.ResetOnSpawn = false
sg.Parent = player:WaitForChild("PlayerGui")

-- Tombol helper
local function createBtn(name, text, yOffset)
    local b = Instance.new("TextButton")
    b.Name = name
    b.Size = UDim2.new(0, 200, 0, 50)
    b.Position = UDim2.new(0.5, -100, 0.5, yOffset) -- center horizontal
    b.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    b.Font = Enum.Font.GothamBold
    b.TextSize = 20
    b.Text = text
    b.Parent = sg
    return b
end

-- Buat tombol
local normal = createBtn("NormalSpeed", "Normal Speed", -60)
local flash  = createBtn("FlashSpeed", "Flash Speed (0.01)", 0)
local ultra  = createBtn("UltraSpeed", "Ultra Speed (0)", 60)
local stop   = createBtn("StopFishing", "Stop", 120)

-- Fungsi tombol
normal.MouseButton1Click:Connect(function()
    event:FireServer("StartFishing", "normal")
end)

flash.MouseButton1Click:Connect(function()
    event:FireServer("StartFishing", "flash")
end)

ultra.MouseButton1Click:Connect(function()
    event:FireServer("StartFishing", "ultra")
end)

stop.MouseButton1Click:Connect(function()
    event:FireServer("StopFishing")
end)