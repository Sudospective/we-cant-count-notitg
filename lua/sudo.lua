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

func {0, function()
    for pn = 1, 2 do
        PP[pn]:hidden(1)
    end
    for cn = 2, #WeCantCount do
        WeCantCount[cn]:hidden(1)
    end
end}

setdefault {100, 'aftzoom'}


-- I can simplify this and I might simplify this but I probably won't simplify this.
local function attempt_to_count(beat)
    --[[
    local old_mult = 0
    local new_mult = 1
    for beat = start, start + 10, 2 do
        if beat == start + 10 then
            func {beat, function()
                new_mult = new_mult + 1
            end}
        end
        func {beat, function()
            old_mult = new_mult
            new_mult = new_mult + 1
            print(old_mult)
            print(new_mult)
        end}
        func {beat + 1, 2, inOutCirc, (scx * 0.4) * old_mult, (scx * 0.4) * new_mult, function(p)
            for cn = 1, new_mult do
                WeCantCount[cn]:hidden(0)
            end
            for cn = 1, #WeCantCount do
                if WeCantCount[cn] and cn % 2 == 1 then
                    WeCantCount[cn]:x(((scx * 0.4) * (cn - 1)) - p)
                else
                    WeCantCount[cn]:x(-((scx * 0.4) * (cn - 2)) + p)
                end
            end
        end}
    end
    --]]
    ---[[
    func {beat + 1.75, 0.5, inOutCirc, 0, scx * 0.4, function(p)
        WeCantCount[2]:hidden(0)
        for cn = 1, #WeCantCount do
            if not WeCantCount[cn]:GetHidden() and cn % 2 == 1 then
                WeCantCount[cn]:x(((scx * 0.4) * (cn - 1)) - p)
            else
                WeCantCount[cn]:x(-((scx * 0.4) * (cn - 2)) + p)
            end
        end
        --[[
        WeCantCount[1]:x(-p)
        WeCantCount[2]:x(p)
        --]]
    end}
    func {beat + 3.75, 0.5, inOutCirc, scx * 0.4, scx * 0.8, function(p)
        WeCantCount[3]:hidden(0)
        for cn = 1, #WeCantCount do
            if not WeCantCount[cn]:GetHidden() and cn % 2 == 1 then
                WeCantCount[cn]:x(((scx * 0.4) * (cn - 1)) - p)
            else
                WeCantCount[cn]:x(-((scx * 0.4) * (cn - 2)) + p)
            end
        end
    end}
    func {beat + 5.75, 0.5, inOutCirc, scx * 0.8, scx * 1.2, function(p)
        WeCantCount[4]:hidden(0)
        for cn = 1, #WeCantCount do
            if not WeCantCount[cn]:GetHidden() and cn % 2 == 1 then
                WeCantCount[cn]:x(((scx * 0.4) * (cn - 1)) - p)
            else
                WeCantCount[cn]:x(-((scx * 0.4) * (cn - 2)) + p)
            end
        end
    end}
    func {beat + 7.75, 0.5, inOutCirc, scx * 1.2, scx * 1.6, function(p)
        WeCantCount[5]:hidden(0)
        for cn = 1, #WeCantCount do
            if not WeCantCount[cn]:GetHidden() and cn % 2 == 1 then
                WeCantCount[cn]:x(((scx * 0.4) * (cn - 1)) - p)
            else
                WeCantCount[cn]:x(-((scx * 0.4) * (cn - 2)) + p)
            end
        end
    end}
    func {beat + 9.75, 0.5, inOutCirc, scx * 1.6, scx * 2.0, function(p)
        WeCantCount[6]:hidden(0)
        for cn = 1, #WeCantCount do
            if not WeCantCount[cn]:GetHidden() and cn % 2 == 1 then
                WeCantCount[cn]:x(((scx * 0.4) * (cn - 1)) - p)
            else
                WeCantCount[cn]:x(-((scx * 0.4) * (cn - 2)) + p)
            end
        end
    end}
    func {beat + 11.75, 0.5, inOutCirc, scx * 2.0, scx * 2.8, function(p)
        WeCantCount[7]:hidden(0)
        WeCantCount[8]:hidden(0)
        for cn = 1, #WeCantCount do
            if not WeCantCount[cn]:GetHidden() and cn % 2 == 1 then
                WeCantCount[cn]:x(((scx * 0.4) * (cn - 1)) - p)
            else
                WeCantCount[cn]:x(-((scx * 0.4) * (cn - 2)) + p)
            end
        end
    end}
    --]]
