local gui = Instance.new("ScreenGui")
gui.Name = "FPSIncreaseUI"
gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(1, 0, 1, 0)
mainFrame.Position = UDim2.new(0, 0, 0, 0)
mainFrame.BackgroundColor3 = Color3.new(1, 1, 1)
mainFrame.BorderSizePixel = 0
mainFrame.Visible = false -- Initially not visible
mainFrame.Parent = gui

local disableButton = Instance.new("TextButton")
disableButton.Size = UDim2.new(0, 200, 0, 50)
disableButton.Position = UDim2.new(0.5, -100, 0.5, -25)
disableButton.AnchorPoint = Vector2.new(0.5, 0.5)
disableButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
disableButton.BorderSizePixel = 0
disableButton.Font = Enum.Font.SourceSans
disableButton.TextSize = 20
disableButton.TextColor3 = Color3.fromRGB(255, 255, 255)
disableButton.Text = "Disable"
disableButton.Parent = mainFrame

local function enableWhiteScreen()
    mainFrame.Visible = true
end

local function disableWhiteScreen()
    mainFrame.Visible = false
end

disableButton.MouseButton1Click:Connect(disableWhiteScreen)

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 250, 0, 200)
frame.Position = UDim2.new(0.5, -125, 0.5, -100)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BackgroundColor3 = Color3.fromRGB(44, 44, 44)
frame.BackgroundTransparency = 0.8
frame.BorderSizePixel = 0
frame.ClipsDescendants = true
frame.Parent = mainFrame

local fpsButton = Instance.new("TextButton")
fpsButton.Size = UDim2.new(0, 200, 0, 50)
fpsButton.Position = UDim2.new(0.5, -100, 0.1, 0)
fpsButton.BackgroundColor3 = Color3.fromRGB(74, 143, 255)
fpsButton.BorderSizePixel = 0
fpsButton.Font = Enum.Font.SourceSans
fpsButton.TextSize = 20
fpsButton.TextColor3 = Color3.fromRGB(255, 255, 255)
fpsButton.Text = "FPS Increase"
fpsButton.Parent = frame

local function increaseFPS()
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

fpsButton.MouseButton1Click:Connect(increaseFPS)

local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -30, 0, 0)
closeButton.AnchorPoint = Vector2.new(1, 0)
closeButton.BackgroundColor3 = Color3.fromRGB(255, 99, 71)
closeButton.BorderSizePixel = 0
closeButton.Font = Enum.Font.SourceSans
closeButton.TextSize = 20
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.Text = "X"
closeButton.Parent = frame

closeButton.MouseButton1Click:Connect(disableWhiteScreen)

enableWhiteScreen() -- Enable the white screen upon running the script
