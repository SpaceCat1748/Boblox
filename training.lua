local GetName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)

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

local btns = serv:Channel("Gamepasses")

btns:Button("Give some Gamepasses", function()
for i,v in pairs(game:GetService("ReplicatedStorage").PlayerData[game.Players.LocalPlayer.Name]:GetChildren()) do
    if v.ClassName == "BoolValue" then
        v.Value = true
    end
end
end)

local tgls = serv:Channel("Auto-Farm")

tgls:Label("Maded with love:SpaceCat1748,special for site scriptrb.com")

itemTable = {}
for _,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
   if not table.find(itemTable, v.Name) then
       table.insert(itemTable, v.Name)
   end
end

local selecteditem
local drop = tgls:Dropdown("Pick item for farm", itemTable, function(v)
print(v)
selecteditem = v
end)

tgls:Toggle("Auto-Farm",false, function(state)
getgenv().af = state

while af do 
for i,v in pairs(player.Backpack:GetChildren()) do
    if v.Name == selecteditem then
        player.Character.Humanoid:EquipTool(v)
    end
end
local VirtualUser = game:service'VirtualUser'
VirtualUser:CaptureController()
VirtualUser:ClickButton1(Vector2.new(9e9,9e9))
wait()
end
end)

tgls:Toggle("Auto-Buy Weights",false, function(state)
getgenv().abw = state

while abw do 
local Event = game:GetService("ReplicatedStorage").Remotes.buyWeight
Event:InvokeServer()
wait()
end
end)

tgls:Toggle("Auto-Claim Gifts",false, function(state)
getgenv().acg = state

while acg do 
for i = 1, 12 do 
local A_1 = i
local Event = game:GetService("ReplicatedStorage").Remotes.claimGift
Event:InvokeServer(A_1)
end
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

