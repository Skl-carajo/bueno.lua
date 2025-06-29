-- UI de control de sonido con verificación RespectFilteringEnabled

local ScreenGui = Instance.new("ScreenGui")
local Draggable = Instance.new("Frame")
local Frame = Instance.new("Frame")
local Frame_2 = Instance.new("Frame")
local Time = Instance.new("TextLabel")
local _1E = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")
local _3E = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")
local SE = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")
local Path = Instance.new("TextLabel")
local Top = Instance.new("Frame")
local Top_2 = Instance.new("Frame")
local ImageLabel = Instance.new("ImageLabel")
local TextLabel = Instance.new("TextLabel")
local Exit = Instance.new("TextButton")
local Minizum = Instance.new("TextButton")
local Stop = Instance.new("TextButton")
local UICorner_4 = Instance.new("UICorner")
local IY = Instance.new("TextButton")
local UICorner_5 = Instance.new("UICorner")
local TextLabel_2 = Instance.new("TextLabel")
local WaitBox = Instance.new("TextBox")

ScreenGui.Name = "SoundFE_Control"
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

Draggable.Name = "Draggable"
Draggable.Parent = ScreenGui
Draggable.BackgroundTransparency = 1
Draggable.Position = UDim2.new(0.35, 0, 0.3, 0)
Draggable.Size = UDim2.new(0, 438, 0, 277)

Frame.Parent = Draggable
Frame.BackgroundTransparency = 1
Frame.Size = UDim2.new(0, 438, 0, 277)

Frame_2.Parent = Frame
Frame_2.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame_2.Size = UDim2.new(0, 438, 0, 238)
Frame_2.Active = true
Frame_2.Draggable = true

Time.Parent = Frame_2
Time.Size = UDim2.new(0, 437, 0, 31)
Time.Text = "RespectFilteringEnabled(RFE) : nil"
Time.Font = Enum.Font.GothamSemibold
Time.TextColor3 = Color3.fromRGB(255, 255, 255)
Time.TextScaled = true
Time.BackgroundTransparency = 1

_1E.Name = "1E"
_1E.Parent = Frame_2
_1E.Position = UDim2.new(0.018, 0, 0.676, 0)
_1E.Size = UDim2.new(0, 208, 0, 33)
_1E.Text = "Mute Game"
_1E.Font = Enum.Font.SourceSans
_1E.TextColor3 = Color3.new(1, 1, 1)
_1E.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
UICorner.Parent = _1E

_3E.Name = "3E"
_3E.Parent = Frame_2
_3E.Position = UDim2.new(0.016, 0, 0.143, 0)
_3E.Size = UDim2.new(0, 209, 0, 33)
_3E.Text = "Annoying Sound"
_3E.Font = Enum.Font.SourceSans
_3E.TextColor3 = Color3.new(1, 1, 1)
_3E.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
UICorner_2.Parent = _3E

SE.Name = "SE"
SE.Parent = Frame_2
SE.Position = UDim2.new(0.509, 0, 0.143, 0)
SE.Size = UDim2.new(0, 209, 0, 33)
SE.Text = "Kill Sound Service"
SE.Font = Enum.Font.SourceSans
SE.TextColor3 = Color3.new(1, 1, 1)
SE.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
UICorner_3.Parent = SE

Path.Parent = Frame_2
Path.Position = UDim2.new(0.007, 0, 0.815, 0)
Path.Size = UDim2.new(0, 435, 0, 44)
Path.Text = "Dev Note: RFE must be false for FE effects to work."
Path.Font = Enum.Font.GothamSemibold
Path.TextColor3 = Color3.fromRGB(255, 0, 0)
Path.TextScaled = true
Path.BackgroundTransparency = 1

Stop.Name = "Stop"
Stop.Parent = Frame_2
Stop.Position = UDim2.new(0.018, 0, 0.311, 0)
Stop.Size = UDim2.new(0, 424, 0, 33)
Stop.Text = "Stop"
Stop.Font = Enum.Font.SourceSans
Stop.TextColor3 = Color3.new(1, 1, 1)
Stop.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
UICorner_4.Parent = Stop

