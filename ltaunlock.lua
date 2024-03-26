-- Create a ScreenGui to hold the UI elements
local gui = Instance.new("ScreenGui")
gui.Name = "FPSIncreaseUI"
gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Create a Frame to hold the UI elements
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 250, 0, 200)
frame.Position = UDim2.new(0.5, -125, 0.5, -100)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BackgroundColor3 = Color3.fromRGB(44, 44, 44)
frame.BackgroundTransparency = 0.8
frame.BorderSizePixel = 0
frame.ClipsDescendants = true
frame.Parent = gui

-- Create FPS Increase button
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

-- Function to change appearance of all parts to white and turn off materials
local function increaseFPS()
    -- Set parts color and material
    for _, obj in ipairs(game.Workspace:GetDescendants()) do
        if obj:IsA("BasePart") then
            obj.Color = Color3.new(1, 1, 1)
            obj.Material = Enum.Material.SmoothPlastic
        end
    end

    -- Disable lighting effects
    game.Lighting.OutdoorAmbient = Color3.new(1, 1, 1)
    game.Lighting.Ambient = Color3.new(1, 1, 1)
    game.Lighting.Brightness = 2
    game.Lighting.GlobalShadows = false
end

-- Function to close the UI
local function closeUI()
    gui:Destroy()
end

-- Connect the button to the function
fpsButton.MouseButton1Click:Connect(increaseFPS)

-- Create close button
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

-- Connect the close button to the function
closeButton.MouseButton1Click:Connect(closeUI)
