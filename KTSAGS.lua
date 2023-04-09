local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)


function KILL()
for i,v in pairs(game:GetService("Workspace").SpawnedEnemies:GetChildren()) do
    if v.ClassName == "Part" then
local args = {
    [1] = {
        [1] = v:GetAttribute("ID")
    }
}

game:GetService("ReplicatedStorage").Remotes.SendClientDamage:FireServer(unpack(args))
    end
end
end

function TP()
for i,v in pairs(game:GetService("Workspace").SpawnedEnemies:GetChildren()) do
    if v.ClassName == "Model" then
       game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(2,1,-5)
    end
end
end

for i,v in pairs(game:GetService("CoreGui"):GetChildren()) do
    if v.Name == "Discord" then
       v:Destroy()
    end
end

eggTable = {}
for _,v in pairs(game:GetService("Workspace").Worlds.World1.Lobby["All Eggs"]:GetChildren()) do
    if not table.find(eggTable, v.Name) then
       table.insert(eggTable, v.Name)
    end
end
for _,v in pairs(game:GetService("Workspace").Worlds.World2.Lobby["All Eggs"]:GetChildren()) do
    if not table.find(eggTable, v.Name) then
       table.insert(eggTable, v.Name)
    end
end

local DiscordLib = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/discord%20lib.txt")()
local win = DiscordLib:Window(game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name)

local serv = win:Server("gui", "")

local auf = serv:Channel("Farm")

local selectedworld
local drop1 = auf:Dropdown("Pick a World", {"World1", "World2"}, function(v)
print(v)
selectedworld = v
end)

auf:Toggle("Auto-Farm",false, function(state)
getgenv().autof3 = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().autof3 == true then
        for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.UI.HUD.TopHolder.WAVEANDENEMY:GetChildren()) do
            if v.Visible == false then
                game.Players.LocalPlayer.Character.Humanoid:MoveTo(game:GetService("Workspace").Worlds[selectedworld].StartWavePart.Position)
            else
                TP()
                KILL()
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
getgenv().autobe = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().autobe == true then
local args = {
    [1] = selectedegg,
    [2] = 1
}

game:GetService("ReplicatedStorage").Remotes.PurchaseEgg:InvokeServer(unpack(args))
    end
end)
end)

egg:Toggle("Auto-Equip Best",false, function(state)
getgenv().autoeb = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().autoeb == true then
local args = {
    [1] = "SWORD_EQUIP_BEST"
}

game:GetService("ReplicatedStorage").Actions.Action:FireServer(unpack(args))
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