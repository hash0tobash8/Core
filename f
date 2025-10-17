if not game:IsLoaded() then game.Loaded:Wait() end
if not game:IsLoaded() then repeat task.wait() until game:IsLoaded() end

if getgenv().RunScript == true then return end
getgenv().RunScript = true

local queueScript = string.format([[
loadstring(game:HttpGet('https://raw.githubusercontent.com/hash0tobash8/Core/refs/heads/main/f'))()
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
    local G2L = {}

    local UserInputService = game:GetService("UserInputService")
    local TweenService = game:GetService("TweenService")
    
    G2L["1"] = Instance.new("ScreenGui", game:GetService("CoreGui"))
    G2L["1"]["Name"] = "StatusPopup"
    G2L["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling
    
    local FRAME_SIZE = Vector2.new(240, 215)
    local SHADOW_OFFSET = Vector2.new(20, 20)
    local SHADOW_SIZE = FRAME_SIZE + SHADOW_OFFSET
    local CENTER_POSITION = UDim2.new(0.5, 0, 0.5, 0)
    local DISCORD_BLURPLE = Color3.fromRGB(88, 101, 242)
    
    G2L["s"] = Instance.new("ImageLabel", G2L["1"])
    G2L["s"]["Name"] = "Shadow"
    G2L["s"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
    G2L["s"]["Position"] = CENTER_POSITION
    G2L["s"]["Size"] = UDim2.fromOffset(SHADOW_SIZE.X, SHADOW_SIZE.Y)
    G2L["s"]["BackgroundTransparency"] = 1.0
    G2L["s"]["ZIndex"] = 0
    G2L["s"]["Image"] = "rbxassetid://17290899982"
    
    G2L["2"] = Instance.new("Frame", G2L["1"])
    G2L["2"]["Name"] = "MainFrame"
    G2L["2"]["Active"] = true
    G2L["2"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
    G2L["2"]["Position"] = CENTER_POSITION
    G2L["2"]["Size"] = UDim2.fromOffset(FRAME_SIZE.X, FRAME_SIZE.Y)
    G2L["2"]["BackgroundColor3"] = Color3.fromRGB(19, 20, 24)
    G2L["2"]["BorderSizePixel"] = 0
    G2L["2"]["ClipsDescendants"] = true
    G2L["2"]["ZIndex"] = 1
    
    G2L["7"] = Instance.new("UICorner", G2L["2"])
    G2L["7"]["CornerRadius"] = UDim.new(0, 20)
    
    G2L["Title"] = Instance.new("TextLabel", G2L["2"])
    G2L["Title"]["Name"] = "Title"
    G2L["Title"]["Size"] = UDim2.new(1, 0, 0, 50)
    G2L["Title"]["Position"] = UDim2.fromScale(0.5, 0.3)
    G2L["Title"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
    G2L["Title"]["BackgroundTransparency"] = 1
    G2L["Title"]["FontFace"] = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.Bold)
    G2L["Title"]["Text"] = "Diamonds Farm"
    G2L["Title"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
    G2L["Title"]["TextSize"] = 33
    G2L["Title"]["TextWrapped"] = true
    
    G2L["Running"] = Instance.new("TextLabel", G2L["2"])
    G2L["Running"]["Name"] = "Running"
    G2L["Running"]["Size"] = UDim2.new(1, 0, 0, 40)
    G2L["Running"]["Position"] = UDim2.fromScale(0.5, 0.5)
    G2L["Running"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
    G2L["Running"]["BackgroundTransparency"] = 1
    G2L["Running"]["FontFace"] = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.ExtraBold)
    G2L["Running"]["Text"] = "Running"
    G2L["Running"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
    G2L["Running"]["TextSize"] = 30
    G2L["Running"]["TextWrapped"] = true
    G2L["Running"]["ClipsDescendants"] = true
    G2L["LiquidGradient"] = Instance.new("UIGradient", G2L["Running"])
    G2L["LiquidGradient"]["Color"] = ColorSequence.new({
    	ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)),
    	ColorSequenceKeypoint.new(0.50, DISCORD_BLURPLE),
    	ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255)),
    })
    G2L["LiquidGradient"]["Rotation"] = 15
    G2L["LiquidGradient"]["Offset"] = Vector2.new(-2, 0)
    
    
    
    G2L["Footer"] = Instance.new("TextLabel", G2L["2"])
    G2L["Footer"]["Name"] = "Footer"
    G2L["Footer"]["Size"] = UDim2.new(1, 0, 0, 20)
    G2L["Footer"]["Position"] = UDim2.fromScale(0.5, 0.8)
    G2L["Footer"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
    G2L["Footer"]["BackgroundTransparency"] = 1
    G2L["Footer"]["FontFace"] = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.Bold)
    G2L["Footer"]["Text"] = "-MOONDIETY-"
    G2L["Footer"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
    G2L["Footer"]["TextSize"] = 14
    G2L["Footer"]["TextWrapped"] = true
    
    G2L["3"] = Instance.new("TextButton", G2L["2"])
    G2L["3"]["Name"] = "CloseButton"
    G2L["3"]["Size"] = UDim2.new(0, 140, 0, 28)
    G2L["3"]["Position"] = UDim2.fromScale(0.5, 0.95)
    G2L["3"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
    G2L["3"]["BackgroundColor3"] = Color3.fromRGB(27, 28, 33)
    G2L["3"]["BorderSizePixel"] = 0
    G2L["3"]["FontFace"] = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.SemiBold)
    G2L["3"]["Text"] = "Close"
    G2L["3"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
    G2L["3"]["TextSize"] = 18
    G2L["3"]["AutoButtonColor"] = false
    G2L["d"] = Instance.new("UICorner", G2L["3"])
    G2L["d"]["CornerRadius"] = UDim.new(0, 10)
    
    task.spawn(function()
    	local closeTime = 0.5
    	local closeTweenInfo = TweenInfo.new(closeTime, Enum.EasingStyle.Circular, Enum.EasingDirection.In)
    
    	G2L["3"].MouseButton1Click:Connect(function()
    		local frameTween = TweenService:Create(G2L["2"], closeTweenInfo, { Size = UDim2.fromOffset(0,0), BackgroundTransparency = 1 })
    		local shadowTween = TweenService:Create(G2L["s"], closeTweenInfo, { Size = UDim2.fromOffset(0,0), ImageTransparency = 1 })
    		frameTween:Play()
    		shadowTween:Play()
    		frameTween.Completed:Connect(function() G2L["1"]:Destroy() end)
    	end)
    end)
    
    task.spawn(function()
    	local popInTime = 0.6
    	local popInTweenInfo = TweenInfo.new(popInTime, Enum.EasingStyle.Circular, Enum.EasingDirection.Out)
    	G2L["2"].Size, G2L["s"].Size = UDim2.fromOffset(0,0), UDim2.fromOffset(0,0)
    	G2L["2"].BackgroundTransparency, G2L["s"].ImageTransparency = 1, 1
    	G2L["2"].Visible, G2L["s"].Visible = true, true
    	local frameTween = TweenService:Create(G2L["2"], popInTweenInfo, { Size = UDim2.fromOffset(FRAME_SIZE.X, FRAME_SIZE.Y), BackgroundTransparency = 0 })
    	local shadowTween = TweenService:Create(G2L["s"], popInTweenInfo, { Size = UDim2.fromOffset(SHADOW_SIZE.X, SHADOW_SIZE.Y), ImageTransparency = 0 })
    	frameTween:Play()
    	shadowTween:Play()
    end)
    
    task.spawn(function()
    	local isDragging = false
    	local dragStart, frameStart
    	local mainFrame, shadow = G2L["2"], G2L["s"]
    	
    	mainFrame.InputBegan:Connect(function(input)
    		
    		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
    			isDragging, dragStart, frameStart = true, input.Position, mainFrame.Position
    		end
    	end)
    	
    	UserInputService.InputChanged:Connect(function(input)
    		
    		if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) and isDragging then
    			local delta = input.Position - dragStart
    			mainFrame.Position = UDim2.new(frameStart.X.Scale, frameStart.X.Offset + delta.X, frameStart.Y.Scale, frameStart.Y.Offset + delta.Y)
    			shadow.Position = mainFrame.Position
    		end
    	end)
    	
    	UserInputService.InputEnded:Connect(function(input)
    		
    		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
    			isDragging = false
    		end
    	end)
    end)
    
    task.spawn(function()
    	local gradient = G2L["LiquidGradient"]
    	local tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1, true)
    	TweenService:Create(gradient, tweenInfo, { Offset = Vector2.new(2, 0) }):Play()
    end)

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
    
   local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")
local humanoid = character:WaitForChild("Humanoid")


humanoid.PlatformStand = true
humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics, false)


for _, part in ipairs(character:GetDescendants()) do
    if part:IsA("BasePart") then
        part.CanCollide = false
        part.Anchored = false
    end
end


workspace.Gravity = 0
    
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
 
local placeId = 79546208627805
local currentJobId = game.JobId
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")

local success, result = pcall(function()
    return HttpService:JSONDecode(HttpService:GetAsync(
        "https://games.roblox.com/v1/games/" .. placeId .. "/servers/Public?sortOrder=Asc&limit=100"
    ))
end)

if success and result and result.data then
    local servers = {}
    for _, server in ipairs(result.data) do
        if server.id ~= currentJobId and (server.playing < (server.maxPlayers or 30)) then
            table.insert(servers, server)
        end
    end
    table.sort(servers, function(a, b) return a.playing < b.playing end)
    if #servers > 0 then
        player:Kick("Switching to lower-population server...")
        wait(0.5)
        TeleportService:TeleportToPlaceInstance(placeId, servers[1].id)
        return
    end
end


player:Kick("Rejoining game...")
wait(0.5)
TeleportService:Teleport(placeId)
end

