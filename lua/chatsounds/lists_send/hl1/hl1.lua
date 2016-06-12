c.LoadCachedList("hl1_fvox","hl1fvox",1437315236,function()
	local ret = {}
	
local l=[[acquired
activated
ammo_depleted
antidote_shot
antitoxin_shot
armor_gone
automedic_on
beep
bell
bio_reading
biohazard_detected
bleeding_stopped
blip
blood_loss
blood_plasma
blood_toxins
boop
buzz
chemical_detected
deactivated
eighty
evacuate_area
fifteen
fifty
five
flatline
fourty
fuzz
health_critical
health_dropping
health_dropping2
heat_damage
hev_critical_fail
hev_damage
hev_general_fail
hev_shutdown
hiss
immediately
innsuficient_medical
internal_bleeding
major_fracture
major_lacerations
medical_repaired
minor_fracture
minor_lacerations
morphine_shot
near_death
ninety
onehundred
percent
power_below
power_level_is
power_restored
powermove_overload
radiation_detected
seek_medic
seventy
shock_damage
sixty
targetting_system
ten
thirty
torniquette_applied
twenty
voice_off
voice_on
warning
wound_sterilized]]

	for v in l:gmatch'[^\r\n]+' do
		local str_orig=v:gsub("_"," "):gsub("hev ","")
		local str_expl="hev "..str_orig
		local snd="hl1/fvox/" .. v..'.wav'
		local tbl = {
						path = snd,
						length = SoundDuration(snd),
					}
		local tbl2={path=tbl.path,length=tbl.length}
		
		ret[str_expl] = tbl
		ret[str_orig] = tbl2
		
	end
	return ret
end)
