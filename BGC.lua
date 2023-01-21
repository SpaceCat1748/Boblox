for i,v in pairs(game:GetService("CoreGui"):GetChildren()) do
    if v.Name == "Discord" then
       v:Destroy()
    end
end

eggTable = {}
for _,v in pairs(game:GetService("Workspace").MAP.Eggs:GetChildren()) do
        if not table.find(eggTable, v.Name) then
            table.insert(eggTable, v.Name)
    end
end

tpTable = {}
for _,v in pairs(game:GetService("Workspace").MAP.Teleports:GetChildren()) do
        if not table.find(tpTable, v.Name) then
            table.insert(tpTable, v.Name)
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

auf:Toggle("Auto-Blow Bubble",false, function(state)
getgenv().blow = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().blow == true then
        local A_1 = 
        {
            [1] = 
        {
            [1] = false
        }, 
            [2] = 
        {
            [1] = 2
        }
        }
        local Event = game:GetService("ReplicatedStorage").Remotes["blow bubble"]
        Event:FireServer(A_1)
    end
end)
end)

auf:Toggle("Auto-Collect Coins, Gems, Orbs",false, function(state)
getgenv().Collect = state

while wait() do
    if getgenv().Collect == true then
            for i,v in pairs(game:GetService("Workspace").Stuff.Pickups:GetDescendants()) do
                if v.Name == "TouchInterest" then
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 0)
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 1)
                end
            end
        end
    end
end)

auf:Toggle("Auto-Sell x2",false, function(state)
getgenv().sell = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().sell == true then
local A_1 = 
{
	[1] = 
{
	[1] = true
}, 
	[2] = 
{
	[1] = false
}
}
local Event = game:GetService("ReplicatedStorage").Remotes["sell bubbles"]
Event:FireServer(A_1)
        end
    end)
end)


auf:Toggle("Auto-Collect Gifts",false, function(state)
getgenv().cg = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().cg == true then
            for i = 1,12 do
                local A_1 = 
                {
                    [1] = 
                {
                    [1] = i
                }, 
                    [2] = 
                {
                    [1] = false
                }
                }
                local Event = game:GetService("ReplicatedStorage").Remotes["redeem free gift"]
                Event:InvokeServer(A_1)
                for i,v in pairs(game:GetService("Workspace").Stuff.Lootbags:GetChildren()) do
                    v["Meshes/Bag_Cylinder (1)"].CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                end
            end
        end
    end)
end)

local egg = serv:Channel("Eggs")

local selectedegg
local drop = egg:Dropdown("Pick Egg", eggTable, function(v)
print(v)
selectedegg = v
end)

egg:Toggle("Auto-Buy Egg",false, function(state)
getgenv().buy = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().buy == true then
            local A_1 = 
            {
                [1] = 
            {
                [1] = selectedegg
            }, 
                [2] = 
            {
                [1] = false
            }
            }
            local Event = game:GetService("ReplicatedStorage").Remotes["buy egg"]
            Event:InvokeServer(A_1)
        end
    end)
end)

egg:Toggle("Auto-Equip Best",false, function(state)
getgenv().best = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().best == true then
local A_1 = 
{
	[1] = 
{
	[1] = false
}, 
	[2] = 
{
	[1] = 2
}
}
local Event = game:GetService("ReplicatedStorage").Remotes["equip best pets"]
Event:FireServer(A_1)
        end
    end)
end)

egg:Label("These are auto-delete buttons")
egg:Label("if you want to disable, just press again")

egg:Button("Auto-Delete Basic Pets", function()
local A_1 = 
{
	[1] = 
{
	[1] = "Basic"
}, 
	[2] = 
{
	[1] = false
}
}
local Event = game:GetService("ReplicatedStorage").Remotes["auto delete setting"]
Event:FireServer(A_1)
end)

egg:Button("Auto-Delete Rare Pets", function()
local A_1 = 
{
	[1] = 
{
	[1] = "Rare"
}, 
	[2] = 
{
	[1] = false
}
}
local Event = game:GetService("ReplicatedStorage").Remotes["auto delete setting"]
Event:FireServer(A_1)
end)

egg:Button("Auto-Delete Epic Pets", function()
local A_1 = 
{
	[1] = 
{
	[1] = "Epic"
}, 
	[2] = 
{
	[1] = false
}
}
local Event = game:GetService("ReplicatedStorage").Remotes["auto delete setting"]
Event:FireServer(A_1)
end)

egg:Button("Auto-Delete Legendary Pets", function()
local A_1 = 
{
	[1] = 
{
	[1] = "Legendary"
}, 
	[2] = 
{
	[1] = false
}
}
local Event = game:GetService("ReplicatedStorage").Remotes["auto delete setting"]
Event:FireServer(A_1)
end)


local tp = serv:Channel("TP")

local selectedtp
local drop = tp:Dropdown("Pick TP", tpTable, function(v)
print(v)
selectedtp = v
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").MAP.Teleports[selectedtp].CFrame
end)


local msc = serv:Channel("Misc")

msc:Button("Collect Chests", function()
for i,v in pairs(game:GetService("Workspace").MAP.Chests:GetChildren()) do
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
end
end)

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
