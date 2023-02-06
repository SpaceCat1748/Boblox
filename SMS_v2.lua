for i,v in pairs(game:GetService("CoreGui"):GetChildren()) do
    if v.Name == "Discord" then
       v:Destroy()
    end
end

eggTable = {}
for _,v in pairs(game:GetService("Workspace").Eggs:GetChildren()) do
        if not table.find(eggTable, v.Name) then
            table.insert(eggTable, v.Name)
        end
    end

areaTable = {}
for _,v in pairs(game:GetService("Workspace").Spawns:GetChildren()) do
        if not table.find(areaTable, v.Name) then
            table.insert(areaTable, v.Name)
        end
    end

tpTable = {}
for _,v in pairs(game:GetService("Workspace").ScriptSabitleri:GetChildren()) do
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

auf:Button("Give all Gamepasses", function()
for i,v in pairs(game.Players.LocalPlayer.Data:GetChildren()) do
    if v.ClassName == "BoolValue" then
       v.Value = true
    end
end
end)

auf:Toggle("Auto-Weight",false, function(state)
getgenv().Clickv1 = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().Clickv1 == true then
local args = {
    [1] = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name
}

game:GetService("ReplicatedStorage").Events.Weight:FireServer(unpack(args))
        end
    end)
end)

auf:Toggle("Auto-Rebirth",false, function(state)
getgenv().Rebirth = state

while wait() do
    if getgenv().Rebirth == true then
game:GetService("ReplicatedStorage").Events.Rebirth:FireServer()
        end
    end
end)

local egg = serv:Channel("Egg")

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
    [1] = selectedegg,
    [2] = 1
}

game:GetService("ReplicatedStorage").Events.HatchEgg:InvokeServer(unpack(args))
    end
end
end)

local tp = serv:Channel("TP")

local selectedarea
local drop = tp:Dropdown("Pick Area", areaTable, function(v)
print(v)
selectedarea = v
player.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Spawns[selectedarea].CFrame
end)

local selectedtp
local drop = tp:Dropdown("Pick another thing", tpTable, function(v)
print(v)
selectedtp = v
player.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").ScriptSabitleri[selectedtp].CFrame
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
