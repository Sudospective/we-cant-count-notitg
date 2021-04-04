xero()

local shit = 404

bg(NoteMask)
NoteMask:diffuse(0, 0, 0, 0)
NoteMask:zbias(-100)
bg(NoteInvert)
NoteInvert:diffuse(1, 1, 1, 0)
NoteInvert:zbias(-100)
bg(RainbowBG)
RainbowBG:rainbow()
RainbowBG:diffusealpha(0.5)
RainbowBG:hidden(1)
if not FUCK_EXE then
    NoteMask:zmask(0)
    NoteInvert:zmask(0)
end

rand.seed(1234568 + shit)

definemod {
    'aftzoom',
    function(n)
        AFTSprite:zoom(n * 0.01)
    end
}

setdefault {100, 'aftzoom'}

local function strobemask(beat)
    func {beat, function()
        local col1 = 1 - rand.int(0, 10, 2) * 0.1
        local col2 = 1 - rand.int(0, 10, 2) * 0.1
        local col3 = 1 - rand.int(0, 10, 2) * 0.1
        NoteMask:diffuse(col1, col2, col3, 0.5)
    end}
end

local function bop(beat, stage)
    if stage > 5 then
        func
            {beat, function(n)
                NoteInvert:hidden(1)
            end}
        add
            {beat - 0.25, 1, bounce, 100, 'movex'}
            {beat + 0.75, 1, bounce, -100, 'movex'}
    end
    if stage > 4 then 
        func
            {beat, function(n)
                NoteInvert:diffusealpha(0.5)
            end}
            {beat + 1, function(n)
                NoteInvert:diffusealpha(0)
            end}
        add
            {beat, 1, bounce, -100, 'movex'}
            {beat + 1, 1, bounce, 100, 'movex'}
    end
    if stage > 3 then
        add
            {beat - 0.5, 1, spike, -5000, 'tiny'}
            {beat + 0.5, 1, spike, -5000, 'tiny'}
            {beat - 2, 4, spike, 15, 'aftzoom'}
            {beat - 1, 4, spike, 15, 'aftzoom'}
    end
    if stage > 2 then
        add
            {beat - 0.5, 1, inOutCirc, -360, 'rotationy', 360 * math.pi / 1.8, 'confusionyoffset'}
            {beat + 0.5, 1, inOutCirc, 360, 'rotationy', -360 * math.pi / 1.8, 'confusionyoffset'}
    end
    if stage > 1 then
        add
            {beat - 2, 4, spike, -150, 'holdgirth', 30, 'rotationy', -15 * math.pi / 1.8, 'confusionzoffset', -45, 'rotationx', 45 * math.pi / 1.8, 'confusionxoffset', -500, 'tinyz'}
            {beat - 1, 4, spike, -150, 'holdgirth', -30, 'rotationy', 15 * math.pi / 1.8, 'confusionzoffset', -45, 'rotationx', 45 * math.pi / 1.8, 'confusionxoffset', -500, 'tinyz'}
        swap
            {beat - 0.5, 1, inOutCirc, 'dlru'}
            {beat + 0.5, 1, inOutCirc, 'ldur'}
        end
    if stage > 0 then
        if beat ~= 72 then
            add {beat - 2, 4, spike, -45, 'rotationy'}
            strobemask(beat)
        end
        add {beat - 1, 4, spike, 45, 'rotationy'}
        strobemask(beat + 1)
    end
    add
        {beat - 2, 4, spike, 25, 'tornado', 10, 'flip', 25, 'brake', 400, 'zoomz', 50, 'bumpyz', 15, 'rotationz'}
        {beat - 1, 4, spike, 25, 'tornado', 10, 'flip', 25, 'brake', 400, 'zoomz', 50, 'bumpyz', -15, 'rotationz'}

end

func
    {0, 7.5, inQuad, 1, 0, function(n)
        NoteMask:diffusealpha(n)
    end}
    {8, function()
        NoteMask:ztestmode('writeonfail')
        NoteMask:blend('add')
        NoteInvert:ztestmode('writeonfail')
        NoteInvert:blend('invertdest')
    end}

