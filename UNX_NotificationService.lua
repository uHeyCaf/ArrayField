-- Never Using This But Fuck It.
-- Example Usage: 
--[[
local NotifService = loadstring(game:HttpGet("https://raw.githubusercontent.com/uHeyCaf/ArrayField/refs/heads/main/UNX_NotificationService.lua"))()

NotifService:Notif1("Title", "Description", "Button1", "Button2", true)

-- Title: The Title Of The Window
-- Description: What You Wanna Say
-- Button1: Primary Button (Can Be Text)
-- Button2: Secondary Button (Can Be Text)
-- true/false: Bollean To Define If Buttton2 Is Visible, true = visible, false = invisible

NotifService:Notif2("Title", "Description", 5)

-- Title: Title Of The Notif
-- Description What You Want To Say
-- 5: Lifetime Of The Notif.

]]

local aa = {}
local ab = game:GetService("TweenService")
local ac = game:GetService("UserInputService")
local ad = game:GetService("ContextActionService")
local ae = game.Players.LocalPlayer:WaitForChild("PlayerGui")
local af = game:GetService("Lighting")

local debugmode = false
local ActiveNotifications = {}

local function CreateTween(ag, ah, ai)
	ab:Create(ag, TweenInfo.new(ai, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = ah}):Play()
end

function aa.Notif1(aj, ak, al, am, an)
	local ao = Instance.new("Sound", ae)
	ao.SoundId = "rbxassetid://8486683243"
	ao:Play()

	local ap = Instance.new("Sound", ae)
	ap.SoundId = "rbxassetid://6895079853"

	local aq = Instance.new("Sound", ae)
	aq.SoundId = "rbxassetid://6042053626"
	aq.Looped = true
	aq.Volume = 0
	aq.Pitch = 0.5
	aq.PlaybackSpeed = 2
	aq:Play()

	local ar = Instance.new("BlurEffect")
	ar.Size = 0
	ar.Parent = af
	ab:Create(ar, TweenInfo.new(0.3), {Size = 15}):Play()

	local as = Instance.new("ScreenGui")
	as.Name = "ErrorGui"
	as.IgnoreGuiInset = true
	as.ResetOnSpawn = false
	as.Parent = ae

	local at = Instance.new("Frame")
	at.Size = UDim2.fromOffset(200, 125)
	at.Position = UDim2.fromScale(0.5, 0.5) - UDim2.fromOffset(100, 62.5)
	at.BackgroundColor3 = Color3.new(0, 0, 0)
	at.BackgroundTransparency = 0.75
	at.ZIndex = 0
	at.Parent = as
	Instance.new("UICorner", at).CornerRadius = UDim.new(0, 8)

	local au = Instance.new("Frame")
	au.Size = at.Size
	au.Position = at.Position
	au.BackgroundColor3 = Color3.fromRGB(0, 2, 39)
	au.BorderSizePixel = 0
	au.ZIndex = 1
	au.Parent = as
	Instance.new("UICorner", au).CornerRadius = UDim.new(0, 8)

	local av = Instance.new("Frame")
	av.Size = UDim2.new(1, 0, 0, 35)
	av.BackgroundTransparency = 1
	av.Position = UDim2.new(0, 0, 0, 0)
	av.ZIndex = 2
	av.Parent = au

	local aw = Instance.new("ImageLabel")
	aw.Image = "rbxassetid://14951904106"
	aw.Size = UDim2.fromOffset(28, 28)
	aw.Position = UDim2.new(0, 5, 0.5, -14)
	aw.BackgroundTransparency = 1
	aw.ZIndex = 2
	aw.Parent = av

	local ax = Instance.new("TextLabel")
	ax.Text = aj
	ax.Font = Enum.Font.GothamSemibold
	ax.TextColor3 = Color3.new(1, 1, 1)
	ax.BackgroundTransparency = 1
	ax.Size = UDim2.new(1, -35, 1, 0)
	ax.Position = UDim2.new(0, 35, 0, 0)
	ax.TextXAlignment = Enum.TextXAlignment.Left
	ax.TextScaled = true
	ax.ZIndex = 2
	ax.Parent = av

	local ay = Instance.new("TextLabel")
	ay.Text = ak
	ay.Font = Enum.Font.Gotham
	ay.TextColor3 = Color3.new(1, 1, 1)
	ay.BackgroundTransparency = 1
	ay.Size = UDim2.new(1, -10, 0, 50)
	ay.Position = UDim2.new(0, 5, 0, 35)
	ay.TextWrapped = true
	ay.TextScaled = true
	ay.ZIndex = 2
	ay.Parent = au

	local az = Instance.new("TextButton")
	az.Text = al
	az.Font = Enum.Font.GothamBold
	az.TextColor3 = Color3.new(1, 1, 1)
	az.BackgroundColor3 = Color3.fromRGB(0, 25, 255)
	az.Size = UDim2.new(0.5, -6, 0, 30)
	az.Position = UDim2.new(0, 5, 1, -35)
	az.ZIndex = 2
	az.Parent = au
	Instance.new("UICorner", az).CornerRadius = UDim.new(0, 6)

	local ba = Instance.new("TextButton")
	ba.Text = am
	ba.Font = Enum.Font.GothamBold
	ba.TextColor3 = Color3.new(1, 1, 1)
	ba.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
	ba.Size = UDim2.new(0.5, -6, 0, 30)
	ba.Position = UDim2.new(0.5, 1, 1, -35)
	ba.ZIndex = 2
	ba.Parent = au
	Instance.new("UICorner", ba).CornerRadius = UDim.new(0, 6)

	if debugmode then
		print("[DEBUG:Notif1] "..aj.." | "..ak)
	end

	local function bb()
		ab:Create(ar, TweenInfo.new(0.3), {Size = 0}):Play()
		as:Destroy()
		aq:Destroy()
	end

	az.MouseButton1Click:Connect(function()
		if an then ap:Play() end
		bb()
	end)

	ba.MouseButton1Click:Connect(function()
		bb()
	end)
