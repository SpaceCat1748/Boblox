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


auf:Toggle("Auto-Farm",false, function(state)
getgenv().farm = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().farm == true then
        game:GetService("Players").LocalPlayer.IsInGame.Value = true
        local Event = game:GetService("ReplicatedStorage").Remotes.Click
        Event:FireServer()
    elseif getgenv().farm == false then
        game:GetService("Players").LocalPlayer.IsInGame.Value = false
    end
end)
end)

auf:Toggle("Auto-Farm without join in race",false, function(state)
getgenv().farmv2 = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().farmv2 == true then
        local Event = game:GetService("ReplicatedStorage").Remotes.Click
        Event:FireServer()
    end
end)
end)


auf:Toggle("Auto-Rebirth",false, function(state)
getgenv().rebirth = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().rebirth == true then
        game:GetService("ReplicatedStorage").Remotes.Rebirth:FireServer()
    end
end)
end)


local egg = serv:Channel("Egg")

eggTable = {}
for _,v in pairs(game:GetService("Workspace").Prompts.PetPrompts:GetChildren()) do
    if not table.find(eggTable, v.Name) then
       table.insert(eggTable, v.Name)
    end
end


local selectedegg
local drop = egg:Dropdown("Pick Egg", eggTable, function(v)
print(v)
selectedegg = v
end)

egg:Toggle("Auto-Buy Egg",false, function(state)
getgenv().egg = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().egg == true then
        local A_1 = selectedegg
        local A_2 = 1
        local A_3 = 
        {
        }
        local Event = game:GetService("ReplicatedStorage").Remotes.Hatcher.HatchPet
        Event:InvokeServer(A_1, A_2, A_3)
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