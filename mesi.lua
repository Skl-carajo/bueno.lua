-- Script AC66 Sound UI con spam, volumen y pitch
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local lp = Players.LocalPlayer

local function findAllAC6Vehicles()
	local vehicles = {}
	for _, v in pairs(workspace:GetChildren()) do
		if v:FindFirstChild("Owner") and (v:FindFirstChild("AChassis") or v:FindFirstChild("A-Chassis Tune")) then
			table.insert(vehicles, v)
		end
	end
	return vehicles
end

local sonidos = {
	"Idle",
	"Engine",
	"Turbo",
	"Backfire",
	"BlowOff",
	"Start",
	"Stop"
}

local gui = Instance.new("ScreenGui")
gui.Name = "AC66SoundUI"
gui.Parent = game.CoreGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 240, 0, 480)
frame.Position = UDim2.new(0.5, -120, 0.5, -240)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Parent = gui

local title = Instance.new("TextLabel")
title.Text = "🚗 AC66 Sonidos (Spam Incluido)"
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 18
title.Parent = frame

local volumen = 1
local pitch = 1

local function crearSlider(nombre, min, max, valorInicial, posY, callback)
	local label = Instance.new("TextLabel")
	label.Text = nombre .. ": " .. valorInicial
	label.Size = UDim2.new(1, -20, 0, 20)
	label.Position = UDim2.new(0, 10, 0, posY)
	label.BackgroundTransparency = 1
	label.TextColor3 = Color3.new(1, 1, 1)
	label.Font = Enum.Font.SourceSans
	label.TextSize = 14
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.Parent = frame

	local slider = Instance.new("Frame")
	slider.Size = UDim2.new(1, -20, 0, 20)
	slider.Position = UDim2.new(0, 10, 0, posY + 20)
	slider.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
	slider.Parent = frame

	local fill = Instance.new("Frame")
	fill.BackgroundColor3 = Color3.fromRGB(255, 180, 0)
	fill.Size = UDim2.new((valorInicial - min) / (max - min), 0, 1, 0)
	fill.BorderSizePixel = 0
	fill.Parent = slider

	local dragging = false

	slider.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = true
		end
	end)

	slider.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = false
		end
	end)

	slider.InputChanged:Connect(function(input)
		if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
			local relativeX = math.clamp(input.Position.X - slider.AbsolutePosition.X, 0, slider.AbsoluteSize.X)
			local percent = relativeX / slider.AbsoluteSize.X
			fill.Size = UDim2.new(percent, 0, 1, 0)
			local valor = min + (max - min) * percent
			valor = math.floor(valor * 100) / 100
			label.Text = nombre .. ": " .. tostring(valor)
			callback(valor)
		end
	end)
end

crearSlider("🔊 Volumen", 0, 1, volumen, 40 + #sonidos * 35, function(v)
	volumen = v
end)

crearSlider("🎵 Pitch", 0.5, 2, pitch, 100 + #sonidos * 35, function(v)
	pitch = v
end)

local function findSound(parent, name)
	for _, obj in pairs(parent:GetChildren()) do
		if obj:IsA("Sound") and obj.Name == name then
			return obj
		end
		local found = findSound(obj, name)
		if found then
			return found
		end
	end
	return nil
end

local function playSoundAllVehicles(soundName)
	local vehicles = findAllAC6Vehicles()
	if #vehicles == 0 then
		print("⚠️ No se encontraron vehículos AC6 en el Workspace.")
		return
	end
	for _, veh in pairs(vehicles) do
		local sound = findSound(veh, soundName)
		if sound then
			sound.Volume = volumen
			sound.PlaybackSpeed = pitch
			sound:Stop()
			sound.TimePosition = 0
			sound:Play()
			print("▶️ Sonido '" .. soundName .. "' reproducido en vehículo: " .. tostring(veh.Name))
		else
			print("❌ No se encontró el sonido '" .. soundName .. "' en vehículo: " .. tostring(veh.Name))
		end
	end
end

for i, nombre in ipairs(sonidos) do
	local boton = Instance.new("TextButton")
	boton.Size = UDim2.new(1, -20, 0, 30)
	boton.Position = UDim2.new(0, 10, 0, 30 + (i - 1) * 35)
	boton.Text = nombre
	boton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
	boton.TextColor3 = Color3.new(1, 1, 1)
	boton.Font = Enum.Font.SourceSans
	boton.TextSize = 16
	boton.Parent = frame

	boton.MouseButton1Click:Connect(function()
		playSoundAllVehicles(nombre)
	end)
end

local spammer = nil
local selectedSound = sonidos[1]

local dropdownLabel = Instance.new("TextLabel")
dropdownLabel.Text = "Sonido para Spam: " .. selectedSound
dropdownLabel.Size = UDim2.new(1, -20, 0, 20)
dropdownLabel.Position = UDim2.new(0, 10, 0, 320)
dropdownLabel.BackgroundTransparency = 1
dropdownLabel.TextColor3 = Color3.new(1, 1, 1)
dropdownLabel.Font = Enum.Font.SourceSans
dropdownLabel.TextSize = 14
dropdownLabel.TextXAlignment = Enum.TextXAlignment.Left
dropdownLabel.Parent = frame

local dropdownButton = Instance.new("TextButton")
dropdownButton.Size = UDim2.new(1, -20, 0, 25)
dropdownButton.Position = UDim2.new(0, 10, 0, 345)
dropdownButton.Text = "Cambiar Sonido"
dropdownButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
dropdownButton.TextColor3 = Color3.new(1,1,1)
dropdownButton.Font = Enum.Font.SourceSans
dropdownButton.TextSize = 16
dropdownButton.Parent = frame

dropdownButton.MouseButton1Click:Connect(function()
	local index = table.find(sonidos, selectedSound)
	index = index or 1
	index = index + 1
	if index > #sonidos then index = 1 end
	selectedSound = sonidos[index]
	dropdownLabel.Text = "Sonido para Spam: " .. selectedSound
	print("🔄 Sonido para spam cambiado a: " .. selectedSound)
end)

local spamButton = Instance.new("TextButton")
spamButton.Size = UDim2.new(1, -20, 0, 30)
spamButton.Position = UDim2.new(0, 10, 0, 380)
spamButton.Text = "Iniciar Spam"
spamButton.BackgroundColor3 = Color3.fromRGB(90, 30, 30)
spamButton.TextColor3 = Color3.new(1,1,1)
spamButton.Font = Enum.Font.SourceSansBold
spamButton.TextSize = 18
spamButton.Parent = frame

spamButton.MouseButton1Click:Connect(function()
	if spammer then
		spammer = false
		spamButton.Text = "Iniciar Spam"
		print("⏹️ Spam detenido")
	else
		spammer = true
		spamButton.Text = "Parar Spam"
		print("▶️ Spam iniciado con sonido: " .. selectedSound)

		spawn(function()
			while spammer do
				playSoundAllVehicles(selectedSound)
				wait(0.15)
			end
		end)
	end
end)
