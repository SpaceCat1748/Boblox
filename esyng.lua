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

auf:Toggle("Auto-Grow",false, function(state)
getgenv().ag = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().ag == true then
       game:GetService('VirtualInputManager'):SendKeyEvent(true,'E',false,uwu)
    elseif getgenv().ag == false then
       game:GetService('VirtualInputManager'):SendKeyEvent(false,'E',false,uwu)
    end
end)
end)

winTable = {}
for _,v in pairs(game:GetService("Workspace"):GetChildren()) do
    if v:FindFirstChild("_WINBRICK") then
        if not table.find(winTable, v.Name) then
            table.insert(winTable, v.Name)
        end
    end
end

local selectedwin
local drop = auf:Dropdown("Pick Win", winTable, function(v)
print(v)
selectedwin = v
end)

auf:Toggle("Auto-Win(It's like rebirth)",false, function(state)
getgenv().aw = state

while wait() do
    if getgenv().aw == true then
        player.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")[selectedwin]["_WINBRICK"].CFrame
        fireproximityprompt(game:GetService("Workspace")[selectedwin]["_WINBRICK"].ProximityPrompt)
    end
end
end)

local egg = serv:Channel("Eggs and Pets")

eggTable = {}
for _,v in pairs(game:GetService("Workspace")["_PetEggs"]:GetChildren()) do
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
        local A_3 = false
        local Event = game:GetService("ReplicatedStorage").Remotes.Pet.ToggleHatch
        Event:InvokeServer(A_1, A_2, A_3)
    end
end
end)

egg:Toggle("Auto-Equip Best",false, function(state)
getgenv().aqb = state

while wait() do
    if getgenv().aqb == true then
        local Event = game:GetService("ReplicatedStorage").Remotes.Pet.EquipBest
        Event:FireServer()
    end
end
end)

local msc = serv:Channel("Misc")

msc:Button("Get Badges", function()
for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
    if v.Name == "_BADGE" then
        firetouchinterest(player.Character.HumanoidRootPart, v.TouchInterest.Parent, 0)
        firetouchinterest(player.Character.HumanoidRootPart, v.TouchInterest.Parent, 1)
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