strobemask(73)
strobemask(86)
strobemask(88)

set
    {0, 175, 'mini', 75, 'beat', 500, 'drawsize'}
    {0, -90, 'rotationx', 45, 'rotationz'}
    {54, 100, 'stealth', 100, 'dark'}
    {54.5, 0, 'stealth', 0, 'dark'}
    {243, 0, 'rotationz'}

ease
    {1.5, 7.5, outSine, 0, 'rotationx', 0, 'rotationz'}
    {0, 8, inQuad, 150, 'mini'}
    {7.5, 1, inOutExpo, 150, 'beat', 0, 'mini', 100, 'drawsize'}

    {18, 4.25, function(t) return inSine(tap(t)) end, 35, 'stealth', -75, 'tiny'}

    {20.5, 1, inOutCirc, 0, 'beat'}
    {23.5, 1, inOutCirc, 150, 'beat'}

    {22, 0.5, outBack, 100, 'invert', 100, 'mini'}
    {23.5, 1, inOutCirc, 0, 'reverse', 0, 'invert', 0, 'mini'}

    {36.75, 1, inOutCirc, 0, 'beat'}
    {39.75, 1, inOutCirc, 150, 'beat'}

    {37.5, 2.5, bell, -85, 'rotationx', 85 * math.pi / 1.8, 'confusionxoffset', 400, 'zoomz', 80, 'mini', -400, 'wave'}
    {38, 1.5, bounce, -2500, 'tinyy', 200, 'brake'}

    {41, 1, pop, 150, 'tiny', 100, 'reverse', 100, 'invert', 90 * math.pi / 1.8, 'confusionzoffset'}

    {67, 1, inOutCirc, 0, 'beat'}

    {71.75, 1, inOutCirc, 150, 'beat'}
    {72.5, 1, inOutCirc, 0.0001, 'bumpy'}

    {85.75, 1, inOutCirc, 0, 'beat'}
    {87.5, 1, bounce, -150, 'beat'}
    {89.5, 0.5, inCirc, 150, 'beat'}

    {117.5, 1, inOutCirc, 0, 'beat', 100, 'reverse', 100, 'drunk', 1, 'xmod', -200, 'tiny'}
    {120.5, 1, inOutCirc, 100, 'beat', 0, 'reverse', 0, 'drunk', 0, 'tiny'}
    {118, 3, inExpo, 5, 'xmod'}
    {120.5, 1, spike, -5000, 'tiny'}
    {121, 1, outExpo, 2, 'xmod'}

    {133.5, 1, inOutCirc, 0, 'beat'}
    {134.75, 0.5, inOutExpo, 100, 'invert'}
    {135.5, 1, inOutCirc, 150, 'beat'}
    {135.75, 0.5, inOutExpo, 0, 'invert'}

    {149.5, 1, inOutCirc, 0, 'beat', 90 * math.pi / 1.8, 'confusionzoffset', 100, 'invert'}
    {151.5, 1, inOutCirc, 150, 'beat'}
    {149.5, 2, inOutBack, 0, 'confusionzoffset', 0, 'invert'}

    {163.5, 1, inOutCirc, 0, 'beat'}
    
    {203, 2, inOutQuint, 0, 'invert'}
    {211, 2, inOutQuint, 100, 'invert'}
    {212, 3, linear, 50, 'invert', 25, 'flip'}

    {243.5, 0.5, inQuad, -100, 'movex', 200, 'drunk', 100, 'tipsy', 115, 'zoomy', -10, 'skewx', 10, 'rotationz', -75, 'rotationy', -50, 'tiny'}
    {244, 4, outElastic, 0, 'movex', 0, 'drunk', 0, 'tipsy', 100, 'zoomy', 0, 'skewx', 0, 'rotationz',0, 'rotationy', 0, 'tiny'}

    {309.5, 2, bell, 100, 'reverse'}
    {311, 0.5, outCirc, 0, 'beat'}
