ForeverSQT = ForeverSQT or {}
ForeverSQT.Sound = {}

local Sound = ForeverSQT.Sound
local ticker = nil
local INTERVAL = 0.5

function Sound.Start()
  if ticker then return end

  ticker = C_Timer.NewTicker(INTERVAL, function()
    PlaySound(3093, "Dialog")
  end)
end

function Sound.Stop()
  if ticker then
    ticker:Cancel()
    ticker = nil
  end
end