end

local function try_again(beat)
    func {beat + 1.75, 0.25, inCirc, scx * 0.4, 0, function(p)
        WeCantCount[1]:x(-p * 4.5)
        WeCantCount[2]:x(p * 4.5)
        WeCantCount[3]:x(-p * 3.5)
        WeCantCount[4]:x(p * 3.5)
        WeCantCount[5]:x(-p * 2.5)
        WeCantCount[6]:x(p * 2.5)
        WeCantCount[7]:x(-p)
        WeCantCount[8]:x(p)
    end}
    func {beat + 2, function()
        for pn = 1, 2 do
            PP[pn]:hidden(0)
        end
        for cn = 1, #WeCantCount do
            WeCantCount[cn]:x(0)
            WeCantCount[cn]:hidden(1)
        end
    end}
    func {beat + 4, function()
        for pn = 1, 2 do
            PP[pn]:hidden(1)
        end
        WeCantCount[1]:hidden(0)
    end}
end

local function fuck_go_back(beat)
    func {beat, 1, instant, function()
        for pn = 1, 2 do
            PP[pn]:hidden(0)
        end
        for cn = 1, #WeCantCount do
            WeCantCount[cn]:x(0)
            WeCantCount[cn]:hidden(1)
        end
    end}

    ease
        {beat, 0.25, outCirc, 1.5, 'xmod'}
        {beat, 0.25, outCirc, 25, 'invert', -25, 'flip', -45 * math.pi/1.8, 'confusionzoffset0', 135 * math.pi/1.8, 'confusionzoffset1', 45 * math.pi/1.8, 'confusionzoffset2', 45 * math.pi/1.8, 'confusionzoffset3', plr = 1}
        {beat, 0.25, outCirc, 50, 'flip', 100, 'stealth', 100, 'dark0', 100, 'dark2', 100, 'dark3', 100, 'hidenoteflashes', plr = 2}
        {beat + 0.75, 0.5, inOutCirc, 0, 'invert', 0, 'flip', 0, 'confusionzoffset0', 0, 'confusionzoffset1', 0, 'confusionzoffset2', 0, 'confusionzoffset3', plr = 1}
        {beat + 0.75, 0.5, inOutCirc, 200, 'tiny', plr = 2}
        {beat + 1.75, 0.5, inOutCirc, 50, 'movex', 200, 'tiny2', plr = 1}
        {beat + 3.75, 0.25, inCirc, 0, 'movex', 0, 'tiny2', 0, 'flip', 0, 'stealth', 0, 'dark0', 0, 'dark2', 0, 'dark3', 0, 'hidenoteflashes', 0, 'tiny'}
        {beat + 4.75, 0.25, inCirc, 3, 'xmod'}

    func {beat + 4, function()
        for pn = 1, 2 do
            PP[pn]:hidden(1)
        end
        WeCantCount[1]:hidden(0)
    end}
end


fuck_go_back(68)

local function strobemask(beat)
    func {beat, function()
        local col1 = 1 - rand.int(0, 10, 2) * 0.1
        local col2 = 1 - rand.int(0, 10, 2) * 0.1
        local col3 = 1 - rand.int(0, 10, 2) * 0.1
        NoteMask:diffuse(col1, col2, col3, 0.5)
    end}
end

