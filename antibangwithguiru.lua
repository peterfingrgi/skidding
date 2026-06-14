-- Gui to Lua
-- Version: 1.488

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.ResetOnSpawn = false
local main = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local title = Instance.new("TextLabel")
local background = Instance.new("ImageLabel")
local UICorner_2 = Instance.new("UICorner")
local slider = Instance.new("Frame")
local knob = Instance.new("Frame")
local UICorner_3 = Instance.new("UICorner")
local UICorner_4 = Instance.new("UICorner")
local slidervalue = Instance.new("TextLabel")
local changebind = Instance.new("TextButton")
local UICorner_5 = Instance.new("UICorner")
local changehidebind = Instance.new("TextButton")
local UICorner_6 = Instance.new("UICorner")
local maindragdetector = Instance.new("UIDragDetector")
local knobdragdetector = Instance.new("UIDragDetector")
local bind = Instance.new("StringValue")
local hidebind = Instance.new("StringValue")
local waittime = Instance.new("NumberValue")

waittime.Value = 0.7

ScreenGui.Parent = game.Players.LocalPlayer.PlayerGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

main.Name = "main"
main.Parent = ScreenGui
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.BackgroundColor3 = Color3.fromRGB(76, 76, 76)
main.BackgroundTransparency = 1.000
main.BorderColor3 = Color3.fromRGB(0, 0, 0)
main.BorderSizePixel = 0
main.Position = UDim2.new(0.514705896, 0, 0.501233041, 0)
main.Size = UDim2.new(0.143188849, 0, 0.299630076, 0)

bind.Parent = main
bind.Name = "bind"
bind.Value = "B"
hidebind.Parent = main
hidebind.Name = "hidebind"
hidebind.Value = "X"

maindragdetector.Parent = main
maindragdetector.CursorIcon = "rbxassetid://0"
maindragdetector.ActivatedCursorIcon = "rbxassetid://0"

UICorner.CornerRadius = UDim.new(0, 4)
UICorner.Parent = main

title.Name = "title"
title.Parent = main
title.AnchorPoint = Vector2.new(0.5, 0.5)
title.BackgroundColor3 = Color3.fromRGB(76, 76, 76)
title.BackgroundTransparency = 1.000
title.BorderColor3 = Color3.fromRGB(0, 0, 0)
title.BorderSizePixel = 0
title.Position = UDim2.new(0.497297287, 0, -0.0872428492, 0)
title.Size = UDim2.new(0.832432449, 0, 0.17037037, 0)
title.Font = Enum.Font.SourceSans
title.Text = "ОЧЕНЬ КРУТАЯ ГУИШКА Н АХ.УЙ"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextScaled = true
title.TextSize = 14.000
title.TextWrapped = true

background.Name = "background"
background.Parent = main
background.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
background.BorderColor3 = Color3.fromRGB(0, 0, 0)
background.BorderSizePixel = 0
background.Size = UDim2.new(1, 0, 1, 0)
background.ZIndex = -5
background.Image = "rbxassetid://120740066821874"

UICorner_2.CornerRadius = UDim.new(0.0299999993, 0)
UICorner_2.Parent = background

slider.Name = "slider"
slider.Parent = main
slider.AnchorPoint = Vector2.new(0.5, 0.5)
slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
slider.BackgroundTransparency = 0.500
slider.BorderColor3 = Color3.fromRGB(0, 0, 0)
slider.BorderSizePixel = 0
slider.Position = UDim2.new(0.492000133, 0, 0.52613169, 0)
slider.Size = UDim2.new(0.832216084, 0, -0.0325916074, 0)

knob.Name = "knob"
knob.Parent = slider
knob.Active = true
knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
knob.BorderColor3 = Color3.fromRGB(0, 0, 0)
knob.BorderSizePixel = 0
knob.Position = UDim2.new(0, 0, -0.100000001, 0)
knob.Size = UDim2.new(0.0649999976, 0, 1.22599995, 0)
knob.ZIndex = 2

knobdragdetector.Parent = knob
knobdragdetector.CursorIcon = "rbxassetid://0"
knobdragdetector.ActivatedCursorIcon = "rbxassetid://0"
knobdragdetector.BoundingUI = slider
knobdragdetector.DragStyle = Enum.UIDragDetectorDragStyle.TranslateLine
knobdragdetector.ReferenceUIInstance = slider

UICorner_3.CornerRadius = UDim.new(1, 0)
UICorner_3.Parent = knob

UICorner_4.CornerRadius = UDim.new(0, 4)
UICorner_4.Parent = slider

