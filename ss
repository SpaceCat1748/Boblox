local GetName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)

local function Notif(title, text, dur)
local CoreGui = game:GetService("StarterGui")
        CoreGui:SetCore("SendNotification", {
        Title = title;
        Text = text;
        Duration = dur
        })
end

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

local tgls = serv:Channel("Auto-Farm")

tgls:Label("Maded with love:SpaceCat1748,special for site scriptrb.com")

tgls:Label("Hello user:"..player.Name)

tgls:Toggle("Auto-Farm Snow",false, function(state)
getgenv().afs = state

while afs do
local A_1 = "Collect"
local A_2 = 
{
	["Tile"] = game:GetService("Workspace").Snow.Field1.SnowTile
}
local Event = game:GetService("ReplicatedStorage").SpecWork.Shared.Network.CollectSnow
Event:FireServer(A_1, A_2)
local A_1 = "Collect"
local A_2 = 
{
	["Tile"] = game:GetService("Workspace").Snow.Field10.SnowTile
}
local Event = game:GetService("ReplicatedStorage").SpecWork.Shared.Network.CollectSnow
Event:FireServer(A_1, A_2)
local A_1 = "Collect"
local A_2 = 
{
	["Tile"] = game:GetService("Workspace").Snow.Field2.SnowTile
}
local Event = game:GetService("ReplicatedStorage").SpecWork.Shared.Network.CollectSnow
Event:FireServer(A_1, A_2)
local A_1 = "Collect"
local A_2 = 
{
	["Tile"] = game:GetService("Workspace").Snow.Field3.SnowTile
}
local Event = game:GetService("ReplicatedStorage").SpecWork.Shared.Network.CollectSnow
Event:FireServer(A_1, A_2)
local A_1 = "Collect"
local A_2 = 
{
	["Tile"] = game:GetService("Workspace").Snow.Field4.SnowTile
}
local Event = game:GetService("ReplicatedStorage").SpecWork.Shared.Network.CollectSnow
Event:FireServer(A_1, A_2)
local A_1 = "Collect"
local A_2 = 
{
	["Tile"] = game:GetService("Workspace").Snow.Field5.SnowTile
}
local Event = game:GetService("ReplicatedStorage").SpecWork.Shared.Network.CollectSnow
Event:FireServer(A_1, A_2)
local A_1 = "Collect"
local A_2 = 
{
	["Tile"] = game:GetService("Workspace").Snow.Field6.SnowTile
}
local Event = game:GetService("ReplicatedStorage").SpecWork.Shared.Network.CollectSnow
Event:FireServer(A_1, A_2)
local A_1 = "Collect"
local A_2 = 
{
	["Tile"] = game:GetService("Workspace").Snow.Field7.SnowTile
}
local Event = game:GetService("ReplicatedStorage").SpecWork.Shared.Network.CollectSnow
Event:FireServer(A_1, A_2)
local A_1 = "Collect"
local A_2 = 
{
	["Tile"] = game:GetService("Workspace").Snow.Field1.SnowTile
}
local Event = game:GetService("ReplicatedStorage").SpecWork.Shared.Network.CollectSnow
Event:FireServer(A_1, A_2)
local A_1 = "Collect"
local A_2 = 
{
	["Tile"] = game:GetService("Workspace").Snow.Field8.SnowTile
}
local Event = game:GetService("ReplicatedStorage").SpecWork.Shared.Network.CollectSnow
Event:FireServer(A_1, A_2)
local A_1 = "Collect"
local A_2 = 
{
	["Tile"] = game:GetService("Workspace").Snow.Field1.SnowTile
}
local Event = game:GetService("ReplicatedStorage").SpecWork.Shared.Network.CollectSnow
Event:FireServer(A_1, A_2)
local A_1 = "Collect"
local A_2 = 
{
	["Tile"] = game:GetService("Workspace").Snow.Field9.SnowTile
}
local Event = game:GetService("ReplicatedStorage").SpecWork.Shared.Network.CollectSnow
Event:FireServer(A_1, A_2)
    wait()
    end
end)

