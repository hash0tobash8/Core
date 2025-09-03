if not game:IsLoaded() then game.Loaded:Wait() end
if not game:IsLoaded() then repeat task.wait() until game:IsLoaded() end

if getgenv().RunScript == true then return end
getgenv().RunScript = true

local queueScript = string.format([[
loadstring(game:HttpGet('https://raw.githubusercontent.com/hash0tobash8/Core/refs/heads/main/DiamondFarm.lua'))()
]])

queue_on_teleport(queueScript)

repeat wait(0.1) until game.Players
local TimeWaitLoadGame = 0
local player = game.Players.LocalPlayer
repeat
    wait(0.1)
    TimeWaitLoadGame = TimeWaitLoadGame + 0.1
    if TimeWaitLoadGame > 3 then
        player:Kick()
        wait(0.5)
        game:GetService("TeleportService"):Teleport(126509999114328)
    end
until game.Players and game.Players.LocalPlayer and game.Players.LocalPlayer.Character

local player = game.Players.LocalPlayer
local character = player.Character
local humanoid = character:FindFirstChildOfClass("Humanoid")
local HMNRT = character:FindFirstChild("HumanoidRootPart")
local Camera = workspace.CurrentCamera
local plrGui = player.PlayerGui

task.spawn(function()
    pcall(function()
        local OutTick = 0
        local LastPosition = HMNRT.Position
        local Stuck_Count = 0
        while wait(1) do
            OutTick = OutTick + 1
            local Dis = (LastPosition - HMNRT.Position).Magnitude
            if Dis < 5 then
                Stuck_Count = Stuck_Count + 1
            end
            if OutTick >= 35 or Stuck_Count > 2 then
                player:Kick()
                wait(0.5)
                game:GetService("TeleportService"):Teleport(126509999114328)
            end
            LastPosition = HMNRT.Position
        end
    end)
end)

local function matchesAllowedKeyword(value, allowedKeywords)
    value = value:lower()
    for _, keyword in ipairs(allowedKeywords) do
        if string.find(value, keyword:lower()) then
            return true
        end
    end
    return false
end

if tonumber(game.PlaceId) == tonumber(79546208627805) then
    local UIS = game:GetService("UserInputService")
    local player = game.Players.LocalPlayer
    local character = player.Character
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    local HMNRT = character:FindFirstChild("HumanoidRootPart")
    
    if plrGui:WaitForChild("Interface"):WaitForChild("EntryScreen") then
        plrGui:WaitForChild("Interface"):WaitForChild("EntryScreen").Visible = false
    end
    
    local VirtualInputManager = game:GetService("VirtualInputManager")
    local screenSize = workspace.CurrentCamera.ViewportSize
    local centerX = screenSize.X / 2
    local centerY = screenSize.Y / 2

    local function Click_Function()
        VirtualInputManager:SendMouseButtonEvent(centerX, centerY, 0, true, game, 0)
        wait(0.02)
        VirtualInputManager:SendMouseButtonEvent(centerX, centerY, 0, false, game, 0)
        wait(0.02)
    end
    
    wait(6)
    local Teleport = false
    repeat
        local GotoEnterPart = false
        if GotoEnterPart == false then
            for i=1,3 do
                if workspace:FindFirstChild("Teleporter"..i) then
                    local Model_Teleport = workspace:FindFirstChild("Teleporter"..i)
                    if Model_Teleport:FindFirstChild("BillboardHolder") then
                        local BillboardHolder = Model_Teleport:FindFirstChild("BillboardHolder")
                        local Players = BillboardHolder:FindFirstChild("BillboardGui"):FindFirstChild("Players")
                        if Players.Text == "0/5" then
                            for _, item in ipairs(Model_Teleport:GetChildren()) do
                                if item.Name == "EnterPart" and GotoEnterPart == false then
                                    firetouchinterest(HMNRT, item, 0)
                                    GotoEnterPart = true
                                    wait(0.1)
                                end
                            end
                        end
                    end
                end
            end
        end
        if GotoEnterPart == true then
            GotoEnterPart = false
            local LobbyCreate = plrGui:FindFirstChild("Interface"):FindFirstChild("LobbyCreate")
            local ButtonList = LobbyCreate:FindFirstChild("ButtonList")
            local CreateButton = LobbyCreate:FindFirstChild("HeaderFrame"):FindFirstChild("CreateButton")
            local Buttin1 = nil
            if ButtonList and LobbyCreate then
                for _, item in ipairs(ButtonList:GetChildren()) do
                    if item.Name ~= "Button1" then
                        item:Destroy()
                    else
                        Buttin1 = item
                    end
                end
                if Buttin1 and CreateButton then
                    CreateButton.Position = UDim2.new(0.5, 0, 4.5, 0)
                    for i=1,5 do
                        Click_Function()
                    end
                    Buttin1.Visible = false
                    for i=1,5 do
                        Click_Function()
                    end
                    wait(30)
                    game:GetService("TeleportService"):Teleport(79546208627805)
                end
            end
        end
        wait(0.1)
    until Teleport == true
