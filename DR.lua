for i,v in pairs(game:GetService("CoreGui"):GetChildren()) do
    if v.Name == "Discord" then
       v:Destroy()
    end
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

auf:Toggle("Auto-Click",false, function(state)
getgenv().click = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().click == true then
        for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
            if v.ClassName == "Tool" then
               game:GetService("Players").LocalPlayer.Character.Humanoid:EquipTool(v)
            end
        end
        local A_1 = game:GetService("Workspace")[game.Players.LocalPlayer.Name]:FindFirstChildOfClass("Tool")
        local Event = game:GetService("ReplicatedStorage").Remote.Event.Click["[C-S]PlayerClick"]
        Event:FireServer(A_1)
    end
end)
end)

auf:Toggle("Auto-Rebirth",false, function(state)
getgenv().Rebirth = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().Rebirth == true then
        local Event = game:GetService("ReplicatedStorage").Remote.Event.Rebirth["[C-S]TryBuyRebirth"]
        Event:FireServer()
    end
end)
end)

auf:Button("TP to Finish", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Success.CFrame
end)

eggTable = {}
for _,v in pairs(game:GetService("Workspace").Eggs.Holder:GetChildren()) do
   if not table.find(eggTable, v.Name) then
    table.insert(eggTable, v.Name)
   end
end

local egg = serv:Channel("Egg")

local selectedegg
local drop = egg:Dropdown("Pick Egg", eggTable, function(v)
print(v)
selectedegg = v
end)

egg:Toggle("Auto-Buy Egg",false, function(state)
getgenv().buy = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().buy == true then
local A_1 = selectedegg
local Event = game:GetService("ReplicatedStorage").Remote.Function.Luck["[C-S]DoLuck"]
Event:InvokeServer(A_1)
    end
end)
end)

egg:Toggle("Auto-Equip Best",false, function(state)
getgenv().best = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().best == true then
        local Event = game:GetService("ReplicatedStorage").Remote.Event.Pet["[C-S]TryEquipBest"]
        Event:FireServer()
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
