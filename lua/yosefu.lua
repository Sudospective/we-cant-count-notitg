xero()



-- sorry i have to edit these due to conflicts on my funnies
--[[
swap
{69.75, 0.5, inOutCirc, 'dlru'}
{70.25, 0.5, inOutCirc, 'rudl'}
{70.75, 0.5, inOutCirc, 'urld'}
{71.25, 0.5, inOutCirc, 'ldur'}
--]]

swap
{69.75, 0.5, inOutCirc, 'dlru'}
{70.25, 0.5, inOutCirc, 'rdlu'}
{70.75, 0.5, inOutCirc, 'rldu'}
{71.25, 0.5, inOutCirc, 'ldru'}
{71.75, 0.5, inOutCirc, 'ldur'}


ease
{166.0, 1.0, outCirc, - 50, 'split', - 50, 'cross', - 50, 'alternate', 100, 'reverse'}
{166.5, 1.0, outCirc, -100, 'split',    0, 'cross',    0, 'alternate', 100, 'reverse'}
{167.0, 1.0, outCirc, - 50, 'split', - 50, 'cross',   50, 'alternate', 100, 'reverse'}
{167.5, 1.5, outCirc,    0, 'split',    0, 'cross',    0, 'alternate', 100, 'reverse'}



-------------------------------------------------
-- You're very close. Let's try one more time. --
-------------------------------------------------
{177.5, 4.5, inCirc, -85, 'rotationx', 85 * math.pi / 1.8, 'confusionxoffset', 400, 'zoomz', 80, 'mini', -400, 'wave', 0.25, 'xmod'}
{178.0, 4, inCirc, -2500, 'tinyy', 200, 'brake'}

set {182,
	  0, 'tinyy',
	  0, 'rotationx',
	  0, 'confusionxoffset',
	  0, 'zoomz',
	 50, 'mini',
	  0, 'wave',
	  0, 'reverse',
	  2, 'xmod',
	  0, 'brake',
	50, 'drawsize'
}


func {182, function()
	for pn = 1, 2 do
		local a = P[pn]
		local mult = 1 if pn == 2 then mult = -1 end
		if a then
			a:x( sw / 2 - ( sw / 4 ) * mult )
			a:y( sh * 1.5 * mult )
		end
	end
end}


-----------------------
-- Count very slowly --
-----------------------
func
{184, 2, outCirc, sh * 1.5, sh / 2, function(c)
	local a = P[1]
	if a then
		a:y(c)
	end
end}
{186, 2, inCirc, sh / 2, sh * -1.5, function(c)
	local a = P[1]
	if a then
		a:y(c)
	end
end}

{188, 2, outCirc, sh * -1.5, sh / 2, function(c)
	local a = P[2]
	if a then
		a:y(c)
	end
end}
{190, 2, inCirc, sh / 2, sh * 1.5, function(c)
	local a = P[2]
	if a then
		a:y(c)
	end
end}

{192, 2, outCirc, sh * -1.5, sh / 2, function(c)
	local a = P[1]
	if a then
		a:y(c)
	end
end}
{194, 2, inCirc, sh / 2, sh * 1.5, function(c)
	local a = P[1]
	if a then
		a:y(c)
	end
end}

{196, 2, outCirc, sh * 1.5, sh / 2, function(c)
	local a = P[2]
	if a then
		a:y(c)
	end
end}
{198, 2, inCirc, sh / 2, sh * -1.5, function(c)
	local a = P[2]
	if a then
		a:y(c)
	end
end}

{200, 2, outCirc, sh * 1.5, sh / 2, function(c)
	for pn = 1, 2 do
		local a = P[pn]
		if a then
			a:y(c)
		end
	end
end}
{200, function()
	for pn = 1, 2 do
		local a = P[pn]
		if a then
			a:x(scx)
		end
	end
end}


ease
{202, 10, linear, 0, 'mini'}
{211, 3.5, linear, -500, 'tiny', 100, 'dark'}
{211, 1.5, linear, 100, 'stealth'}

set {215,
	 100, 'drawsize',
	   0, 'tiny',
	   0, 'dark',
	   0, 'stealth',
	 100, 'flip',
	 900, 'movex0',
	-900, 'movey1',
	 900, 'movey2',
	-900, 'movex3',
	 200, 'tiny1'
}
--{216.833, 0, 'tiny1'}

set {184, 360 * 9, 'rotationy', (math.pi * 2) * 9 * -100, 'confusionyoffset'}


ease
{184, 2, outCirc, 360 * 8, 'rotationy', (math.pi * 2) * 8 * -100, 'confusionyoffset'}
{186, 2,  inCirc, 360 * 7, 'rotationy', (math.pi * 2) * 7 * -100, 'confusionyoffset'}

{188, 2, outCirc, 360 * 6, 'rotationy', (math.pi * 2) * 6 * -100, 'confusionyoffset'}
{190, 2,  inCirc, 360 * 5, 'rotationy', (math.pi * 2) * 5 * -100, 'confusionyoffset'}

