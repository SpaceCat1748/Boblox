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

auf:Toggle("Auto-Farm(equip tool)",false, function(state)
getgenv().af = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().af == true then
local args = {
    [1] = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool")
}

game:GetService("ReplicatedStorage").Remotes.Input:FireServer(unpack(args))
local args = {
    [1] = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool")
}

game:GetService("ReplicatedStorage").Remotes.ToolScale:FireServer(unpack(args))
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

local egg = serv:Channel("Eggs")

local selectedegg
local drop = egg:Dropdown("Pick Egg", eggTable, function(v)
print(v)
selectedegg = v
end)

egg:Toggle("Auto-Buy Egg",false, function(state)
getgenv().buy = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().buy == true then
local args = {
    [1] = selectedegg
}

game:GetService("ReplicatedStorage").Remotes.OpenEgg:InvokeServer(unpack(args))
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