tgls:Toggle("Semi-Farm v2",false, function(state)
    getgenv().as = state

Notif("lol", "it's not auto farm but better than v1", 10)    

while wait() do
    if getgenv().as == true then
        local A_1 = "Collect"
        local A_2 = 
        {
	        ["Tile"] = game:GetService("Workspace").Snow.Field10.SnowTile
        }
        local Event = game:GetService("ReplicatedStorage").SpecWork.Shared.Network.CollectSnow
        Event:FireServer(A_1, A_2)
        local RootPart = game.Players.LocalPlayer.Character.HumanoidRootPart

        game.Workspace.Camera.CFrame = RootPart.CFrame * CFrame.Angles(0,math.rad(90) ,0)
        wait(1)
        game:GetService('VirtualInputManager'):SendKeyEvent(true,'W',false,uwu)
    elseif getgenv().as == false then
        getgenv().as = false
        break;
    end
end
end)

tgls:Button("Find Gummies", function()
        for i,v in pairs(game:GetService("Workspace").Gummies:GetChildren()) do
            if v.ClassName == 'Model' then
                local A_1 = "Found"
                local A_2 = 
                {
                    ["ID"] = v.Name
                }
                local Event = game:GetService("ReplicatedStorage").SpecWork.Shared.Network.Gummies
                Event:FireServer(A_1, A_2)
            end
        end
end)

eggsTable = {}
for _,v in pairs(game:GetService("ReplicatedStorage").Eggs:GetChildren()) do
   if not table.find(eggsTable, v.Name) then
       table.insert(eggsTable, v.Name)
   end
end


tgls:Toggle("Auto-Sell",false, function(state)
    getgenv().as = state
    
while wait() do
    if getgenv().as == true then
        local A_1 = "SellSnow"
        local A_2 = 
        {
	        ["Amount"] = game:GetService("Players").LocalPlayer.leaderstats.Snow.Value
        }
        local Event = game:GetService("ReplicatedStorage").SpecWork.Shared.Network.Shop
        Event:InvokeServer(A_1, A_2)
    elseif getgenv().as == false then
        getgenv().as = false
        break;
    end
end
end)

tgls:Toggle("Auto-Sell when full",false, function(state)
    getgenv().aswf = state
    
while aswf do
        local ok = game:GetService("Players").LocalPlayer.PlayerGui.MainUI.SnowBar.Main.Amount.Text
        local pon = ok:gsub("%d+/", "")
 
        if game:GetService("Players").LocalPlayer.leaderstats.Snow.Value == tonumber(pon) then
            local A_1 = "SellSnow"
            local A_2 = 
            {
              ["Amount"] = game:GetService("Players").LocalPlayer.leaderstats.Snow.Value
            }
            local Event = game:GetService("ReplicatedStorage").SpecWork.Shared.Network.Shop
            Event:InvokeServer(A_1, A_2)
        end
        wait()
end
end)


local function boots()
    for i,v in pairs(game:GetService("ReplicatedStorage").Accessories.Boots:GetChildren()) do
        if v.ClassName == "Accessory" then
            local A_1 = "Item"
            local A_2 = 
            {
                ["ID"] = v.Name, 
                ["Action"] = "Buy", 
                ["ItemType"] = "Boots"
            }
            local Event = game:GetService("ReplicatedStorage").SpecWork.Shared.Network.Shop
            Event:InvokeServer(A_1, A_2)
        end
    end
end

local function shovels()
    for i,v in pairs(game:GetService("ReplicatedStorage").Accessories.Shovels:GetChildren()) do
        if v.ClassName == "Accessory" then
            local A_1 = "Item"
            local A_2 = 
            {
                ["ID"] = v.Name, 
                ["Action"] = "Buy", 
                ["ItemType"] = "Shovels"
            }
            local Event = game:GetService("ReplicatedStorage").SpecWork.Shared.Network.Shop
            Event:InvokeServer(A_1, A_2)
        end
    end
