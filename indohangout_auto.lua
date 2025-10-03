-- Indo Hangout Auto Fishing Script
-- Buat sendiri logic auto fishing disini
print("Auto Mancing Indo Hangout Loaded!")

-- contoh loop auto klik tombol mancing (pseudocode)
while task.wait(1) do
    pcall(function()
        -- ganti event ini sesuai game Indo Hangout
        game:GetService("ReplicatedStorage").Events.Fishing:FireServer("Cast")
    end)
end
