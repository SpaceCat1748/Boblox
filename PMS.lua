local GetName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)

local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

local function getNearest()
    local Closest, Distance = nil, 99999
    for _, v in pairs(game:GetService("Workspace").SpawnedMineables:GetChildren()) do
            for i,l in pairs(v:GetChildren()) do
                local Mag = (game:GetService("Players").LocalPlayer.Character.Head.Position - l.Center.Position).magnitude
                if Mag < Distance then
                Distance = Mag
                Closest = l
            end
        end
    end
    return Closest
end

local player = game.Players.LocalPlayer

local DiscordLib = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/discord%20lib.txt")()

local win = DiscordLib:Window(GetName.Name)

local serv = win:Server("gui", "")

local auf = serv:Channel("Farm")

auf:Toggle("Auto-Farm Nearest",false, function(state)
getgenv().farming = state

while wait() do
    if getgenv().farming == true then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = getNearest().Center.CFrame 

local A_1 = "Mineable"
local A_2 = 
{
	["Mineable"] = getNearest()
}
local Event = game:GetService("ReplicatedStorage").Knit.Services.MineableService.RE.MineableRemote
Event:FireServer(A_1, A_2)

for i,v in pairs(game:GetService("Workspace").PickaxeStorage[game.Players.LocalPlayer.Name]:GetChildren()) do
local A_1 = 
{
	["Mineable"] = getNearest(), 
	["PickaxeId"] = v.Name
}
local Event = game:GetService("ReplicatedStorage").Knit.Services.MineableService.RF.MovePickaxe
Event:InvokeServer(A_1)

local A_1 = 
{
	["Mineable"] = getNearest(), 
	["PickaxeId"] = v.Name
}
local Event = game:GetService("ReplicatedStorage").Knit.Services.MineableService.RF.StartMining
Event:InvokeServer(A_1)
        end
    end
end
end)

auf:Toggle("Auto-Click",false, function(state)
getgenv().click = state

while wait() do
    if getgenv().click == true then
        local A_1 = "Click"
        local Event = game:GetService("ReplicatedStorage").Knit.Services.MineableService.RE.MineableRemote
        Event:FireServer(A_1)
    end
end
end)

auf:Toggle("Auto-Collect Drops",false, function(state)
getgenv().drop = state

while wait() do
    if getgenv().drop == true then
        for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
            if v.Name == "Drops" then
                if v:FindFirstChildOfClass("Model") then
                    for i,l in pairs(v:GetChildren()) do
                        l.Drop.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                    end
                end
            end
        end    
    end
end
end)

auf:Toggle("Auto-Collect Rewards",false, function(state)
getgenv().reward = state

while wait() do
    if getgenv().reward == true then
        for i = 1,9 do
            local A_1 = 
            {
                ["Id"] = i
            }
            local Event = game:GetService("ReplicatedStorage").Knit.Services.RewardService.RF.RequestCompletion
            Event:InvokeServer(A_1)
        end    
    end
end
end)

auf:Toggle("Auto-Buy Gates",false, function(state)
getgenv().gate = state

while wait() do
    if getgenv().gate == true then
        for i,v in pairs(game:GetService("Workspace").Gates:GetChildren()) do
            if v.ClassName == "Model" then
                local A_1 = v.Name
                local A_2 = v.Name
                local Event = game:GetService("ReplicatedStorage").Knit.Services.GateService.RF.RequestUnlock
                Event:InvokeServer(A_1, A_2)
            end
        end
    end
end
end)

local egg = serv:Channel("Eggs")

eggTable = {}
for _,v in pairs(game:GetService("Workspace").Eggs:GetChildren()) do
   if not table.find(eggTable, v.Name) then
       table.insert(eggTable, v.Name)
   end
end

local selectedegg
local drop = egg:Dropdown("Pick Egg", eggTable, function(v)
print(v)
selectedegg = v
end)

egg:Toggle("Auto-Buy 1 Egg",false, function(state)
getgenv().egg = state

while wait() do
    if getgenv().egg == true then
        local A_1 = 
        {
            ["Auto"] = false, 
            ["EggType"] = selectedegg, 
            ["UpdateType"] = "Open", 
            ["Amount"] = 1
        }
        local Event = game:GetService("ReplicatedStorage").Knit.Services.EggService.RF.OpenEgg
        Event:InvokeServer(A_1)
    end
end
end)

local tp = serv:Channel("TP")


tpTable = {}
for _,v in pairs(game:GetService("Workspace").Spawnpoints:GetChildren()) do
   if not table.find(tpTable, v.Name) then
       table.insert(tpTable, v.Name)
   end
end

local selectedtp
local drop = tp:Dropdown("Pick TP", tpTable, function(v)
print(v)
selectedtp = v
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Spawnpoints[selectedtp].CFrame
end)

local msc = serv:Channel("Misc")

msc:Button("Delete Invisible Walls", function()
for i,v in pairs(game:GetService("Workspace").INVISWALLS:GetChildren()) do
    if v.ClassName == "Part" then
        v:Destroy()
    end
end

end)


msc:Textbox("WalkSpeed", "Type here!", true, function(v)
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v

game.Players.LocalPlayer.Character.Humanoid:GetPropertyChangedSignal('WalkSpeed'):Connect(function()
     game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
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