end

local function gloves()
    for i,v in pairs(game:GetService("ReplicatedStorage").Accessories.Gloves:GetChildren()) do
        if v.ClassName == "Accessory" then
            local A_1 = "Item"
            local A_2 = 
            {
                ["ID"] = v.Name, 
                ["Action"] = "Buy", 
                ["ItemType"] = "Gloves"
            }
            local Event = game:GetService("ReplicatedStorage").SpecWork.Shared.Network.Shop
            Event:InvokeServer(A_1, A_2)
        end
    end
end

local ab = serv:Channel("Shop")

ab:Toggle("Auto-Buy Gloves",false, function(state)
    getgenv().aq = state
    
while wait() do
    if getgenv().aq == true then
        gloves()
    end
end
end)

ab:Toggle("Auto-Buy Shovels",false, function(state)
    getgenv().aq = state
    
while wait() do
    if getgenv().aq == true then
        shovels()
    end
end
end)

ab:Toggle("Auto-Buy Boots",false, function(state)
    getgenv().aq = state
    
while wait() do
    if getgenv().aq == true then
        boots()
    end
end
end)

local Quest = serv:Channel("Quest")

Quest:Toggle("Auto-Quest",false, function(state)
    getgenv().aq = state
    
while wait() do
    if getgenv().aq == true then
        for i = 1, 8 do
            local A_1 = "StartQuest"
            local A_2 = 
            {
                ["ID"] = "Quest"..i
             }
            local Event = game:GetService("ReplicatedStorage").SpecWork.Shared.Network.Quests
            Event:FireServer(A_1, A_2)
        end
    end
end
end)

npcTable = {}
for _,v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
   if not table.find(npcTable, v.Name) then
       table.insert(npcTable, v.Name)
   end
end

local selectednpc
local drop = Quest:Dropdown("pick npc to speak", npcTable, function(v)
print(v)
selectednpc = v
end)

Quest:Button("speak with npc", function()
for i,v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
    if v:FindFirstChild('ProximityPrompt') then
        if v.Name == selectednpc then
      fireproximityprompt(v.ProximityPrompt)
    end
    end
end
end)

local pets = serv:Channel("Eggs")

local selectedegg
local drop = pets:Dropdown("pick egg", eggsTable, function(v)
print(v)
selectedegg = v
end)

pets:Toggle("Auto-Buy Egg",false, function(state)
    getgenv().abe = state
        
while wait() do
    if getgenv().abe == true then
        local A_1 = "Egg"
        local A_2 = 
        {
	        ["Action"] = "Buy", 
	        ["ID"] = selectedegg
        }
        local Event = game:GetService("ReplicatedStorage").SpecWork.Shared.Network.Shop
        Event:InvokeServer(A_1, A_2)
        end
    end
end)

local tp = serv:Channel("TP")

eggsTable = {}
for _,v in pairs(game:GetService("Workspace")["__Locations"]:GetChildren()) do
   if not table.find(eggsTable, v.Name) then
       table.insert(eggsTable, v.Name)
   end
end

local selectedpon
local drop = tp:Dropdown("pick area to tp", eggsTable, function(v)
print(v)
selectedpon = v
end)

tp:Button("tp", function()
    for i,v in pairs(game:GetService("Workspace")["__Locations"]:GetChildren()) do
        if v.Name == selectedpon then
            player.Character.HumanoidRootPart.CFrame = v.CFrame
        end
    end
end)

local textbs = serv:Channel("Misc")

textbs:Textbox("Speed", "Type here!", true, function(v)
player.Character.Humanoid.WalkSpeed = v
end)

textbs:Button("Infinity Jumps", function()
local InfiniteJumpEnabled = true
game:GetService("UserInputService").JumpRequest:connect(function()
	if InfiniteJumpEnabled then
		game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
	end
end)
end)
