for i,v in pairs(game:GetService("CoreGui"):GetChildren()) do
    if v.Name == "Discord" then
       v:Destroy()
    end
end

eggTable = {}
for _,v in pairs(game:GetService("ReplicatedStorage").Eggs:GetChildren()) do
    if not table.find(eggTable, v.Name) then
       table.insert(eggTable, v.Name)
    end
end

local ok = {"Moving", "Tween", "TP"}

local function getNearest()
    local Closest, Distance = nil, 99999
    for _, v in pairs(game:GetService("Workspace").ClientEnemies:GetChildren()) do
              if v:FindFirstChild("Head") then
                local Mag = (game:GetService("Players").LocalPlayer.Character.Head.Position - v.Head.Position).magnitude
                    if Mag < Distance then
                        Distance = Mag
                        Closest = v
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

auf:Toggle("Auto-Farm Nearest",false, function(state)
getgenv().afarm = state

while wait() do
    if getgenv().afarm == true then
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

auf:Toggle("Auto-Attack(shitty)", false, function(state)
getgenv().atckv3 = state

while wait() do
    if getgenv().atckv3 == true then
       for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
    if v.Name == getNearest().Name then
        if v:GetAttribute("Warriors") == 0 then
local args = {
    [1] = {
        [1] = {
            [1] = "%",
            [2] = getNearest().Name
        }
    }
}

game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))
           else
                print("Bruh")
        end
        end
        end
    end
end
end)

auf:Toggle("Auto-Click", false, function(state)
getgenv().click = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().click == true then
local args = {
    [1] = {
        [1] = {
            [1] = "&"
        }
    }
}

game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))
    end
end)
end)

auf:Toggle("Auto-Collect Drop(shitty works)", false, function(state)
getgenv().collectv2 = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().collectv2 == true then
        for i,v in pairs(game:GetService("Workspace").Drops:GetChildren()) do
            if v.ClassName == "Part" then
                v.CFrame = game.Players.LocalPlayer.Character.Head.CFrame
            end
        end
    end
end)
end)

auf:Toggle("Auto-Achievements", false, function(state)
getgenv().ach = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().ach == true then
        for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Frames.Achievements.Frame.Container:GetChildren()) do
    if v.ClassName == "Frame" then
local args = {
    [1] = {
        [1] = {
            [1] = ">",
            [2] = v.Name
        }
    }
}

game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))
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
getgenv().buy2 = state

while wait() do
    if getgenv().buy2 == true then
       for i,v in pairs(game:GetService("ReplicatedStorage").Eggs:GetChildren()) do
           if v.Name == selectedegg then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v:FindFirstChildOfClass("MeshPart").CFrame
           end
       end
local args = {
    [1] = selectedegg,
    [3] = false
}

game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.EggService.RF.Open:InvokeServer(unpack(args))
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
