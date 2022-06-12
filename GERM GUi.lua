local DiscordLib = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/discord%20lib.txt")()

local win = DiscordLib:Window("Germ Simulator (in work) | SpaceCat#1748")

local serv = win:Server("it's shit", "")

local guns = serv:Channel("General")

guns:Label("Value")

guns:Toggle("Auto Farm Coin (Laggy)",false, function(state)
    getgenv().coin = state
    
    while coin do
        wait(0.5)
    for i,v in pairs(game:GetService("Workspace").CoinSpawn:GetChildren()) do
    v.CFrame = CFrame.new(game:GetService("Players")["LocalPlayer"].Character["HumanoidRootPart"].Position)
    end
end
end)

guns:Toggle("Auto Farm Coin v2",false, function(state)
    getgenv().coin = state



 while coin do
    for i,v in pairs(game:GetService("Workspace").CoinSpawn:GetDescendants()) do
        if v.Name == "TouchInterest" then
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 0)
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 1)
        end
    end
wait()
end
end)

guns:Toggle("Auto Farm Gems (Laggy)",false, function(state)
    getgenv().gems = state
    
    while gems do
        wait(0.5)
    for i,v in pairs(game:GetService("Workspace").GemSpawn:GetChildren()) do
    v.CFrame = CFrame.new(game:GetService("Players")["LocalPlayer"].Character["HumanoidRootPart"].Position)
    end
end
end)

guns:Toggle("Auto Farm Gems v2",false, function(state)
    getgenv().gemsv2 = state



 while gemsv2 do
    for i,v in pairs(game:GetService("Workspace").GemSpawn:GetDescendants()) do
        if v.Name == "TouchInterest" then
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 0)
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 1)
        end
    end
wait()
end
end)

guns:Toggle("Auto Farm PlayButton (Laggy)",false, function(state)
    getgenv().coin = state
    
    while coin do
    wait(0.5)
    for i,v in pairs(game:GetService("Workspace").PlaySpawn:GetChildren()) do
    v.CFrame = CFrame.new(game:GetService("Players")["LocalPlayer"].Character["HumanoidRootPart"].Position)
    end
end
end)

guns:Toggle("Auto Farm PlayButton v2",false, function(state)
    getgenv().playv2 = state



 while playv2 do
    for i,v in pairs(game:GetService("Workspace").PlaySpawn:GetDescendants()) do
        if v.Name == "TouchInterest" then
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 0)
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 1)
        end
    end
wait()
end
end)



guns:Label("Farm")


guns:Toggle("Auto Farm",false, function(state)
getgenv().farm = state

local human = game.Players.LocalPlayer.Character.HumanoidRootPart

while farm do
for i,v in pairs(game:GetService("Workspace").Mushrooms:GetChildren()) do
    if v.Name == 13 then
human.CFrame = v.CFrame * CFrame.new(0,0,2)
end
wait()
end
end)


guns:Toggle("Auto Sell",false, function(state)
getgenv().sell = state

while sell do
    for i,v in pairs(game:GetService("Workspace").Sales.HitBox:GetDescendants()) do
        if v.Name == "TouchInterest" then
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 0)
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 1)
            wait()
        end
    end
end
end)


guns:Toggle("Auto Attack(Click)",false, function(state)
getgenv().click = state

local vu = game:GetService("VirtualUser")


while click do
for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do 
    if v.ClassName == "Tool" then 
    game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
    end
end
vu:ClickButton1(Vector2.new(125,125))
wait()
end
end)

guns:Toggle("Auto Rebirth",false, function(state)
getgenv().rebirth = state


while rebirth do
local Event = game:GetService("ReplicatedStorage").Remotes.Rebirth
Event:InvokeServer()
wait()
end
end)

local shop = serv:Channel("Gamepasses")

shop:Button("Buy Forbidden Hammer", function()
    local A_1 = "Tool"
local A_2 = 59
local Event = game:GetService("ReplicatedStorage").Remotes.BuyItem
Event:InvokeServer(A_1, A_2)
end)

