for i,v in pairs(game:GetService("CoreGui"):GetChildren()) do
    if v.Name == "Discord" then
       v:Destroy()
    end
end

eggTable = {}
for _,v in pairs(game:GetService("Workspace").Eggs:GetChildren()) do
    if not table.find(eggTable, v.Name) then
       table.insert(eggTable, v.Name)
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

auf:Toggle("Auto-Win Race",false, function(state)
getgenv().Win = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().Win == true then
            for i,v in pairs(game:GetService("Workspace").map.winGates:GetChildren()) do
                if v.Name == "LastGate" then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v:FindFirstChildOfClass("Part").CFrame
                end
            end
        end
    end)
end)

auf:Toggle("Auto-Click",false, function(state)
getgenv().Click = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().Click == true then
local args = {
    [1] = "Click"
}

game:GetService("Players").LocalPlayer.PlayerGui.PunchV2.Function:FireServer(unpack(args))
        end
    end)
end)

auf:Toggle("Auto-Rebirth",false, function(state)
getgenv().rebi = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().rebi == true then
       game:GetService("Players").LocalPlayer.PlayerGui.MainUI.RebirthFrame.Visible = false
game:GetService("ReplicatedStorage").GameClient.Events.RemoteEvent.UpdateRebirth:FireServer()
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
getgenv().buy1 = state

while wait() do
    if getgenv().buy1 == true then
       game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Eggs[selectedegg].Builds.Center.CFrame
local args = {
    [1] = selectedegg,
    [2] = "Buy1"
}

game:GetService("ReplicatedStorage").GameClient.Events.RemoteFunction.BuyEgg:InvokeServer(unpack(args))
    end
end
end)

egg:Toggle("Auto-Equip Best", false, function(state)
getgenv().best = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().best == true then
local args = {
    [1] = "EquipBest",
    [2] = {}
}

game:GetService("ReplicatedStorage").GameClient.Events.RemoteFunction.HandlePet:InvokeServer(unpack(args))
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
        game:GetService("Players").LocalPlayer.Speed = getgenv().walk
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
