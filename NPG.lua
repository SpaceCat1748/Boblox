local GetName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)

local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

local player = game.Players.LocalPlayer

local DiscordLib = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/discord%20lib.txt")()

local win = DiscordLib:Window(GetName.Name)

local serv = win:Server("gui", "")

local auf = serv:Channel("Game")

auf:Toggle("Auto-Farm Presents and more",false, function(state)
getgenv().pf = state

while wait() do
    if getgenv().pf == true then
        for i,v in pairs(game:GetService("Workspace")["GAME_MAP"].Spawns.Items:GetChildren()) do
            if v:FindFirstChildOfClass("Model") then
                player.Character.HumanoidRootPart.CFrame = v.CFrame
            end
        end

        for i,v in pairs(game:GetService("Workspace")["GAME_MAP"].Station:GetChildren()) do
            if v.Name == "TouchInterest" then
                firetouchinterest(player.Character.HumanoidRootPart, v.Parent, 0)
                firetouchinterest(player.Character.HumanoidRootPart, v.Parent, 1)
            end
        end
        end
    end
end)

auf:Toggle("Lazy Farm(Faster)",false, function(state)
getgenv().pf = state

while wait() do
    if getgenv().pf == true then
        for i,v in pairs(game:GetService("Workspace")["GAME_MAP"].Spawns.Items:GetDescendants()) do
            if v.Name == "TouchInterest" then
                firetouchinterest(player.Character.HumanoidRootPart, v.Parent, 0)
                firetouchinterest(player.Character.HumanoidRootPart, v.Parent, 1)
            end
        end

        for i,v in pairs(game:GetService("Workspace")["GAME_MAP"].Station:GetChildren()) do
            if v.Name == "TouchInterest" then
                firetouchinterest(player.Character.HumanoidRootPart, v.Parent, 0)
                firetouchinterest(player.Character.HumanoidRootPart, v.Parent, 1)
            end
        end
        end
    end
end)

auf:Button("TP to Finish Obby", function()
player.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["GAME_MAP"].Obby.Finish.CFrame
end)

auf:Textbox("Speed", "Type here!", true, function(v)
player.Character.Humanoid.WalkSpeed = v
end)

auf:Button("Infinity Jumps", function()
local InfiniteJumpEnabled = true
game:GetService("UserInputService").JumpRequest:connect(function()
	if InfiniteJumpEnabled then
		player.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
	end
end)
end)

local pen = serv:Channel("ESP")

pen:Toggle("Mobs ESP",false, function(state)
getgenv().me = state

while wait() do
    if getgenv().me == true then
          for i,v in pairs(game:GetService("Workspace")["GAME_MAP"]:GetChildren()) do
                if v:FindFirstChild("Humanoid") then
                    if not v:FindFirstChild("ESP") then
                        if v ~= player.Character then
                            local esp = Instance.new("BoxHandleAdornment",v)
                            esp.Adornee = v.HumanoidRootPart
                            esp.ZIndex = 0
                            esp.Size = Vector3.new(4,8,3)
                            esp.Transparency = 0.40
                            esp.Color3 = Color3.fromRGB(0,255,255)
                            esp.AlwaysOnTop = true
                            esp.Name = "ESP"
                        end
                    end
                end
            end
        end
    end
end)

pen:Toggle("Items ESP",false, function(state)
getgenv().ie = state

while wait() do
    if getgenv().ie == true then
          for i,v in pairs(game:GetService("Workspace")["GAME_MAP"].Spawns.Items:GetChildren()) do
                if v:FindFirstChildOfClass("Model") then
                    if not v:FindFirstChild("ESP") then
                        local esp = Instance.new("BoxHandleAdornment",v)
                        esp.Adornee = v
                        esp.ZIndex = 0
                        esp.Size = v:FindFirstChildOfClass("Model").Handle.Size
                        esp.Transparency = 0.40
                        esp.Color3 = Color3.fromRGB(0,255,255)
                        esp.AlwaysOnTop = true
                        esp.Name = "ESP"
          for i,v in pairs(game:GetService("Workspace")["GAME_MAP"].Spawns.Items:GetChildren()) do
                if not v:FindFirstChildOfClass("Model") then
                    if v:FindFirstChild("ESP") then
                         v.ESP:Destroy()
                    end
                end
            end
        end
     end
     end
     elseif getgenv().ie == false then
        for i,v in pairs(game:GetService("Workspace")["GAME_MAP"].Spawns.Items:GetChildren()) do
                if v:FindFirstChild("ESP") then
                    v.ESP:Destroy()
                    break;
                end
            end
        end  
    end
end)

pen:Toggle("Players ESP",false, function(state)
getgenv().pe = state

while wait() do
    if getgenv().pe == true then
          for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
                if v:FindFirstChild("Humanoid") then
                    if v ~= game.Players.LocalPlayer.Character then
                        if not v:FindFirstChild("ESP") then
                            local esp = Instance.new("BoxHandleAdornment",v)
                            esp.Adornee = v.Head
                            esp.ZIndex = 0
                            esp.Size = v.Head.Size
                            esp.Transparency = 0.40
                            esp.Color3 = Color3.fromRGB(0,255,255)
                            esp.AlwaysOnTop = true
                            esp.Name = "ESP"
                        end 
                    end
                end
            end
    elseif getgenv().pe == false then
       for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
            if v:FindFirstChild("Humanoid") then
                if v:FindFirstChild("ESP") then
                    v.ESP:Destroy()
                    break;
                end
            end
        end
    end
end
end)


while wait() do
   for i,v in pairs(game:GetService("Workspace")["GAME_MAP"].Spawns.Items:GetChildren()) do
    if not v:FindFirstChildOfClass("Model") then
        if v:FindFirstChild("ESP") then
           v.ESP:Destroy()
        end
    end
end
end
