local rs = game:GetService("RunService")
local uis = game:GetService("UserInputService")
local plr = game.Players.LocalPlayer
local char = plr.Character or plr.CharacterAdded:Wait()
local hum = char:WaitForChild("Humanoid")
local animator = hum:WaitForChild("Animator")

local sitid = 83475540437708

if not isfolder("animstorage") then
	makefolder("animstorage")
end

local gui = Instance.new("ScreenGui")
gui.Name = "animmanagergui"
gui.ResetOnSpawn = false
gui.Parent = plr:WaitForChild("PlayerGui")

local panel = Instance.new("Frame")
panel.Size = UDim2.new(0, 320, 0, 240)
panel.Position = UDim2.new(0.4, -160, 0.5, -120)
panel.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
panel.BorderSizePixel = 0
panel.Active = true
panel.Draggable = true
panel.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 8)
corner.Parent = panel

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundTransparency = 1
title.Text = "animation player<3"
title.TextColor3 = Color3.fromRGB(200, 200, 200)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 14
title.Parent = panel

local function createinput(placeholder, ypos, parent)
	local box = Instance.new("TextBox")
	box.Size = UDim2.new(0.9, 0, 0, 30)
	box.Position = UDim2.new(0.05, 0, 0, ypos)
	box.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	box.TextColor3 = Color3.fromRGB(255, 255, 255)
	box.PlaceholderText = placeholder
	box.Text = ""
	box.Font = Enum.Font.SourceSans
	box.TextSize = 14
	box.ClearTextOnFocus = false
	box.BorderSizePixel = 0
	box.Parent = parent or panel
	local c = Instance.new("UICorner")
	c.CornerRadius = UDim.new(0, 4)
	c.Parent = box
	return box
end

local function createbtn(text, ypos, color)
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(0.9, 0, 0, 30)
	btn.Position = UDim2.new(0.05, 0, 0, ypos)
	btn.BackgroundColor3 = color
	btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	btn.Text = text
	btn.Font = Enum.Font.SourceSansBold
	btn.TextSize = 14
	btn.BorderSizePixel = 0
	btn.Parent = panel
	local c = Instance.new("UICorner")
	c.CornerRadius = UDim.new(0, 4)
	c.Parent = btn
	return btn
end

local nameinput = createinput("animation name", 40)
local idinput = createinput("animation id", 80)
local playbtn = createbtn("play & save animation", 120, Color3.fromRGB(0, 140, 90))
local togglebtn = createbtn("stop animation after walking: false", 160, Color3.fromRGB(140, 45, 45))

local sidebtn = Instance.new("ImageButton")
sidebtn.Size = UDim2.new(0, 35, 0, 35)
sidebtn.Position = UDim2.new(1, -35, 0, 0)
sidebtn.BackgroundTransparency = 1
sidebtn.Image = "http://www.roblox.com/asset/?id=12141614304"
sidebtn.Parent = panel

local sidecontainer = Instance.new("Frame")
sidecontainer.Size = UDim2.new(0, 200, 1, 0)
sidecontainer.Position = UDim2.new(1, 5, 0, 0)
sidecontainer.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
sidecontainer.BorderSizePixel = 0
sidecontainer.Parent = panel
sidecontainer.Visible = false

local sidecontainercorner = Instance.new("UICorner")
sidecontainercorner.CornerRadius = UDim.new(0, 8)
sidecontainercorner.Parent = sidecontainer

local searchbar = createinput("search animations", 5, sidecontainer)
searchbar.Size = UDim2.new(0.9, 0, 0, 25)

local sidebar = Instance.new("ScrollingFrame")
sidebar.Size = UDim2.new(1, 0, 1, -40)
sidebar.Position = UDim2.new(0, 0, 0, 35)
sidebar.BackgroundTransparency = 1
sidebar.BorderSizePixel = 0
sidebar.CanvasSize = UDim2.new(0, 0, 0, 0)
sidebar.AutomaticCanvasSize = Enum.AutomaticSize.Y
sidebar.Parent = sidecontainer

local listlayout = Instance.new("UIListLayout")
listlayout.Padding = UDim.new(0, 5)
listlayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
listlayout.SortOrder = Enum.SortOrder.LayoutOrder
listlayout.Parent = sidebar

local listpadding = Instance.new("UIPadding")
listpadding.PaddingTop = UDim.new(0, 5)
listpadding.Parent = sidebar

local currenttrack = nil
local sittrack = nil
local stoponwalk = false

local function getanimid(id)
	local objects = game:GetObjects("rbxassetid://" .. tonumber(id))
	for x = 1, #objects do
		local obj = objects[x]
		if obj:IsA("Animation") then
			return obj.AnimationId
		end
		wait(0.01)
	end
	return "rbxassetid://" .. tonumber(id)
end

local decodedsitid = getanimid(sitid)
local sitanim = Instance.new("Animation")
sitanim.AnimationId = decodedsitid

local function stopcurrent()
	if currenttrack then
		currenttrack:Stop()
		currenttrack:Destroy()
		currenttrack = nil
	end
end

