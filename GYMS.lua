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

auf:Button("Give Gamepasses", function()
for i,v in pairs(game:GetService("Players").LocalPlayer.Gamepasses:GetChildren()) do
    if v.ClassName == "BoolValue" then
        v.Value = true
    end
end
game.Players.LocalPlayer.Character.Humanoid.Health = 0
end)

auf:Toggle("Auto-Weight",false, function(state)
getgenv().aw2 = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().aw2 == true then
        local args = {
            [1] = "ToolUse",
            [2] = "Weight"
        }

         game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(unpack(args))
    end
    end)
end)


auf:Toggle("Auto-Rebirth",false, function(state)
getgenv().aRebirth = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().aRebirth == true then
        local args = {
            [1] = "Rebirth"
        }

        game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(unpack(args))
    end
    end)
end)

local msc = serv:Channel("Misc")

msc:Textbox("WalkSpeed", "Type here!", true, function(v)
getgenv().walk = v

game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = getgenv().walk
end)

msc:Toggle("Toggle WalkSpeed",false, function(state)
getgenv().walk4 = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().walk4 == true then
        game:GetService("Players").LocalPlayer.Data.WalkSpeed.Value = getgenv().walk
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = getgenv().walk
    elseif getgenv().walk4 == false then
        game:GetService("Players").LocalPlayer.Data.WalkSpeed.Value = 16
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
    end
end)
end)



msc:Button("Infinity Jumps", function()
local InfiniteJumpEnabled = true
game:GetService("Players").LocalPlayer.PlayerScripts.ClientManager.Modules.AntiMultiJump:Remove()
game:GetService("UserInputService").JumpRequest:connect(function()
	if InfiniteJumpEnabled then
		player.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
	end
end)
end)
