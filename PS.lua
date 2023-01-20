for i,v in pairs(game:GetService("CoreGui"):GetChildren()) do
    if v.Name == "Discord" then
       v:Destroy()
    end
end

winTable = {}
for _,v in pairs(game:GetService("Workspace").WinPads:GetChildren()) do
   if not table.find(winTable, v.Name) then
    table.insert(winTable, v.Name)
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

local selectedwin
local drop = auf:Dropdown("Pick Winpad", winTable, function(v)
print(v)
selectedwin = v
end)

auf:Toggle("Auto-Farm Wins",false, function(state)
getgenv().autoFarmwin = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().autoFarmwin == true then
       for i,v in pairs(game:GetService("Workspace").WinPads[selectedwin]:GetDescendants()) do
           if v.Name == "TouchInterest" then
              firetouchinterest(player.Character.HumanoidRootPart, v.Parent, 0)
              firetouchinterest(player.Character.HumanoidRootPart, v.Parent, 1)
           end
        end
    end
end)
end)


local tp = serv:Channel("TP")

tpTable = {}
for _,v in pairs(game:GetService("Workspace").Teleports:GetChildren()) do
   if not table.find(tpTable, v.Name) then
    table.insert(tpTable, v.Name)
   end
end

local selectedtp
local drop = tp:Dropdown("Pick tp", tpTable, function(v)
print(v)
selectedtp = v
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Teleports[selectedtp].CFrame
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