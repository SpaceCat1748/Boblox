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

towerTable = {}
for _,v in pairs(game:GetService("Workspace")["__MAP"].Towers:GetChildren()) do
   if not table.find(towerTable, v.Name) then
    table.insert(towerTable, v.Name)
   end
end

local selectedtower
local drop = auf:Dropdown("Pick Tower", towerTable, function(v)
print(v)
selectedtower = v
end)

auf:Toggle("Auto-Farm Selected Tower",false, function(state)
getgenv().coin = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().coin == true then
       game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["__MAP"].Towers[selectedtower].Win.Button.CFrame
    end
end)
end)

local buy = serv:Channel("Things For Buy")

GearTable = {}
for _,v in pairs(game:GetService("ReplicatedStorage").Assets.Models.Gears:GetChildren()) do
   if not table.find(GearTable, v.Name) then
    table.insert(GearTable, v.Name)
   end
end

local selectedGear
local drop = buy:Dropdown("Buy Gear", GearTable, function(v)
print(v)
selectedGear = v
local A_1 = "S_Gears_Click"
local A_2 = 
{
	[1] = selectedGear
}
local Event = game:GetService("ReplicatedStorage").Common.Library.Network.RemoteEvent
Event:FireServer(A_1, A_2)
end)


local egg = serv:Channel("Eggs")

eggTable = {}
for _,v in pairs(game:GetService("Workspace")["__MAP"].Towers:GetChildren()) do
    if v:FindFirstChild("Eggs") then
       for i,l in pairs(v.Eggs:GetChildren()) do
           if l.ClassName == "Model" then
                if not table.find(eggTable, l.Name) then
                    table.insert(eggTable, l.Name)
              end
          end
       end
    end
end


local selectedegg
local drop = egg:Dropdown("Pick Egg", eggTable, function(v)
print(v)
selectedegg = v
end)

egg:Toggle("Auto-Buy Egg",false, function(state)
getgenv().egg = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().egg == true then
        local A_1 = "S_Egg_Open"
        local A_2 = 
        {
            [1] = selectedegg, 
            [2] = false
        }
        local Event = game:GetService("ReplicatedStorage").Common.Library.Network.RemoteEvent
        Event:FireServer(A_1, A_2)
    end
end)
end)


local msc = serv:Channel("Misc")

msc:Textbox("WalkSpeed", "Type here!", true, function(v)
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
end)


msc:Button("Infinity Jumps", function()
local InfiniteJumpEnabled = true
game:GetService("UserInputService").JumpRequest:connect(function()
	if InfiniteJumpEnabled then
		player.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
	end
end)
end)
