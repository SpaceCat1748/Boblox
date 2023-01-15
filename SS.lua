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
        for i,v in pairs(game:GetService("Workspace").Mobs:GetChildren()) do
            if v:FindFirstChild("HumanoidRootPart") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,10,2)
            end
        end
    end
end)
end)

auf:Toggle("Auto-Attack",false, function(state)
getgenv().Attack = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().Attack == true then
        local Event = game:GetService("ReplicatedStorage").EventStorage.Attack
        Event:InvokeServer()
    end
end)
end)

local upg = serv:Channel("Upgrades")

upg:Toggle("Auto-Upgrade Defence",false, function(state)
getgenv().Defence = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().Defence == true then
        local A_1 = "Defence"
        local A_2 = ""
        local Event = game:GetService("ReplicatedStorage").EventStorage.Upgrade
        Event:InvokeServer(A_1, A_2)
    end
end)
end)

upg:Toggle("Auto-Upgrade Strength",false, function(state)
getgenv().Strength = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().Strength == true then
        local A_1 = "Strength"
        local A_2 = ""
        local Event = game:GetService("ReplicatedStorage").EventStorage.Upgrade
        Event:InvokeServer(A_1, A_2)
    end
end)
end)

upg:Toggle("Auto-Upgrade Agility",false, function(state)
getgenv().Agility = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().Agility == true then
        local A_1 = "Agility"
        local A_2 = ""
        local Event = game:GetService("ReplicatedStorage").EventStorage.Upgrade
        Event:InvokeServer(A_1, A_2)
    end
end)
end)

upg:Toggle("Auto-Upgrade Regen",false, function(state)
getgenv().Regen = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().Regen == true then
        local A_1 = "Regen"
        local A_2 = ""
        local Event = game:GetService("ReplicatedStorage").EventStorage.Upgrade
        Event:InvokeServer(A_1, A_2)
    end
end)
end)

upg:Toggle("Auto-Upgrade Luck",false, function(state)
getgenv().Luck = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().Luck == true then
        local A_1 = "Luck"
        local A_2 = ""
        local Event = game:GetService("ReplicatedStorage").EventStorage.Upgrade
        Event:InvokeServer(A_1, A_2)
    end
end)
end)



local egg = serv:Channel("Egg")

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

egg:Toggle("Auto-Buy Egg",false, function(state)
getgenv().buy = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().buy == true then
        local A_1 = selectedegg
        local A_2 = 1
        local Event = game:GetService("ReplicatedStorage").EventStorage.EggHandler
        Event:FireServer(A_1, A_2)
    end
end)
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