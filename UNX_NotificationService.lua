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
local ab = game:GetService("Players")
local ac = game:GetService("TweenService")
local ad = game:GetService("RunService")
local ae = ab.LocalPlayer
local af = workspace.CurrentCamera or workspace
local ag = {}

function aa:Notif1(ah, ai, aj, ak, al)
    aj = aj or "OK"
    ak = ak or "Cancel"
    local am = ae:WaitForChild("PlayerGui")
    local an = Instance.new("Sound", am)
    an.SoundId = "rbxassetid://8486683243"
    an:Play()
    local ao = Instance.new("Sound", am)
    ao.SoundId = "rbxassetid://6895079853"
    local ap = Instance.new("Sound", am)
    ap.SoundId = "rbxassetid://6042053626"
    ap.Looped = true
    ap.Volume = 0
    ap.PlaybackSpeed = 2
    ap:Play()
    local aq = Instance.new("BlurEffect")
    aq.Size = 0
    aq.Parent = af
    ac:Create(aq, TweenInfo.new(0.3), {Size = 15}):Play()
    local ar = Instance.new("ScreenGui", am)
    ar.Name = "ErrorGui"
    ar.IgnoreGuiInset = true
    ar.ResetOnSpawn = false
    local as = Instance.new("Frame", ar)
    as.Size = UDim2.fromOffset(200, 125)
    as.Position = UDim2.fromScale(0.5, 0.5) - UDim2.fromOffset(100, 62.5)
    as.BackgroundColor3 = Color3.new(0, 0, 0)
    as.BackgroundTransparency = 0.75
    Instance.new("UICorner", as).CornerRadius = UDim.new(0, 8)
    local at = Instance.new("Frame", ar)
    at.Size = as.Size
    at.Position = as.Position
    at.BackgroundColor3 = Color3.fromRGB(0, 2, 39)
    at.BorderSizePixel = 0
    Instance.new("UICorner", at).CornerRadius = UDim.new(0, 8)
    local au = Instance.new("Frame", at)
    au.Size = UDim2.new(1, 0, 0, 35)
    au.BackgroundColor3 = at.BackgroundColor3
    Instance.new("UICorner", au).CornerRadius = UDim.new(0, 8)
    local av = Instance.new("ImageLabel", au)
    av.Size = UDim2.fromOffset(26, 26)
    av.Position = UDim2.new(0, 8, 0.5, -13)
    av.BackgroundTransparency = 1
    av.Image = "rbxassetid://84759093733650"
    Instance.new("UICorner", av).CornerRadius = UDim.new(0, 6)
    local aw = Instance.new("TextLabel", au)
    aw.Size = UDim2.new(1, -50, 1, 0)
    aw.Position = UDim2.fromOffset(40, 0)
    aw.BackgroundTransparency = 1
    aw.Font = Enum.Font.SourceSansLight
    aw.TextSize = 20
    aw.TextColor3 = Color3.new(1, 1, 1)
    aw.Text = ah
    aw.TextXAlignment = Enum.TextXAlignment.Left
    local ax = Instance.new("TextLabel", at)
    ax.Size = UDim2.new(1, -40, 0, 45)
    ax.Position = UDim2.fromOffset(20, 40)
    ax.BackgroundTransparency = 1
    ax.Font = Enum.Font.SourceSansLight
    ax.TextSize = 17
    ax.TextColor3 = Color3.new(1, 1, 1)
    ax.TextWrapped = true
    ax.TextYAlignment = Enum.TextYAlignment.Top
    ax.TextXAlignment = Enum.TextXAlignment.Left
    ax.Text = ai
    local ay = Instance.new("TextButton", at)
    ay.Size = UDim2.new(0.4, 0, 0, 35)
    ay.Position = al and UDim2.new(0.08, 0, 1, -45) or UDim2.new(0.3, 0, 1, -45)
    ay.BackgroundColor3 = Color3.fromRGB(0, 4, 67)
    ay.Text = aj
    ay.Font = Enum.Font.SourceSansLight
    ay.TextSize = 17
    ay.TextColor3 = Color3.new(1, 1, 1)
    Instance.new("UICorner", ay).CornerRadius = UDim.new(0, 6)
    local az
    if al then
        az = Instance.new("TextButton", at)
        az.Size = UDim2.new(0.4, 0, 0, 35)
        az.Position = UDim2.new(0.52, 0, 1, -45)
        az.BackgroundColor3 = Color3.fromRGB(0, 4, 67)
        az.Text = ak
        az.Font = Enum.Font.SourceSansLight
        az.TextSize = 17
        az.TextColor3 = Color3.new(1, 1, 1)
        Instance.new("UICorner", az).CornerRadius = UDim.new(0, 6)
        az.MouseButton1Click:Connect(function()
            ac:Create(aq, TweenInfo.new(0.3), {Size = 0}):Play()
            wait(0.3)
            ar:Destroy()
            aq:Destroy()
        end)
    end
    ay.MouseButton1Click:Connect(function()
        ac:Create(aq, TweenInfo.new(0.3), {Size = 0}):Play()
        wait(0.3)
        ar:Destroy()
        aq:Destroy()
    end)
end

function aa:Notif2(ba, bb, bc)
    local bd = ae:WaitForChild("PlayerGui")
    local be = Instance.new("Sound", bd)
    be.SoundId = "rbxassetid://8486683243"
    be:Play()
    local bf = Instance.new("ScreenGui", bd)
    bf.Name = "Notif2"
    bf.ResetOnSpawn = false
    local bg = Instance.new("Frame", bf)
    bg.AnchorPoint = Vector2.new(1, 1)
    bg.Position = UDim2.new(1, -20, 1, -20 - (#ag * 110))
    bg.Size = UDim2.new(0, 300, 0, 100)
    bg.BackgroundColor3 = Color3.fromRGB(0, 4, 67)
    bg.BackgroundTransparency = 0.2
    bg.BorderSizePixel = 0
    Instance.new("UICorner", bg).CornerRadius = UDim.new(0, 10)
    local bh = Instance.new("TextLabel", bg)
    bh.Size = UDim2.new(1, -20, 0, 25)
    bh.Position = UDim2.new(0, 10, 0, 8)
    bh.BackgroundTransparency = 1
    bh.Font = Enum.Font.SourceSansSemibold
    bh.TextSize = 18
    bh.TextColor3 = Color3.new(1, 1, 1)
    bh.Text = ba
    bh.TextXAlignment = Enum.TextXAlignment.Left
    local bi = Instance.new("TextLabel", bg)
    bi.Size = UDim2.new(1, -20, 1, -40)
    bi.Position = UDim2.new(0, 10, 0, 35)
    bi.BackgroundTransparency = 1
    bi.Font = Enum.Font.SourceSans
    bi.TextSize = 15
    bi.TextColor3 = Color3.new(1, 1, 1)
    bi.TextWrapped = true
    bi.Text = bb
    bi.TextXAlignment = Enum.TextXAlignment.Left
    table.insert(ag, bg)
    task.delay(bc or 3, function()
        if bg then
            ac:Create(bg, TweenInfo.new(0.3), {Position = bg.Position + UDim2.new(0, 0, 0, 50), Transparency = 1}):Play()
            wait(0.3)
            bg:Destroy()
        end
    end)
end

return aa
