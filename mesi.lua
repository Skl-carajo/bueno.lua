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
title.Text = "🚗 Spam sonido SQ (Smoke_FE)"
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 18
title.Parent = frame

local spamSmokeFe = false
local spamSmokeFeButton = Instance.new("TextButton")
spamSmokeFeButton.Size = UDim2.new(1, -20, 0, 50)
spamSmokeFeButton.Position = UDim2.new(0, 10, 0, 40)
spamSmokeFeButton.Text = "Iniciar Spam SQ (Smoke_FE)"
spamSmokeFeButton.BackgroundColor3 = Color3.fromRGB(80, 80, 20)
spamSmokeFeButton.TextColor3 = Color3.new(1, 1, 1)
spamSmokeFeButton.Font = Enum.Font.SourceSansBold
spamSmokeFeButton.TextSize = 18
spamSmokeFeButton.Parent = frame

spamSmokeFeButton.MouseButton1Click:Connect(function()
	if spamSmokeFe then
		spamSmokeFe = false
		spamSmokeFeButton.Text = "Iniciar Spam SQ (Smoke_FE)"
		print("⏹️ Spam SQ detenido")
	else
		spamSmokeFe = true
		spamSmokeFeButton.Text = "Parar Spam SQ"
		print("▶️ Spam SQ iniciado")

		spawn(function()
			while spamSmokeFe do
				local car = workspace:FindFirstChild("2007 Toyota Camry")
				if car then
					local smokeFE = car:FindFirstChild("Smoke_FE")
					if smokeFE and smokeFE:IsA("RemoteEvent") then
						smokeFE:FireServer("SQ")
					else
						print("⚠️❌ No se encontró RemoteEvent 'Smoke_FE' en el auto")
						spamSmokeFe = false
						spamSmokeFeButton.Text = "Iniciar Spam SQ (Smoke_FE)"
						break
					end
				else
					print("⚠️❌ No se encontró el auto '2007 Toyota Camry'")
					spamSmokeFe = false
					spamSmokeFeButton.Text = "Iniciar Spam SQ (Smoke_FE)"
					break
				end
				wait(0.1)
			end
		end)
	end
end)
