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

auf:Toggle("Auto-Collect Coins",false, function(state)
getgenv().coin = state

while wait() do
    if getgenv().coin == true then
        local Event = game:GetService("ReplicatedStorage").Events.CoinEvent
        Event:FireServer()
    end
end
end)

npcTable = {}
for _,v in pairs(game:GetService("Workspace").NPC:GetChildren()) do
   if not table.find(npcTable, v.Name) then
    table.insert(npcTable, v.Name)
   end
end

local selectednpc
local drop = auf:Dropdown("Pick NPC", npcTable, function(v)
print(v)
selectednpc = v
end)

auf:Toggle("Auto-Farm NPC(use animal)",false, function(state)
getgenv().farmnpc = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().farmnpc == true then
        VirtualInputManager:SendKeyEvent(true,"Q",false,uwu)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").NPC[selectednpc].HumanoidRootPart.CFrame
    end
end)
end)

auf:Toggle("Auto-Farm Dummy",false, function(state)
getgenv().farm = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().farm == true then
        VirtualInputManager:SendKeyEvent(true,"Q",false,uwu)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").MAP.dummies["Training Dummy"].HumanoidRootPart.CFrame
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