for i,v in pairs(game:GetService("CoreGui"):GetChildren()) do
    if v.Name == "Discord" then
       v:Destroy()
    end
end

eggTable = {}
for _,v in pairs(game:GetService("Workspace").Eggs.Holder:GetChildren()) do
    if not table.find(eggTable, v.Name) then
       table.insert(eggTable, v.Name)
    end
end

farmTable = {}
for _,v in pairs(game:GetService("Workspace").Walls:GetChildren()) do
    if not table.find(farmTable, v.win.Value) then
       table.insert(farmTable, v.win.Value)
    end
end


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

auf:Button("3x Wins(You can this use infinity)", function()
firetouchinterest(game.Players.LocalPlayer.Character.Head, game:GetService("Workspace").Parkour.EndIsland.Reward.TouchInterest.Parent, 0)
firetouchinterest(game.Players.LocalPlayer.Character.Head, game:GetService("Workspace").Parkour.EndIsland.Reward.TouchInterest.Parent, 1)
end)

local selectedrace
local drop = auf:Dropdown("Pick Egg", farmTable, function(v)
print(v)
selectedrace = v
end)

auf:Toggle("Auto-Farm Win",false, function(state)
getgenv().afw = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().afw == true then
       if game:GetService("Workspace").GameInfo.GameType.Value == "Race" then
            for i,v in pairs(game:GetService("Workspace").Walls:GetChildren()) do
                if v.win.Value == selectedrace then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v:FindFirstChildOfClass("Part").CFrame * CFrame.new(0,0,15)
                    game.Players.LocalPlayer.Character.Humanoid.Health = 0
                end
            end
        end
    end
end)
end)

auf:Toggle("Auto-Rebirth",false, function(state)
getgenv().Rebirth = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().Rebirth == true then
        game:GetService("ReplicatedStorage").Remote.Event.Rebirth["[C-S]TryBuyRebirth"]:FireServer()
    end
end)
end)

auf:Toggle("Auto-Collect Drop",false, function(state)
getgenv().Drop = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().Drop == true then
        for i,v in pairs(game.Workspace.Pick.Normal.Drop:GetDescendants()) do
            if v.ClassName == "Part" then
                v.CFrame = game.Players.LocalPlayer.Character.Head.CFrame
            end
        end
    end
end)
end)

auf:Toggle("Auto-Collect Coins",false, function(state)
getgenv().Coins = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().Coins == true then
        for i,v in pairs(game.Workspace.Coins:GetDescendants()) do
            if v.ClassName == "MeshPart" then
                v.CFrame = game.Players.LocalPlayer.Character.Head.CFrame
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

egg:Toggle("Auto-Buy Egg", false, function(state)
getgenv().buy1 = state

while wait() do
    if getgenv().buy1 == true then
local args = {
    [1] = selectedegg
}

game:GetService("ReplicatedStorage").Remote.Function.Luck["[C-S]DoLuck"]:InvokeServer(unpack(args))
    end
end
end)

egg:Toggle("Auto-Equip Best", false, function(state)
getgenv().Best = state

while wait() do
    if getgenv().Best == true then
        game:GetService("ReplicatedStorage").Remote.Event.Pet["[C-S]TryEquipBest"]:FireServer()
    end
end
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
    elseif getgenv().walk1 == false then
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
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
