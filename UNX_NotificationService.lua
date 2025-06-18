--[[

Usage:

local NotificationSystem = loadstring(game:HttpGet("https://raw.githubusercontent.com/uHeyCaf/ArrayField/refs/heads/main/UNX_NotificationService.lua"))()
NotificationSystem.Notification("Title", "Message", "OK", "Cancel", true)

-- Title: Error Message Title
-- Message: The Message U Wanna Say
-- OK: Button One (Primary)
-- Cancel: Button Two (Secondary)
-- true/false: true = button two visible, false = button two invisible

]]

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local ContextActionService = game:GetService("ContextActionService")
local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
local Lighting = game:GetService("Lighting")

local Module = {}

function Module.Notification(title, message, okText, cancelText, hasCancel)
    local sound1 = Instance.new("Sound", PlayerGui)
    sound1.SoundId = "rbxassetid://8486683243"
    sound1:Play()

    local sound2 = Instance.new("Sound", PlayerGui)
    sound2.SoundId = "rbxassetid://6895079853"

    local soundLoop = Instance.new("Sound", PlayerGui)
    soundLoop.SoundId = "rbxassetid://6042053626"
    soundLoop.Looped = true
    soundLoop.Volume = 0
    soundLoop.Pitch = 0.5
    soundLoop.PlaybackSpeed = 2
    soundLoop:Play()

    local blur = Instance.new("BlurEffect")
    blur.Size = 0
    blur.Parent = Lighting
    TweenService:Create(blur, TweenInfo.new(0.3), {Size = 15}):Play()

    local gui = Instance.new("ScreenGui")
    gui.Name = "ErrorGui"
    gui.IgnoreGuiInset = true
    gui.ResetOnSpawn = false
    gui.Parent = PlayerGui

    local backShadow = Instance.new("Frame")
    backShadow.Size = UDim2.fromOffset(200, 125)
    backShadow.Position = UDim2.fromScale(0.5, 0.5) - UDim2.fromOffset(100, 62.5)
    backShadow.BackgroundColor3 = Color3.new(0, 0, 0)
    backShadow.BackgroundTransparency = 0.75
    backShadow.ZIndex = 0
    backShadow.Parent = gui
    Instance.new("UICorner", backShadow).CornerRadius = UDim.new(0, 8)

    local container = Instance.new("Frame")
    container.Size = UDim2.fromOffset(200, 125)
    container.Position = backShadow.Position
    container.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
    container.BorderSizePixel = 0
    container.ZIndex = 1
    container.Parent = gui
    Instance.new("UICorner", container).CornerRadius = UDim.new(0, 8)

    local header = Instance.new("Frame")
    header.Size = UDim2.new(1, 0, 0, 35)
    header.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
    header.BorderSizePixel = 0
    header.ZIndex = 2
    header.Parent = container
    Instance.new("UICorner", header).CornerRadius = UDim.new(0, 8)

    local icon = Instance.new("ImageLabel")
    icon.Size = UDim2.fromOffset(26, 26)
    icon.Position = UDim2.new(0, 8, 0.5, -13)
    icon.BackgroundTransparency = 1
    icon.Image = "rbxassetid://14951904106"
    icon.ZIndex = 3
    icon.Parent = header
    Instance.new("UICorner", icon).CornerRadius = UDim.new(0, 6)

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, -50, 1, 0)
    titleLabel.Position = UDim2.fromOffset(40, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = title or "Unlisted Error"
    titleLabel.Font = Enum.Font.SourceSansLight
    titleLabel.TextSize = 20
    titleLabel.TextColor3 = Color3.new(1, 1, 1)
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.ZIndex = 3
    titleLabel.Parent = header

    local messageLabel = Instance.new("TextLabel")
    messageLabel.Size = UDim2.new(1, -40, 0, 45)
    messageLabel.Position = UDim2.fromOffset(20, 40)
    messageLabel.BackgroundTransparency = 1
    messageLabel.Text = message or "Unlisted Error Occurred, Please Press /console For More Information."
    messageLabel.Font = Enum.Font.SourceSansLight
    messageLabel.TextSize = 17
    messageLabel.TextWrapped = true
    messageLabel.TextYAlignment = Enum.TextYAlignment.Top
    messageLabel.TextXAlignment = Enum.TextXAlignment.Left
    messageLabel.TextColor3 = Color3.new(1, 1, 1)
    messageLabel.ZIndex = 2
    messageLabel.Parent = container

    local okButton = Instance.new("TextButton")
    okButton.Size = UDim2.new(0.4, 0, 0, 35)
    okButton.Position = hasCancel and UDim2.new(0.08, 0, 1, -45) or UDim2.new(0.3, 0, 1, -45)
    okButton.BackgroundColor3 = Color3.fromRGB(9, 9, 9)
    okButton.Text = okText or "OK"
    okButton.Font = Enum.Font.SourceSansLight
    okButton.TextSize = 17
    okButton.TextColor3 = Color3.new(1, 1, 1)
    okButton.ZIndex = 3
    okButton.Parent = container
    Instance.new("UICorner", okButton).CornerRadius = UDim.new(0, 6)

    local cancelButton
    if hasCancel then
        cancelButton = Instance.new("TextButton")
        cancelButton.Size = UDim2.new(0.4, 0, 0, 35)
        cancelButton.Position = UDim2.new(0.52, 0, 1, -45)
        cancelButton.BackgroundColor3 = Color3.fromRGB(9, 9, 9)
        cancelButton.Text = cancelText or "Cancel"
        cancelButton.Font = Enum.Font.SourceSansLight
        cancelButton.TextSize = 17
        cancelButton.TextColor3 = Color3.new(1, 1, 1)
        cancelButton.ZIndex = 3
        cancelButton.Parent = container
        Instance.new("UICorner", cancelButton).CornerRadius = UDim.new(0, 6)
    end

    local resizeButton = Instance.new("Frame")
    resizeButton.Size = UDim2.fromOffset(20, 20)
    resizeButton.Position = UDim2.new(1, -20, 1, -20)
    resizeButton.BackgroundColor3 = Color3.fromRGB(9, 9, 9)
    resizeButton.BorderSizePixel = 0
    resizeButton.ZIndex = 3
    resizeButton.Parent = container
    Instance.new("UICorner", resizeButton).CornerRadius = UDim.new(0, 4)

    local dragging, dragStart, startPos = false, nil, nil
    local resizing, resizeStart, startSize = false, nil, nil
    local colorDefault = Color3.fromRGB(9, 9, 9)
    local colorDown = Color3.fromRGB(18, 18, 18)

    local connections = {}

    connections[#connections+1] = header.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = container.Position
        end
    end)

    connections[#connections+1] = header.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)

    connections[#connections+1] = resizeButton.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            resizing = true
            resizeStart = input.Position
            startSize = container.Size
            TweenService:Create(resizeButton, TweenInfo.new(0.15), {BackgroundColor3 = colorDown}):Play()
            soundLoop.Volume = 0.3
        end
    end)

    connections[#connections+1] = resizeButton.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            resizing = false
            TweenService:Create(resizeButton, TweenInfo.new(0.15), {BackgroundColor3 = colorDefault}):Play()
            soundLoop.Volume = 0
        end
    end)

    connections[#connections+1] = UserInputService.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            if dragging and dragStart then
                local delta = input.Position - dragStart
                container.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
                backShadow.Position = container.Position
            elseif resizing and resizeStart then
                local delta = input.Position - resizeStart
                local newWidth = math.clamp(startSize.X.Offset + delta.X, 200, 800)
                local newHeight = math.clamp(startSize.Y.Offset + delta.Y, 125, 600)
                container.Size = UDim2.fromOffset(newWidth, newHeight)
                backShadow.Size = container.Size
            end
        end
    end)

    connections[#connections+1] = UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
            resizing = false
            TweenService:Create(resizeButton, TweenInfo.new(0.15), {BackgroundColor3 = colorDefault}):Play()
            soundLoop.Volume = 0
        end
    end)

    local function close(btn)
        for _, conn in ipairs(connections) do conn:Disconnect() end
        local center = btn.AbsolutePosition + btn.AbsoluteSize / 2
        sound2:Play()
        TweenService:Create(blur, TweenInfo.new(0.3), {Size = 0}):Play()
        local tweenOut = {Size = UDim2.fromOffset(0, 0), Position = UDim2.fromOffset(center.X, center.Y)}
        TweenService:Create(container, TweenInfo.new(0.2), tweenOut):Play()
        TweenService:Create(backShadow, TweenInfo.new(0.2), tweenOut):Play()
        task.wait(0.25)
        gui:Destroy()
        blur:Destroy()
        sound1:Destroy()
        sound2:Destroy()
        soundLoop:Destroy()
    end

    okButton.MouseButton1Click:Connect(function() close(okButton) end)
    if cancelButton then
        cancelButton.MouseButton1Click:Connect(function() close(cancelButton) end)
    end
end

return Module
