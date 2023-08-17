for i,v in pairs(game:GetService("CoreGui"):GetChildren()) do
    if v.Name == "Discord" then
       v:Destroy()
    end
end

repeat wait() until game:IsLoaded() wait()
 
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16

getgenv().walk = game.Players.LocalPlayer.Character.Humanoid.WalkSpeed;

local GetName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)

local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

local player = game.Players.LocalPlayer

if game:IsLoaded() then
    local CoreGui = game:GetService("StarterGui")
    CoreGui:SetCore("SendNotification", {
        Title = "WARNING";
        Text = "Please, wait loading npc";
        Duration = 15
    })

        for d,v in pairs(game.Workspace.BreakableParts:GetChildren()) do
            for r,l in pairs(v:GetChildren()) do
                if not l:FindFirstChild("HumanoidRootPart") then 
                  local location = string.gsub(l.Parent.Name, "Stage", "")
                    repeat wait()
                         player.Character.HumanoidRootPart.CFrame = game.ReplicatedStorage.TeleportLocations[location].CFrame * CFrame.new(0, 20, 0)
                    until l:FindFirstChild("HumanoidRootPart")
                end
             end
        end
wait(5)
        for _,v in pairs(game:GetService("Workspace").Arenas:GetChildren()) do
            for i,l in pairs(v:GetChildren()) do
                for i,b in pairs(game.Workspace.BreakableParts:GetChildren()) do
                    if not l:FindFirstChild("EnemyNamePart") then
                        for i,m in pairs(b:GetChildren()) do
                            if b.Name == l.Parent.Name then
                                if m.Name == l.Name then
                                    repeat wait()
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = m.HumanoidRootPart.CFrame
                                    until l:FindFirstChild("EnemyNamePart")
                                end
                            end
                        end
                    end
                end
            end
        end
end



local VirtualInputManager = game:GetService('VirtualInputManager')


local DiscordLib = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/discord%20lib.txt")()

local win = DiscordLib:Window(GetName.Name)

local serv = win:Server("gui", "")

local f = serv:Channel("farm")

f:Label("Maded by SpaceCat1748, thanks to AceBan for help.")

f:Toggle("Auto-Click", false, function(state)
getgenv().click = state

game:GetService('RunService').RenderStepped:connect(function()
    if getgenv().click == true then
        game:GetService("ReplicatedStorage").Events.DamageIncreaseOnClickEvent:FireServer()
    end
end)
end)

npcTable = {}
for _,v in pairs(game:GetService("Workspace").Arenas:GetChildren()) do
    for i,l in pairs(v:GetChildren()) do
        if not table.find(npcTable, l:WaitForChild("EnemyNamePart").BillboardGui.Frame.EnemyName.Text) then
           table.insert(npcTable, l:WaitForChild("EnemyNamePart").BillboardGui.Frame.EnemyName.Text)
        end
    end
end

local selectednpc
local drop = f:Dropdown("Pick NPC", npcTable, function(v)
print(v)
selectednpc = v
end)

f:Button("Tp to npc", function()
for _,v in pairs(game:GetService("Workspace").Arenas:GetChildren()) do
    for i,l in pairs(v:GetChildren()) do
       for i,b in pairs(game.Workspace.BreakableParts:GetChildren()) do
            if l.EnemyNamePart.BillboardGui.Frame.EnemyName.Text == selectednpc then
		        for i,m in pairs(b:GetChildren()) do
		            if b.Name == l.Parent.Name then
			            if m.Name == l.Name then 
                           player.Character.HumanoidRootPart.CFrame = m.HumanoidRootPart.CFrame
                        end
                    end
                end
            end
        end
    end
end
end)

f:Toggle("Auto-Fight with NPC", false, function(state)
getgenv().fight = state

game:GetService('RunService').RenderStepped:connect(function()
    if getgenv().fight == true then
	    for _,v in pairs(game:GetService("Workspace").Arenas:GetChildren()) do
            for i,l in pairs(v:GetChildren()) do
                 if l.EnemyNamePart.BillboardGui.Frame.EnemyName.Text == selectednpc then
                    local location = string.gsub(l.Parent.Name, "Stage", "")
                    local args = {
                        [1] = "Fight",
                        [2] = tonumber(location),
                        [3] = l.Name
                    }
        
                    game:GetService("ReplicatedStorage").Events.AutoFight:FireServer(unpack(args))
                    for _,v in next, getconnections(game.Players.LocalPlayer.PlayerGui.FightingMainUi.ClickButton.MouseButton1Click) do
                        v:Fire()
                    end
                end
            end
        end
    end
end)
end)

local egg = serv:Channel("Egg")

eggTable = {}
for _,v in pairs(game:GetService("Workspace").EggVendors:GetChildren()) do
    if not table.find(eggTable, v.Name) then
       table.insert(eggTable, v.Name)
    end
end

local selectedegg
local drop = egg:Dropdown("Pick Egg", eggTable, function(v)
print(v)
selectedegg = v
end)

egg:Toggle("Auto-Buy Egg", false, function(state)
getgenv().buy2 = state

for i,v in pairs(game.Workspace.EggVendors:GetChildren()) do
    if v.Name == selectedegg then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.PetsPopup.HitboxPart.CFrame        
    end
end

while wait() do
    if getgenv().buy2 == true then
        for i,v in pairs(game.Workspace.EggVendors:GetChildren()) do
      	    if v.Name == selectedegg then
                game.Players.LocalPlayer.Character.Humanoid:MoveTo(v.PetsPopup.HitboxPart.Position)
		        local A_1 = "1"
		        local Event = game.ReplicatedStorage.Events.PlayerPressedKeyOnEgg
		        Event:FireServer(A_1)
            end
        end
    end
end
end)

local rares = {}
for i,v in pairs(game.Players.LocalPlayer.PlayerGui.PetsIndex.Frame.RarityTemplates:GetChildren()) do
      if v.ClassName == "ImageButton" then
          if not table.find(rares, v.Name) then
                table.insert(rares, v.Name)
         end
     end
end

local tp = serv:Channel("Teleport")

local zn = {}
for i,v in pairs(game.ReplicatedStorage.TeleportLocations:GetChildren()) do
    if not table.find(zn, v.Name) then
       table.insert(zn, v.Name)
     end
end

local selectedzn
local drop = tp:Dropdown("Pick Zone", zn, function(v)
print(v)
selectedzn = v
end)



tp:Button("Tp to zone", function()
for i,v in pairs(game.ReplicatedStorage.TeleportLocations:GetChildren()) do
    if v.Name == selectedzn then
       player.Character.HumanoidRootPart.CFrame = v.CFrame * CFrame.new(0, 40, 0)
   end
end
end)