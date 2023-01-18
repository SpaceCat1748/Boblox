for i,v in pairs(game:GetService("CoreGui"):GetChildren()) do
    if v.Name == "Discord" then
       v:Destroy()
    end
end

game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16

getgenv().walk = game.Players.LocalPlayer.Character.Humanoid.WalkSpeed;

local GetName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)

local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

local VirtualInputManager = game:GetService('VirtualInputManager')

local player = game.Players.LocalPlayer

local DiscordLib = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/discord%20lib.txt")()

local win = DiscordLib:Window(GetName.Name)

local serv = win:Server("gui", "")

local auf = serv:Channel("Farm")

auf:Toggle("Auto-Farm",false, function(state)
getgenv().farm = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().farm == true then
        local A_1 = getgenv().farm
        local Event = game:GetService("ReplicatedStorage").Packages["_Index"]["sleitnick_knit@1.4.7"].knit.Services.AutoFarmService.RE.ToggleAutoFarm
        Event:FireServer(A_1)
    elseif getgenv().farm == false then
        local A_1 = false
        local Event = game:GetService("ReplicatedStorage").Packages["_Index"]["sleitnick_knit@1.4.7"].knit.Services.AutoFarmService.RE.ToggleAutoFarm
        Event:FireServer(A_1)
        return getgenv().farm;
    end
end)
end)

auf:Toggle("Auto-Collect Money",false, function(state)
getgenv().Collect = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().Collect == true then
            for i,v in pairs(game:GetService("Workspace").CurrencyDrops:GetChildren()) do
                if v:FindFirstChild("0") then
                    local A_1 = v:GetAttribute("Name")
                    local A_2 = v:GetAttribute("Value")
                    local Event = game:GetService("ReplicatedStorage").Packages["_Index"]["sleitnick_knit@1.4.7"].knit.Services.CurrencyService.RE.Collect
                    Event:FireServer(A_1, A_2)
                end
            end
            for i,v in pairs(game:GetService("Workspace").CurrencyDrops:GetChildren()) do
                if v:FindFirstChild("0") then
                    v:Destroy()
                end
            end
        end
end)
end)

auf:Toggle("Auto-Buy Gates",false, function(state)
getgenv().gate = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().gate == true then
        for i,v in pairs(game:GetService("Workspace").ZoneBorders:GetChildren()) do
            if v.ClassName == "Model" then
                fireproximityprompt(v.PromptPart.ProximityPrompt)
                local A_1 = v.Name
                local Event = game:GetService("ReplicatedStorage").Packages["_Index"]["sleitnick_knit@1.4.7"].knit.Services.ZoneService.RF.PurchaseZone
                Event:InvokeServer(A_1)
            end
        end
    end
end)
end)



local egg = serv:Channel("Eggs")

eggTable = {}
for _,v in pairs(game:GetService("Workspace"):GetChildren()) do
    if v.ClassName == "Model" then
        if string.find(v.Name, "Silo") then
            if not table.find(eggTable, v.Name) then
                table.insert(eggTable, v.Name)
            end
        end
    end
end

local selectedegg
local drop = egg:Dropdown("Pick Egg", eggTable, function(v)
print(v)
selectedegg = v
end)

egg:Toggle("Auto-Buy Eggs",false, function(state)
getgenv().buy = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().buy == true then
       local A_1 = selectedegg
       local Event = game:GetService("ReplicatedStorage").Packages["_Index"]["sleitnick_knit@1.4.7"].knit.Services.EggService.RF.Buy
       Event:InvokeServer(A_1)
    end
end)
end)

egg:Toggle("Auto-Equip Best",false, function(state)
getgenv().best = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().best == true then
        local Event = game:GetService("ReplicatedStorage").Packages["_Index"]["sleitnick_knit@1.4.7"].knit.Services.NukeService.RE.EquipBest
        Event:FireServer()
    end
end)
end)

local TP = serv:Channel("TP")

TPTable = {}
for _,v in pairs(game:GetService("ReplicatedStorage").Assets.ZoneBorders:GetChildren()) do
       if not table.find(TPTable, v.Name) then
           table.insert(TPTable, v.Name)
    end
end

local selectedtp
local drop = TP:Dropdown("Pick for TP", TPTable, function(v)
print(v)
selectedtp = v
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("ReplicatedStorage").Assets.ZoneBorders[selectedtp].PromptPart.CFrame * CFrame.new(0,0,10)
end)


local msc = serv:Channel("Misc")

msc:Textbox("WalkSpeed", "Type here!", true, function(v)
getgenv().walk = v

game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = getgenv().walk
end)

msc:Toggle("Toggle WalkSpeed",false, function(state)
getgenv().walk1 = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().walk1 == true then
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = getgenv().walk
    end
end)
end)



msc:Button("Infinity Jumps", function()
local InfiniteJumpEnabled = true
game:GetService("UserInputService").JumpRequest:connect(function()
	if InfiniteJumpEnabled then
		player.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
	end
end)
end)