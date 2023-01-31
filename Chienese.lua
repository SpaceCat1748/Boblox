for i,v in pairs(game:GetService("CoreGui"):GetChildren()) do
    if v.Name == "Discord" then
       v:Destroy()
    end
end

eggTable = {}
for _,v in pairs(game:GetService("Workspace"):GetDescendants()) do
    if v.Name == "EggId" then
        if not table.find(eggTable, v.Value) then
            table.insert(eggTable, v.Value)
        end
   end
end

local ok = {"Moving", "Tween", "TP"}

local function getNearest()
    local Closest, Distance = nil, 99999
    for _, v in pairs(game:GetService("Workspace").Enemy:GetChildren()) do
        for i,l in pairs(v:GetChildren()) do
              if l:FindFirstChild("Head") then
                 if l.HP.Value ~= 0 then
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

auf:Button("Unlock all gamepasses", function()
local pon = require(game:GetService("ReplicatedStorage").Tool.CheckGamePass)

pon.IsPass = function() return true end

game:GetService("Players").LocalPlayer.GamePass.Luck.Value = 1
game:GetService("Players").LocalPlayer.GamePass["Fast-Hatch"].Value = 1
game:GetService("Players").LocalPlayer.GamePass["Super-Luck"].Value = 1
game:GetService("Players").LocalPlayer.GamePass["Triple-Hatch"].Value = 1
game:GetService("Players").LocalPlayer.GamePass["More-Equip"].Value = 1
game:GetService("Players").LocalPlayer.GamePass.VIP.Value = 1
game:GetService("Players").LocalPlayer.GamePass["More-Gold"].Value = 1
game:GetService("Players").LocalPlayer.GamePass["Auto-Click"].Value = 1
game:GetService("Players").LocalPlayer.GamePass["Mount_1"].Value = 1
end)

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

auf:Toggle("Auto-Click", false, function(state)
getgenv().click = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().click == true then
game:GetService("ReplicatedStorage").System.SystemClick.Click:FireServer()
    end
end)
end)

auf:Toggle("Auto-Collect Drops", false, function(state)
getgenv().drop = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().drop == true then
        for i,v in pairs(game.Workspace:GetChildren()) do 
            if v.ClassName == "Part" then
                v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            end
        end
    end
end)
end)

auf:Toggle("Auto-Rebirth", false, function(state)
getgenv().rebirth = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().rebirth == true then
        game:GetService("ReplicatedStorage").Remotes.Rebirth:FireServer()
    end
end)
end)

local egg = serv:Channel("Heroes")

local selectedegg
local drop = egg:Dropdown("Pick Egg", eggTable, function(v)
print(v)
selectedegg = v
end)

egg:Toggle("Auto-Buy Egg", false, function(state)
getgenv().buy = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().buy == true then
        local A_1 = selectedegg
        local A_2 = 1
        local Event = game:GetService("ReplicatedStorage").Tool.DrawUp.Msg.DrawHero
        Event:InvokeServer(A_1, A_2)
    end
end)
end)

egg:Toggle("Auto-Equip Best Hero", false, function(state)
getgenv().Best = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().Best == true then
        local Event = game:GetService("ReplicatedStorage").ServerMsg.WearBestPet
        Event:InvokeServer()
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
