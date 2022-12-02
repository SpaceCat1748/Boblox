local GetName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)

local function Notif(title, text, dur)
local CoreGui = game:GetService("StarterGui")
        CoreGui:SetCore("SendNotification", {
        Title = title;
        Text = text;
        Duration = dur
        })
end

local function getNearest()
    local Closest, Distance = nil, 99999
    for _, v in pairs(game:GetService("Workspace").Live.NPCs.Client:GetChildren()) do
        for i,l in pairs(v:GetChildren()) do
              if l:FindFirstChild("Head") then
                local Mag = (game:GetService("Players").LocalPlayer.Character.Head.Position - v.Head.Position).magnitude
                if Mag < Distance then
                Distance = Mag
                Closest = v
            end
        end
    end
    end
    return Closest
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

tgls:Button("Verify Twitter", function()
local A_1 = "petsimulatorx"
local Event = game:GetService("ReplicatedStorage").Packages.Knit.Services.TwitterVerifyService.RF.Verify
Event:InvokeServer(A_1)
end)

tgls:Toggle("Auto-Farm Nearest",false, function(state)
getgenv().af = state

while wait() do 
    if getgenv().af == true then
        player.Character.Humanoid:MoveTo(getNearest().HumanoidRootPart.Position)
end
end
end)


tgls:Toggle("Auto-Click",false, function(state)
getgenv().ac = state

while ac do 
local Event = game:GetService("ReplicatedStorage").Packages.Knit.Services.ClickService.RF.Click
Event:InvokeServer()
local A_1 = getNearest().Name
local Event = game:GetService("ReplicatedStorage").Packages.Knit.Services.ClickService.RF.Click
Event:InvokeServer(A_1)
wait()
end
end)

local pon = serv:Channel("Upgrades")

areaTable = {}
for _,v in pairs(game:GetService("Workspace").Resources.Teleports:GetChildren()) do
   if not table.find(areaTable, v.Name) then
       table.insert(areaTable, v.Name)
   end
end

local selectedarea
local drop = pon:Dropdown("Pick Area", areaTable, function(v)
print(v)
selectedarea = v
end)

local selectedupg
local drop = pon:Dropdown("Pick Upgrade", {"Crit Multiplier", "More Storage", "WalkSpeed", "Crit Chance", "Power Gain"} , function(v)
print(v)
selectedupg = v
end)

pon:Toggle("Auto-Upgrade",false, function(state)
getgenv().au = state

while au do
   if selectedarea == nil or selectedupg == nil then
        Notif("Warn", "You something not selected", 10)
        getgenv().au = false
        break;
     
   else
        local A_1 = selectedarea
        local A_2 = selectedupg
        local Event = game:GetService("ReplicatedStorage").Packages.Knit.Services.UpgradeService.RF.Upgrade
        Event:InvokeServer(A_1, A_2)
        wait()
        end
    end
end)


local egg = serv:Channel("Eggs")

itemTable = {}
for _,v in pairs(game:GetService("Workspace").Resources.EggStands:GetChildren()) do
   if not table.find(itemTable, v.Name) then
       table.insert(itemTable, v.Name)
   end
end

local selectedegg
local drop = egg:Dropdown("Pick Egg", itemTable, function(v)
print(v)
selectedegg = v
end)


egg:Toggle("Auto-Buy 1 Egg",false, function(state)
getgenv().abe = state

while abe do
    local A_1 = selectedegg
    local A_2 = 1
    local A_3 = false
    local Event = game:GetService("ReplicatedStorage").Packages.Knit.Services.EggService.RF.BuyEgg
    Event:InvokeServer(A_1, A_2, A_3)
    wait()
    end
end)



local textbs = serv:Channel("Misc")

textbs:Textbox("Speed", "Type here!", true, function(v)
while true do
player.Character.Humanoid.WalkSpeed = v
wait()
end
end)

textbs:Button("Infinity Jumps", function()
local InfiniteJumpEnabled = true
game:GetService("UserInputService").JumpRequest:connect(function()
	if InfiniteJumpEnabled then
		game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
	end
end)
end)