end

function aa.Notif2(bc, bd, be)
	local bf = Instance.new("Frame")
	local bg = Instance.new("UICorner")
	local bh = Instance.new("TextLabel")
	local bi = Instance.new("TextLabel")
	local bj = Instance.new("ImageLabel")
	local bk = Instance.new("UICorner")
	local bl = Instance.new("UIScale")

	bf.Name = "NotificationBox"
	bf.BackgroundColor3 = Color3.fromRGB(0, 7, 32)
	bf.BorderSizePixel = 0
	bf.Size = UDim2.new(0.3, 0, 0.1, 0)
	bf.AnchorPoint = Vector2.new(1, 1)
	bf.Position = UDim2.new(1.3, 0, 0.99, 0)
	bf.Parent = ae
	bg.Parent = bf
	bl.Parent = bf
	bl.Scale = 1

	bh.Name = "TitleText"
	bh.Parent = bf
	bh.BackgroundTransparency = 1
	bh.Position = UDim2.new(0.2, 0, 0.15, 0)
	bh.Size = UDim2.new(0.75, 0, 0.3, 0)
	bh.Font = Enum.Font.SourceSansLight
	bh.Text = bc
	bh.TextColor3 = Color3.fromRGB(255, 255, 255)
	bh.TextScaled = true
	bh.TextWrapped = true
	bh.TextXAlignment = Enum.TextXAlignment.Left

	bi.Name = "MessageText"
	bi.Parent = bf
	bi.BackgroundTransparency = 1
	bi.Position = UDim2.new(0.2, 0, 0.55, 0)
	bi.Size = UDim2.new(0.75, 0, 0.3, 0)
	bi.Font = Enum.Font.SourceSansLight
	bi.Text = bd
	bi.TextColor3 = Color3.fromRGB(255, 255, 255)
	bi.TextScaled = true
	bi.TextWrapped = true
	bi.TextXAlignment = Enum.TextXAlignment.Left

	bj.Name = "IconImage"
	bj.Parent = bf
	bj.BackgroundTransparency = 1
	bj.Position = UDim2.new(0.03, 0, 0.1, 0)
	bj.Size = UDim2.new(0.15, 0, 0.8, 0)
	bj.Image = "rbxassetid://14951904106"
	bk.Parent = bj

	if debugmode then
		print("[DEBUG:Notif2] "..bc.." | "..bd.." ("..tostring(be)..")")
	end

	table.insert(ActiveNotifications, bf)

	for bn, bo in ipairs(ActiveNotifications) do
		local bp = UDim2.new(0.99, 0, 0.99 - (0.11 * (bn - 1)), 0)
		CreateTween(bo, bp, 0.35)
	end

	CreateTween(bf, UDim2.new(0.99, 0, 0.99 - (0.11 * (#ActiveNotifications - 1)), 0), 0.35)

	local bq = Instance.new("Sound")
	bq.SoundId = "rbxassetid://8551372796"
	bq.Volume = 1
	bq.Parent = workspace
	bq:Play()
	bq.Ended:Connect(function()
		bq:Destroy()
	end)

	task.delay(be, function()
		if bf and bf.Parent then
			CreateTween(bf, UDim2.new(1.3, 0, bf.Position.Y.Scale, 0), 0.35)
			task.wait(0.35)
			bf:Destroy()
		end

		for br, bs in ipairs(ActiveNotifications) do
			if bs == bf then
				table.remove(ActiveNotifications, br)
				break
			end
		end

		for bt, bu in ipairs(ActiveNotifications) do
			local bv = UDim2.new(0.99, 0, 0.99 - (0.11 * (bt - 1)), 0)
			CreateTween(bu, bv, 0.35)
		end
	end)
end

return aa
