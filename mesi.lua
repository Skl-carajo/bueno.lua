-- UI
local fix = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local Top = Instance.new("Frame")
local ZinniaPanelText = Instance.new("TextLabel")
local ZInniaImage = Instance.new("ImageLabel")
local PlayButton = Instance.new("TextButton")
local TextBox = Instance.new("TextBox")
local AC6MUSICVUILNTEXT = Instance.new("TextLabel")
local VolumeBox = Instance.new("TextBox")
local PitchBox = Instance.new("TextBox")
local Credits = Instance.new("TextLabel")

-- Properties
fix.Name = "fix"
fix.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
fix.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Main.Name = "Main"
Main.Parent = fix
Main.BackgroundColor3 = Color3.new(0.145098, 0.145098, 0.145098)
Main.BorderColor3 = Color3.new(0, 0, 0)
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0.341115743, 0, 0.492411464, 0)
Main.Size = UDim2.new(0, 471, 0, 297)

Top.Name = "Top"
Top.Parent = Main
Top.BackgroundColor3 = Color3.new(0.239216, 0.239216, 0.239216)
Top.BorderColor3 = Color3.new(0, 0, 0)
Top.BorderSizePixel = 0
Top.Position = UDim2.new(-2.120713e-05, 0, 0, 0)
Top.Size = UDim2.new(0, 471, 0, 26)

ZinniaPanelText.Name = "ZinniaPanelText"
ZinniaPanelText.Parent = Top
ZinniaPanelText.BackgroundColor3 = Color3.new(1, 1, 1)
ZinniaPanelText.BackgroundTransparency = 1
ZinniaPanelText.BorderColor3 = Color3.new(0, 0, 0)
ZinniaPanelText.BorderSizePixel = 0
ZinniaPanelText.Position = UDim2.new(-0.00166414748, 0, 0.0250760596, 0)
ZinniaPanelText.Size = UDim2.new(0, 112, 0, 24)
ZinniaPanelText.Font = Enum.Font.SourceSans
ZinniaPanelText.Text = "Zinnia Panel"
ZinniaPanelText.TextColor3 = Color3.new(1, 1, 1)
ZinniaPanelText.TextSize = 20
ZinniaPanelText.TextWrapped = true

ZInniaImage.Name = "ZInniaImage"
ZInniaImage.Parent = Top
ZInniaImage.BackgroundColor3 = Color3.new(1, 1, 1)
ZInniaImage.BackgroundTransparency = 1
ZInniaImage.BorderColor3 = Color3.new(0, 0, 0)
ZInniaImage.BorderSizePixel = 0
ZInniaImage.Position = UDim2.new(-0.182590231, 0, 2.73076916, 0)
ZInniaImage.Size = UDim2.new(0, 247, 0, 226)
ZInniaImage.Image = "rbxassetid://7148691919"

PlayButton.Name = "PlayButton"
PlayButton.Parent = Top
PlayButton.BackgroundColor3 = Color3.new(0.239216, 0.239216, 0.239216)
PlayButton.BorderColor3 = Color3.new(0, 0, 0)
PlayButton.BorderSizePixel = 0
PlayButton.Position = UDim2.new(0.53927815, 0, 5.69230747, 0)
PlayButton.Size = UDim2.new(0, 202, 0, 45)
PlayButton.Font = Enum.Font.SourceSans
PlayButton.Text = "Play"
PlayButton.TextColor3 = Color3.new(1, 1, 1)
PlayButton.TextSize = 40
PlayButton.TextWrapped = true

TextBox.Parent = Top
TextBox.BackgroundColor3 = Color3.new(0.239216, 0.239216, 0.239216)
TextBox.BorderColor3 = Color3.new(0, 0, 0)
TextBox.BorderSizePixel = 0
TextBox.Position = UDim2.new(0.53927815, 0, 3.34615374, 0)
TextBox.Size = UDim2.new(0, 202, 0, 50)
TextBox.ClearTextOnFocus = false
TextBox.Font = Enum.Font.SourceSans
TextBox.PlaceholderText = "Music ID"
TextBox.Text = ""
TextBox.TextColor3 = Color3.new(1, 1, 1)
TextBox.TextSize = 35
TextBox.TextWrapped = true

AC6MUSICVUILNTEXT.Name = "AC6 MUSIC VUILN TEXT"
AC6MUSICVUILNTEXT.Parent = Top
AC6MUSICVUILNTEXT.BackgroundColor3 = Color3.new(1, 1, 1)
AC6MUSICVUILNTEXT.BackgroundTransparency = 1
AC6MUSICVUILNTEXT.BorderColor3 = Color3.new(0, 0, 0)
AC6MUSICVUILNTEXT.BorderSizePixel = 0
AC6MUSICVUILNTEXT.Position = UDim2.new(0.54610616, 0, 1.5635376, 0)
AC6MUSICVUILNTEXT.Size = UDim2.new(0, 195, 0, 33)
AC6MUSICVUILNTEXT.Font = Enum.Font.SourceSans
AC6MUSICVUILNTEXT.Text = "AC6 Music Vuln"
AC6MUSICVUILNTEXT.TextColor3 = Color3.new(1, 1, 1)
AC6MUSICVUILNTEXT.TextScaled = true
AC6MUSICVUILNTEXT.TextSize = 20
AC6MUSICVUILNTEXT.TextWrapped = true

