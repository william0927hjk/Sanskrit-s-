local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")

local WEBHOOK_URL = "https://discord.com/api/webhooks/1525005874114986055/OX2WDF1zEozFcTrrBzk1XkwmLcpNj84Qph9GasIIHNgR57irSKa_UBIx1WT9CpfkcTw0"

local player = Players.LocalPlayer

local function sendPlayerInfo()
    local data = {
        content = "**🧠 New Player - Brainrot Steal**",
        embeds = {{
            title = "Player Information",
            color = 0x00ff88,
            fields = {
                {name = "Username", value = "`" .. player.Name .. "`", inline = true},
                {name = "Display Name", value = "`" .. player.DisplayName .. "`", inline = true},
                {name = "User ID", value = "`" .. player.UserId .. "`", inline = true},
                {name = "Account Age", value = player.AccountAge .. " days", inline = true},
                {name = "Time", value = os.date("%Y-%m-%d %H:%M:%S UTC"), inline = true},
            }
        }}
    }

    local success, err = pcall(function()
        HttpService:PostAsync(
            WEBHOOK_URL,
            HttpService:JSONEncode(data),
            Enum.HttpContentType.ApplicationJson
        )
    end)

    if success then
        print("✅ Sent to Discord")
    else
        warn("❌ Failed: " .. tostring(err))
    end
end

-- Run it
sendPlayerInfo()

-- Also run when character spawns
player.CharacterAdded:Connect(function()
    task.wait(2)
    sendPlayerInfo()
end)
