for i,v in pairs(game:GetService("CoreGui"):GetChildren()) do
    if v.Name == "Discord" then
       v:Destroy()
    end
end

capsuleTable = {}
for _,v in pairs(game:GetService("Workspace")["__MAP"].Capsules:GetChildren()) do
    if not table.find(capsuleTable, v.Name) then
        table.insert(capsuleTable, v.Name)
    end
end

local argsv3 = {
                [1] = "SelectMultiplePets"
            }

            game:GetService("ReplicatedStorage").Assets.Network.ToggleSetting:FireServer(unpack(argsv3))

local function getNearest()
    local Closest, Distance = nil, 99999
    for _, v in pairs(game:GetService("Workspace")["__THINGS"].Enemies:GetChildren()) do
              if v:FindFirstChild("Head") then
                local Mag = (game:GetService("Players").LocalPlayer.Character.Head.Position - v.Head.Position).magnitude
                    if Mag < Distance then
                        Distance = Mag
                        Closest = v
                end
            end
        end
    return Closest
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

auf:Toggle("Auto-Farm Nearest",false, function(state)
getgenv().Nearest = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().Nearest == true then
            player.Character.HumanoidRootPart.CFrame = getNearest().HumanoidRootPart.CFrame
            for i,v in pairs(game:GetService("Workspace")["__THINGS"].Pets:GetChildren()) do
                if v:GetAttribute("Owner") == game.Players.LocalPlayer.Name then
                    local args = {
                        [1] = getNearest().Name,
                        [2] = {
                                [1] = v.Name
                        }
                    }

                    game:GetService("ReplicatedStorage").Assets.Network.SelectNpc:InvokeServer(unpack(args))
                    local args = {
                        [1] = v.Name,
                        [2] = getNearest().Name
                    }

                    game:GetService("ReplicatedStorage").Assets.Network.FarmNpc:FireServer(unpack(args))
                end
            end
        end
    end)
end)

auf:Toggle("Auto-Buy Rank", false, function(state)
getgenv().Rank = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().Rank == true then
        game:GetService("ReplicatedStorage").Assets.Network.BuyRank:FireServer()
    end
end)
end)

auf:Toggle("Auto-Claim Achievements", false, function(state)
getgenv().Claim = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().Claim == true then
        for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.AchievementsUI.Frame.ScrollingFrame.Frame:GetChildren()) do
            if v.ClassName == "Frame" then
                local argsv2 = {
                    [1] = v.Name
                }

                game:GetService("ReplicatedStorage").Assets.Network.ClaimAchievementReward:FireServer(unpack(argsv2))
            end
        end
    end
end)
end)


local Capsules = serv:Channel("Capsules")

local selectedegg
local drop = Capsules:Dropdown("Pick Capsule", capsuleTable, function(v)
print(v)
selectedegg = v
end)

Capsules:Toggle("Auto-Buy Capsule", false, function(state)
getgenv().buy = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().buy == true then
        local args = {
            [1] = selectedegg,
            [2] = false
        }

        game:GetService("ReplicatedStorage").Assets.Network.OpenCapsule:InvokeServer(unpack(args))
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
