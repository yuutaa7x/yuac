local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")

local splashGui = Instance.new("ScreenGui")
splashGui.Name = "YuuSplash"
splashGui.IgnoreGuiInset = true
splashGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
splashGui.Parent = CoreGui

local bg = Instance.new("Frame")
bg.Size = UDim2.fromScale(1, 1)
bg.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
bg.BackgroundTransparency = 1 -- Mulai dari 100% transparan agar tidak mengagetkan
bg.BorderSizePixel = 0
bg.Parent = splashGui

local title = Instance.new("TextLabel")
title.Text = "Yuu's Universal Avatar Customizer"
title.Font = Enum.Font.GothamBold
title.TextSize = 30
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1
title.Size = UDim2.new(1, 0, 0, 50)
title.Position = UDim2.new(0, 0, 0.42, 0)
title.TextTransparency = 1
title.Parent = bg

local subtitle = Instance.new("TextLabel")
subtitle.Text = "by Yuutaa7x"
subtitle.Font = Enum.Font.GothamMedium
subtitle.TextSize = 18
subtitle.TextColor3 = Color3.fromRGB(180, 180, 180)
subtitle.BackgroundTransparency = 1
subtitle.Size = UDim2.new(1, 0, 0, 30)
subtitle.Position = UDim2.new(0, 0, 0.5, 0)
subtitle.TextTransparency = 1
subtitle.Parent = bg

local barBg = Instance.new("Frame")
barBg.Size = UDim2.new(0, 350, 0, 4)
barBg.Position = UDim2.new(0.5, -175, 0.6, 0)
barBg.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
barBg.BorderSizePixel = 0
barBg.BackgroundTransparency = 1
barBg.Parent = bg

local barFill = Instance.new("Frame")
barFill.Size = UDim2.new(0, 0, 1, 0)
barFill.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
barFill.BorderSizePixel = 0
barFill.BackgroundTransparency = 1
barFill.Parent = barBg

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(1, 0)
UICorner.Parent = barBg
local UICorner2 = UICorner:Clone()
UICorner2.Parent = barFill

-- Animations (Lebih lambat dan santai)
local tiBg = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
TweenService:Create(bg, tiBg, {BackgroundTransparency = 0.35}):Play() -- Hanya gelap sedikit (35%), game tetap terlihat jelas
task.wait(0.5)

local tiText = TweenInfo.new(1.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
TweenService:Create(title, tiText, {TextTransparency = 0}):Play()
task.wait(0.4)
TweenService:Create(subtitle, tiText, {TextTransparency = 0}):Play()
TweenService:Create(barBg, tiText, {BackgroundTransparency = 0.5}):Play()
TweenService:Create(barFill, tiText, {BackgroundTransparency = 0}):Play()

task.wait(0.8)

-- Fill Bar (Loading diperlambat)
TweenService:Create(barFill, TweenInfo.new(3.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Size = UDim2.new(1, 0, 1, 0)}):Play()
task.wait(5) -- Tunggu loading selesai + jeda sedikit agar tulisan bisa dibaca

-- Fade out (Menghilang perlahan)
local tiOut = TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
TweenService:Create(title, tiOut, {TextTransparency = 1}):Play()
TweenService:Create(subtitle, tiOut, {TextTransparency = 1}):Play()
TweenService:Create(barBg, tiOut, {BackgroundTransparency = 1}):Play()
TweenService:Create(barFill, tiOut, {BackgroundTransparency = 1}):Play()
task.wait(2)
TweenService:Create(bg, TweenInfo.new(1.5), {BackgroundTransparency = 1}):Play()
task.wait(2)

splashGui:Destroy()

local isAnonymous = false

local promptGui = Instance.new("ScreenGui")
promptGui.Name = "YuuPrompt"
promptGui.IgnoreGuiInset = true
promptGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
promptGui.Parent = CoreGui

local pBg = Instance.new("Frame")
pBg.Size = UDim2.fromScale(1, 1)
pBg.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
pBg.BackgroundTransparency = 0.5
pBg.BorderSizePixel = 0
pBg.Parent = promptGui

local pFrame = Instance.new("Frame")
pFrame.Size = UDim2.new(0, 320, 0, 160)
pFrame.Position = UDim2.new(0.5, -160, 0.5, -80)
pFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
pFrame.BorderSizePixel = 0
pFrame.Parent = pBg

local pCorner = Instance.new("UICorner")
pCorner.CornerRadius = UDim.new(0, 10)
pCorner.Parent = pFrame

local pTitle = Instance.new("TextLabel")
pTitle.Text = "Privacy Settings"
pTitle.Font = Enum.Font.GothamBold
pTitle.TextSize = 20
pTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
pTitle.BackgroundTransparency = 1
pTitle.Size = UDim2.new(1, 0, 0, 40)
pTitle.Position = UDim2.new(0, 0, 0, 5)
pTitle.Parent = pFrame

local pDesc = Instance.new("TextLabel")
pDesc.Text = "Do you want to show your username to others in Sync, or stay Anonymous?"
pDesc.Font = Enum.Font.GothamMedium
pDesc.TextSize = 14
pDesc.TextColor3 = Color3.fromRGB(180, 180, 180)
pDesc.BackgroundTransparency = 1
pDesc.TextWrapped = true
pDesc.Size = UDim2.new(1, -40, 0, 50)
pDesc.Position = UDim2.new(0, 20, 0, 45)
pDesc.Parent = pFrame

local pBind = Instance.new("BindableEvent")

local function createBtn(text, color, xPos, isAnonVal)
    local btn = Instance.new("TextButton")
    btn.Text = text
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 14
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.BackgroundColor3 = color
    btn.Size = UDim2.new(0, 120, 0, 35)
    btn.Position = UDim2.new(0, xPos, 0, 105)
    btn.AutoButtonColor = true
    btn.Parent = pFrame
    
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 6)
    c.Parent = btn
    
    btn.MouseButton1Click:Connect(function()
        isAnonymous = isAnonVal
        pBind:Fire()
    end)
