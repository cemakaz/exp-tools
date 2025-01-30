local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:FindFirstChildOfClass("Humanoid")
local backpack = player:FindFirstChild("Backpack")

local tool = Instance.new("Tool")
tool.Name = "20-20-20 Dropkick"
tool.RequiresHandle = false
tool.Parent = backpack

tool.Equipped:Connect(function()
    local originalWalkSpeed = humanoid.WalkSpeed
    humanoid.WalkSpeed = 0
    tool.Parent = backpack
    
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://127703473665985"
    sound.Parent = game.Workspace
    sound.Volume = 1
    sound.PlayOnRemove = true
    sound:Play()
    
    task.wait(sound.TimeLength or 5)
    sound:Destroy()
    
    local animation = Instance.new("Animation")
    animation.AnimationId = "rbxassetid://17354976067"
    local animator = humanoid:FindFirstChildOfClass("Animator") or humanoid:WaitForChild("Animator")
    local animationTrack = animator:LoadAnimation(animation)
    for _, track in ipairs(animator:GetPlayingAnimationTracks()) do
        track:Stop()
    end
    animationTrack:Play()
    local movementActive = true
    
    animationTrack.Stopped:Connect(function()
        movementActive = false
        humanoid.WalkSpeed = originalWalkSpeed
    movementActive = false
    humanoid.WalkSpeed = originalWalkSpeed
end)
    
    task.wait(1.8)
    local camera = workspace.CurrentCamera
    local movementActive = true
    local stopTime = tick() + 5.4
    
    while movementActive and tick() < stopTime do
    humanoid.WalkSpeed = 0
        humanoid.WalkSpeed = 0
        local currentTime = tick()
        local moveDirection = camera.CFrame.LookVector
        local speed = (currentTime >= stopTime - 1) and -2 or -15
        local newCFrame = character.PrimaryPart.CFrame * CFrame.new(0, 0, speed)
        character:SetPrimaryPartCFrame(newCFrame)
        task.wait(0.05)
    end
end)