else
    local DiamondCount = plrGui:WaitForChild("Interface"):WaitForChild("DiamondCount"):FindFirstChild("Count")
    local Map = workspace:WaitForChild("Map")
    local InnerTouchZone = Map:WaitForChild("Campground"):WaitForChild("MainFire"):WaitForChild("InnerTouchZone")
    local RemoteEvents = game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents")
    local RequestStartDraggingItem = RemoteEvents:FindFirstChild("RequestStartDraggingItem")
    local StopDraggingItem = RemoteEvents:FindFirstChild("StopDraggingItem")
    local RequestTakeDiamonds = RemoteEvents:FindFirstChild("RequestTakeDiamonds")
    local FastBring_Delay = 0.17
    local Bring_HipHeight = 6
    local StartCountDiamon = tonumber(DiamondCount.Text)
    local Items = workspace:WaitForChild("Items")
    
    if workspace:FindFirstChild("Map"):FindFirstChild("Boundaries") then
        workspace:FindFirstChild("Map"):FindFirstChild("Boundaries"):Destroy()
    end
    
    game.Workspace.Gravity = 0
    
    local function collectAllChests()
        local chestsCollected = 0
        for _, item in ipairs(Items:GetChildren()) do
            if matchesAllowedKeyword(item.Name, {"Chest"}) then
                pcall(function()
                    if not item.PrimaryPart then
                        repeat wait(0.1) until item.PrimaryPart or not item.Parent
                        if not item.Parent then return end
                    end
                    
                    if not item.PrimaryPart.ProximityAttachment or not item.PrimaryPart.ProximityAttachment.ProximityInteraction then
                        repeat wait(0.1) until item.PrimaryPart.ProximityAttachment and item.PrimaryPart.ProximityAttachment.ProximityInteraction or not item.Parent
                        if not item.Parent then return end
                    end
                    
                    local Prox = item.PrimaryPart.ProximityAttachment.ProximityInteraction
                    humanoid.HipHeight = 16
                    HMNRT.CFrame = CFrame.new(item.PrimaryPart.Position) * CFrame.new(0, 16, 0)
                    wait(0.2)
                    fireproximityprompt(Prox, 10)
                    wait(0.2)
                    humanoid.HipHeight = 0
                    chestsCollected = chestsCollected + 1
                end)
            end
        end
        return chestsCollected
    end
    
    local function collectAllDiamonds()
        local diamondsCollected = 0
        for _, item in ipairs(Items:GetChildren()) do
            if item.Name == "Diamond" then
                pcall(function()
                    if not item.PrimaryPart then
                        repeat wait(0.1) until item.PrimaryPart or not item.Parent
                        if not item.Parent then return end
                    end
                    
                    HMNRT.CFrame = item.PrimaryPart.CFrame
                    wait(0.1)
                    RequestStartDraggingItem:FireServer(item)
                    wait(0.1)
                    RequestTakeDiamonds:FireServer(item)
                    wait(0.1)
                    StopDraggingItem:FireServer(item)
                    wait(0.1)
                    diamondsCollected = diamondsCollected + 1
                end)
            end
        end
        return diamondsCollected
    end
    
    local totalPasses = 5
    for pass = 1, totalPasses do
        local chests = collectAllChests()
        wait(1)
        local diamonds = collectAllDiamonds()
        wait(1)
    end
    
    wait(2)
    player:Kick()
    wait(0.5)
    game:GetService("TeleportService"):Teleport(126509999114328)
end
