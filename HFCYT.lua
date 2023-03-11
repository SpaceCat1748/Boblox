

for i,v in pairs(game:GetService("CoreGui"):GetChildren()) do
    if v.Name == "Discord" then
       v:Destroy()
    end
end

eggTable = {}
for _,v in pairs(game:GetService("Workspace").EggMachines:GetChildren()) do
    if not table.find(eggTable, v.Name) then
       table.insert(eggTable, v.Name)
    end
end



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


auf:Toggle("Auto-Throw",false, function(state)
getgenv().at = state

while wait() do
    if getgenv().at == true then
        game:GetService("ReplicatedStorage").Remotes.AttemptThrow:InvokeServer()
    end
end
end)

local bruh = auf:Dropdown("Pick Strength", {"1", "100", "1000", "100000"}, function(v)
    print(v)
    getgenv().strength = v
end)


auf:Toggle("Auto-Buy Strength",false, function(state)
getgenv().abs = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().abs == true then
        local args = {
            [1] = tonumber(getgenv().strength)
        }

        game:GetService("ReplicatedStorage").Remotes.BuyStrength:FireServer(unpack(args))
    end
end)
end)

auf:Toggle("Auto-Rebirth",false, function(state)
getgenv().ar = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().ar == true then
        game:GetService("ReplicatedStorage").Remotes.RebirthRequest:InvokeServer()
    end
end)
end)

auf:Toggle("Auto-Collect Coins",false, function(state)
getgenv().acc = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().acc == true then
        for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
            if v.Name == "Coin" then
                if v.Transparency == 0 then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                else
                    v:Destroy()
                end
            end
        end
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
getgenv().buy2 = state

while wait() do
    if getgenv().buy2 == true then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").EggMachines[selectedegg].Interaction.CFrame
        game:GetService("VirtualInputManager"):SendKeyEvent(true,Enum.KeyCode.E,false,game)
        game:GetService("VirtualInputManager"):SendKeyEvent(false,Enum.KeyCode.E,false,game)
    end
end
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

msc:Button("God Mode", function()
while wait() do
local args = {
    [1] = 100
}

game:GetService("ReplicatedStorage").Remote.Event.Up["[C-S]TryRegen"]:FireServer(unpack(args))
end
end)