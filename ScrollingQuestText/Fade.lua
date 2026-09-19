ForeverSQT = ForeverSQT or {}
ForeverSQT.Fade = {}

local Fade = ForeverSQT.Fade

local DURATION = 0.4

local function EnsureGroup(region)
  local group = region.FadeInGroup

  if not group then
    group = region:CreateAnimationGroup()
    local anim = group:CreateAnimation("Alpha")

    anim:SetFromAlpha(0)
    anim:SetToAlpha(1)
    anim:SetDuration(DURATION)
    anim:SetSmoothing("OUT")

    group:SetScript("OnFinished", function()
      region:SetAlpha(1)
    end)

    region.FadeInGroup = group
  end

  return group
end

function Fade.In(region)
  if not region then return end

  local group = EnsureGroup(region)
  region:SetAlpha(0)
  group:Play()
end

function Fade.Reset(region)
  if not region then return end

  if region.FadeInGroup and region.FadeInGroup:IsPlaying() then
    region.FadeInGroup:Stop()
  end

  region:SetAlpha(1)
end

