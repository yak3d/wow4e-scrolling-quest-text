ForeverSQT = ForeverSQT or {}
ForeverSQTDB = ForeverSQTDB or {}

local category = Settings.RegisterVerticalLayoutCategory("Scrolling Quest Text")

do
  local setting = Settings.RegisterAddOnSetting(
    category,
    "ForeverSQT_Sound",
    "sound",
    ForeverSQTDB,
    type(true),
    "Play quill writing sound",
    true
  )
  Settings.CreateCheckbox(category, setting, "Repeats the quill writing sound while quest text writes out.")
end

do
  local setting = Settings.RegisterAddOnSetting(
    category,
    "ForeverSQT_DisableAcceptButton",
    "disable_accept",
    ForeverSQTDB,
    type(true),
    "Disable Accept Button",
    true
  )

  Settings.CreateCheckbox(category, setting, "Disables the Accept button in the quest frame while writing.")
end

do
  local setting = Settings.RegisterAddOnSetting(
    category,
    "ForeverSQT_EnableClickToSkip",
    "enable_click_to_skip",
    ForeverSQTDB,
    type(true),
    "Enable Click to Skip",
    true
  )

  Settings.CreateCheckbox(category, setting, "Enables the click-to-skip feature, where clicking on the quest frame skips the writing.")
end

do
  local setting = Settings.RegisterAddOnSetting(
    category,
    "ForeverSQT_Speed",
    "speed",
    ForeverSQTDB,
    type(40),
    "Writing Speed",
    40
  )

  local options = Settings.CreateSliderOptions(10, 120, 5)
  options:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Right)

  Settings.CreateSlider(category, setting, options, "Quest writing speed, in characters per second.")
end

Settings.RegisterAddOnCategory(category)
ForeverSQT.settingsCategory = category

