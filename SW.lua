for i,v in pairs(game:GetService("CoreGui"):GetChildren()) do
    if v.Name == "Discord" then
       v:Destroy()
    end
end

eggTable = {}
for _,v in pairs(game:GetService("ReplicatedStorage").Models.Eggs:GetChildren()) do
    if not table.find(eggTable, v.Name) then
       table.insert(eggTable, v.Name)
    end
end

local function getNearest()
    local Closest, Distance = nil, 99999
    for _, v in pairs(game:GetService("Workspace").Orbs:GetChildren()) do
              if v:FindFirstChild("Main") then
                    local Mag = (game:GetService("Players").LocalPlayer.Character.Head.Position - v.Main.Position).magnitude
                        if Mag < Distance then
                            Distance = Mag
                            Closest = v.Name
        end
    end
    end
    return Closest
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


auf:Toggle("Auto-Farm Race",false, function(state)
getgenv().afr2 = state

while wait() do
    if getgenv().afr2 == true then
        game:GetService("ReplicatedStorage").Remotes.RF_JoinRace:InvokeServer()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Studs.Start.CFrame * CFrame.new(-55,60, 0)
    end
end
end)

auf:Toggle("Auto-Rebirth",false, function(state)
getgenv().Rebirth = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().Rebirth == true then
        game:GetService("ReplicatedStorage").Remotes.RE_Rebirth:FireServer()
    end
end)
end)

auf:Toggle("Kill-Aura Slimes",false, function(state)
getgenv().Drop = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().Drop == true then
               local args = {
    [1] = {
        [1] = getNearest()
    }
}

game:GetService("ReplicatedStorage").Remotes.RE_Swing:FireServer(unpack(args))
-- Script generated by SimpleSpy - fixed version for exploits other than synapse & krnl made by stummy#002 credits to exx#9394 for originally creating the script.

local args = {
    [1] = true,
    [2] = false
}

game:GetService("ReplicatedStorage").Remotes.RE_CreateObrs:FireServer(unpack(args))
    end
end)
end)

auf:Toggle("Auto-Collect Rewards",false, function(state)
getgenv().Collect = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().Collect == true then
    for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.MainUI.UI.CenterMenu.Rewards.Reward.ScrollingFrame.Rewards.List:GetChildren()) do
        if v.ClassName == "TextButton" then
            local args = {
                [1] = v.Name
            }
    
            game:GetService("ReplicatedStorage").Remotes.RE_ClaimReward:FireServer(unpack(args))
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
    [1] = "Hatch",
    [2] = selectedegg,
    [3] = {}
}

game:GetService("ReplicatedStorage").Remotes.RE_Draw:FireServer(unpack(args))
    end
end
end)


egg:Toggle("Auto-Equip Best Pets and Weapons", false, function(state)
getgenv().best = state

while wait() do
    if getgenv().best == true then
-- Script generated by SimpleSpy - fixed version for exploits other than synapse & krnl made by stummy#002 credits to exx#9394 for originally creating the script.
local args = {
    [1] = true
}

game:GetService("ReplicatedStorage").Remotes.RE_EquipBest:FireServer(unpack(args))
-- Script generated by SimpleSpy - fixed version for exploits other than synapse & krnl made by stummy#002 credits to exx#9394 for originally creating the script.

game:GetService("ReplicatedStorage").Remotes.RE_WeaponEquipBest:FireServer()

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