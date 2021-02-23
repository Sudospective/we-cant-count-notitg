xero()

bg(NoteMask)
NoteMask:diffusealpha(0)
NoteMask:zbias(-100)
NoteMask:ztestmode('writeonfail')
NoteMask:blend('add')
NoteMask:rainbow()

--[[
local function strobemask(beat)
    func {beat, function()
        local col1 = 1 - rand.int(0, 10, 2) * 0.1
        local col2 = 1 - rand.int(0, 10, 2) * 0.1
        local col3 = 1 - rand.int(0, 10, 2) * 0.1
        NoteMask:diffuse(col1, col2, col3, 0.75)
    end}
end

set {0, 100, 'beat'}
for beat = 104, 116, 2 do
    add
        {beat - 2, 4, spike, -150, 'holdgirth', 25, 'brake', 50, 'bumpyz', 25, 'tornado', 10, 'flip', 400, 'zoomz', -15, 'rotationy', -15 * math.pi / 1.8, 'confusionzoffset', -45, 'rotationx', 45 * math.pi / 1.8, 'confusionxoffset', 15, 'rotationz', -500, 'tinyz'}
        {beat - 1, 4, spike, -150, 'holdgirth', 25, 'brake', 50, 'bumpyz', 25, 'tornado', 10, 'flip', 400, 'zoomz', 15, 'rotationy', 15 * math.pi / 1.8, 'confusionzoffset', -45, 'rotationx', 45 * math.pi / 1.8, 'confusionxoffset', -15, 'rotationz', -500, 'tinyz'}
        {beat - 0.5, 1, inOutCirc, -360, 'rotationy', 360 * math.pi / 1.8, 'confusionyoffset'}
        {beat + 0.5, 1, inOutCirc, 360, 'rotationy', -360 * math.pi / 1.8, 'confusionyoffset'}
    strobemask(beat)
    strobemask(beat + 1)
end
--]]