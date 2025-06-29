-- UI de control de sonido con verificación RespectFilteringEnabled y spam de remotes

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
local SmokeBtn = Instance.new("TextButton")
local BackfireBtn = Instance.new("TextButton")
local AC6Btn = Instance.new("TextButton")

-- Services
local SoundService = game:GetService("SoundService")
local StarterGui = game:GetService("StarterGui")
local Workspace = game:GetService("Workspace")
local CoreGui = game:GetService("CoreGui")

-- Setup base UI
ScreenGui.Name = "SoundControlUI"
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false

Draggable.Name = "Draggable"
Draggable.Parent = ScreenGui
Draggable.BackgroundTransparency = 1
Draggable.Size = UDim2.new(0, 438, 0, 300)
Draggable.Position = UDim2.new(0.35, 0, 0.3, 0)
Draggable.Active = true
Draggable.Draggable = true

Frame.Parent = Draggable
Frame.Size = UDim2.new(1, 0, 1, 0)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

Frame_2.Parent = Frame
Frame_2.Size = UDim2.new(1, 0, 1, 0)
Frame_2.BackgroundTransparency = 1

Time.Name = "Time"
Time.Parent = Frame_2
Time.Size = UDim2.new(1, 0, 0, 30)
Time.Position = UDim2.new(0, 0, 0, 0)
Time.Font = Enum.Font.GothamSemibold
Time.Text = "RespectFilteringEnabled(RFE): nil"
Time.TextColor3 = Color3.new(1, 1, 1)
Time.TextScaled = true
Time.BackgroundTransparency = 1

SmokeBtn.Parent = Frame_2
SmokeBtn.Size = UDim2.new(0, 140, 0, 30)
SmokeBtn.Position = UDim2.new(0.03, 0, 0.9, 0)
SmokeBtn.Text = "Spam Smoke_FE"
SmokeBtn.Font = Enum.Font.SourceSans
SmokeBtn.TextColor3 = Color3.new(1,1,1)
SmokeBtn.BackgroundColor3 = Color3.fromRGB(50,50,50)

BackfireBtn.Parent = Frame_2
BackfireBtn.Size = UDim2.new(0, 140, 0, 30)
BackfireBtn.Position = UDim2.new(0.37, 0, 0.9, 0)
BackfireBtn.Text = "Spam Backfire_FE"
BackfireBtn.Font = Enum.Font.SourceSans
BackfireBtn.TextColor3 = Color3.new(1,1,1)
BackfireBtn.BackgroundColor3 = Color3.fromRGB(50,50,50)

AC6Btn.Parent = Frame_2
AC6Btn.Size = UDim2.new(0, 140, 0, 30)
AC6Btn.Position = UDim2.new(0.71, 0, 0.9, 0)
AC6Btn.Text = "Spam AC6_FE"
AC6Btn.Font = Enum.Font.SourceSans
AC6Btn.TextColor3 = Color3.new(1,1,1)
AC6Btn.BackgroundColor3 = Color3.fromRGB(50,50,50)

WaitBox.Parent = Frame_2
WaitBox.Size = UDim2.new(0, 200, 0, 30)
WaitBox.Position = UDim2.new(0.5, -100, 0.8, 0)
WaitBox.Text = "0.5"
WaitBox.Font = Enum.Font.GothamSemibold
WaitBox.TextScaled = true
WaitBox.TextColor3 = Color3.new(1, 1, 1)
WaitBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)

Stop.Parent = Frame_2
Stop.Size = UDim2.new(1, -20, 0, 30)
Stop.Position = UDim2.new(0, 10, 0.7, 0)
Stop.Text = "🛑 Detener todo"
Stop.Font = Enum.Font.SourceSans
Stop.TextColor3 = Color3.new(1, 1, 1)
Stop.BackgroundColor3 = Color3.fromRGB(120, 30, 30)

-- Logic control
local SpamActive = false

local function RFEBlock()
	if SoundService.RespectFilteringEnabled then
		print("⚠️ RespectFilteringEnabled está activado. Bloqueando función FE...")
		StarterGui:SetCore("SendNotification", {
			Title = "⚠️ Bloqueado por RFE",
			Text = "Esta función no funciona con RespectFilteringEnabled activado.",
			Duration = 4
		})
		return true
	end
	return false
end

local function startSpamRemote(remoteName, remoteArg)
	if RFEBlock() then return end
	SpamActive = true
	print("📡 Spameando ", remoteName, " con argumento ", remoteArg)
	task.spawn(function()
		while SpamActive do
			for _, r in ipairs(Workspace:GetDescendants()) do
				if r:IsA("RemoteEvent") and r.Name == remoteName then
					print("📨 Enviando a ", r:GetFullName())
					r:FireServer(remoteArg)
				end
			end
			task.wait(tonumber(WaitBox.Text) or 0.5)
		end
	end)
end

SmokeBtn.MouseButton1Click:Connect(function()
	startSpamRemote("Smoke_FE", "SQ")
end)

BackfireBtn.MouseButton1Click:Connect(function()
	startSpamRemote("Backfire_FE", "Backfire1")
end)

AC6Btn.MouseButton1Click:Connect(function()
	startSpamRemote("AC6_FE_Sounds", "SQ")
end)

Stop.MouseButton1Click:Connect(function()
	SpamActive = false
	print("⏹️ Spam detenido")
end)

-- Actualizar RFE dinámicamente
while true do
	task.wait(0.5)
	local setting = SoundService.RespectFilteringEnabled
	if setting then
		Time.Text = "RespectFilteringEnabled(RFE): true"
		Time.TextColor3 = Color3.fromRGB(255, 0, 0)
	else
		Time.Text = "RespectFilteringEnabled(RFE): false"
		Time.TextColor3 = Color3.fromRGB(0, 255, 0)
	end
end