shop:Button("Buy Infinity Mask", function()
    local A_1 = "Storage"
local A_2 = 29
local Event = game:GetService("ReplicatedStorage").Remotes.BuyItem
Event:InvokeServer(A_1, A_2)
end)

shop:Button("Unlock Teleport", function()
    game:GetService("Players").LocalPlayer.PlayerStats.Teleport.Value = true
end)

shop:Button("Unlock VIP", function()
    game:GetService("Players").LocalPlayer.PlayerStats.VIP.Value = true
end)

shop:Button("Unlock Triple Eggs", function()
    game:GetService("Players").LocalPlayer.PlayerStats.TripleEggs.Value = 1
end)

shop:Button("Unlock Auto Eggs", function()
    game:GetService("Players").LocalPlayer.PlayerStats.AutoEggs.Value = 1
end)

shop:Button("Unlock Triple Crates", function()
game:GetService("Players").LocalPlayer.PlayerStats.TripleCrates.Value = 1
end)

shop:Button("Unlock Auto Crates", function()
game:GetService("Players").LocalPlayer.PlayerStats.AutoCrates.Value = 1
end)

local pets = serv:Channel("Pets and Hats")

pets:Button("Max Equippable Pets", function()
    game:GetService("Players").LocalPlayer.PlayerStats.MaxPets.Value = math.huge 
end)

pets:Button("Max Equippable Hats", function()
    game:GetService("Players").LocalPlayer.PlayerStats.MaxEquippableHats.Value = 999999999 
end)

local eggs = serv:Channel("Eggs and Crates ")

eggsTable = {}
for _,v in pairs(game:GetService("Workspace").Eggs:GetChildren()) do
   if not table.find(eggsTable, v.Name) then
       table.insert(eggsTable, v.Name)
   end
end

cratesTable = {}
for _,v in pairs(game:GetService("Workspace").Crates:GetChildren()) do
   if not table.find(cratesTable, v.Name) then
       table.insert(cratesTable, v.Name)
   end
end

local selectedegg
eggs:Dropdown("Select Egg", eggsTable, function(value)
    print(value)
    selectedegg = value
end)


eggs:Toggle("Auto Buy Eggs",false, function(state)
    getgenv().egg = state

while egg do
local A_1 = selectedegg
local Event = game:GetService("ReplicatedStorage").RemoteEvents.Eclicked
Event:FireServer(A_1)
wait()
end
end)

eggs:Toggle("Auto Buy Tripple Eggs",false, function(state)
    getgenv().egg = state

    game:GetService("Players").LocalPlayer.PlayerStats.TripleEggs.Value = 1

while egg do
local A_1 = selectedegg
local Event = game:GetService("ReplicatedStorage").RemoteEvents.Rclicked
Event:FireServer(A_1)
wait()
end
end)

eggs:Label("Crates")

local selectedcrate
eggs:Dropdown("Select Crate", cratesTable, function(value)
    print(value)
    selectedcrate = value
end)

eggs:Toggle("Auto Buy Crates",false, function(state)
    getgenv().crates = state

while crates do
local A_1 = selectedcrate
local Event = game:GetService("ReplicatedStorage").HatRemoteEvents.HatEclicked
Event:FireServer(A_1)
wait()
end
end)

eggs:Toggle("Auto Buy Tripple Crates",false, function(state)
    getgenv().crates = state

  
while crates do
local A_1 = selectedcrate
local Event = game:GetService("ReplicatedStorage").HatRemoteEvents.HatRclicked
Event:FireServer(A_1)
wait()
end
end)




local misc = serv:Channel("Player")

local speed = misc:Slider("WalkSpeed", 0, 500, 50, function(v)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
end)
    
misc:Button("Normal WalkSpeed", function()
    speed:Change(16)
end)

local tp = serv:Channel("TP")

tp:Button("Sell", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Teleports.Sell.CFrame
end)

tp:Button("VIP", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Teleports.VIP.CFrame
end)

