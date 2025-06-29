local Players = game:GetService("Players")
local lp = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "SoundFEUI"
gui.Parent = game.CoreGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 280, 0, 100)
frame.Position = UDim2.new(0.5, -140, 0.5, -50)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Parent = gui

local title = Instance.new("TextLabel")
title.Text = "🔊 Spammer RemoteEvents FE"
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 18
title.Parent = frame

local spamming = false
local button = Instance.new("TextButton")
button.Size = UDim2.new(1, -20, 0, 50)
button.Position = UDim2.new(0, 10, 0, 40)
button.Text = "Iniciar Spam FE"
button.BackgroundColor3 = Color3.fromRGB(80, 80, 20)
button.TextColor3 = Color3.new(1, 1, 1)
button.Font = Enum.Font.SourceSansBold
button.TextSize = 18
button.Parent = frame

local remoteNames = {
	"Smoke_FE",
	"Backfire_FE",
	"AC6_FE_Sounds"
}

button.MouseButton1Click:Connect(function()
	if spamming then
		spamming = false
		button.Text = "Iniciar Spam FE"
		print("⏹️ Spam detenido")
	else
		spamming = true
		button.Text = "Parar Spam"
		print("▶️ Buscando y ejecutando remotes...")

		spawn(function()
			while spamming do
				local count = 0
				for _, obj in ipairs(workspace:GetDescendants()) do
					if table.find(remoteNames, obj.Name) and obj:IsA("RemoteEvent") then
						pcall(function()
							obj:FireServer() -- SIN argumentos
							count += 1
						end)
					end
				end

				if count > 0 then
					print("✅ Disparados "..count.." RemoteEvents FE")
				else
					print("⚠️ No se encontraron RemoteEvents con nombre válido")
				end

				wait(0.15)
			end
		end)
	end
end)
