local G2L = {}


local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")


G2L["1"] = Instance.new("ScreenGui", game:GetService("CoreGui"))
G2L["1"]["Name"] = "NotificationPopup"
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


G2L["TitleContainer"] = Instance.new("Frame", G2L["2"])
G2L["TitleContainer"]["Name"] = "TitleContainer"
G2L["TitleContainer"]["Size"] = UDim2.new(1, 0, 0, 40)
G2L["TitleContainer"]["Position"] = UDim2.fromScale(0.5, 0.15)
G2L["TitleContainer"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
G2L["TitleContainer"]["BackgroundTransparency"] = 1
G2L["TitleListLayout"] = Instance.new("UIListLayout", G2L["TitleContainer"])
G2L["TitleListLayout"]["FillDirection"] = Enum.FillDirection.Horizontal
G2L["TitleListLayout"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center
G2L["TitleListLayout"]["VerticalAlignment"] = Enum.VerticalAlignment.Center
G2L["TitleListLayout"]["Padding"] = UDim.new(0, 8)


G2L["JoinText"] = Instance.new("TextLabel", G2L["TitleContainer"])
G2L["JoinText"]["Size"] = UDim2.new(0, 55, 1, 0)
G2L["JoinText"]["BackgroundTransparency"] = 1
G2L["JoinText"]["FontFace"] = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.Bold)
G2L["JoinText"]["Text"] = "Join"
G2L["JoinText"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
G2L["JoinText"]["TextSize"] = 33


G2L["DiscordText"] = Instance.new("TextLabel", G2L["TitleContainer"])
G2L["DiscordText"]["Size"] = UDim2.new(0, 110, 1, 0)
G2L["DiscordText"]["BackgroundTransparency"] = 1
G2L["DiscordText"]["FontFace"] = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.ExtraBold)
G2L["DiscordText"]["Text"] = "Discord"
G2L["DiscordText"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
G2L["DiscordText"]["TextSize"] = 30
G2L["DiscordText"]["ClipsDescendants"] = true
G2L["LiquidGradient"] = Instance.new("UIGradient", G2L["DiscordText"])
G2L["LiquidGradient"]["Color"] = ColorSequence.new({
	ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)),
	ColorSequenceKeypoint.new(0.50, DISCORD_BLURPLE),
	ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255)),
})
G2L["LiquidGradient"]["Rotation"] = 15
G2L["LiquidGradient"]["Offset"] = Vector2.new(-2, 0)


