getgenv().esp = false;

function ESP()
for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
    if v:FindFirstChild("Humanoid") then
        if v ~= game.Players.LocalPlayer.Character then
           if v:FindFirstChild("ESP") then
              v.ESP:Destroy()
           end
        end
    end
end
for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
    if v:FindFirstChild("Humanoid") then
        if v ~= game.Players.LocalPlayer.Character then
           if not v:FindFirstChild("ESP") then
              local esp = Instance.new("BoxHandleAdornment",v)
              esp.Adornee = v.HumanoidRootPart
              esp.ZIndex = 0
              esp.Size = Vector3.new(4,8,3)
              esp.Transparency = 0.40
              esp.Color3 = game.Players[v.Name].TeamColor.Color
              esp.AlwaysOnTop = true
              esp.Name = "ESP"
            end 
        end
    end
end
end

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().esp == true then
       ESP()
    elseif getgenv().esp == false then
       for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
            if v:FindFirstChild("Humanoid") then
                if v ~= game.Players.LocalPlayer.Character then
                    if v:FindFirstChild("ESP") then
                        v.ESP:Destroy()
                        break;
                    end
                end
            end
        end
    end
end)