local function one(beat)
    for start = beat, beat + 0.5, 0.25 do
        ease
            {start, 0.0625, instant, 20, 'alternate', -10, 'reverse', 100, 'flip', -100, 'tornado', 20, 'drunk', 20, 'tipsy', 5, 'rotationz', 95, 'stealth'}
            {start, 0.0625, spike, 50, 'stealth'}
            {start + 0.0625, 0.0625, instant, 0, 'alternate', 0, 'reverse', 0, 'flip', 0, 'tornado', 0, 'drunk', 0, 'tipsy', 0, 'rotationz', 95, 'stealth'}
            {start + 0.0625, 0.0625, spike, 50, 'stealth'}
            {start + 0.125, 0.0625, instant, 20, 'alternate', -10, 'reverse', 100, 'invert', 100, 'tornado', 20, 'drunk', 20, 'tipsy', 5, 'rotationz', 95, 'stealth'}
            {start + 0.125, 0.0625, spike, 50, 'stealth'}
            {start + 0.1875, 0.0625, instant, 0, 'alternate', 0, 'reverse', 0, 'invert', 0, 'tornado', 0, 'drunk', 0, 'tipsy', 0, 'rotationz', 95, 'stealth'}
            {start + 0.1875, 0.0625, spike, 50, 'stealth'}
    end
    set {beat + 0.75, 0, 'stealth'}
end

local function three(beat)
    ease
        {beat + 0.500, 0.5, outExpo, -200, 'movex', plr = 1}
        {beat + 0.833, 0.5, outExpo, -200, 'movex', plr = 2}
        {beat + 1.500, 0.5, outExpo, 0, 'movex'}
end

local function six(beat)
    ease
        {beat + 0.833, 0.5, outExpo, 200, 'movex'}
        {beat + 1.333, 0.5, outExpo, 0, 'movex', plr = 1}
        {beat + 1.500, 0.5, outExpo, 0, 'movex', plr = 2}
end

local function shit(beat)
    for start = beat, beat + 0.5, 0.25 do
        ease
            {start, 0.0625, bell, 100, 'flip', 200, 'tipsy', 0, 'stealth', 0, 'dark'}
            {start + 0.0625, 0.0625, bell, 100, 'invert', 200, 'drunk', 0, 'stealth', 0, 'dark'}
            {start + 0.125, 0.0625, bell, 100, 'flip', -200, 'tipsy', 0, 'stealth', 0, 'dark'}
            {start + 0.1875, 0.0625, bell, 100, 'invert', -200, 'drunk', 0, 'stealth', 0, 'dark'}
    end
end

local function flippos(beat)
    set
        {beat + 0.500, 200, 'tipsy', 0, 'drunk', -50, 'tiny'}
        {beat + 0.833, 0, 'tipsy', 200, 'drunk', 0, 'tiny'}
        {beat + 1.000, -200, 'tipsy', 0, 'drunk'}
        {beat + 1.333, 0, 'tipsy', -200, 'drunk', -50, 'tiny'}
        {beat + 1.500, 200, 'tipsy', 0, 'drunk', 0, 'tiny'}
        {beat + 1.833, 0, 'tipsy', 200, 'drunk'}
        {beat + 2, 0, 'tipsy', 0, 'drunk'}
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


-- Function

strobemask(73)
strobemask(86)
strobemask(88)

one(40)
one(136)

three(76)
three(92)
three(108)
three(124)
three(140)
three(156)
three(220)
three(236)

six(82)
six(98)
six(114)
six(130)
six(146)
six(162)
six(226)
six(242)

shit(54)
shit(230)

flippos(102)
flippos(294)

-- Set
set
    {0, 1.5, 'xmod', 175, 'mini', 75, 'beat', 500, 'drawsize'}
    {0, -90, 'rotationx', 45, 'rotationz'}
    {40.75, 0, 'stealth'}
    {54, 100, 'stealth', 100, 'dark'}
    {54.5, 0, 'stealth', 0, 'dark'}
    {218, 3, 'xmod'}
    {243, 0, 'rotationz'}

