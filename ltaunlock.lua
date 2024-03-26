local TweenService = game:GetService("TweenService")

-- Create ScreenGui
local gui = Instance.new("ScreenGui")
gui.Name = "FPSIncreaseUI"
gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Create Frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 250)
frame.Position = UDim2.new(0.5, -150, 0.5, -125)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
frame.BorderSizePixel = 0
frame.Parent = gui

-- Function to create a rounded corner
local function createRoundedCorner(obj)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = obj
end

-- Apply rounded corners to the frame
createRoundedCorner(frame)

-- Create FPS Increase Button
local fpsButton = Instance.new("TextButton")
fpsButton.Size = UDim2.new(0, 200, 0, 50)
fpsButton.Position = UDim2.new(0.5, -100, 0.2, 0)
fpsButton.BackgroundColor3 = Color3.fromRGB(74, 143, 255)
fpsButton.BorderSizePixel = 0
fpsButton.Font = Enum.Font.SourceSans
fpsButton.TextSize = 20
fpsButton.TextColor3 = Color3.fromRGB(255, 255, 255)
fpsButton.Text = "Increase FPS"
fpsButton.Parent = frame

-- Apply rounded corners to the FPS button
createRoundedCorner(fpsButton)

-- Function to animate button on click
local function animateButtonClick(button)
    local originalSize = button.Size
    local newSize = UDim2.new(originalSize.X.Scale, originalSize.X.Offset * 0.95, originalSize.Y.Scale, originalSize.Y.Offset * 0.95)
    
    local tweenInfo = TweenInfo.new(0.1)
    local tween = TweenService:Create(button, tweenInfo, {Size = newSize})
    tween:Play()
    tween.Completed:Wait()
    tween:Reverse()
end

-- Function to increase FPS
local function increaseFPS()
    animateButtonClick(fpsButton)

    for _, obj in ipairs(game.Workspace:GetDescendants()) do
        if obj:IsA("BasePart") then
            obj.Color = Color3.new(1, 1, 1)
            obj.Material = Enum.Material.SmoothPlastic
        end
    end

    game.Lighting.OutdoorAmbient = Color3.new(1, 1, 1)
    game.Lighting.Ambient = Color3.new(1, 1, 1)
    game.Lighting.Brightness = 2
    game.Lighting.GlobalShadows = false
end

-- Connect button click event
fpsButton.MouseButton1Click:Connect(increaseFPS)

-- Create Close Button
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -35, 0, 5)
closeButton.AnchorPoint = Vector2.new(1, 0)
closeButton.BackgroundColor3 = Color3.fromRGB(255, 99, 71)
closeButton.BorderSizePixel = 0
closeButton.Font = Enum.Font.SourceSans
closeButton.TextSize = 20
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.Text = "X"
closeButton.Parent = frame

-- Apply rounded corners to the Close button
createRoundedCorner(closeButton)

-- Function to animate closing
local function closeUI()
    animateButtonClick(closeButton)
    wait(0.2) -- Delay before destroying UI
    gui:Destroy()
end

-- Connect close button click event
closeButton.MouseButton1Click:Connect(closeUI)