IY.Name = "IY"
IY.Parent = Frame_2
IY.Position = UDim2.new(0.509, 0, 0.676, 0)
IY.Size = UDim2.new(0, 209, 0, 33)
IY.Text = "Unmute Game"
IY.Font = Enum.Font.SourceSans
IY.TextColor3 = Color3.new(1, 1, 1)
IY.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
UICorner_5.Parent = IY

TextLabel_2.Parent = Frame_2
TextLabel_2.Position = UDim2.new(0.018, 0, 0.466, 0)
TextLabel_2.Size = UDim2.new(0, 426, 0, 50)
TextLabel_2.Text = "Wait Speed       :"
TextLabel_2.Font = Enum.Font.GothamSemibold
TextLabel_2.TextColor3 = Color3.new(1, 1, 1)
TextLabel_2.TextSize = 30
TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left
TextLabel_2.BackgroundTransparency = 1

WaitBox.Name = "Wait()"
WaitBox.Parent = Frame_2
WaitBox.Position = UDim2.new(0.532, 0, 0.466, 0)
WaitBox.Size = UDim2.new(0, 199, 0, 50)
WaitBox.Text = "0.5"
WaitBox.Font = Enum.Font.GothamSemibold
WaitBox.TextColor3 = Color3.new(1, 1, 1)
WaitBox.TextSize = 30
WaitBox.ClearTextOnFocus = false
WaitBox.BackgroundTransparency = 1

-- Funciones
local SoundService = game:GetService("SoundService")
local StarterGui = game:GetService("StarterGui")

local Active = false
local Mute = false

local function RFEBlock()
	if SoundService.RespectFilteringEnabled then
		StarterGui:SetCore("SendNotification", {
			Title = "⚠️ Bloqueado por RFE",
			Text = "Esta función no funciona con RespectFilteringEnabled activado.",
			Duration = 4
		})
		return true
	end
	return false
end

Exit.MouseButton1Click:Connect(function()
	ScreenGui:Destroy()
end)

IY.MouseButton1Click:Connect(function()
	if RFEBlock() then return end
	Mute = false
end)

_1E.MouseButton1Click:Connect(function()
	if RFEBlock() then return end
	Mute = true
	task.spawn(function()
		while Mute do
			for _, s in ipairs(workspace:GetDescendants()) do
				if s:IsA("Sound") then s:Stop() end
			end
			task.wait(0.1)
		end
	end)
end)

_3E.MouseButton1Click:Connect(function()
	if RFEBlock() then return end
	for _, s in ipairs(workspace:GetDescendants()) do
		if s:IsA("Sound") then s:Play() end
	end
end)

SE.MouseButton1Click:Connect(function()
	if RFEBlock() then return end
	Active = true
	task.spawn(function()
		while Active do
			local delayTime = tonumber(WaitBox.Text) or 0.5
			task.wait(delayTime)
			for _, s in ipairs(workspace:GetDescendants()) do
				if s:IsA("Sound") then s:Play() end
			end
		end
	end)
end)

Stop.MouseButton1Click:Connect(function()
	Active = false
end)

-- Verificación continua RespectFilteringEnabled
task.spawn(function()
	while true do
		task.wait(0.5)
		local RFE = SoundService.RespectFilteringEnabled
		if RFE then
			Time.TextColor3 = Color3.fromRGB(255, 0, 0)
			Time.Text = "RespectFilteringEnabled(RFE) : true ❌ (Client-only)"
		else
			Time.TextColor3 = Color3.fromRGB(0, 255, 0)
			Time.Text = "RespectFilteringEnabled(RFE) : false ✅ (FE exploits OK)"
		end
	end
end)

-- Sonido de carga inicial
local notification = Instance.new("Sound")
notification.SoundId = "rbxassetid://9086208751"
notification.Volume = 5
notification.Parent = SoundService
notification:Play()

StarterGui:SetCore("SendNotification", {
	Title = "FELAG",
	Text = "FELAG Ha sido cargado - FE UI cargada correctamente.",
	Duration = 6
})
