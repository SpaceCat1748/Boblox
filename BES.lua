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

local auf = serv:Channel("farm")

auf:Toggle("Auto-Place Block",false, function(state)
getgenv().apb = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().apb == true then
        local Event = game:GetService("ReplicatedStorage").Remotes.PlaceBlock
        Event:FireServer()
    end
end)
end)

auf:Toggle("Auto-Rebirth",false, function(state)
getgenv().ar = state

while wait() do
    if getgenv().ar == true then
        local A_1 = "RebirthShop"
        local Event = game:GetService("ReplicatedStorage").Remotes.Rebirth
        Event:InvokeServer(A_1)
    end
end
end)

auf:Toggle("Auto-Upgrade Tower",false, function(state)
getgenv().aut = state

while wait() do
    if getgenv().aut == true then
        for i = 1, 15 do
            local A_1 = i
            local Event = game:GetService("ReplicatedStorage").Remotes.PurchaseTower
            Event:InvokeServer(A_1)
        end
    end
end
end)

local egg = serv:Channel("Eggs and Pets")

eggTable = {}
for _,v in pairs(game:GetService("Workspace").Eggs:GetChildren()) do
   if not table.find(eggTable, v.Name) then
       table.insert(eggTable, v.Name)
   end
end

local selectedegg
local drop = egg:Dropdown("Pick Egg", eggTable, function(v)
print(v)
selectedegg = v
end)

egg:Toggle("Auto-Buy 1 Egg",false, function(state)
getgenv().ab1e = state

while wait() do
    if getgenv().ab1e == true then
        player.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Eggs[selectedegg].Spark.CFrame * CFrame.new(-5,0,0)
        local A_1 = selectedegg
        local A_2 = "Single"
        local Event = game:GetService("ReplicatedStorage").RemoteEvents.EggOpen
        Event:InvokeServer(A_1, A_2)
    end
end
end)

egg:Toggle("Auto-Equip Best",false, function(state)
getgenv().aqb = state

while wait() do
    if getgenv().aqb == true then
        local A_1 = "Equip Best"
        local Event = game:GetService("ReplicatedStorage").RemoteEvents.PetActionRequest
        Event:InvokeServer(A_1)
    end
end
end)

egg:Toggle("Auto-Craft",false, function(state)
getgenv().ac = state

while wait() do
    if getgenv().ac == true then
        for i,v in pairs(game:GetService("Players").LocalPlayer.Pets:GetChildren()) do
            if v:FindFirstChild("PetID") then
                local A_1 = "Craft"
                local A_2 = 
                {
                    ["PetID"] = v.PetID.Value
                }
                local Event = game:GetService("ReplicatedStorage").RemoteEvents.PetActionRequest
                Event:InvokeServer(A_1, A_2)
            end
        end
    end
end
end)

local msc = serv:Channel("Misc")

mscaa:Button("Infinity Jumps", function()
local InfiniteJumpEnabled = true
game:GetService("UserInputService").JumpRequest:connect(function()
	if InfiniteJumpEnabled then
		player.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
	end
end)
end)