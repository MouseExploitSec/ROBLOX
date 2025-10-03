-- Indo Hangout Auto Fishing GUI
-- Loader: loadstring(game:HttpGet("https://raw.githubusercontent.com/USERNAME/REPO/main/indohangout_auto.lua"))()

-- Ambil Orion Library
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()

-- Window
local Window = OrionLib:MakeWindow({
    Name = "Indo Hangout | Auto Mancing",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "IndoHangoutFishing"
})

-- Variabel
getgenv().AutoMancing = false
getgenv().Delay = 1

-- Tab
local MainTab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- Toggle Auto Mancing
MainTab:AddToggle({
    Name = "Auto Mancing",
    Default = false,
    Callback = function(Value)
        getgenv().AutoMancing = Value
        if Value then
            OrionLib:MakeNotification({
                Name = "Fishing Started",
                Content = "Auto Mancing sedang berjalan!",
                Image = "rbxassetid://4483345998",
                Time = 3
            })
            task.spawn(function()
                while getgenv().AutoMancing do
                    pcall(function()
                        -- ⚠️ Ganti RemoteEvent sesuai nama aslinya di game Indo Hangout
                        game:GetService("ReplicatedStorage").Events.Fishing:FireServer("Cast")
                        task.wait(getgenv().Delay)
                        game:GetService("ReplicatedStorage").Events.Fishing:FireServer("Reel")
                    end)
                    task.wait(getgenv().Delay)
                end
            end)
        end
    end
})

-- Slider Delay
MainTab:AddSlider({
    Name = "Delay (detik)",
    Min = 0.5,
    Max = 5,
    Default = 1,
    Color = Color3.fromRGB(255,255,255),
    Increment = 0.1,
    ValueName = "detik",
    Callback = function(Value)
        getgenv().Delay = Value
    end
})

-- Info Tab
local InfoTab = Window:MakeTab({
    Name = "Info",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

InfoTab:AddParagraph("Cara Pakai", "1. Klik Auto Mancing\n2. Atur Delay sesuai kecepatan\n3. Nikmati auto mancing 😎")

OrionLib:Init()
