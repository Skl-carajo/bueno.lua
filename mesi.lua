local Players = game:GetService("Players")
local lp = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "AC66SoundUI"
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
title.Text = "🔊 Spam sonidos FE (AC6, Smoke, Backfire)"
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
button.Text = "Iniciar Spam de sonidos FE"
button.BackgroundColor3 = Color3.fromRGB(80, 80, 20)
button.TextColor3 = Color3.new(1, 1, 1)
button.Font = Enum.Font.SourceSansBold
button.TextSize = 18
button.Parent = frame

-- Lista de nombres de RemoteEvents a buscar
local remoteNames = {
	"Smoke_FE",
	"Backfire_FE",
	"AC6_FE_Sounds"
}

button.MouseButton1Click:Connect(function()
	if spamming then
		spamming = false
		button.Text = "Iniciar Spam de sonidos FE"
		print("⏹️ Spam detenido")
	else
		spamming = true
		button.Text = "Parar Spam"
		print("▶️ Spam iniciado")

		spawn(function()
			while spamming do
				local count = 0
				for _, obj in ipairs(workspace:GetDescendants()) do
					if table.find(remoteNames, obj.Name) and obj:IsA("RemoteEvent") then
						obj:FireServer("SQ")
						count += 1
					end
				end

				if count > 0 then
					print("✅ Disparados", count, "remotes")
				else
					print("⚠️ No se encontraron RemoteEvents válidos en workspace")
				end

				wait(0.1)
			end
		end)
	end
end)