end

createBtn("Anonymous", Color3.fromRGB(180, 60, 60), 25, true)
createBtn("Show Identity", Color3.fromRGB(60, 160, 80), 175, false)

pBind.Event:Wait()
promptGui:Destroy()

-- Load Library
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

-- Core Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

-- Additional Settings
WindUI:SetNotificationLower(true)

WindUI:AddTheme({
    Name = "DarkNew",
    Accent = Color3.fromHex("#18181b"),
    Background = Color3.fromHex("#101010"),
    Outline = Color3.fromHex("#FFFFFF"),
    Text = Color3.fromHex("#FFFFFF"),
    Placeholder = Color3.fromHex("#7a7a7a"),
    Button = Color3.fromHex("#52525b"),
    Icon = Color3.fromHex("#a1a1aa"),
})

WindUI:SetTheme("DarkNew")

-- Loaded Notify
WindUI:Notify({
    Title = "Welcome!",
    Content = "Scripts Loaded, Please wait Until window appearing.",
    Icon = "circle-check-big",
    Duration = 5,
})

task.wait(1)

WindUI:Notify({
    Title = "Information",
    Content = "press = to hide/unhide window",
    Icon = "bell",
    Duration = 15,
})

task.wait(5)

-- Avatar State
local AvatarState = {
    Self = { Korblox = false, Headless = false, Crown8B = false, Backpack8B = false, HPBar8B = false, TabbyCat8B = false, CustomAssetID = nil, KorbloxX = -0.05, KorbloxY = -0.50, KorbloxZ = 0, KorbloxRX = 0, KorbloxRY = 295, KorbloxRZ = 0 },
    Targeted = { TargetName = "", Korblox = false, Headless = false, Crown8B = false, Backpack8B = false, HPBar8B = false, TabbyCat8B = false, CustomAssetID = nil, KorbloxX = -0.05, KorbloxY = -0.50, KorbloxZ = 0, KorbloxRX = 0, KorbloxRY = 295, KorbloxRZ = 0 },
    Global = { Korblox = false, Headless = false, Crown8B = false, Backpack8B = false, HPBar8B = false, TabbyCat8B = false, CustomAssetID = nil, KorbloxX = -0.05, KorbloxY = -0.50, KorbloxZ = 0, KorbloxRX = 0, KorbloxRY = 295, KorbloxRZ = 0 },
    SyncedPlayers = {}
}

-- Asset IDs
local ASSETS = {
    Crown8B = 10159600649,
    Backpack8B = 10369943613,
    HPBar8B = 10159610478,
    TabbyCat8B = 10159617728
}
local KORBLOX_MESH = "rbxassetid://101851696"
local KORBLOX_TEXTURE = "rbxassetid://101851254"

-- Caching Handles
local HandleCaches = {}
local CharacterHandles = {} -- [char] = { Crown8B = handle, Backpack8B = handle, ... }
local removedForChar = {}
local MasterHandles = {}
local MasterNames = {}

local function loadAccessoryHandle(assetId, handleName)
    if MasterHandles[assetId] then
        local clone = MasterHandles[assetId]:Clone()
        clone.Name = handleName
        clone.Transparency = 1
        task.delay(0.1, function()
            if clone and clone.Parent then
                clone.Transparency = 0
            end
        end)
        return clone, MasterNames[assetId]
    end
    
    local ok, objects = pcall(function() return game:GetObjects("rbxassetid://" .. tostring(assetId)) end)
    if ok and objects and #objects > 0 then
        local obj = objects[1]
        local handle = obj:IsA("Accessory") and obj:FindFirstChild("Handle") or (obj:FindFirstChildOfClass("Accessory") and obj:FindFirstChildOfClass("Accessory"):FindFirstChild("Handle"))
        if handle then
            handle.Parent = nil
            local objName = obj.Name
            pcall(function() obj:Destroy() end)
            handle.Name = handleName
            handle.Anchored = true
            handle.CanCollide = false
            handle.CastShadow = false
            
            MasterHandles[assetId] = handle:Clone()
            MasterNames[assetId] = objName
            
            handle.Transparency = 1
            task.delay(0.1, function()
                if handle and handle.Parent then
                    handle.Transparency = 0
                end
            end)
            
            return handle, objName
        else
            pcall(function() obj:Destroy() end)
        end
    end
    return nil, nil
end

local function getUniversalCharacter(plr)
    local rigs = workspace:FindFirstChild("Rigs")
    if rigs then
        local customRig = rigs:FindFirstChild(plr.Name)
        if customRig and customRig:FindFirstChild("Head") then return customRig end
    end
    if plr.Character and plr.Character:FindFirstChild("Head") then return plr.Character end
    return nil
end

local function applyHeadless(char, isEnabled)
    local head = char:FindFirstChild("Head")
    if not head then return end
    
    if head:IsA("MeshPart") then
        head.Transparency = isEnabled and 1 or 0
        local face = head:FindFirstChildOfClass("Decal")
        if face then face.Transparency = isEnabled and 1 or 0 end
    else
        for _, v in ipairs(head:GetChildren()) do
            if v:IsA("SpecialMesh") or v:IsA("CylinderMesh") then
                v.Scale = isEnabled and Vector3.new(0, 0, 0) or (v:IsA("SpecialMesh") and v.MeshType == Enum.MeshType.Head and Vector3.new(1.25, 1.25, 1.25) or Vector3.new(1, 1, 1))
            end
            if v:IsA("Decal") then v.Transparency = isEnabled and 1 or 0 end
        end
        if head:IsA("BasePart") and not head:FindFirstChildOfClass("SpecialMesh") then
            head.Transparency = isEnabled and 1 or 0
        end
    end
end

local KorbloxCache = {}