VolumeBox.Name = "VolumeBox"
VolumeBox.Parent = Top
VolumeBox.BackgroundColor3 = Color3.new(0.239216, 0.239216, 0.239216)
VolumeBox.BorderColor3 = Color3.new(0, 0, 0)
VolumeBox.BorderSizePixel = 0
VolumeBox.Position = UDim2.new(0.253112912, 0, 3.34615374, 0)
VolumeBox.Size = UDim2.new(0, 120, 0, 50)
VolumeBox.ClearTextOnFocus = false
VolumeBox.Font = Enum.Font.SourceSans
VolumeBox.PlaceholderText = "VOLUME"
VolumeBox.Text = ""
VolumeBox.TextColor3 = Color3.new(1, 1, 1)
VolumeBox.TextSize = 35
VolumeBox.TextWrapped = true

PitchBox.Name = "PitchBox"
PitchBox.Parent = Top
PitchBox.BackgroundColor3 = Color3.new(0.239216, 0.239216, 0.239216)
PitchBox.BorderColor3 = Color3.new(0, 0, 0)
PitchBox.BorderSizePixel = 0
PitchBox.Position = UDim2.new(0.253112912, 0, 5.69230747, 0)
PitchBox.Size = UDim2.new(0, 120, 0, 45)
PitchBox.ClearTextOnFocus = false
PitchBox.Font = Enum.Font.SourceSans
PitchBox.PlaceholderText = "PITCH"
PitchBox.Text = ""
PitchBox.TextColor3 = Color3.new(1, 1, 1)
PitchBox.TextSize = 35
PitchBox.TextWrapped = true

Credits.Name = "Credits"
Credits.Parent = Top
Credits.BackgroundColor3 = Color3.new(1, 1, 1)
Credits.BackgroundTransparency = 1
Credits.BorderColor3 = Color3.new(0, 0, 0)
Credits.BorderSizePixel = 0
Credits.Position = UDim2.new(0.47179696, 0, 10.4866142, 0)
Credits.Size = UDim2.new(0, 249, 0, 24)
Credits.Font = Enum.Font.SourceSans
Credits.Text = "Developed by Moon and Universal"
Credits.TextColor3 = Color3.new(1, 1, 1)
Credits.TextSize = 20
Credits.TextWrapped = true

-- Función para arrastrar
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local dragging = false
local dragStart
local startPos

Top.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = input.Position
		startPos = Main.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

RunService.RenderStepped:Connect(function()
	if dragging then
		local delta = UserInputService:GetMouseLocation() - dragStart
		Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
end)

-- Validaciones

VolumeBox.FocusLost:Connect(function()
	local volume = tonumber(VolumeBox.Text)
	if volume and volume >= 0 and volume <= 1 then
		print("✔ Volumen válido: " .. volume)
	else
		print("✘ Volumen inválido. Usa un valor entre 0 y 1.")
	end
end)

PitchBox.FocusLost:Connect(function()
	local pitch = tonumber(PitchBox.Text)
	if pitch and pitch >= 0 and pitch <= 2 then
		print("✔ Pitch válido: " .. pitch)
	else
		print("✘ Pitch inválido. Usa un valor entre 0 y 2.")
	end
end)

-- PlayButton funcionalidad

local function findRemoteEvent(name)
	for _, parent in ipairs({game:GetService("ReplicatedStorage"), game:GetService("Workspace")}) do
		for _, descendant in ipairs(parent:GetDescendants()) do
			if descendant:IsA("RemoteEvent") and descendant.Name == name then
				return descendant
			end
		end
	end
end

local function generateRandomName()
	local chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
	local name = ""
	for _ = 1, math.random(5, 10) do
		local i = math.random(1, #chars)
		name = name .. chars:sub(i, i)
	end
	return name
end

PlayButton.MouseButton1Click:Connect(function()
	local remote = findRemoteEvent("AC6_FE_Sounds")
	if not remote then
		warn("RemoteEvent 'AC6_FE_Sounds' no encontrado")
		return
	end

	local musicId = TextBox.Text
	if musicId == "" or not tonumber(musicId) then
		warn("Music ID inválido.")
		return
	end

	local volume = tonumber(VolumeBox.Text)
	if not volume or volume < 0 or volume > 1 then volume = 1 end

	local pitch = tonumber(PitchBox.Text)
	if not pitch or pitch < 0 or pitch > 2 then pitch = 1 end

	local soundName = generateRandomName()
	local assetId = "rbxassetid://" .. musicId

	remote:FireServer("newSound", soundName, workspace, assetId, pitch, volume, true)
	remote:FireServer("playSound", soundName)
end)
