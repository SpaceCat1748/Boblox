local GetName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)

local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

function Owner()
    for i,v in pairs(game:GetService("Workspace").Tycoons:GetChildren()) do
        if v.Values.Owner.Value == game.Players.LocalPlayer then   
           return v
        end
    end
end

local player = game.Players.LocalPlayer

local DiscordLib = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/discord%20lib.txt")()

local win = DiscordLib:Window(GetName.Name)

local serv = win:Server("gui", "")

local auf = serv:Channel("farm")


auf:Button("inf money(you need droper)", function()
local money = {Name="Dropper1";Class={Upgrade={Value=999999999999}}}

for i,v in pairs(Owner().Drops:GetChildren()) do
    if v.ClassName == "MeshPart" then
       game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Upgrade"):FireServer(money, v.Name)
    end
end
end)

auf:Toggle("Auto-Buy Buttons",false, function(state)
getgenv().ab = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().ab == true then
        for i,v in pairs(Owner().Buttons:GetDescendants()) do
            if v.Name == "TouchInterest" then
                firetouchinterest(player.Character.HumanoidRootPart, v.Parent, 0)
                firetouchinterest(player.Character.HumanoidRootPart, v.Parent, 1)
            end
        end
    end
end)
end)

auf:Toggle("Auto-Collect Money",false, function(state)
getgenv().ab = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().ab == true then
        for i,v in pairs(Owner().Important.CashCollect:GetDescendants()) do
            if v.Name == "TouchInterest" then
                firetouchinterest(player.Character.HumanoidRootPart, v.Parent, 0)
                firetouchinterest(player.Character.HumanoidRootPart, v.Parent, 1)
            end
        end
    end
end)
end)


local msc = serv:Channel("Misc")


msc:Textbox("WalkSpeed", "Type here!", true, function(v)
     game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
end)


msc:Button("Infinity Jumps", function()
local InfiniteJumpEnabled = true
game:GetService("UserInputService").JumpRequest:connect(function()
	if InfiniteJumpEnabled then
		player.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
	end
end)
end)