local function applyKorblox(char, isEnabled, xOffset, yOffset, zOffset, rxOffset, ryOffset, rzOffset)
    local hum = char:FindFirstChildOfClass("Humanoid")
    local isR15 = hum and hum.RigType == Enum.HumanoidRigType.R15

    if isR15 then
        local upper = char:FindFirstChild("RightUpperLeg")
        local lower = char:FindFirstChild("RightLowerLeg")
        local foot = char:FindFirstChild("RightFoot")
        
        local targetTrans = isEnabled and 1 or 0
        if upper and upper.Transparency ~= targetTrans then upper.Transparency = targetTrans end
        if lower and lower.Transparency ~= targetTrans then lower.Transparency = targetTrans end
        if foot and foot.Transparency ~= targetTrans then foot.Transparency = targetTrans end
        
        if isEnabled and upper then
            if not KorbloxCache[char] then
                local fake = Instance.new("Part")
                fake.Name = "FakeKorbloxLeg"
                fake.Size = Vector3.new(0.1, 0.1, 0.1)
                fake.CanCollide = false
                fake.Massless = true
                fake.Anchored = true
                fake.CastShadow = false
                fake.Parent = workspace
                
                local mesh = Instance.new("SpecialMesh")
                mesh.MeshType = Enum.MeshType.FileMesh
                mesh.MeshId = "rbxassetid://101851696" -- Using R6 mesh since it covers the whole leg visually
                mesh.TextureId = "rbxassetid://101851254"
                mesh.Scale = Vector3.new(1, 1, 1)
                mesh.Parent = fake
                
                KorbloxCache[char] = fake
            end
            
            local fake = KorbloxCache[char]
            if fake and fake.Parent then
                local targetCFrame = upper.CFrame * CFrame.new(xOffset, yOffset, zOffset) * CFrame.Angles(math.rad(rxOffset), math.rad(ryOffset), math.rad(rzOffset))
                if fake.CFrame ~= targetCFrame then fake.CFrame = targetCFrame end
            end
        else
            if KorbloxCache[char] then
                KorbloxCache[char]:Destroy()
                KorbloxCache[char] = nil
            end
        end
    else
        local rightLeg = char:FindFirstChild("Right Leg")
        if rightLeg then
            local sm = rightLeg:FindFirstChild("CustomBodyMesh")
            if isEnabled then
                if not sm then
                    sm = Instance.new("SpecialMesh")
                    sm.Name = "CustomBodyMesh"
                    sm.Parent = rightLeg
                end
                sm.MeshType = Enum.MeshType.FileMesh
                local targetMesh = "rbxassetid://101851696"
                local targetTex = "rbxassetid://101851254"
                if sm.MeshId ~= targetMesh then sm.MeshId = targetMesh end
                if sm.TextureId ~= targetTex then sm.TextureId = targetTex end
                sm.Scale = Vector3.new(1, 1, 1)
                
                -- Hapus CharacterMesh bawaan Roblox agar tidak bertumpuk
                for _, v in ipairs(char:GetChildren()) do
                    if v:IsA("CharacterMesh") and v.BodyPart == Enum.BodyPart.RightLeg then
                        v:Destroy()
                    end
                end
            else
                if sm then sm:Destroy() end
            end
        end
    end
end

local function removeConflictingAccessories(char, attachName)
    if not attachName then return end
    for _, child in ipairs(char:GetChildren()) do
        if child:IsA("Accessory") then
            local h = child:FindFirstChild("Handle")
            if h and h:FindFirstChild(attachName) then
                child:Destroy()
            end
        end
    end
end

local function applyAccessoryToChar(char, featureName, assetId, handleName)
    if not CharacterHandles[char] then CharacterHandles[char] = {} end
    if not CharacterHandles[char][featureName] then
        local newHandle = loadAccessoryHandle(assetId, handleName)
        if newHandle then
            newHandle.CFrame = CFrame.new(0, -10000, 0)
            newHandle.Parent = workspace
            CharacterHandles[char][featureName] = newHandle
        end
    end
    
    local handle = CharacterHandles[char][featureName]
    if handle then
        local accAtt = handle:FindFirstChildWhichIsA("Attachment")
        local attName = accAtt and accAtt.Name or "HatAttachment"
        local offset = accAtt and accAtt.Position or Vector3.new(0,0,0)
        local charAtt = char:FindFirstChild(attName, true)
        local attachPart = charAtt and charAtt.Parent or char:FindFirstChild("Head")
        
        if attachPart then
            if not removedForChar[char] then removedForChar[char] = {} end
            if not removedForChar[char][featureName] then
                removeConflictingAccessories(char, attName)
                removedForChar[char][featureName] = true
            end
            local charAttPos = charAtt and charAtt.Position or Vector3.new(0, 0.6, 0)
            local targetCF = attachPart.CFrame * CFrame.new(charAttPos)
            handle.CFrame = targetCF * CFrame.new(-offset)
        else
            handle.CFrame = CFrame.new(0, -10000, 0)
        end
    end
end

local function removeAccessoryFromChar(char, featureName)
    if CharacterHandles[char] and CharacterHandles[char][featureName] then
        CharacterHandles[char][featureName]:Destroy()
        CharacterHandles[char][featureName] = nil
    end
    if removedForChar[char] then
        removedForChar[char][featureName] = nil
    end
end

local function resolveTargetPlayer(targetName)
    if not targetName or targetName == "" then return nil end
    local lower = string.lower(targetName)
    for _, p in ipairs(Players:GetPlayers()) do
        if string.find(string.lower(p.Name), lower, 1, true) or string.find(string.lower(p.DisplayName), lower, 1, true) then
            return p
        end
    end
    return nil
end

if _G.YuacMainLoopConn then _G.YuacMainLoopConn:Disconnect(); _G.YuacMainLoopConn = nil end

