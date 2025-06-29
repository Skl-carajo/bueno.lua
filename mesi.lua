-- ... (todo el UI igual, no modificado, no lo repito para no saturar)

-- [Conserva todo lo que ya tienes hasta la línea de definición de SpamActive]

local SpamActive = false

-- Función para bloquear si RespectFilteringEnabled está activo
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

-- Función para buscar todos los remotes con patrón AC6 en el Workspace
local function findAC6Remotes()
	local remotes = {}
	for _, r in ipairs(Workspace:GetDescendants()) do
		if r:IsA("RemoteEvent") then
			-- Cambia el patrón según sea necesario, aquí busca "AC6" en el nombre
			if string.find(r.Name, "AC6") then
				table.insert(remotes, r)
				print("🔍 Encontrado remote AC6: "..r:GetFullName())
			end
		end
	end
	return remotes
end

-- Variable para guardar remotes AC6 encontrados
local AC6Remotes = {}

-- Función para spamear un remote o lista de remotes con argumento
local function startSpamRemote(remoteNameOrList, remoteArg)
	if RFEBlock() then return end
	SpamActive = true
	print("📡 Iniciando spam para ", remoteNameOrList, " con argumento ", remoteArg)
	task.spawn(function()
		while SpamActive do
			if type(remoteNameOrList) == "table" then
				-- Lista de remotes
				for _, remote in ipairs(remoteNameOrList) do
					if remote and remote:IsA("RemoteEvent") then
						print("📨 Enviando a "..remote:GetFullName())
						remote:FireServer(remoteArg)
					end
				end
			else
				-- Nombre simple, buscar en Workspace
				for _, r in ipairs(Workspace:GetDescendants()) do
					if r:IsA("RemoteEvent") and r.Name == remoteNameOrList then
						print("📨 Enviando a "..r:GetFullName())
						r:FireServer(remoteArg)
					end
				end
			end
			task.wait(tonumber(WaitBox.Text) or 0.5)
		end
	end)
end

-- Botón Smoke_FE
SmokeBtn.MouseButton1Click:Connect(function()
	startSpamRemote("Smoke_FE", "SQ")
end)

-- Botón Backfire_FE
BackfireBtn.MouseButton1Click:Connect(function()
	startSpamRemote("Backfire_FE", "Backfire1")
end)

-- Botón AC6_FE_Sounds -> ahora busca remotes dinámicamente y spamea todos
AC6Btn.MouseButton1Click:Connect(function()
	AC6Remotes = findAC6Remotes()
	if #AC6Remotes == 0 then
		print("❌ No se encontraron remotes AC6 para spamear")
		StarterGui:SetCore("SendNotification", {
			Title = "❌ No remotes AC6",
			Text = "No se encontraron remotes AC6 en Workspace.",
			Duration = 3
		})
		return
	end
	startSpamRemote(AC6Remotes, "SQ")
end)

-- Botón Detener spam
Stop.MouseButton1Click:Connect(function()
	SpamActive = false
	print("⏹️ Spam detenido")
end)

-- Actualizar estado RespectFilteringEnabled dinámicamente
task.spawn(function()
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
end)
