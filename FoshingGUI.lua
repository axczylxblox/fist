-- FishingGUI.lua (file utama yang akan di-load oleh loadstring)

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local event = ReplicatedStorage:WaitForChild("ActionEvent")

local player = Players.LocalPlayer

-- === GUI ===
local sg = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
sg.Name = "FISHING_PANEL"

local function createBtn(name, text, y)
    local b = Instance.new("TextButton", sg)
    b.Name = name
    b.Size = UDim2.new(0, 200, 0, 50)
    b.Position = UDim2.new(0, 40, 0, y)
    b.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    b.Font = Enum.Font.GothamBold
    b.TextSize = 20
    b.Text = text
    return b
end

local normal = createBtn("NormalSpeed", "Normal Speed", 100)
local flash = createBtn("FlashSpeed", "Flash Speed (0.01)", 160)
local ultra = createBtn("UltraSpeed", "Ultra Speed (0)", 220)
local stop  = createBtn("StopFishing", "Stop", 280)

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