-- Ease
ease
    {1, 7.5, outSine, 0, 'rotationx', 0, 'rotationz'}
    {0, 8, inQuad, 150, 'mini'}
    {7.5, 1, inOutCirc, 3, 'xmod', 150, 'beat', 0, 'mini', 100, 'drawsize'}

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

    {85.75, 0.5, inOutCirc, 100, 'reverse', 100, 'invert'}
    {85.75, 1, inOutCirc, 0, 'beat'}
    {87.75, 0.5, inOutCirc, 0, 'reverse', 0, 'invert'}
    {87.5, 1, bounce, -150, 'beat'}
    {89.5, 0.5, inCirc, 150, 'beat'}

    {117.5, 1, inOutCirc, 0, 'beat', 100, 'reverse', 50, 'drunk', 1.5, 'xmod', 50, 'mini'}
    {120.5, 1, inOutCirc, 100, 'beat', 0, 'reverse', 0, 'drunk', 0, 'mini'}
    {118, 3, inExpo, 5, 'xmod'}
    {120.5, 1, spike, -5000, 'tiny'}
    {121, 1, outExpo, 3, 'xmod'}

    {133.5, 1, inOutCirc, 0, 'beat'}
    {134.75, 0.5, inOutExpo, 100, 'invert'}
    {135.5, 1, inOutCirc, 150, 'beat'}
    {135.75, 0.5, inOutExpo, 0, 'invert'}

    {149.5, 1, inOutCirc, 0, 'beat', 90 * math.pi / 1.8, 'confusionzoffset', 100, 'invert'}
    {151.5, 1, inOutCirc, 150, 'beat'}
    {149.5, 2, inOutBack, 0, 'confusionzoffset', 0, 'invert'}

    {163.5, 1, inOutCirc, 0, 'beat'}
    
    {167.7501, 0.25, inCirc, 0, 'tiny2'}
    {167.75, 1, flip(inExpo), 100, 'stealth2', 100, 'dark2', 100, 'hidenoteflashes'}
    {167.75, 1, flip(inExpo), 100, 'stealth', 100, 'dark', plr = 2}
    
    {203, 2, inOutQuint, 0, 'invert'}
    {211, 2, inOutQuint, 100, 'invert'}
    {212, 3, linear, 50, 'invert', 25, 'flip'}

    {243.5, 0.5, inQuad, -100, 'movex', 200, 'drunk', 100, 'tipsy', 115, 'zoomy', -10, 'skewx', 10, 'rotationz', -75, 'rotationy', -50, 'tiny'}
    {244, 4, outElastic, 0, 'movex', 0, 'drunk', 0, 'tipsy', 100, 'zoomy', 0, 'skewx', 0, 'rotationz',0, 'rotationy', 0, 'tiny'}

    {309.5, 2, bell, 100, 'reverse'}
    {311, 0.5, outCirc, 0, 'beat'}