_G.YuacMainLoopConn = RunService.Heartbeat:Connect(function()
    local desiredFeatures = {}
    
    local localChar = getUniversalCharacter(LocalPlayer)
    if localChar then desiredFeatures[localChar] = AvatarState.Self end
    
    local targetedPlayer = nil
    if AvatarState.Targeted.TargetName ~= "" then
        targetedPlayer = resolveTargetPlayer(AvatarState.Targeted.TargetName)
        if targetedPlayer and targetedPlayer ~= LocalPlayer then
            local tChar = getUniversalCharacter(targetedPlayer)
            if tChar then desiredFeatures[tChar] = AvatarState.Targeted end
        end
    end
    
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p ~= targetedPlayer then
            local pChar = getUniversalCharacter(p)
            if pChar then
                if AvatarState.SyncedPlayers and AvatarState.SyncedPlayers[p.Name] then
                    desiredFeatures[pChar] = AvatarState.SyncedPlayers[p.Name]
                else
                    desiredFeatures[pChar] = AvatarState.Global
                end
            end
        end
    end
    
    local activeChars = {}
    for char, features in pairs(desiredFeatures) do
        activeChars[char] = true
        pcall(function()
            applyHeadless(char, features.Headless)
            applyKorblox(char, features.Korblox, features.KorbloxX or -0.05, features.KorbloxY or -0.50, features.KorbloxZ or 0, features.KorbloxRX or 0, features.KorbloxRY or 295, features.KorbloxRZ or 0)
            
            if features.Crown8B then applyAccessoryToChar(char, "Crown8B", ASSETS.Crown8B, "Crown8B_Handle") else removeAccessoryFromChar(char, "Crown8B") end
            if features.Backpack8B then applyAccessoryToChar(char, "Backpack8B", ASSETS.Backpack8B, "Backpack8B_Handle") else removeAccessoryFromChar(char, "Backpack8B") end
            if features.HPBar8B then applyAccessoryToChar(char, "HPBar8B", ASSETS.HPBar8B, "HPBar8B_Handle") else removeAccessoryFromChar(char, "HPBar8B") end
            if features.TabbyCat8B then applyAccessoryToChar(char, "TabbyCat8B", ASSETS.TabbyCat8B, "TabbyCat8B_Handle") else removeAccessoryFromChar(char, "TabbyCat8B") end
            
            local currentCustoms = {}
            if features.CustomAssets then
                for id, accName in pairs(features.CustomAssets) do
                    local featName = "Custom_" .. id
                    currentCustoms[featName] = true
                    applyAccessoryToChar(char, featName, id, "Custom_Handle_" .. id)
                end
            end
            
            if CharacterHandles[char] then
                for featName, handle in pairs(CharacterHandles[char]) do
                    if string.sub(featName, 1, 7) == "Custom_" and not currentCustoms[featName] then
                        removeAccessoryFromChar(char, featName)
                    end
                end
            end
        end)
    end
    
    for char, handles in pairs(CharacterHandles) do
        if not char.Parent or not activeChars[char] then
            for feat, handle in pairs(handles) do handle:Destroy() end
            CharacterHandles[char] = nil
            removedForChar[char] = nil
        end
    end
    
    for char, fake in pairs(KorbloxCache) do
        if not char.Parent or not activeChars[char] then
            fake:Destroy()
            KorbloxCache[char] = nil
        end
    end
end)

-- Window Container
local Window = WindUI:CreateWindow({
    Title = "Yuu's Universal Avatar Customizer",
    Author = "by Yuutaa7x",
    Folder = "yuac",
    Size = UDim2.fromOffset(750, 520),
    Resizable = true,
    SideBarWidth = 200,
    HideSearchBar = true,
    ScrollBarEnabled = false,
    User = { Enabled = true, Anonymous = isAnonymous },
    Topbar = {
        Height = 52,
        ButtonsType = "Mac" -- "Default" or "Mac" style
    }
})

local VerTag = Window:Tag({
    Title = "Version: v1.0",
    Color = Color3.fromRGB(128, 128, 128),
})

local PingTag = Window:Tag({
    Title = "Ping: 0ms",
    Color = Color3.fromRGB(128, 128, 128),
})
 
task.spawn(function()
    while true do
        local success, ping = pcall(function()
            local Stats = game:GetService("Stats")
            local pingValue = Stats.Network.ServerStatsItem["Data Ping"]:GetValue()
            return math.floor(pingValue)
        end)
        
        if success and ping then
            PingTag:SetTitle("Ping: " .. ping .. "ms")
        end
        
        task.wait(2)
    end
end)

local FPSTag = Window:Tag({
    Title = "FPS: 0",
    Color = Color3.fromRGB(128, 128, 128),
})
 
local RunService = game:GetService("RunService")
local lastUpdate = tick()
local frameCount = 0
 
RunService.RenderStepped:Connect(function()
    frameCount = frameCount + 1
    local now = tick()
    
    if now - lastUpdate >= 1 then
        local fps = math.floor(frameCount / (now - lastUpdate))
        FPSTag:SetTitle("FPS: " .. fps)
        
        frameCount = 0
        lastUpdate = now
    end
end)