G2L["IconContainer"] = Instance.new("Frame", G2L["2"])
G2L["IconContainer"]["Size"] = UDim2.new(1, 0, 0, 85)
G2L["IconContainer"]["Position"] = UDim2.fromScale(0.5, 0.4)
G2L["IconContainer"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
G2L["IconContainer"]["BackgroundTransparency"] = 1
G2L["IconListLayout"] = Instance.new("UIListLayout", G2L["IconContainer"])
G2L["IconListLayout"]["FillDirection"] = Enum.FillDirection.Horizontal
G2L["IconListLayout"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center
G2L["IconListLayout"]["VerticalAlignment"] = Enum.VerticalAlignment.Center
G2L["IconListLayout"]["Padding"] = UDim.new(0, 10)


G2L["8"] = Instance.new("ImageLabel", G2L["IconContainer"])
G2L["8"]["Size"] = UDim2.fromOffset(85, 85)
G2L["8"]["BackgroundTransparency"] = 1
G2L["8"]["Image"] = "rbxassetid://10110319522"


G2L["YesChampText"] = Instance.new("TextLabel", G2L["IconContainer"])
G2L["YesChampText"]["Size"] = UDim2.new(0, 90, 1, 0)
G2L["YesChampText"]["BackgroundTransparency"] = 1
G2L["YesChampText"]["FontFace"] = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.Bold)
G2L["YesChampText"]["Text"] = "Yes champ"
G2L["YesChampText"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
G2L["YesChampText"]["TextScaled"] = true
G2L["YesChampText"]["TextWrapped"] = true
G2L["YesChampText"]["TextXAlignment"] = Enum.TextXAlignment.Left


G2L["4"] = Instance.new("TextButton", G2L["2"])
G2L["4"]["Name"] = "CopyButton"
G2L["4"]["Size"] = UDim2.new(0, 160, 0, 35)
G2L["4"]["Position"] = UDim2.fromScale(0.5, 0.68)
G2L["4"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
G2L["4"]["Text"] = ""
G2L["4"]["BorderSizePixel"] = 0
G2L["4"]["AutoButtonColor"] = false
G2L["4"]["ClipsDescendants"] = true
G2L["e"] = Instance.new("UIGradient", G2L["4"])
G2L["e"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(66, 89, 182)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(37, 57, 137))}
G2L["e"]["Rotation"] = 20
G2L["5"] = Instance.new("UICorner", G2L["4"])
G2L["5"]["CornerRadius"] = UDim.new(0, 10)


G2L["ButtonText1"] = Instance.new("TextLabel", G2L["4"])
G2L["ButtonText1"]["Size"] = UDim2.fromScale(1, 1)
G2L["ButtonText1"]["Position"] = UDim2.fromScale(0.5, 0.5)
G2L["ButtonText1"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
G2L["ButtonText1"]["BackgroundTransparency"] = 1
G2L["ButtonText1"]["FontFace"] = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.SemiBold)
G2L["ButtonText1"]["Text"] = "Copy invite link"
G2L["ButtonText1"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
G2L["ButtonText1"]["TextSize"] = 20


G2L["ButtonText2"] = Instance.new("TextLabel", G2L["4"])
G2L["ButtonText2"]["Size"] = UDim2.fromScale(1, 1)
G2L["ButtonText2"]["Position"] = UDim2.new(0.5, 0, 1.5, 0)
G2L["ButtonText2"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
G2L["ButtonText2"]["BackgroundTransparency"] = 1
G2L["ButtonText2"]["FontFace"] = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.SemiBold)
G2L["ButtonText2"]["Text"] = "Tuff I'll Join"
G2L["ButtonText2"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
G2L["ButtonText2"]["TextSize"] = 20
G2L["ButtonText2"]["TextTransparency"] = 1


G2L["CopiedText"] = Instance.new("TextLabel", G2L["4"])
G2L["CopiedText"]["Size"] = UDim2.fromScale(1, 1)
G2L["CopiedText"]["Position"] = UDim2.fromScale(0.5, 0.5)
G2L["CopiedText"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
G2L["CopiedText"]["BackgroundTransparency"] = 1
G2L["CopiedText"]["FontFace"] = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.Bold)
G2L["CopiedText"]["Text"] = "Link Copied!"
G2L["CopiedText"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
G2L["CopiedText"]["TextSize"] = 20
G2L["CopiedText"]["TextTransparency"] = 1


G2L["3"] = Instance.new("TextButton", G2L["2"])
G2L["3"]["Name"] = "CloseButton"
G2L["3"]["Size"] = UDim2.new(0, 140, 0, 28)
G2L["3"]["Position"] = UDim2.fromScale(0.5, 0.88)
G2L["3"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
G2L["3"]["BackgroundColor3"] = Color3.fromRGB(27, 28, 33)
G2L["3"]["BorderSizePixel"] = 0
G2L["3"]["FontFace"] = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.SemiBold)
G2L["3"]["Text"] = "No Sybau"
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
	local button, text1, text2, copiedText = G2L["4"], G2L["ButtonText1"], G2L["ButtonText2"], G2L["CopiedText"]
	local isAnimationActive = true
	local clickConnection
	
	clickConnection = button.MouseButton1Click:Connect(function()
		
		isAnimationActive = false
		
		
		if setclipboard then setclipboard("https://discord.gg/moondiety") end
		
		
		local tweenInfoFadeOut = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
		TweenService:Create(text1, tweenInfoFadeOut, {TextTransparency = 1}):Play()
		TweenService:Create(text2, tweenInfoFadeOut, {TextTransparency = 1}):Play()

		
		local tweenInfoFadeIn = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
		TweenService:Create(copiedText, tweenInfoFadeIn, {TextTransparency = 0}):Play()
		
		
		if clickConnection then
			clickConnection:Disconnect()
			clickConnection = nil
		end
	end)

	
	local activeText, inactiveText = text1, text2
	local tweenInfo = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local centerPos, topPos, bottomPos = UDim2.fromScale(0.5, 0.5), UDim2.new(0.5, 0, -0.5, 0), UDim2.new(0.5, 0, 1.5, 0)
	
	while isAnimationActive and G2L["1"].Parent do
		task.wait(2)
		if not isAnimationActive then break end 

		TweenService:Create(activeText, tweenInfo, { Position = topPos, TextTransparency = 1 }):Play()
		inactiveText.Position = bottomPos
		TweenService:Create(inactiveText, tweenInfo, { Position = centerPos, TextTransparency = 0 }):Play()
		
		activeText, inactiveText = inactiveText, activeText
	end
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

return G2L["1"], require