-- Add
add
    {116, 4, spike, -150, 'holdgirth', 25, 'brake', 50, 'bumpyz', 25, 'tornado', 10, 'flip', 400, 'zoomz', -15, 'rotationy', -15 * math.pi / 1.8, 'confusionzoffset', -45, 'rotationx', 45 * math.pi / 1.8, 'confusionxoffset', 15, 'rotationz', -500, 'tinyz'}
    {117.5, 1, inOutCirc, -360, 'rotationy', 360 * math.pi / 1.8, 'confusionyoffset'}
    {119, 4, spike, -150, 'holdgirth', 25, 'brake', 50, 'bumpyz', 25, 'tornado', 10, 'flip', 400, 'zoomz', 15, 'rotationy', 15 * math.pi / 1.8, 'confusionzoffset', -45, 'rotationx', 45 * math.pi / 1.8, 'confusionxoffset', -15, 'rotationz', -500, 'tinyz'}
    {120.5, 1, inOutCirc, -360, 'rotationy', 360 * math.pi / 1.8, 'confusionyoffset'}
    {148, 4, spike, -150, 'holdgirth', 25, 'brake', 50, 'bumpyz', 25, 'tornado', 10, 'flip', 400, 'zoomz', -15, 'rotationy', -15 * math.pi / 1.8, 'confusionzoffset', -45, 'rotationx', 45 * math.pi / 1.8, 'confusionxoffset', 15, 'rotationz', -500, 'tinyz'}
    {149.5, 1, inOutCirc, -360, 'rotationy', 360 * math.pi / 1.8, 'confusionyoffset'}
    {149.5, 1, spike, -5000, 'tiny'}
    
    {132, 4, spike, -150, 'holdgirth', 25, 'brake', 50, 'bumpyz', 25, 'tornado', 10, 'flip', 400, 'zoomz', -15, 'rotationy', -15 * math.pi / 1.8, 'confusionzoffset', -45, 'rotationx', 45 * math.pi / 1.8, 'confusionxoffset', 15, 'rotationz', -500, 'tinyz'}
    {133.5, 1, inOutCirc, -360, 'rotationy', 360 * math.pi / 1.8, 'confusionyoffset'}
    {134, 1, outCirc, 180, 'rotationz', -180 * math.pi / 1.8, 'confusionzoffset'}
    {135.5, 1, inOutCirc, 180, 'rotationz', -180 * math.pi / 1.8, 'confusionzoffset'}

    {162, 4, spike, -150, 'holdgirth', 25, 'brake', 50, 'bumpyz', 25, 'tornado', 10, 'flip', 400, 'zoomz', -15, 'rotationy', -15 * math.pi / 1.8, 'confusionzoffset', -45, 'rotationx', 45 * math.pi / 1.8, 'confusionxoffset', 15, 'rotationz', -500, 'tinyz'}
    {163.5, 1, inOutCirc, -360, 'rotationy', 360 * math.pi / 1.8, 'confusionyoffset'}
    {167.5, 2, outElastic, -50, 'movex'}

    {212, 3, tap, 30, 'rotationz', 100, 'centered'}

    {308, 4, spike, 15, 'aftzoom', -150, 'holdgirth', 25, 'brake', 50, 'bumpyz', 25, 'tornado', 10, 'flip', 400, 'zoomz', -15, 'rotationy', -15 * math.pi / 1.8, 'confusionzoffset', -45, 'rotationx', 45 * math.pi / 1.8, 'confusionxoffset', 15, 'rotationz', -500, 'tinyz'}
    {309, 4, spike, 15, 'aftzoom', -150, 'holdgirth', 25, 'brake', 50, 'bumpyz', 25, 'tornado', 10, 'flip', 400, 'zoomz', 15, 'rotationy', 15 * math.pi / 1.8, 'confusionzoffset', -45, 'rotationx', 45 * math.pi / 1.8, 'confusionxoffset', -15, 'rotationz', -500, 'tinyz'}
    {309.5, 1, spike, -5000, 'tiny'}
    {310.5, 1, spike, -5000, 'tiny'}
    {309.5, 1, inOutCirc, -360, 'rotationy', 360 * math.pi / 1.8, 'confusionyoffset'}
    {310.5, 1, inOutCirc, -360, 'rotationy', 360 * math.pi / 1.8, 'confusionyoffset'}

-- Swap
swap

    {87.75, 0.5, inOutCirc, 'ludr'}
    {89, 0.5, inOutCirc, 'ldur'}
    {117.5, 1, inOutCirc, 'dlru'}
    {118, 1, inOutCirc, 'ldur'}
    {118.5, 1, inOutCirc, 'urld'}
    {119, 1, inOutCirc, 'rudl'}
    {120.5, 1, inOutCirc, 'ldur'}
    
    {165.75, 0.5, inOutCirc, 'ldru'}
    {167.5, 2, outElastic, 'ldur'}
    
    {245.75, 0.5, inOutCirc, 'dlru'}
    {246.25, 0.5, inOutCirc, 'rdlu'}
    {246.75, 0.5, inOutCirc, 'rldu'}
    {247.25, 0.5, inOutCirc, 'ldru'}
    {247.75, 0.5, inOutCirc, 'ldur'}

    {277.75, 0.5, inOutCirc, 'ldru'}
    {279.75, 2, inCirc, 'ldur'}

    {203, 2, inOutQuint, 'urld'}
    {207, 2, inOutQuint, 'ludr'}
    {211, 2, inOutQuint, 'ldur'}

    {309.5, 2, bell, 'urld'}

-- Func
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

-- Loop
for beat = 8, 296, 16 do
    if beat < 168 or beat >= 216 then
        attempt_to_count(beat)
        if beat == 56 or beat == 152 or beat == 232 or beat == 264 then
            fuck_go_back(beat + 12)
        else
            try_again(beat + 12)
        end
    end
end
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