local function buildSettingsForTab(TabInstance, StateTable, isSelf)
    local SectionCustom = TabInstance:Section({ Title = "Custom Assets ID", Opened = true })
    
    local typedAssetID = nil
    SectionCustom:Input({
        Title = "Assets ID", Placeholder = "Insert Assets ID", Desc = "Type ID here, then click Equip below", 
        Locked = false, Type = "Default",
        Callback = function(txt)
            typedAssetID = tonumber(txt)
        end
    })
    
        local unequipSections = {}
    
    SectionCustom:Button({
        Title = "Equip Asset",
        Color = Color3.fromRGB(50, 200, 50),
        Callback = function()
            local id = typedAssetID
            
            if not id then
                local CoreGui = game:GetService("CoreGui")
                local ui = CoreGui:FindFirstChild("WindUI") or CoreGui:FindFirstChild("yuac")
                if not ui then
                    local pgui = game:GetService("Players").LocalPlayer:FindFirstChild("PlayerGui")
                    if pgui then ui = pgui:FindFirstChild("WindUI") or pgui:FindFirstChild("yuac") end
                end
                
                if ui then
                    for _, tb in ipairs(ui:GetDescendants()) do
                        if tb:IsA("TextBox") and tb.Text and tb.Text ~= "" then
                            local num = tonumber(tb.Text)
                            if num and num > 1000000 then 
                                id = num 
                                break 
                            end
                        end
                    end
                end
            end
            
            if not id then 
                WindUI:Notify({Title = "Error", Content = "Please enter a valid Asset ID first! (Tekan Enter setelah mengetik ID)", Duration = 4})
                return 
            end
            
            StateTable.CustomAssets = StateTable.CustomAssets or {}
            
            if StateTable.CustomAssets[id] then
                WindUI:Notify({Title = "Error", Content = "Asset ID " .. id .. " is already equipped!", Duration = 3})
                return
            end
            
            WindUI:Notify({Title = "Fetching", Content = "Getting info for " .. id .. "...", Duration = 1})
            
            task.spawn(function()
                  local success, info = pcall(function() return game:GetService("MarketplaceService"):GetProductInfo(id) end)
                  if not success or not info then
                      WindUI:Notify({Title = "Error", Content = "Invalid Asset ID or could not fetch info!", Duration = 3})
                      return
                  end
                  
                  local validTypes = {
                      [8] = "Hat", [41] = "Hair", [42] = "Face", [43] = "Neck",
                      [44] = "Shoulder", [45] = "Front", [46] = "Back", [47] = "Waist"
                  }
                  
                  local typeName = validTypes[info.AssetTypeId]
                  if not typeName then
                      WindUI:Notify({Title = "Invalid Type", Content = "ID " .. id .. " is a " .. (info.AssetTypeId or "Unknown") .. ", not an Accessory!", Duration = 4})
                      return
                  end
                  
                  local function doEquip()
                      WindUI:Notify({Title = "Loading", Content = "Fetching asset " .. id .. "...", Duration = 2})
                      local handle, accName = loadAccessoryHandle(id, "Custom_Handle_" .. id)
                      if handle then
                          StateTable.CustomAssets[id] = accName
                          WindUI:Notify({Title = "Equipped", Content = "Loaded: " .. accName, Duration = 3})
                          
                          local newSec = TabInstance:Section({
                              Title = accName,
                              TextSize = 19,
                              TextXAlignment = "Left",
                              Box = true, BoxBorder = true,
                              FontWeight = Enum.FontWeight.SemiBold,
                              DescFontWeight = Enum.FontWeight.Medium,
                          })
                          unequipSections[id] = newSec
                          newSec:Button({
                              Title = "Unequip",
                              Color = Color3.fromRGB(255, 50, 50),
                              Callback = function()
                                  StateTable.CustomAssets[id] = nil
                                  if unequipSections[id] and unequipSections[id].Destroy then pcall(function() unequipSections[id]:Destroy() end) end
                                  unequipSections[id] = nil
                                  WindUI:Notify({Title = "Unequipped", Content = "Removed: " .. accName, Duration = 3})
                              end
                          })
                      else
                          WindUI:Notify({Title = "Error", Content = "Failed to load asset " .. id .. " (No Handle found)", Duration = 3})
                      end
                  end
                  
                  local dialogSuccess = pcall(function()
                      Window:Dialog({
                          Title = "Confirm Asset",
                          Content = "Name: " .. (info.Name or "Unknown") .. "\nType: " .. typeName .. "\nCreator: " .. (info.Creator.Name or "Unknown"),
                          Buttons = {
                              { Title = "Equip", Callback = function() doEquip() end },
                              { Title = "Cancel", Callback = function() end }
                          }
                      })
                  end)
                  
                  if not dialogSuccess then
                      local confirmSec = TabInstance:Section({ Title = "Confirm: " .. (info.Name or "Unknown"), Box = true, BoxBorder = true })
                      confirmSec:Button({
                          Title = "Yes, Equip It (" .. typeName .. ")", Color = Color3.fromRGB(50, 200, 50),
                          Callback = function() pcall(function() confirmSec:Destroy() end); doEquip() end
                      })
                      confirmSec:Button({
                          Title = "Cancel", Color = Color3.fromRGB(255, 50, 50),
                          Callback = function() pcall(function() confirmSec:Destroy() end) end
                      })
                  end
              end)
        end
    })

    local SectionKBHL = TabInstance:Section({ Title = "Korblox + Headless" })
    SectionKBHL:Button({ Title = "Enable", Color = Color3.fromRGB(50, 50, 255), Callback = function() StateTable.Korblox = true; StateTable.Headless = true end })
    SectionKBHL:Button({ Title = "Disable", Color = Color3.fromRGB(255, 100, 100), Callback = function() StateTable.Korblox = false; StateTable.Headless = false end })

    local SectionKB = TabInstance:Section({ Title = "Korblox Only" })
    SectionKB:Button({ Title = "Enable", Color = Color3.fromRGB(50, 50, 255), Callback = function() StateTable.Korblox = true end })
    SectionKB:Button({ Title = "Disable", Color = Color3.fromRGB(255, 100, 100), Callback = function() StateTable.Korblox = false end })

    local SectionHL = TabInstance:Section({ Title = "Headless Only" })
    SectionHL:Button({ Title = "Enable", Color = Color3.fromRGB(50, 50, 255), Callback = function() StateTable.Headless = true end })
    SectionHL:Button({ Title = "Disable", Color = Color3.fromRGB(255, 100, 100), Callback = function() StateTable.Headless = false end })

    local Section8BRC = TabInstance:Section({ Title = "8-Bit Royal Crown" })
    Section8BRC:Button({ Title = "Enable", Color = Color3.fromRGB(50, 50, 255), Callback = function() StateTable.Crown8B = true end })
    Section8BRC:Button({ Title = "Disable", Color = Color3.fromRGB(255, 100, 100), Callback = function() StateTable.Crown8B = false end })

    local Section8BCB = TabInstance:Section({ Title = "8-Bit Controller Backpack" })
    Section8BCB:Button({ Title = "Enable", Color = Color3.fromRGB(50, 50, 255), Callback = function() StateTable.Backpack8B = true end })
    Section8BCB:Button({ Title = "Disable", Color = Color3.fromRGB(255, 100, 100), Callback = function() StateTable.Backpack8B = false end })

    local Section8BHP = TabInstance:Section({ Title = "8-Bit HP Bar" })
    Section8BHP:Button({ Title = "Enable", Color = Color3.fromRGB(50, 50, 255), Callback = function() StateTable.HPBar8B = true end })
    Section8BHP:Button({ Title = "Disable", Color = Color3.fromRGB(255, 100, 100), Callback = function() StateTable.HPBar8B = false end })

    local Section8BTC = TabInstance:Section({ Title = "8-Bit Tabby Cat" })
    Section8BTC:Button({ Title = "Enable", Color = Color3.fromRGB(50, 50, 255), Callback = function() StateTable.TabbyCat8B = true end })
    Section8BTC:Button({ Title = "Disable", Color = Color3.fromRGB(255, 100, 100), Callback = function() StateTable.TabbyCat8B = false end })