tp:Button("Evil Germ Boss", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-88.9511566, 38.9349022, 196.270309, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247)
end)

tp:Button("Tofuu Boss", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(137.22998046875, 40.476119995117, 31.37243270874)
end)

tp:Button("Farm", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(17.2738647, 38.9348984, -211.278687, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247)
end)

tp:Button("Graveyard", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-21.4427109, 38.9348907, -577.803101, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247)
end)

tp:Button("Enchanted Forest", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-61.1297226, 38.9348907, -860.69342, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247)
end)

tp:Button("Candyland", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(37.1326752, 38.9348869, -1165.72815, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247)
end)

tp:Button("Moon", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(6.74920654, 675.81012, -2531.12524, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247)
end)

tp:Button("Ancient Greece", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(112.458824, 675.81012, -2851.53955, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247)
end)

tp:Button("Omega Farm", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(27.1390572, 675.81012, -3135.37524, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247)
end)

tp:Button("Medieval", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-52.0110092, 675.81012, -3495.60474, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247)
end)

tp:Button("Elven Forest", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-166.802872, 678.892639, -3850.64258, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247)
end)

tp:Button("Wizard World", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2449.00024, 272.708923, -801, 1, 0, 0, 0, 1, 0, 0, 0, 1)
end)

tp:Button("Lotus", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2449.00024, 272.708923, -1056, 1, 0, 0, 0, 1, 0, 0, 0, 1)
end)


local misc = serv:Channel("Misc")

misc:Button("Anti-Afk", function()
 local vu = game:GetService("VirtualUser")
    game:GetService("Players").LocalPlayer.Idled:connect(function()
       vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
       wait(1)
       vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end)
end)

misc:Button("Collect Chest(join in Group)", function()
  for i,v in pairs(game:GetService("Workspace").Rewards:GetDescendants()) do
        if v.Name == "TouchInterest" then
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 0)
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 1)
        end
    end
end)

misc:Button("Insert all codes", function()
local A_1 = "RELEASE"
local Event = game:GetService("ReplicatedStorage").Remotes.InsertCode
Event:InvokeServer(A_1)
wait(0.1)
local A_1 = "UPDATE"
local Event = game:GetService("ReplicatedStorage").Remotes.InsertCode
Event:InvokeServer(A_1)
wait(0.1)
local A_1 = "TOFUUBOSS"
local Event = game:GetService("ReplicatedStorage").Remotes.InsertCode
Event:InvokeServer(A_1)
wait(0.1)
local A_1 = "PETS"
local Event = game:GetService("ReplicatedStorage").Remotes.InsertCode
Event:InvokeServer(A_1)
wait(0.1)
local A_1 = "YOUTUBER"
local Event = game:GetService("ReplicatedStorage").Remotes.InsertCode
Event:InvokeServer(A_1)
wait(0.1)
local A_1 = "HATS"
local Event = game:GetService("ReplicatedStorage").Remotes.InsertCode
Event:InvokeServer(A_1)
wait(0.1)
local A_1 = "WIZARD"
local Event = game:GetService("ReplicatedStorage").Remotes.InsertCode
Event:InvokeServer(A_1)
end)

misc:Button("Delete Doors", function()
   game:GetService("Workspace").Doors:Destroy(v)
   game:GetService("Workspace").PlayDoors:Destroy(v)
   game:GetService("Workspace").GemDoors:Destroy(v)
   game:GetService("Workspace").VIPAccess:Destroy(v)
end)

misc:Button("Delete PopUp (Maybe fix lag)", function()
   game:GetService("Players").LocalPlayer.PlayerGui.AddValuesGui:Destroy(v)
end)

misc:Button("Delete notification Storage Full", function()
   game:GetService("Players").LocalPlayer.PlayerGui.MainGUI.StorageFull:Destroy(v)
end)

misc:Label("GUI")

misc:Button("Shop", function()
    for i,v in pairs(game:GetService("Workspace").Shops.HitBox:GetDescendants()) do
        if v.Name == "TouchInterest" then
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 0)
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 1)
        end
    end
end)
