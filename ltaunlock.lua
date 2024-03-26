local gui = Instance.new("ScreenGui")
gui.Name = "FPSIncreaseUI"
gui.IgnoreGuiInset = true -- Ensures the UI is not affected by mobile device insets
gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 250, 0, 250)
frame.Position = UDim2.new(0.5, -125, 0.5, -125)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BackgroundColor3 = Color3.fromRGB(44, 44, 44)
frame.BackgroundTransparency = 0.8
frame.BorderSizePixel = 0
frame.Parent = gui

-- Function to create buttons
local function createButton(name, text, position, onClick)
    local button = Instance.new("TextButton")
    button.Name = name
    button.Size = UDim2.new(0.8, 0, 0, 50) -- Larger button size
    button.Position = position
    button.BackgroundColor3 = Color3.fromRGB(74, 143, 255)
    button.BorderSizePixel = 0
    button.Font = Enum.Font.SourceSans
    button.TextSize = 24 -- Larger text size
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Text = text
    button.Parent = frame
    
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

-- Create buttons
local fpsButton = createButton("FPSButton", "Increase FPS", UDim2.new(0.5, -125, 0.3, 0), increaseFPS)
local closeButton = createButton("CloseButton", "Close", UDim2.new(0.5, -125, 0.5, 0), closeUI)

-- Center the frame and buttons horizontally
fpsButton.Position = UDim2.new(0.5, -fpsButton.Size.X.Offset / 2, 0.3, 0)
closeButton.Position = UDim2.new(0.5, -closeButton.Size.X.Offset / 2, 0.5, 0)