{192, 2, outCirc, 360 * 4, 'rotationy', (math.pi * 2) * 4 * -100, 'confusionyoffset'}
{194, 2,  inCirc, 360 * 3, 'rotationy', (math.pi * 2) * 3 * -100, 'confusionyoffset'}

{196, 2, outCirc, 360 * 2, 'rotationy', (math.pi * 2) * 2 * -100, 'confusionyoffset'}
{198, 2,  inCirc, 360 * 1, 'rotationy', (math.pi * 2) * 1 * -100, 'confusionyoffset'}

{200, 2, outCirc, 360 * 0, 'rotationy', (math.pi * 2) * 0, 'confusionyoffset'}

{202, 10, linear, 100, 'beat'}

-- The original plinkies
--[[
{216.333, 0.5, outElastic, 0, 'movex0'}
{216.500, 0.5, outElastic, 0, 'movex3'}
{216.833, 0.5, outElastic, 0, 'movey1'}
{217.000, 0.5, outElastic, 0, 'movey2'}

{217.333, 0.5, outElastic, 0, 'flip'}
--]]

-- IN CASE OF REACTION FUNNIES BREAK COMMENT
---[[
{216.333 - 1, 2, outBounce, 0, 'movex0'}
{216.500 - 1, 2, outBounce, 0, 'movex3'}
{216.833 - 1, 2, outBounce, 0, 'movey1'}
{217.000 - 1, 2, outBounce, 0, 'movey2'}

{217.333 - 2, 2, outBounce, 0, 'flip'}

set {216.833 - 0.5, 0, 'tiny1'}
--]]

ease
{246.0, 1, outCirc,   50, 'split', - 50, 'cross',   50, 'alternate',   0, 'reverse'}
{246.5, 1, outCirc,  100, 'split',    0, 'cross',    0, 'alternate',   0, 'reverse'}
{247.0, 1, outCirc,   50, 'split', - 50, 'cross', - 50, 'alternate', 100, 'reverse'}
{247.5, 1, outCirc,    0, 'split',    0, 'cross',    0, 'alternate', 100, 'reverse'}

{276.0, 1, outCirc, - 50, 'split', - 50, 'cross',   50, 'alternate', 100, 'reverse'}
{277.0, 1, outCirc,    0, 'split', -100, 'cross',    0, 'alternate', 100, 'reverse'}
{278.0, 1, outCirc,    0, 'split',    0, 'cross',    0, 'alternate',   0, 'reverse'}


set
{184, 100, 'invert', plr = 1}
{184, 100, 'reverse', 100, 'flip', plr = 2}
{188, 100, 'reverse', 100, 'flip', -100, 'invert', plr = 1}
{192,   0, 'reverse', 0, 'flip', plr = 2}
{196,   0, 'reverse', 0, 'flip', 100, 'invert'}
{215,   0, 'invert'}

{212.5, 0, 'beat'}



----------
-- shit --
----------
ease {311, 0.5, outCirc, 0, 'zoom'}




ease
{73, 1, pop, 150, 'tiny', 100, 'reverse', 100, 'invert', 90 * math.pi / 1.8, 'confusionzoffset'}
{281, 0.5, pop, 150, 'tiny', 100, 'reverse', 100, 'invert', 90 * math.pi / 1.8, 'confusionzoffset'}



{194, 4.25, function(t) return inSine(tap(t)) end, 35, 'stealth', -75, 'tiny'}


----------------
-- Spellcards --
----------------
card {  8,  22, 'Okay, first attempt',                            1, {   0 / 255, 255 / 255,   0 / 255 }}
card { 24,  38, 'Well we can always try again',                   1, {  50 / 255, 200 / 255,   0 / 255 }}
card { 41,  73, 'Attempt Number Two',                             3, { 100 / 255, 150 / 255,   0 / 255 }}
card { 73,  88, 'Third time\'s the charm?',                       5, { 150 / 255, 100 / 255,   0 / 255 }}
card { 88, 104, 'wow we suck at counting',                        8, { 200 / 255,  50 / 255,   0 / 255 }}
card {104, 136, 'Wait were the notes always this rainbow-y?',     9, { 255 / 255,   0 / 255,  50 / 255 }}
card {136, 169, 'Rainbow BG for the win',                        10, { 255 / 255,  50 / 255, 100 / 255 }}
card {169, 212, 'You\'re very close. Let\'s try one more time.',  4, { 200 / 255, 100 / 255, 150 / 255 }}
card {216, 248, 'the fuck you mean rainbow aft i cant see shit', 11, { 255 / 255, 255 / 255, 255 / 255 }}
card {248, 280, 'We really DO suck at counting.',                 7, { 255 / 255,   0 / 255,   0 / 255 }}
card {280, 310, 'More 24th gallops? Got it.',                    10, { 149 / 255,  82 / 255, 250 / 255 }}
card {310, 312, 'shit',                                          11, { 114 / 255,  43 / 255,  43 / 255 }}