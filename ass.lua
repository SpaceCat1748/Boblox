for i,v in pairs(game:GetService("CoreGui"):GetChildren()) do
    if v.Name == "Discord" then
       v:Destroy()
    end
end

eggTable = {}
for _,v in pairs(game:GetService("Workspace")["_EGGS"]:GetChildren()) do
    if not table.find(eggTable, v.Name) then
       table.insert(eggTable, v.Name)
    end
end

mobTable = {}
for _,v in pairs(game:GetService("Workspace")["_ENEMIES"]:GetChildren()) do
    for i,l in pairs(v:GetChildren()) do
        if not table.find(mobTable, l.Name) then
            table.insert(mobTable, l.Name)
        end
    end
end

local ok = {"Moving", "Tween", "TP"}

local function getNearest()
    local Closest, Distance = nil, 99999
    for _, v in pairs(game:GetService("Workspace")["_ENEMIES"]:GetChildren()) do
        for i,l in pairs(v:GetChildren()) do
              if l:FindFirstChild("Head") then
                 if l["_stats"]["current_hp"].Value ~= 0 then
                    local Mag = (game:GetService("Players").LocalPlayer.Character.Head.Position - l.Head.Position).magnitude
                        if Mag < Distance then
                            Distance = Mag
                            Closest = l
                end
            end
        end
    end
    end
    return Closest
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

local selectedautofarm
local drop = auf:Dropdown("Pick Way for farm", ok, function(v)
print(v)
selectedautofarm = v
end)

local selectedmob
local drop = auf:Dropdown("Select Mob", mobTable, function(v)
print(v)
selectedmob = v
end)

local function getNearestMob()
    local Closest, Distance = nil, 99999
    for _, v in pairs(game:GetService("Workspace")["_ENEMIES"]:GetChildren()) do
          for i,l in pairs(v:GetChildren()) do
              if l.Name == selectedmob then
                if l["_stats"]["current_hp"].Value ~= 0 then
                    local Mag = (game:GetService("Players").LocalPlayer.Character.Head.Position - l.Head.Position).magnitude
                        if Mag < Distance then
                            Distance = Mag
                            Closest = l
                        end
                    end
                end
            end
        end
    return Closest
end

auf:Toggle("Auto-Farm Mob",false, function(state)
getgenv().Farmmobv1 = state

while wait() do
    if getgenv().Farmmobv1 == true then
        if selectedautofarm == nil then
            Notif("Warn", "You not selected way for Farm", 10)
            getgenv().Farmmobv1 = false
            break;
        elseif selectedautofarm == "Moving" then
            player.Character.Humanoid:MoveTo(getNearestMob().HumanoidRootPart.Position)
        elseif selectedautofarm == "Tween" then
            local CFrameEnd = CFrame.new(getNearestMob().HumanoidRootPart.Position)
            local Time = 1
            local tween =  game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(Time), {CFrame = CFrameEnd})
            tween:Play()
        elseif selectedautofarm == "TP" then
            player.Character.HumanoidRootPart.CFrame = getNearestMob().HumanoidRootPart.CFrame
        elseif getgenv().Farmmobv1 == false then
               getgenv().Farmmobv1 = false
               break;
            end
        end
    end
end)

auf:Label("or")

auf:Toggle("Auto-Farm Nearest",false, function(state)
getgenv().Faarm = state

while wait() do
    if getgenv().Faarm == true then
        if selectedautofarm == nil then
            Notif("Warn", "You not selected way for Farm", 10)
            getgenv().afarm = false
            break;
        elseif selectedautofarm == "Moving" then
            player.Character.Humanoid:MoveTo(getNearest().HumanoidRootPart.Position)
        elseif selectedautofarm == "Tween" then
            local CFrameEnd = CFrame.new(getNearest().HumanoidRootPart.Position)
            local Time = 1
            local tween =  game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(Time), {CFrame = CFrameEnd})
            tween:Play()
        elseif selectedautofarm == "TP" then
            player.Character.HumanoidRootPart.CFrame = getNearest().Head.CFrame * CFrame.new(0, 2, 0)
        elseif getgenv().afarm == false then
               getgenv().afarm = false
               break;
        end
    end
    end
end)

auf:Toggle("Auto-Click",false, function(state)
getgenv().Clickv1 = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().Clickv1 == true then
local args = {
    [1] = {
        [1] = "Hit",
        [2] = getNearest()
    }
}

game:GetService("ReplicatedStorage").Remotes.Server:FireServer(unpack(args))
        end
    end)
end)

auf:Toggle("Auto-Quest",false, function(state)
getgenv().Quest = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().Quest == true then
local args = {
    [1] = {
        [1] = "Quest"
    }
}

game:GetService("ReplicatedStorage").Remotes.Server:FireServer(unpack(args))
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
       game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["_EGGS"][selectedegg].WorldsPad.CFrame
local args = {
    [1] = {
        [1] = "BuyHeroes",
        [2] = selectedegg
    }
}

game:GetService("ReplicatedStorage").Remotes.Server:FireServer(unpack(args))
    end
end
end)

egg:Toggle("Auto-Equip Best", false, function(state)
getgenv().best = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().best == true then
local args = {
    [1] = "EquipBest",
    [2] = {}
}

game:GetService("ReplicatedStorage").GameClient.Events.RemoteFunction.HandlePet:InvokeServer(unpack(args))
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
        game:GetService("Players").LocalPlayer.Speed = getgenv().walk
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