slidervalue.Name = "slidervalue"
slidervalue.Parent = main
slidervalue.AnchorPoint = Vector2.new(0.5, 0.5)
slidervalue.BackgroundColor3 = Color3.fromRGB(76, 76, 76)
slidervalue.BackgroundTransparency = 1.000
slidervalue.BorderColor3 = Color3.fromRGB(0, 0, 0)
slidervalue.BorderSizePixel = 0
slidervalue.Position = UDim2.new(0.486486584, 0, 0.639158964, 0)
slidervalue.Size = UDim2.new(0.832432449, 0, 0.112710074, 0)
slidervalue.Font = Enum.Font.SourceSans
slidervalue.Text = "ты будешь падать 0.7 секунд"
slidervalue.TextScaled = true
slidervalue.TextColor3 = Color3.fromRGB(238, 51, 255)
slidervalue.TextSize = 25.000
slidervalue.TextWrapped = true
slidervalue.TextYAlignment = Enum.TextYAlignment.Top

changebind.Name = "changebind"
changebind.Parent = main
changebind.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
changebind.BackgroundTransparency = 0.700
changebind.BorderColor3 = Color3.fromRGB(0, 0, 0)
changebind.BorderSizePixel = 0
changebind.Position = UDim2.new(0.1027027, 0, 0.288065851, 0)
changebind.Size = UDim2.new(0.772973001, 0, 0.168724284, 0)
changebind.Font = Enum.Font.SourceSans
changebind.Text = "поменять бинд (b)"
changebind.TextColor3 = Color3.fromRGB(255, 255, 255)
changebind.TextScaled = true
changebind.TextSize = 28.000
changebind.TextWrapped = true

UICorner_5.CornerRadius = UDim.new(0.100000001, 0)
UICorner_5.Parent = changebind

changehidebind.Name = "changehidebind"
changehidebind.Parent = main
changehidebind.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
changehidebind.BackgroundTransparency = 0.700
changehidebind.BorderColor3 = Color3.fromRGB(0, 0, 0)
changehidebind.BorderSizePixel = 0
changehidebind.Position = UDim2.new(0.1027027, 0, 0.0658436269, 0)
changehidebind.Size = UDim2.new(0.772973001, 0, 0.168724284, 0)
changehidebind.Font = Enum.Font.SourceSans
changehidebind.Text = "поменять бинд чтобы спрятать гуишку (x)"
changehidebind.TextColor3 = Color3.fromRGB(255, 255, 255)
changehidebind.TextScaled = true
changehidebind.TextSize = 28.000
changehidebind.TextWrapped = true

UICorner_6.CornerRadius = UDim.new(0.100000001, 0)
UICorner_6.Parent = changehidebind

	local script = Instance.new('LocalScript', main)

	local uis = game:GetService("UserInputService")
	local bind = script.Parent.bind
	local hidebind = script.Parent.hidebind
	local main = script.Parent
	local changebind = script.Parent.changebind
	local changehidebind = script.Parent.changehidebind
	local changebindconn
	local changehidebindconn 


	local knob = script.Parent.slider.knob
	local slider = knob.Parent
	local dd = knob:WaitForChild("UIDragDetector")

	local min = 0.7
	local max = 4.5

	dd.DragContinue:Connect(function()
		local x = knob.Position.X.Offset
		local maxtrackwidth = slider.AbsoluteSize.X - knob.AbsoluteSize.X
		local raw = math.clamp(x / maxtrackwidth, 0, 1)

		local val = min + (raw * (max - min))
		local shift = 10 ^ 1
		local final = math.round(val * shift) / shift

		slidervalue.Text = "ты будешь падать "..final.." секунд"
		waittime.Value = final
	end)

	uis.InputBegan:Connect(function(i,p)
		if p then return end
		if i.KeyCode.Name == bind.Value then --scriptblox.com/script/Universal-Script-anti-bang-21721
			local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart

			workspace.FallenPartsDestroyHeight = -3000
			local lastCFrame = hrp.CFrame

			hrp.CFrame = CFrame.new(Vector3.new(0, -500, 0))

			wait(waittime.Value)

			hrp.CFrame = lastCFrame
			workspace.FallenPartsDestroyHeight = -500

		elseif i.KeyCode.Name == hidebind.Value then
			main.Visible = not main.Visible
		end
	end)
	
	changebind.Activated:Connect(function()
		if changebindconn then
			changebindconn:Disconnect()
		end
		if changehidebindconn then
			changehidebindconn:Disconnect()
		end
		changebind.Text = "нажми любую кнопку"
		changebindconn = uis.InputBegan:Connect(function(i,p)
			if p then return end
			changebindconn:Disconnect()
			wait(0.15)
			bind.Value = i.KeyCode.Name
			changebind.Text = "поменять бинд ("..string.lower(bind.Value)..")"
		end)
	end)

	changehidebind.Activated:Connect(function()
		if changehidebindconn then
			changebindconn:Disconnect()
		end
		if changebindconn then
			changebindconn:Disconnect()
		end
		changehidebind.Text = "нажми любую кнопку"
		changehidebindconn = uis.InputBegan:Connect(function(i,p)
			if p then return end
			changehidebindconn:Disconnect()
			wait(0.015)
			hidebind.Value = i.KeyCode.Name
			changehidebind.Text = "поменять бинд чтобы спрятать гуишку ("..string.lower(hidebind.Value)..")"
		end)	
	end)