end

-- TABS
local MainTab = Window:Tab({ Title = "Main Self Avatar Settings", Icon = "user", Locked = false, ShowTabTitle = true, Border = true })
buildSettingsForTab(MainTab, AvatarState.Self, true)

local TargetedTab = Window:Tab({ Title = "Targeted User Avatar Settings", Icon = "circle-user", Locked = false, ShowTabTitle = true, Border = true })
local SectionTarget = TargetedTab:Section({ Title = "Target Selection", Opened = true })
SectionTarget:Input({
    Title = "Target Username / Display Name", 
    Placeholder = "Enter name here...", 
    Desc = "Changes apply only to this player", 
    Callback = function(txt) AvatarState.Targeted.TargetName = txt end
})
buildSettingsForTab(TargetedTab, AvatarState.Targeted, false)

local GlobalServerTab = Window:Tab({ Title = "Global Server Avatar Settings", Icon = "earth", Locked = false, ShowTabTitle = true, Border = true })
buildSettingsForTab(GlobalServerTab, AvatarState.Global, false)

local SyncTab = Window:Tab({ Title = "Sync Settings", Icon = "refresh-ccw", Locked = false, ShowTabTitle = true, Border = true })
local SectionSync = SyncTab:Section({ Title = "Avatar Sync with Other Script User", Opened = true })

local FIREBASE_URL = "https://robloxsyncava-default-rtdb.asia-southeast1.firebasedatabase.app/"
local HttpService = game:GetService("HttpService")
local request_func = (syn and syn.request) or (http and http.request) or http_request or request or (fluxus and fluxus.request)

_G.YuacSyncTargetID = nil
_G.YuacSyncTargetName = nil
_G.YuacFirebasePollConn = true

local onlineUserButtons = {}

SectionSync:Button({
    Title = "Refresh Online Users",
    Color = Color3.fromRGB(150, 150, 150),
    Callback = function()
        WindUI:Notify({Title = "Scanning", Content = "Searching for active users...", Duration = 2})
        task.spawn(function()
            local success, res = pcall(function()
                return request_func({
                    Url = FIREBASE_URL .. "yuac_presence.json",
                    Method = "GET"
                })
            end)
            
            if success and res and res.StatusCode == 200 and res.Body ~= "null" then
                local data = HttpService:JSONDecode(res.Body)
                
                for _, btn in ipairs(onlineUserButtons) do
                    if btn and btn.Destroy then pcall(function() btn:Destroy() end) end
                end
                table.clear(onlineUserButtons)
                
                local foundAny = false
                local now = os.time()
                for userIdStr, info in pairs(data) do
                    if info and info.name and info.name ~= LocalPlayer.Name then
                        if info.timestamp and (now - info.timestamp) < 60 then
                            foundAny = true
                            local inServer = game:GetService("Players"):FindFirstChild(info.name) ~= nil
                            local titleText = "Sync: " .. info.displayName .. " (@" .. info.name .. ")"
                            if inServer then titleText = titleText .. " [IN SERVER]" end
                            
                            local btn = SectionSync:Button({
                                Title = titleText,
                                Color = inServer and Color3.fromRGB(50, 200, 50) or Color3.fromRGB(50, 150, 255),
                                Callback = function()
                                    _G.YuacSyncTargetID = userIdStr
                                    _G.YuacSyncTargetName = info.displayName
                                    WindUI:Notify({Title = "Sync Active", Content = "Now streaming to " .. info.displayName, Duration = 3})
                                end
                            })
                            table.insert(onlineUserButtons, btn)
                        end
                    end
                end
                
                if not foundAny then
                    WindUI:Notify({Title = "No Users", Content = "No other users currently online.", Duration = 3})
                end
            else
                WindUI:Notify({Title = "Error", Content = "Failed to fetch online users.", Duration = 3})
            end
        end)
    end
})

SectionSync:Button({
    Title = "Stop Syncing",
    Color = Color3.fromRGB(255, 100, 100),
    Callback = function()
        _G.YuacSyncTargetID = nil
        _G.YuacSyncTargetName = nil
        WindUI:Notify({Title = "Sync Stopped", Content = "No longer sending avatar data.", Duration = 3})
    end
})

-- Presence Loop
task.spawn(function()
    while _G.YuacFirebasePollConn do
        if request_func then
            pcall(function()
                request_func({
                    Url = FIREBASE_URL .. "yuac_presence/" .. LocalPlayer.UserId .. ".json",
                    Method = "PUT",
                    Headers = {["Content-Type"] = "application/json"},
                    Body = HttpService:JSONEncode({
                        name = isAnonymous and "Hidden" or LocalPlayer.Name,
                        displayName = isAnonymous and "Anonymous Player" or LocalPlayer.DisplayName,
                        timestamp = os.time()
                    })
                })
            end)
        end
        task.wait(15)
    end
end)

