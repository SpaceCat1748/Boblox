local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

for i,v in pairs(game:GetService("CoreGui"):GetChildren()) do
    if v.Name == "Discord" then
       v:Destroy()
    end
end

local function getNearest()
    local Closest, Distance = nil, math.huge
    for _, v in pairs(game:GetService("Workspace").NPC:GetChildren()) do
        for i,l in pairs(v:GetChildren()) do
            if l.ClassName == "Model" then
                    local Mag = (game:GetService("Players").LocalPlayer.Character.Head.Position - l.Head.Position).magnitude
                        if Mag < Distance then
                            Distance = Mag
                            Closest = v.Name
                        end
                    end
                end
            end
    return Closest
end

local function getName()
    local Closest, Distance = nil, math.huge
    for _, v in pairs(game:GetService("Workspace").NPC:GetChildren()) do
        for i,l in pairs(v:GetChildren()) do
            if l.ClassName == "Model" then
                    local Mag = (game:GetService("Players").LocalPlayer.Character.Head.Position - l.Head.Position).magnitude
                        if Mag < Distance then
                            Distance = Mag
                            Closest = l.Name
                        end
                    end
                end
            end
    return Closest
end

local function getNea()
    local Closest, Distance = nil, math.huge
    for _, v in pairs(game:GetService("Workspace").NPC:GetChildren()) do
        for i,l in pairs(v:GetChildren()) do
            if l.ClassName == "Model" then
                    local Mag = (game:GetService("Players").LocalPlayer.Character.Head.Position - l.Head.Position).magnitude
                        if Mag < Distance then
                            Distance = Mag
                            Closest = l
                        end
                    end
                end
            end
    return Closest
end

eggTable = {}
for _,v in pairs(game:GetService("Workspace").Eggs:GetChildren()) do
    if not table.find(eggTable, v.Name) then
       table.insert(eggTable, v.Name)
    end
end


local DiscordLib = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/discord%20lib.txt")()
local win = DiscordLib:Window(game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name)

local serv = win:Server("gui", "")

local auf = serv:Channel("Farm")

auf:Toggle("Auto-Farm NPC",false, function(state)
getgenv().autokill = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().autokill == true then
           if getNea().Head.AttachTag.EnemyTag.HP.Text > "0" then
    game.Players.LocalPlayer.Character.Humanoid:MoveTo(getNea().Head.Position)
end
            local args = {
                    [1] = getNearest(),
                    [2] = getName()
                }

                game:GetService("ReplicatedStorage").Network.Punch:FireServer(unpack(args))
               
    end
end)
end)

auf:Toggle("Auto-Prestige",false, function(state)
getgenv().autopr = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().autopr == true then
        game:GetService("ReplicatedStorage").Network.Prestige:FireServer()
    end
end)
end)

auf:Toggle("Auto-Collect Drop",false, function(state)
getgenv().autocoll = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().autocoll == true then
           for i,v in pairs(game:GetService("Workspace").Interaction.Coins:GetChildren()) do
    if v.ClassName == "Part" then
        v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    end
end
for i,v in pairs(game:GetService("Workspace").Interaction.Gems:GetChildren()) do
    if v.ClassName == "Part" then
        v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    end
end
for i,v in pairs(game:GetService("Workspace").Interaction.BrickCoins:GetChildren()) do
    if v.ClassName == "Part" then
        v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    end
end
    end
end)
end)


local ab = serv:Channel("Eggs")

local selectedegg
local drop = ab:Dropdown("Pick Egg", eggTable, function(v)
print(v)
selectedegg = v
end)


ab:Toggle("Auto-Buy Egg",false, function(state)
getgenv().autobuyv1 = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().autobuyv1 == true then
    for i,v in pairs(game.Workspace.Eggs:GetChildren()) do
        if v.Name == selectedegg then
           local CFrameEnd = CFrame.new(v.key.Position)
            local Time = 3
            local tween =  game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(Time), {CFrame = CFrameEnd})
            tween:Play()
        end
    end
local args = {
    [1] = selectedegg,
    [2] = "Single"
}

game:GetService("ReplicatedStorage").Network.OpenEgg:InvokeServer(unpack(args))       
    end
end)
end)

ab:Toggle("Auto-Best Glove",false, function(state)
getgenv().autobg = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().autobg == true then
        game:GetService("ReplicatedStorage").Network.EquipBestGlove:FireServer()
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