local function runanim(rawid)
	stopcurrent()
	local finalid = getanimid(rawid)
	local newanim = Instance.new("Animation")
	newanim.AnimationId = finalid
	local success, err = pcall(function()
		currenttrack = animator:LoadAnimation(newanim)
		currenttrack.Priority = Enum.AnimationPriority.Action4
		currenttrack:Play()
	end)
	if not success then warn("failed playing tracker: ", err) end
end

local function refreshlist()
	for _, child in ipairs(sidebar:GetChildren()) do
		if child:IsA("Frame") then
			child:Destroy()
		end
	end
	local success, files = pcall(function() return listfiles("animstorage") end)
	if not success or not files then return end
	local searchtext = string.lower(searchbar.Text)
	for _, filepath in ipairs(files) do
		local pathparts = string.split(filepath, "/")
		local cleanfilename = pathparts[#pathparts] or filepath
		cleanfilename = string.gsub(cleanfilename, "%.txt$", "")
		if searchtext ~= "" and not string.find(string.lower(cleanfilename), searchtext, 1, true) then
			continue
		end
		local readingpath = "animstorage//" .. cleanfilename .. ".txt"
		local filecontent = ""
		pcall(function() filecontent = readfile(readingpath) end)
		local rowframe = Instance.new("Frame")
		rowframe.Size = UDim2.new(0.9, 0, 0, 30)
		rowframe.BackgroundTransparency = 1
		rowframe.Parent = sidebar
		local rowlayout = Instance.new("UIListLayout")
		rowlayout.FillDirection = Enum.FillDirection.Horizontal
		rowlayout.SortOrder = Enum.SortOrder.LayoutOrder
		rowlayout.Padding = UDim.new(0, 4)
		rowlayout.Parent = rowframe
		local itembtn = Instance.new("TextButton")
		itembtn.Size = UDim2.new(0.8, -2, 1, 0)
		itembtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
		itembtn.TextColor3 = Color3.fromRGB(230, 230, 230)
		itembtn.Text = cleanfilename
		itembtn.Font = Enum.Font.SourceSans
		itembtn.TextSize = 13
		itembtn.BorderSizePixel = 0
		itembtn.LayoutOrder = 1
		itembtn.Parent = rowframe
		local itemcorner = Instance.new("UICorner")
		itemcorner.CornerRadius = UDim.new(0, 4)
		itemcorner.Parent = itembtn
		local delbtn = Instance.new("ImageButton")
		delbtn.Size = UDim2.new(0.16, -2, 0.9, 0)
		delbtn.BackgroundTransparency = 1
		delbtn.Image = "http://www.roblox.com/asset/?id=6741600111"
		delbtn.BorderSizePixel = 0
		delbtn.LayoutOrder = 2
		delbtn.Parent = rowframe
		local delcorner = Instance.new("UICorner")
		delcorner.CornerRadius = UDim.new(0, 4)
		delcorner.Parent = delbtn
		itembtn.MouseButton1Click:Connect(function()
			if filecontent ~= "" then
				runanim(filecontent)
			end
		end)
		delbtn.MouseButton1Click:Connect(function()
			pcall(function() delfile(readingpath) end)
			refreshlist()
		end)
	end
end

local function setupsitlistener()
	hum.StateChanged:Connect(function(_, newstate)
		if newstate == Enum.HumanoidStateType.Seated then
			stopcurrent()
			local success, err = pcall(function()
				sittrack = animator:LoadAnimation(sitanim)
				sittrack.Priority = Enum.AnimationPriority.Action4
				sittrack:Play()
			end)
			if not success then warn("failed playing sit animation: ", err) end
		else
			if sittrack then
				sittrack:Stop()
				sittrack:Destroy()
				sittrack = nil
			end
		end
	end)
end

setupsitlistener()

searchbar:GetPropertyChangedSignal("Text"):Connect(refreshlist)

playbtn.MouseButton1Click:Connect(function()
	local name = nameinput.Text
	local id = idinput.Text
	if id == "" or not tonumber(id) then return end
	if name ~= "" then
		writefile("animstorage//" .. name .. ".txt", id)
		refreshlist()
	end
	runanim(id)
end)

stoponwalk = true
togglebtn.Text = "stop animation after walking: true"
togglebtn.BackgroundColor3 = Color3.fromRGB(0, 110, 180)

togglebtn.MouseButton1Click:Connect(function()
	stoponwalk = not stoponwalk
	if stoponwalk then
		togglebtn.Text = "stop animation after walking: true"
		togglebtn.BackgroundColor3 = Color3.fromRGB(0, 110, 180)
	else
		togglebtn.Text = "stop animation after walking: false"
		togglebtn.BackgroundColor3 = Color3.fromRGB(140, 45, 45)
	end
end)

sidebtn.MouseButton1Click:Connect(function()
	sidecontainer.Visible = not sidecontainer.Visible
end)

rs.Heartbeat:Connect(function()
	if stoponwalk and hum.MoveDirection.Magnitude > 0 then
		stopcurrent()
	end
end)

plr.CharacterAdded:Connect(function(newchar)
	char = newchar
	hum = char:WaitForChild("Humanoid")
	animator = hum:WaitForChild("Animator")
	stopcurrent()
	if sittrack then
		sittrack:Stop()
		sittrack:Destroy()
		sittrack = nil
	end
	setupsitlistener()
end)

refreshlist()
