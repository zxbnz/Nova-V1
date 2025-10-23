-- 🌌 Cosmic Key Loader with Expiration Support

-- Load keys from external Lua file
local keySource = game:HttpGet("https://raw.githubusercontent.com/zxbnz/Nova-V1/refs/heads/main/keys.lua") -- Replace with your actual URL
local allowedKeys = loadstring(keySource)()
local currentTime = os.time()

-- Create GUI
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "CosmicKeyLoader"

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 300, 0, 150)
Frame.Position = UDim2.new(0.5, -150, 0.5, -75)
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Frame.BorderSizePixel = 0

local Title = Instance.new("TextLabel", Frame)
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Text = "🌌 Cosmic Key Loader"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.GothamBold
Title.TextSize = 20

local TextBox = Instance.new("TextBox", Frame)
TextBox.Position = UDim2.new(0.1, 0, 0.4, 0)
TextBox.Size = UDim2.new(0.8, 0, 0.2, 0)
TextBox.PlaceholderText = "Enter your key..."
TextBox.Text = ""
TextBox.TextColor3 = Color3.new(1, 1, 1)
TextBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
TextBox.Font = Enum.Font.Gotham
TextBox.TextSize = 16

local Submit = Instance.new("TextButton", Frame)
Submit.Position = UDim2.new(0.3, 0, 0.7, 0)
Submit.Size = UDim2.new(0.4, 0, 0.2, 0)
Submit.Text = "Submit"
Submit.TextColor3 = Color3.new(1, 1, 1)
Submit.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Submit.Font = Enum.Font.GothamBold
Submit.TextSize = 16

local Status = Instance.new("TextLabel", Frame)
Status.Position = UDim2.new(0, 0, 1, 0)
Status.Size = UDim2.new(1, 0, 0, 30)
Status.Text = ""
Status.TextColor3 = Color3.new(1, 0.2, 0.2)
Status.BackgroundTransparency = 1
Status.Font = Enum.Font.Gotham
Status.TextSize = 14

-- Key Validation Logic
Submit.MouseButton1Click:Connect(function()
    local inputKey = TextBox.Text
    for _, entry in ipairs(allowedKeys) do
        if inputKey == entry.key then
            if currentTime <= entry.expires then
                Status.TextColor3 = Color3.new(0.2, 1, 0.2)
                Status.Text = "✅ Key accepted!"
                wait(1)
                ScreenGui:Destroy()

                -- Load your actual script here
                loadstring(game:HttpGet("https://raw.githubusercontent.com/zxbnz/Nova-V1/refs/heads/main/loader.lua"))()
                return
            else
                Status.TextColor3 = Color3.new(1, 0.6, 0.2)
                Status.Text = "⏰ Key expired."
                return
            end
        end
    end
    Status.TextColor3 = Color3.new(1, 0.2, 0.2)
    Status.Text = "❌ Invalid key."
end)
