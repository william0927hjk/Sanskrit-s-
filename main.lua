local Players = game:GetService("Players")

local player = Players.LocalPlayer

local function printPlayerInfo()
    print("=== Brainrot Player Info ===")
    print("Username: " .. player.Name)
    print("Display Name: " .. player.DisplayName)
    print("User ID: " .. player.UserId)
    print("Account Age: " .. player.AccountAge .. " days")
    print("Time: " .. os.date("%Y-%m-%d %H:%M:%S UTC"))
    print("=============================")
end

-- Print immediately
printPlayerInfo()

-- Print again when character spawns
player.CharacterAdded:Connect(function()
    task.wait(2)
    printPlayerInfo()
end)

print("✅ Brainrot Info Script Loaded!")
