local gui = Instance.new("ScreenGui")
gui.Name = "FPSIncreaseUI"
gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 250)
frame.Position = UDim2.new(0.5, -150, 0.5, -125)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BackgroundColor3 = Color3.fromRGB(44, 44, 44)
frame.BackgroundTransparency = 0.8
frame.BorderSizePixel = 0
frame.ClipsDescendants = true
frame.Parent = gui
frame.ZIndex = 2 -- Ensure the frame is above other GUI elements

-- Function to create buttons
local function createButton(name, text, position, onClick)
    local button = Instance.new("TextButton")
    button.Name = name
    button.Size = UDim2.new(0, 200, 0, 50)
    button.Position = position
    button.BackgroundColor3 = Color3.fromRGB(74, 143, 255)
    button.BorderSizePixel = 0
    button.Font = Enum.Font.SourceSans
    button.TextSize = 20
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Text = text
    button.Parent = frame
    button.ZIndex = 3 -- Ensure the button is above the background frame
    
    -- Add hover effect
    button.MouseEnter:Connect(function()
        button.BackgroundColor3 = Color3.fromRGB(54, 113, 209)
    end)
    button.MouseLeave:Connect(function()
        button.BackgroundColor3 = Color3.fromRGB(74, 143, 255)
    end)
    
    -- Connect onClick event
    button.MouseButton1Click:Connect(onClick)
    
    return button
end

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

local function closeUI()
    gui:Destroy()
end

local fpsButton = createButton("FPSButton", "FPS Increase", UDim2.new(0.5, -100, 0.1, 0), increaseFPS)
local closeButton = createButton("CloseButton", "X", UDim2.new(1, -30, 0, 0), closeUI)
closeButton.AnchorPoint = Vector2.new(1, 0)
closeButton.Position = UDim2.new(1, 0, 0, 0)

local paintingText = Instance.new("TextLabel")
paintingText.Size = UDim2.new(0, 200, 0, 30)
paintingText.Position = UDim2.new(0.5, -100, 0.25, 0)
paintingText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
paintingText.BorderSizePixel = 0
paintingText.Font = Enum.Font.SourceSans
paintingText.TextSize = 16
paintingText.TextColor3 = Color3.fromRGB(255, 255, 255)
paintingText.TextWrapped = true
paintingText.Text = "Painting Part: "
paintingText.Parent = frame
paintingText.ZIndex = 3 -- Ensure the text label is above the background frame