-- Send Loop
task.spawn(function()
    while _G.YuacFirebasePollConn do
        task.wait(2)
        if _G.YuacSyncTargetID and request_func then
            local state = AvatarState.Self
            local customAssetsArray = {}
            if state.CustomAssets then
                for id, _ in pairs(state.CustomAssets) do
                    table.insert(customAssetsArray, tostring(id))
                end
            end
            
            local payload = HttpService:JSONEncode({
                senderName = isAnonymous and "Hidden" or LocalPlayer.Name,
                timestamp = os.time(),
                korblox = state.Korblox,
                headless = state.Headless,
                crown8b = state.Crown8B,
                backpack8b = state.Backpack8B,
                hpbar8b = state.HPBar8B,
                tabbycat8b = state.TabbyCat8B,
                customAssets = customAssetsArray,
                kbX = state.KorbloxX, kbY = state.KorbloxY, kbZ = state.KorbloxZ,
                kbRX = state.KorbloxRX, kbRY = state.KorbloxRY, kbRZ = state.KorbloxRZ
            })
            
            pcall(function()
                request_func({
                    Url = FIREBASE_URL .. "yuac_syncs/" .. _G.YuacSyncTargetID .. ".json",
                    Method = "PUT",
                    Headers = {["Content-Type"] = "application/json"},
                    Body = payload
                })
            end)
        end
    end
end)

-- Receive Loop
task.spawn(function()
    local lastTimestamp = 0
    while _G.YuacFirebasePollConn do
        task.wait(2)
        if request_func then
            local success, res = pcall(function()
                return request_func({
                    Url = FIREBASE_URL .. "yuac_syncs/" .. LocalPlayer.UserId .. ".json",
                    Method = "GET"
                })
            end)
            if success and res and res.StatusCode == 200 and res.Body ~= "null" then
                local data = HttpService:JSONDecode(res.Body)
                if data and data.timestamp and data.timestamp > lastTimestamp then
                    lastTimestamp = data.timestamp
                    local sender = data.senderName
                    if sender and sender ~= "" then
                        AvatarState.SyncedPlayers = AvatarState.SyncedPlayers or {}
                        
                        local loadedCustoms = {}
                        if data.customAssets then
                            for _, idStr in ipairs(data.customAssets) do
                                local id = tonumber(idStr)
                                if id then
                                    local handle, accName = loadAccessoryHandle(id, "Custom_Handle_" .. id)
                                    if handle then
                                        loadedCustoms[id] = accName
                                        handle:Destroy()
                                    end
                                end
                            end
                        end
                        
                        AvatarState.SyncedPlayers[sender] = {
                            Korblox = data.korblox,
                            Headless = data.headless,
                            Crown8B = data.crown8b,
                            Backpack8B = data.backpack8b,
                            HPBar8B = data.hpbar8b,
                            TabbyCat8B = data.tabbycat8b,
                            CustomAssets = loadedCustoms,
                            KorbloxX = data.kbX or -0.05, KorbloxY = data.kbY or -0.50, KorbloxZ = data.kbZ or 0,
                            KorbloxRX = data.kbRX or 0, KorbloxRY = data.kbRY or 295, KorbloxRZ = data.kbRZ or 0
                        }
                    end
                end
            end
        end
    end
end)

local SettingsTab = Window:Tab({ Title = "Other Settings", Icon = "settings", Locked = false, ShowTabTitle = true, Border = true })

local TutorialTab = Window:Tab({ Title = "Tutorial & Guide", Icon = "swatch-book", Locked = false, ShowTabTitle = true, Border = true })

local TutorialParagraph = TutorialTab:Paragraph({
    Title = "Q: How to get Assets ID?",
    Desc = "A: go to roblox marketplace with browser and choose item you want to use, and copy id in 'catalog/[id]/' from the url adress bar | ( just copy the id dont copy the 'catalog/' or '/' )",
    Locked = false,
})

local AboutTab = Window:Tab({
    Title = "About YUAC",
    Icon = "info",
    Locked = false,
    ShowTabTitle = true,
    Border = true,
})

local AboutParagraph = AboutTab:Paragraph({
    Title = "Visit Github Repository",
    Desc = "Official Github Repository Below",
    Locked = false,
})

AboutTab:Button({
    Title = "Visit Github Now",
    Icon = "github",
    Color = Color3.fromRGB(128, 128, 128),
    Callback = function()
        if setclipboard then
            setclipboard("https://github.com/yuutaa7x/yuac")
            WindUI:Notify({Title = "Copied!", Content = "Github link copied to clipboard!", Duration = 3, Icon = "copy"})
        else
            WindUI:Notify({Title = "Error", Content = "Your executor does not support setclipboard!", Duration = 3, Icon = "x"})
        end
    end,
})

local AboutParagraph2 = AboutTab:Paragraph({
    Title = "Visit My Community Discord Server",
    Desc = "if you want to meet me in online, lets meet here!",
    Locked = false,
})

AboutTab:Button({
    Title = "Visit Discord Now",
    Icon = "message-circle",
    Color = Color3.fromRGB(50, 85, 255),
    Callback = function()
        if setclipboard then
            setclipboard("https://discord.gg/dzGKnf5pSK")
            WindUI:Notify({Title = "Copied!", Content = "Discord invite copied to clipboard!", Duration = 3, Icon = "copy"})
        else
            WindUI:Notify({Title = "Error", Content = "Your executor does not support setclipboard!", Duration = 3, Icon = "x"})
        end
    end,
})

