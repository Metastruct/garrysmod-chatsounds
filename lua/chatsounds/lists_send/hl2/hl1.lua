c.LoadCachedList("hl1_fvox","hl1fvox",1408308871,function()
	local ret = {}
	
	local t=file.Find("sound/fvox/*.wav",'GAME')

	for k,v in next,t do
		local str="hev "..v:gsub("%.wav",""):gsub("_"," "):gsub("hev ","")
		local snd="fvox/" .. v
		local tbl = {
						path = snd,
						length = SoundDuration(snd),
					}
		
		ret[str] = tbl
		
	end
	return ret
end)