add
    {116, 4, spike, -150, 'holdgirth', 25, 'brake', 50, 'bumpyz', 25, 'tornado', 10, 'flip', 400, 'zoomz', -15, 'rotationy', -15 * math.pi / 1.8, 'confusionzoffset', -45, 'rotationx', 45 * math.pi / 1.8, 'confusionxoffset', 15, 'rotationz', -500, 'tinyz'}
    {117.5, 1, inOutCirc, -360, 'rotationy', 360 * math.pi / 1.8, 'confusionyoffset'}
    {119, 4, spike, -150, 'holdgirth', 25, 'brake', 50, 'bumpyz', 25, 'tornado', 10, 'flip', 400, 'zoomz', 15, 'rotationy', 15 * math.pi / 1.8, 'confusionzoffset', -45, 'rotationx', 45 * math.pi / 1.8, 'confusionxoffset', -15, 'rotationz', -500, 'tinyz'}
    {120.5, 1, inOutCirc, -360, 'rotationy', 360 * math.pi / 1.8, 'confusionyoffset'}
    {148, 4, spike, -150, 'holdgirth', 25, 'brake', 50, 'bumpyz', 25, 'tornado', 10, 'flip', 400, 'zoomz', -15, 'rotationy', -15 * math.pi / 1.8, 'confusionzoffset', -45, 'rotationx', 45 * math.pi / 1.8, 'confusionxoffset', 15, 'rotationz', -500, 'tinyz'}
    {149.5, 1, inOutCirc, -360, 'rotationy', 360 * math.pi / 1.8, 'confusionyoffset'}
    {149.5, 1, spike, -5000, 'tiny'}
    
    {212, 3, tap, 30, 'rotationz', 100, 'centered'}
    
    {132, 4, spike, -150, 'holdgirth', 25, 'brake', 50, 'bumpyz', 25, 'tornado', 10, 'flip', 400, 'zoomz', -15, 'rotationy', -15 * math.pi / 1.8, 'confusionzoffset', -45, 'rotationx', 45 * math.pi / 1.8, 'confusionxoffset', 15, 'rotationz', -500, 'tinyz'}
    {133.5, 1, inOutCirc, -360, 'rotationy', 360 * math.pi / 1.8, 'confusionyoffset'}
    {134, 1, outCirc, 180, 'rotationz', -180 * math.pi / 1.8, 'confusionzoffset'}
    {135.5, 1, inOutCirc, 180, 'rotationz', -180 * math.pi / 1.8, 'confusionzoffset'}

    {162, 4, spike, -150, 'holdgirth', 25, 'brake', 50, 'bumpyz', 25, 'tornado', 10, 'flip', 400, 'zoomz', -15, 'rotationy', -15 * math.pi / 1.8, 'confusionzoffset', -45, 'rotationx', 45 * math.pi / 1.8, 'confusionxoffset', 15, 'rotationz', -500, 'tinyz'}
    {163.5, 1, inOutCirc, -360, 'rotationy', 360 * math.pi / 1.8, 'confusionyoffset'}

    {308, 4, spike, 15, 'aftzoom', -150, 'holdgirth', 25, 'brake', 50, 'bumpyz', 25, 'tornado', 10, 'flip', 400, 'zoomz', -15, 'rotationy', -15 * math.pi / 1.8, 'confusionzoffset', -45, 'rotationx', 45 * math.pi / 1.8, 'confusionxoffset', 15, 'rotationz', -500, 'tinyz'}
    {309, 4, spike, 15, 'aftzoom', -150, 'holdgirth', 25, 'brake', 50, 'bumpyz', 25, 'tornado', 10, 'flip', 400, 'zoomz', 15, 'rotationy', 15 * math.pi / 1.8, 'confusionzoffset', -45, 'rotationx', 45 * math.pi / 1.8, 'confusionxoffset', -15, 'rotationz', -500, 'tinyz'}
    {309.5, 1, spike, -5000, 'tiny'}
    {310.5, 1, spike, -5000, 'tiny'}
    {309.5, 1, inOutCirc, -360, 'rotationy', 360 * math.pi / 1.8, 'confusionyoffset'}
    {310.5, 1, inOutCirc, -360, 'rotationy', 360 * math.pi / 1.8, 'confusionyoffset'}
