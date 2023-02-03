for i,v in pairs(game:GetService("CoreGui"):GetChildren()) do
    if v.Name == "Discord" then
       v:Destroy()
    end
end

function Owner()
    for i,v in pairs(game:GetService("Workspace").Plots:GetChildren()) do   
        if v.Owner.Value == game.Players.LocalPlayer then
            return v
        end
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

auf:Button("Claim Plot", function()
function Nobody()
for i,v in pairs(game:GetService("Workspace").Plots:GetChildren()) do
        if v.Name ~= Owner() then 
            if v.Owner.Value == nil then
                local CFrameEnd = CFrame.new(v.Mailbox.Main.Position)
                local Time = 5
                local tween =  game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(Time), {CFrame = CFrameEnd})
                tween:Play()
                wait(6)
                local args = {
                    [1] = v
                }

                game:GetService("ReplicatedStorage").Events.ClaimPlot:InvokeServer(unpack(args))
            end
        end
    end
end

Nobody()
end)

auf:Button("TP to Plot", function()
local CFrameEnd = CFrame.new(Owner().Mailbox.Main.Position)
                local Time = 10
                local tween =  game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(Time), {CFrame = CFrameEnd})
                tween:Play()
end)



auf:Toggle("Auto-Buy Buttons",false, function(state)
getgenv().buy = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().buy == true then
            for i,v in pairs(Owner().Tycoon.Buttons:GetDescendants()) do 
                if v.Name == "TouchInterest" then
firetouchinterest(player.Character.HumanoidRootPart, v.Parent, 0)
                   firetouchinterest(player.Character.HumanoidRootPart, v.Parent, 1)
                end
            end
        end
    end)
end)

local selected
local drop = auf:Dropdown("Pick Item for farm", {"Basic", "Gem"}, function(v)
print(v)
selected = v
end)

auf:Toggle("Auto-Claim Crates", false, function(state)
getgenv().Claimcr = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().Claimcr == true then
        for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
            if v.ClassName == "Part" then
                if v.Name == selected then
                    local CFrameEnd = CFrame.new(v.Position)
                    local Time = 3
                    local tween =  game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(Time), {CFrame = CFrameEnd})
                    tween:Play()
                end
            end
        end
    end
end)
end)

local args = {
            [1] = CFrame.new(getNearest().Character.HumanoidRootPart.Position, getNearest().Character.HumanoidRootPart.Position)
        }

        game:GetService("ReplicatedStorage").Events.Use_Spell:FireServer(unpack(args))
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
