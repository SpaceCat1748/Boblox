local GetName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)

local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

local player = game.Players.LocalPlayer

local DiscordLib = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/discord%20lib.txt")()

local win = DiscordLib:Window(GetName.Name)

local serv = win:Server("gui", "")

local auf = serv:Channel("farm")


auf:Toggle("Auto-Farm",false, function(state)
getgenv().af = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().af == true then
        local Event = game:GetService("ReplicatedStorage").Events.Jumped
        Event:InvokeServer()
        player.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Earth.Walls[1000000].CFrame * CFrame.new(-5,0,0)
    end
end)
end)

auf:Toggle("Auto-Rebirth",false, function(state)
getgenv().af = state

while wait() do
    if getgenv().af == true then
        local Event = game:GetService("ReplicatedStorage").Events.Rebirth
        Event:FireServer()
    end
end
end)

local egg = serv:Channel("Eggs and Pets")

eggTable = {}
for _,v in pairs(game:GetService("ReplicatedStorage").Assets.Eggs:GetChildren()) do
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
getgenv().abe = state

while wait() do
    if getgenv().abe == true then
        local A_1 = selectedegg
        local A_2 = 1
        local Event = game:GetService("ReplicatedStorage").Events.HatchPet
        Event:FireServer(A_1, A_2)
    end
end
end)


local msc = serv:Channel("Misc")

msc:Button("collect chest", function()
for i,v in pairs(game:GetService("Workspace").Chests:GetDescendants()) do
    if v.Name == "TouchInterest" then
        firetouchinterest(player.Character.HumanoidRootPart, v.Parent, 0)
        firetouchinterest(player.Character.HumanoidRootPart, v.Parent, 1)
    end
end
end)


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