swap
    {117.75, 0.5, inOutCirc, 'dlru'}
    {118.25, 0.5, inOutCirc, 'urld'}
    {118.75, 0.5, inOutCirc, 'ldur'}
    {119.25, 0.5, inOutCirc, 'rudl'}
    {120.75, 0.5, inOutCirc, 'lurd'}

    {203, 2, inOutQuint, 'urld'}
    {207, 2, inOutQuint, 'ludr'}
    {211, 2, inOutQuint, 'ldur'}

    {309.5, 2, bell, 'urld'}

func
    {86.5, function() NoteMask:hidden(1) end}
    {88, function() NoteMask:hidden(0) end}
    {88.5, function() NoteMask:hidden(1) end}
    {90, function() NoteMask:hidden(0) end}
    {118, function() NoteMask:hidden(1) end}
    {121, function() NoteMask:hidden(0) end}
    {134, function() NoteMask:hidden(1) end}
    {136, function() NoteMask:hidden(0) end}
    {136, function() RainbowBG:hidden(0) end}
    {150, function() NoteMask:rainbow() end}
    {150, function() RainbowBG:hidden(1) end}
    {152, function() RainbowBG:hidden(0) end}
    {164, function() RainbowBG:hidden(1) end}
    {212, function()
        for pn = 1, 2 do
            P[pn]:vibrate()
        end
    end}
    {216, function()
        for pn = 1, 2 do
            P[pn]:stopeffect()
        end
    end}
    {218, function()
        AFTSprite:diffusealpha(0.85)
        AFTSprite:wag()
        AFTSprite:effectmagnitude(0, 0, 2)
        AFTSprite:effectclock('bgm')
        AFTSprite:effectoffset(0.5)
    end}
    {244, function() AFTSprite:diffusealpha(0) end}
    {248, function() AFTSprite:diffusealpha(0.5) end}
    {311, function() NoteMask:hidden(1) end}
    {311, function() RainbowBG:hidden(1) end}
    {311, function() AFTSprite:diffusealpha(0) end}

for beat = 8, 310, 2 do
    if beat >= 42 and beat < 68 then
        bop(beat, 0)
    elseif beat >= 74 and beat < 86 then
        bop(beat, 1)
    elseif beat >= 90 and beat < 104 then
        bop(beat, 2)
    elseif beat >= 104 and beat < 134 and beat ~= 118 and beat ~= 120 then
        bop(beat, 3)
    elseif beat >= 136 and beat < 150 then
        bop(beat, 4)
    elseif beat >= 152 and beat < 164 then
        bop(beat, 5)
    elseif beat >= 218 and beat < 244 then
        func {beat, function()
            RainbowBG:hidden(0)
        end}
        bop(beat, 6)
    elseif beat >= 248 and beat < 276 then
        bop(beat, 5)
    elseif beat >= 282 and beat < 310 then
        bop(beat, 4)
    end
end

for beat = 54, 54.5, 0.25 do
    ease
        {beat, 0.0625, bell, 100, 'flip', 200, 'tipsy', 0, 'stealth', 0, 'dark'}
        {beat + 0.0625, 0.0625, bell, 100, 'invert', 200, 'drunk', 0, 'stealth', 0, 'dark'}
        {beat + 0.125, 0.0625, bell, 100, 'flip', -200, 'tipsy', 0, 'stealth', 0, 'dark'}
        {beat + 0.1875, 0.0625, bell, 100, 'invert', -200, 'drunk', 0, 'stealth', 0, 'dark'}
end
