local fonts = {}

local function create_fonts(font, size, weight, blursize)
	local main = "pretty_text_" .. size .. weight
	local blur = "pretty_text_blur_" .. size .. weight

	surface.CreateFont(
		main,
		{
			font = font,
			size = size,
			weight = weight,
			antialias	= true,
			additive		= true,
		}
	)

	surface.CreateFont(
		blur,
		{
			font = font,
			size = size,
			weight = weight,
			antialias	= true,
			blursize = blursize,
		}
	)

	return
	{
		main = main,
		blur = blur,
	}
end

local def_color1 = Color(255, 255, 255, 255)
local def_color2 = Color(0, 0, 0, 255)

local surface_SetFont = surface.SetFont
local surface_SetTextColor = surface.SetTextColor
local surface_SetTextPos = surface.SetTextPos
local surface_DrawText = surface.DrawText

function chatsounds_DrawPrettyText(text, x, y, font, size, weight, blursize, color1, color2)
	font = font or "Arial"
	size = size or 14
	weight = weight or 0
	blursize = blursize or 1
	color1 = color1 or def_color1
	color2 = color2 or def_color2

	fonts[font] = fonts[font] or {}
	fonts[font][size] = fonts[font][size] or {}
	fonts[font][size][weight] = fonts[font][size][weight] or {}
	fonts[font][size][weight][blursize] = fonts[font][size][weight][blursize] or create_fonts(font, size, weight, blursize)

	surface_SetFont(fonts[font][size][weight][blursize].blur)
	surface_SetTextColor(color2)

	for i = 1, 5 do
		surface_SetTextPos(x, y) -- this resets for some reason after drawing
		surface_DrawText(text)
	end

	surface_SetFont(fonts[font][size][weight][blursize].main)
	surface_SetTextColor(color1)
	surface_SetTextPos(x, y)
	surface_DrawText(text)
end