local ExitTab = Window:Tab({ Title = "Exit", Icon = "door-open", Locked = false, ShowTabTitle = true, Border = true })
local SectionExit = ExitTab:Section({ Title = "Close Menu", Opened = true })
SectionExit:Button({ 
    Title = "Destroy UI & Clean Up", 
    Color = Color3.fromRGB(255, 50, 50), 
    Callback = function() 
        if _G.YuacMainLoopConn then 
            _G.YuacMainLoopConn:Disconnect() 
            _G.YuacMainLoopConn = nil 
        end
        if toggleConn then
            toggleConn:Disconnect()
            toggleConn = nil
        end
        if reminderTask then 
            task.cancel(reminderTask) 
            reminderTask = nil 
        end
        _G.YuacFirebasePollConn = false
        local req = (syn and syn.request) or (http and http.request) or http_request or request or (fluxus and fluxus.request)
        if req then
            pcall(function()
                req({ Url = "https://robloxsyncava-default-rtdb.asia-southeast1.firebasedatabase.app/yuac_presence/" .. game:GetService("Players").LocalPlayer.UserId .. ".json", Method = "DELETE" })
            end)
        end
        for char, handles in pairs(CharacterHandles) do
            for feat, handle in pairs(handles) do handle:Destroy() end
        end
        for char, fake in pairs(KorbloxCache) do
            fake:Destroy()
        end
        table.clear(CharacterHandles)
        table.clear(KorbloxCache)
        table.clear(MasterHandles)
        local CoreGui = game:GetService("CoreGui")
        local ui = CoreGui:FindFirstChild("WindUI") or CoreGui:FindFirstChild("yuac")
        if ui then ui:Destroy() end
        if Window.Destroy then Window:Destroy() end
    end 
})

MainTab:Select()
task.wait(2.5)

local reminderTask = nil
local isReminderDisabled = false

local currentToggleKey = "="

SettingsTab:Keybind({
    Title = "Toggle UI",
    Desc = "Keybind to open/hide UI",
    Value = "Equals",
    Callback = function(v)
        if Window.SetToggleKey then
            pcall(function() Window:SetToggleKey(Enum.KeyCode[v]) end)
        end
        local ok, str = pcall(function() return game:GetService("UserInputService"):GetStringForKeyCode(Enum.KeyCode[v]) end)
        if ok and str and str ~= "" then
            currentToggleKey = str
        else
            currentToggleKey = tostring(v)
        end
    end
})

if Window.OnOpen and Window.OnClose then
    Window:OnOpen(function()
        WindUI:Notify({ Title = "Window Opened", Content = "Press " .. currentToggleKey .. " to hide again", Duration = 3, Icon = "eye" })
    end)
    Window:OnClose(function()
        WindUI:Notify({ Title = "Window Closed", Content = "Press " .. currentToggleKey .. " to back open", Duration = 3, Icon = "eye-off" })
    end)
end

SettingsTab:Toggle({
    Title = "Disable Donate Reminder",
    Desc = "For stopping/disabling Reminder to Donate",
    Value = false,
    Type = "Toggle",
    Locked = false,
    Flag = "sobuzreminder",
    Callback = function(state)
        isReminderDisabled = state        
        if reminderTask then task.cancel(reminderTask); reminderTask = nil end
        if isReminderDisabled then
            WindUI:Notify({ Title = "Notify", Content = "Donate reminder disabled", Icon = "bell", Duration = 3 })
        else
            WindUI:Notify({ Title = "Notify", Content = "Donate reminder enabled", Icon = "bell", Duration = 3 })
            startReminderLoop()
        end
    end
})

local SectionTweak = SettingsTab:Section({ Title = "R15 Korblox Tweaks", Opened = false })
SectionTweak:Input({ 
    Title = "Offset X (Geser Kiri/Kanan)", Placeholder = "Contoh: -0.05", Desc = "Ketik angka untuk geser (Default: -0.05)", 
    Callback = function(val) local num = tonumber(val); if num then AvatarState.Self.KorbloxX = num; AvatarState.Targeted.KorbloxX = num; AvatarState.Global.KorbloxX = num end end 
})
SectionTweak:Input({ 
    Title = "Offset Y (Naik/Turun)", Placeholder = "Contoh: -0.50", Desc = "Ketik angka untuk tinggi (Default: -0.50)", 
    Callback = function(val) local num = tonumber(val); if num then AvatarState.Self.KorbloxY = num; AvatarState.Targeted.KorbloxY = num; AvatarState.Global.KorbloxY = num end end 
})
SectionTweak:Input({ 
    Title = "Offset Z (Depan/Belakang)", Placeholder = "Contoh: 0", Desc = "Ketik angka untuk maju/mundur (Default: 0)", 
    Callback = function(val) local num = tonumber(val); if num then AvatarState.Self.KorbloxZ = num; AvatarState.Targeted.KorbloxZ = num; AvatarState.Global.KorbloxZ = num end end 
})
SectionTweak:Input({ 
    Title = "Rotation X (Pitch / Miring)", Placeholder = "Contoh: 0", Desc = "Ketik derajat miring (Default: 0)", 
    Callback = function(val) local num = tonumber(val); if num then AvatarState.Self.KorbloxRX = num; AvatarState.Targeted.KorbloxRX = num; AvatarState.Global.KorbloxRX = num end end 
})
SectionTweak:Input({ 
    Title = "Rotation Y (Yaw / Hadap)", Placeholder = "Contoh: 295", Desc = "Ketik derajat hadap (Default: 295)", 
    Callback = function(val) local num = tonumber(val); if num then AvatarState.Self.KorbloxRY = num; AvatarState.Targeted.KorbloxRY = num; AvatarState.Global.KorbloxRY = num end end 
})
SectionTweak:Input({ 
    Title = "Rotation Z (Roll / Goyang)", Placeholder = "Contoh: 0", Desc = "Ketik derajat goyang (Default: 0)", 
    Callback = function(val) local num = tonumber(val); if num then AvatarState.Self.KorbloxRZ = num; AvatarState.Targeted.KorbloxRZ = num; AvatarState.Global.KorbloxRZ = num end end 
})

function startReminderLoop()
    reminderTask = task.spawn(function()
        while not isReminderDisabled do
            task.wait(60)
            if not isReminderDisabled then
                WindUI:Notify({ Title = "Reminder", Content = "don't forget to support me in socialbuzz", Icon = "bell-ring", Duration = 5 })
            end
        end
    end)
end

startReminderLoop()
