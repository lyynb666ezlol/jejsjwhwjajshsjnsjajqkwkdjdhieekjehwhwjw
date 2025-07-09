-- 确保在客户端环境正确执行（放在LocalScript中，Parent设为StarterPlayerScripts）
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local player = Players.LocalPlayer

-- 等待角色加载（避免Character为nil导致的错误）
if not player.Character then
    player.CharacterAdded:Wait()
end

-- 发送验证通知
StarterGui:SetCore("SendNotification", {
    Title = "白名单验证",
    Text = "正在验证身份...",
    Duration = 1
})

-- 核心修复：正确获取玩家用户名（原代码错误获取Character的字符串）
local playerName = player.Name
local _G = _G or {}
_G.lyy = false -- 初始化状态

-- 白名单判断（修正条件链，确保每个分支正确执行）
if playerName == "a1rNB116" then
    _G.lyy = true
elseif playerName == "NU732894482" then
    _G.lyy = true
elseif playerName == "CN_30224854980" then
    _G.lyy = true
    elseif playerName == "Lty06777" then
    _G.lyy = true
    elseif playerName == "Qw159357sws" then
    _G.lyy = true
    elseif playerName == "Lty0677" then
    _G.lyy = true
    elseif playerName == "5486r2" then
    _G.lyy = true
    elseif playerName == "fjjcf08" then
    _G.lyy = true
    elseif playerName == "a1rNB116" then
    _G.lyy = true
    elseif playerName == "spammer123487" then
    _G.lyy = true
    elseif playerName == "CN_30224854983" then
    _G.lyy = true
    elseif playerName == "CN_30224854981" then
    _G.lyy = true
    elseif playerName == "CN_30224854984" then
    _G.lyy = true
    elseif playerName == "A1Rnb277" then
    _G.lyy = true
    elseif playerName == "zxcvbnm999879" then
    _G.lyy = true
     elseif playerName == "ycyyds986" then
    _G.lyy = true
     elseif playerName == "Lty067777" then
    _G.lyy = true
     elseif playerName == "a1rNB6666" then
    _G.lyy = true
     elseif playerName == "AAOA530" then
    _G.lyy = true
     elseif playerName == "5sydt6" then
    _G.lyy = true
    elseif playerName == "ohioN855" then
    _G.lyy = true
    elseif playerName == "haozheng4528" then
    _G.lyy = true
elseif playerName == "usssuisshsgu" then
    _G.lyy = true
elseif playerName == "" then
    _G.lyy = true
    
    elseif playerName == "zxcvbnm1233151" then
    _G.lyy = true
    elseif playerName == "5483d8" then
    _G.lyy = true
end

-- 验证结果处理（确保分支逻辑正确执行）
if _G.lyy then
    -- 验证成功：显示通知并执行链接代码
    StarterGui:SetCore("SendNotification", {
        Title = "验证成功",
        Text = playerName .. "，已通过白名单验证",
        Duration = 1
    })
    wait(1) -- 等待通知显示
    -- 尝试执行外部代码（若链接失效会报错，需确保链接有效）
    local success, err = pcall(function()
 loadstring(game:HttpGet("https://raw.githubusercontent.com/lyynb666ezlol/jejsjwhwjajshsjnsjajqkwkdjdhieekjehwhwjw/refs/heads/main/2_%E6%B7%B7%E6%B7%861(1).lua"))()
    end)
    if not success then
        StarterGui:SetCore("SendNotification", {
            Title = "执行失败",
            Text = "代码加载错误：" .. err,
            Duration = 10
        })
    end
else
    -- 验证失败：复制QQ并提示
    setclipboard("1773636032 3022485498 1390500951 875100900 3549375062")
    StarterGui:SetCore("SendNotification", {
        Title = "验证失败",
        Text = "你不在白名单中，已复制作者和代理的QQ号",
        Duration = 1
    })
end
