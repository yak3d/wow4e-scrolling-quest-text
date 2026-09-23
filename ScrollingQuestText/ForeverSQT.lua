print("ForeverSQT Loaded");

local Sound = ForeverSQT.Sound
local Fade = ForeverSQT.Fade

local questText = QuestInfoDescriptionText

local GRADIENT = 10
local CHARS_PER_SECOND = 40

local fullText = nil
local progress = 0

local ticker = CreateFrame("Frame")
ticker:Hide()

local function WritingDone()
  Sound.Stop()

  ticker:Hide()
  if fullText then
    questText:SetAlphaGradient(#fullText + GRADIENT * 2, GRADIENT)
  end

  fullText = nil
  progress = 0

  questText:SetAlpha(1)

  if QuestInfoRewardsFrame then
    QuestInfoRewardsFrame:Show()
    Fade.In(QuestInfoRewardsFrame)
  end
  if QuestInfoObjectivesFrame then
    QuestInfoObjectivesFrame:Show()
    Fade.In(QuestInfoObjectivesFrame)
  end
  if QuestInfoObjectivesHeader then
    QuestInfoObjectivesHeader:Show()
    Fade.In(QuestInfoObjectivesHeader)
  end
  if QuestInfoObjectivesText then
    QuestInfoObjectivesText:Show()
    Fade.In(QuestInfoObjectivesText)
  end

  if QuestInfoFrame and QuestInfoFrame.acceptButton then
    QuestInfoFrame.acceptButton:Enable()
  end
end

ticker:SetScript("OnUpdate", function(self, elapsed)
  progress = progress + elapsed * (ForeverSQTDB.speed or CHARS_PER_SECOND)

  local stillHidden = questText:SetAlphaGradient(progress, GRADIENT)
  if not stillHidden or progress > #fullText + GRADIENT * 2 then
    WritingDone()
  end
end)

local function StartWriting()
  if not (QuestFrame and QuestFrame:IsShown()) then return end

  -- QuestInfoFrame.acceptButton:Disable()

  local text = questText:GetText()

  if not text or text == "" then return end

  fullText = text
  progress = 0

  if QuestInfoRewardsFrame then
    Fade.Reset(QuestInfoRewardsFrame)
    QuestInfoRewardsFrame:Hide()
  end
  if QuestInfoObjectivesFrame then
    Fade.Reset(QuestInfoObjectivesFrame)
    QuestInfoObjectivesFrame:Hide()
  end
  if QuestInfoObjectivesHeader then
    Fade.Reset(QuestInfoObjectivesHeader)
    QuestInfoObjectivesHeader:Hide()
  end
  if QuestInfoObjectivesText then
    Fade.Reset(QuestInfoObjectivesText)
    QuestInfoObjectivesText:Hide()
  end

  questText:SetAlphaGradient(0, GRADIENT)

  if ForeverSQTDB.sound ~= false then
    Sound.Start()
  end

  ticker:Show()
end

if QuestInfo_Display then
  hooksecurefunc("QuestInfo_Display", StartWriting)
else
  print("ForeverSQT: QuestInfo_Display not found, scroll not hooked")
end

QuestFrame:EnableMouse(true)

if ForeverSQTDB.click_to_skip ~= false then
  QuestFrame:HookScript("OnMouseUp", function()
    if fullText then
      WritingDone()
    end
  end)
end

QuestFrame:HookScript("OnHide", function()
  if fullText then
    WritingDone()
  end
end)

SLASH_FOREVERSQT1 = "/sqt"
SlashCmdList["FOREVERSQT"] = function()
  Settings.OpenToCategory(ForeverSQT.settingsCategory:GetID())
end
