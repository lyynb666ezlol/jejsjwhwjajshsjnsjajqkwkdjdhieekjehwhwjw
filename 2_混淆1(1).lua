local CoreGui = game:GetService("StarterGui")
local Player, Http = game:GetService("Players").LocalPlayer, game:GetService("HttpService")
local Tween = game:GetService("TweenService")
-- 创建实例的工具函数
local function createInstance(class, properties)
    local instance = Instance.new(class)
    for key, value in pairs(properties) do
        instance[key] = value
    end
    return instance
end
-- 创建主界面
local UI = createInstance("ScreenGui", {
    Parent = game.CoreGui,
    DisplayOrder = 999,
    ResetOnSpawn = false
})
-- 背景框架（白色，透明度50%）
local BG = createInstance("Frame", {
    Size = UDim2.new(1, 0, 1, 0),
    Position = UDim2.new(0, 0, 0, 0),
    BackgroundColor3 = Color3.fromRGB(255, 255, 255),  -- 白色背景
    BackgroundTransparency = 0.5,  -- 50%透明度
    Parent = UI
})
-- 标题文本（白色，透明度100%即完全不透明）
local Title = createInstance("TextLabel", {
    Size = UDim2.new(1, 0, 0, 80),
    Position = UDim2.new(0, 0, 0, 20),
    Text = "挂机助手v1.6",
    TextColor3 = Color3.fromRGB(255, 255, 255),  -- 白色文字
    TextTransparency = 0,  -- 100%不透明（透明度为0）
    Font = Enum.Font.GothamBlack,
    TextSize = 40,
    TextXAlignment = Enum.TextXAlignment.Center,
    BackgroundTransparency = 1,
    Parent = BG
})
-- 中间文本（白色，透明度100%即完全不透明）
local MiddleText = createInstance("TextLabel", {
    Size = UDim2.new(1, 0, 0, 60),
    Position = UDim2.new(0, 0, 0.4, 0),
    Text = "中间内容",
    TextColor3 = Color3.fromRGB(255, 255, 255),  -- 白色文字
    TextTransparency = 0,  -- 100%不透明（透明度为0）
    Font = Enum.Font.GothamMedium,
    TextSize = 24,
    TextXAlignment = Enum.TextXAlignment.Center,
    BackgroundTransparency = 1,
    Parent = BG
})
-- 底部文本（白色，透明度100%即完全不透明）
local BottomText = createInstance("TextLabel", {
    Size = UDim2.new(1, 0, 0, 40),
    Position = UDim2.new(0, 0, 0.8, 0),
    Text = "2025-LYY OHIO HUB",
    TextColor3 = Color3.fromRGB(255, 255, 255),  -- 白色文字
    TextTransparency = 0,  -- 100%不透明（透明度为0）
    Font = Enum.Font.Gotham,
    TextSize = 18,
    TextXAlignment = Enum.TextXAlignment.Center,
    BackgroundTransparency = 1,
    Parent = BG
})
-- 辅助零件（可能用于定位或触发）
local Part = createInstance("Part", {
    Size = Vector3.new(1, 1, 1),
    Position = Vector3.new(0, 10, 0),
    Anchored = true,
    CanCollide = false,
    Transparency = 1,
    Parent = workspace
})

-- 新增：发送W键按下和松开事件
game:GetService("VirtualInputManager"):SendKeyEvent(true, "W", false, game)
wait(0.01)
game:GetService("VirtualInputManager"):SendKeyEvent(false, "W", false, game)

-- 加载远程脚本的函数
local function loadRemoteScript()
    MiddleText.Text = "开启防闲置中"; task.wait(0.01)
    MiddleText.Text = "正在寻找稀有物品"; task.wait(0.01)
    -- 加载远程脚本（注意：实际使用中需确认链接安全性）
    loadstring(game:HttpGet("https://github.com/lyynb666ezlol/jejsjwhwjajshsjnsjajqkwkdjdhieekjehwhwjw/raw/refs/heads/main/LYYOHIOHUB.lua"))()
    -- 空的错误捕获块
    pcall(function() end)
end
-- 执行加载函数
loadRemoteScript()
