local Players = game:GetService("Players")
local lp = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "BackfireSpamUI"
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
title.Text = "💥 Spammer Backfire_FE"
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
button.Text = "Iniciar Spam Backfire"
button.BackgroundColor3 = Color3.fromRGB(120, 40, 40)
button.TextColor3 = Color3.new(1, 1, 1)
button.Font = Enum.Font.SourceSansBold
button.TextSize = 18
button.Parent = frame

local toggle = true

button.MouseButton1Click:Connect(function()
	if spamming then
		spamming = false
		button.Text = "Iniciar Spam Backfire"
		print("⏹️ Backfire Spam detenido")
	else
		spamming = true
		button.Text = "Parar Spam Backfire"
		print("🔥 Comenzando spam Backfire_FE")

		spawn(function()
			while spamming do
				local fired = 0
				for _, obj in ipairs(workspace:GetDescendants()) do
					if obj:IsA("RemoteEvent") and obj.Name == "Backfire_FE" then
						pcall(function()
							local mode = toggle and "Backfire1" or "Backfire2"
							obj:FireServer(mode)
							fired += 1
						end)
					end
				end
				toggle = not toggle
				if fired > 0 then
					print("💥 Enviados", fired, "comandos", toggle and "Backfire1" or "Backfire2")
				else
					print("⚠️ No se encontraron Backfire_FE activos")
				end
				wait(0.2)
			end
		end)
	end
end)
