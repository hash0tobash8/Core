local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local LocalPlayer = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")
local Remote = game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("RequestTakeDiamonds")
local Interface = LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("Interface")
local DiamondCount = Interface:WaitForChild("DiamondCount"):WaitForChild("Count")

local DISCORD_LINK = "http://discord.gg/moondiety"
local BLACKLISTED_PLACEIDS = {
    [7954620862] = true,
}
pcall(function()
    writefile("ATS.txt", "on")
end)
local qtp = queueonteleport or queue_on_teleport
if qtp then
    qtp([[
        repeat task.wait() until game:IsLoaded()
        local ok, flag = pcall(function() return readfile("ATS.txt") end)
        if ok and flag == "on" then
            loadstring(game:HttpGet('https://raw.githubusercontent.com/hash0tobash8/Core/refs/heads/main/DiamondFarm.lua'))()
        end
    ]])
end

local isHopping = false
local ENTER_TIME = tick()

local function notify(title, text, dur)
    pcall(function()
        CoreGui:SetCore("SendNotification", {Title = title, Text = text or "", Duration = dur or 2})
    end)
end

local function safeTeleportToInstance(placeId, serverId, waitTimeout)
    waitTimeout = waitTimeout or 10
    if BLACKLISTED_PLACEIDS[placeId] then return false end
    local curJob = game.JobId
    local ok = pcall(function()
        TeleportService:TeleportToPlaceInstance(placeId, serverId, LocalPlayer)
    end)
    if not ok then return false end
    local t0 = tick()
    while tick() - t0 < waitTimeout do
        if game.JobId ~= curJob then
            ENTER_TIME = tick()
            return true
        end
        task.wait(0.25)
    end
    return false
end

local function hopServer()
    if isHopping then return end
    isHopping = true
    task.spawn(function()
        local startT = tick()
        local gameId = tonumber(game.PlaceId)
        local tried = {}
        while tick() - startT < 28 do
            if BLACKLISTED_PLACEIDS[gameId] then
                notify("Blacklist", "Current PlaceId blacklisted, searching other instances...", 2)
            end
            local success, body = pcall(function()
                return game:HttpGet(("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Asc&limit=100"):format(gameId))
            end)
            if success and body then
                local ok, data = pcall(function() return HttpService:JSONDecode(body) end)
                if ok and data and data.data then
                    for _, server in ipairs(data.data) do
                        if server.id and server.id ~= game.JobId and server.playing < server.maxPlayers and not tried[server.id] then
                            tried[server.id] = true
                            local teleOk = safeTeleportToInstance(gameId, server.id, 8)
                            if teleOk then
                                isHopping = false
                                return
                            end
                            task.wait(0.4)
                        end
                    end
                end
            end
            task.wait(0.6)
        end
        isHopping = false
    end)
end

if BLACKLISTED_PLACEIDS[game.PlaceId] then
    notify("Blacklisted Server", "Hopping from blacklisted server...", 2)
    task.wait(0.5)
    hopServer()
end

task.spawn(function()
    while true do
        task.wait(1)
        if tick() - ENTER_TIME >= 30 then
            notify("Watchdog", "30s reached — forcing hop", 2)
            hopServer()
            return
        end
    end
end)

task.spawn(function()
    if LocalPlayer:GetAttribute("HasDied") == true then
        hopServer()
        return
    end
    LocalPlayer:GetAttributeChangedSignal("HasDied"):Connect(function()
        if LocalPlayer:GetAttribute("HasDied") == true then
            hopServer()
        end
    end)
end)

local function rainbowStroke(stroke)
    task.spawn(function()
        while stroke and stroke.Parent do
            for hue = 0, 1, 0.01 do
                if not stroke.Parent then break end
                stroke.Color = Color3.fromHSV(hue, 1, 1)
                task.wait(0.02)
            end
        end
    end)
end

local function pulseGlow(uiStroke)
    task.spawn(function()
        local up = true
        while uiStroke and uiStroke.Parent do
            for i = 1, 20 do
                if not uiStroke.Parent then break end
                uiStroke.Transparency = up and (1 - i/30) or (i/30)
                task.wait(0.03)
            end
            up = not up
            task.wait(0.1)
        end
    end)
end

local function farmDiamonds()
    repeat task.wait() until LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if LocalPlayer:GetAttribute("HasDied") == true then hopServer() return end
    local chest
    local findStart = tick()
    while tick() - findStart < 6 do
        chest = workspace.Items:FindFirstChild("Stronghold Diamond Chest")
        if chest then break end
        if LocalPlayer:GetAttribute("HasDied") == true then hopServer() return end
        task.wait(0.2)
    end
    if not chest then
        notify("Notification", "chest not found (timeout)", 3)
        hopServer()
        return
    end
    if LocalPlayer:GetAttribute("HasDied") == true then hopServer() return end
    pcall(function()
        LocalPlayer.Character:PivotTo(CFrame.new(chest:GetPivot().Position))
    end)
    local proxPrompt
    local proxStart = tick()
    while tick() - proxStart < 8 do
        if LocalPlayer:GetAttribute("HasDied") == true then hopServer() return end
        local prox = chest:FindFirstChild("Main")
        if prox and prox:FindFirstChild("ProximityAttachment") then
            proxPrompt = prox.ProximityAttachment:FindFirstChild("ProximityInteraction")
            if proxPrompt then break end
        end
        task.wait(0.15)
    end
    if not proxPrompt then
        notify("Notification", "Proximity prompt not found (timeout)", 3)
        hopServer()
        return
    end
    local startTime = tick()
    while proxPrompt and proxPrompt.Parent and (tick() - startTime) < 8 do
        if LocalPlayer:GetAttribute("HasDied") == true then hopServer() return end
        pcall(function() fireproximityprompt(proxPrompt) end)
        task.wait(0.25)
    end
    local diamondFound = false
    local waitStart = tick()
    while tick() - waitStart < 8 do
        if LocalPlayer:GetAttribute("HasDied") == true then hopServer() return end
        if workspace:FindFirstChild("Diamond", true) then
            diamondFound = true
            break
        end
        task.wait(0.15)
    end
    if not diamondFound then
        notify("Notification", "No diamonds spawned (timeout)", 3)
        hopServer()
        return
    end
    task.wait(0.5)
    if LocalPlayer:GetAttribute("HasDied") == true then hopServer() return end
    for _, v in pairs(workspace:GetDescendants()) do
        if v.ClassName == "Model" and v.Name == "Diamond" then
            pcall(function() Remote:FireServer(v) end)
        end
    end
    notify("Notification", "Diamonds collected!", 3)
    local waitTill = 14
    local t0 = tick()
    while tick() - t0 < waitTill do
        if LocalPlayer:GetAttribute("HasDied") == true then hopServer() return end
        task.wait(0.2)
    end
    hopServer()
end

task.spawn(farmDiamonds)

local a = Instance.new("ScreenGui")
a.Name = "Yo my dih was made with diamond (vuk)"
a.Parent = CoreGui
a.ResetOnSpawn = false

local b = Instance.new("Frame", a)
b.Size = UDim2.new(0, 300, 0, 120)
b.Position = UDim2.new(0, 80, 0, 100)
b.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
b.BorderSizePixel = 0
b.Active = true
b.Draggable = true

local corner = Instance.new("UICorner", b)
corner.CornerRadius = UDim.new(0, 12)

local bgStroke = Instance.new("UIStroke", b)
bgStroke.Thickness = 1.2
bgStroke.Color = Color3.fromRGB(150, 40, 40)

local header = Instance.new("TextLabel", b)
header.Size = UDim2.new(1, 0, 0, 34)
header.Position = UDim2.new(0, 0, 0, 0)
header.BackgroundTransparency = 1
header.Text = "By Moon x Vuk"
header.TextColor3 = Color3.fromRGB(255, 120, 120)
header.Font = Enum.Font.GothamBold
header.TextSize = 16

local titleLine = Instance.new("Frame", b)
titleLine.Size = UDim2.new(1, -20, 0, 1)
titleLine.Position = UDim2.new(0, 10, 0, 34)
titleLine.BackgroundColor3 = Color3.fromRGB(85, 20, 20)
titleLine.BorderSizePixel = 0

local diamondFrame = Instance.new("Frame", b)
diamondFrame.Size = UDim2.new(0, 120, 0, 40)
diamondFrame.Position = UDim2.new(0, 10, 0, 44)
diamondFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
diamondFrame.BorderSizePixel = 0
local dcorner = Instance.new("UICorner", diamondFrame)
dcorner.CornerRadius = UDim.new(0, 8)

local diamondStroke = Instance.new("UIStroke", diamondFrame)
diamondStroke.Thickness = 2
rainbowStroke(diamondStroke)

local diamondLabel = Instance.new("TextLabel", diamondFrame)
diamondLabel.Size = UDim2.new(1, -10, 1, 0)
diamondLabel.Position = UDim2.new(0, 6, 0, 0)
diamondLabel.BackgroundTransparency = 1
diamondLabel.Text = "💎 Diamonds: " .. (DiamondCount and DiamondCount.Text or "0")
diamondLabel.Font = Enum.Font.GothamBold
diamondLabel.TextSize = 14
diamondLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
diamondLabel.TextXAlignment = Enum.TextXAlignment.Left

task.spawn(function()
    while task.wait(0.2) do
        pcall(function()
            diamondLabel.Text = "💎 Diamonds: " .. (DiamondCount and DiamondCount.Text or "0")
        end)
    end
end)

local copyBtn = Instance.new("TextButton", b)
copyBtn.Size = UDim2.new(0, 150, 0, 36)
copyBtn.Position = UDim2.new(1, -160, 0, 44)
copyBtn.BackgroundColor3 = Color3.fromRGB(180, 30, 30)
copyBtn.BorderSizePixel = 0
copyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
copyBtn.Font = Enum.Font.GothamBold
copyBtn.TextSize = 14
copyBtn.Text = "Discord • Copy Invite"
local copyCorner = Instance.new("UICorner", copyBtn)
copyCorner.CornerRadius = UDim.new(0, 8)

local copyStroke = Instance.new("UIStroke", copyBtn)
copyStroke.Thickness = 2
copyStroke.Color = Color3.fromRGB(255, 200, 100)
pulseGlow(copyStroke)

copyBtn.MouseButton1Click:Connect(function()
    local ok = pcall(function() setclipboard(DISCORD_LINK) end)
    if not ok then
        pcall(function() CoreGui:SetCore("SendNotification", {Title = "Clipboard", Text = "Failed to copy", Duration = 3}) end)
        return
    end
    copyBtn.Text = "Copied!"
    task.spawn(function()
        task.wait(1.2)
        copyBtn.Text = "Discord • Copy Invite"
    end)
end)

local footer = Instance.new("TextLabel", b)
footer.Size = UDim2.new(1, -20, 0, 20)
footer.Position = UDim2.new(0, 10, 1, -26)
footer.BackgroundTransparency = 1
footer.Text = "Auto Farm Diamond"
footer.TextColor3 = Color3.fromRGB(255, 215, 0)
footer.Font = Enum.Font.GothamBold
footer.TextSize = 13

local footerStroke = Instance.new("UIStroke", footer)
footerStroke.Thickness = 1
rainbowStroke(footerStroke)
