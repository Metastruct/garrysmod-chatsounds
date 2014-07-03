


c.StartList("random")
	L.skip_random = true -- this only has one sound so far, so skip the entire default list
	
	local nexttime=0
	local Now=RealTime

	L["random"] = {

		--skip_random = true,

		{path = ""},
		pre = function(chtsnd)
			local c=chatsounds
			
			local t=Now()
			if nexttime>t+0.8 then -- allow only 2 randoms within this timespan
				return
			end
			if nexttime<t then nexttime=t end
			nexttime=nexttime+0.7
		
			chtsnd:SetSeed(chtsnd:GetSeed() .. chtsnd:GetIndex())


			local sound = c.GetRandomSoundFromLists(chtsnd:GetSeed())

			chtsnd:SetSoundPath(sound.path)
			chtsnd:SetPitch(c.GeneratePitch(sound, chtsnd:GetSeed()))
			chtsnd:SetDuration(c.GetSoundDuration(sound.path))
		end,
	}
c.EndList()


c.StartList("default")
	L["im going to gut you like a cornish game hen"] = {
		{
			path = "vo/taunts/spy_taunts02.wav",
			length = 3.1056690216064,
		},
	}

	L["im in the middle of a critical test"] = {
		{
			path = "vo/trainyard/kl_whatisit02.wav",
			length = 2.4687528610229,
		},
	}

	L["a predictable failure doctor freeman"] = {
		{
			path = "vo/Citadel/br_mock04.wav",
			length = 3.5630612373352,
		},
	}

	L["prepare for unforeseen consequences"] = {
		{
			path = "vo/outland_11a/silo/al_silo_prepare02.wav",
			length = 2.8666665554047,
		},
	}

	L["i appear to have burst into flames"] = {
		{
			path = "vo/spy_autoonfire01.wav",
			length = 1.840181350708,
		},
	}

	L["im running in circles around you"] = {
		{
			path = "vo/taunts/scout_taunts01.wav",
			length = 1.5557370185852,
		},
	}

	L["im runnin in circles around you"] = {
		{
			path = "vo/taunts/scout_taunts01.wav",
			length = 1.5557370185852,
		},
	}

	L["what am i supposed to do about it"] = {
		{
			path = "vo/npc/female01/answer29.wav",
			length = 1.2367347478867,
		},
	}

	L["im runnin in circles around ya"] = {
		{
			path = "vo/taunts/scout_taunts01.wav",
			length = 1.5557370185852,
		},
	}

	L["there is no such thing as an ar3"] = {
		{
			path = "vo/outland_11a/silo/reb_silo_reb_art3.wav",
			length = 3.191995382309,
		},
	}

	L["theres no such thing as an ar3"] = {
		{
			path = "vo/outland_11a/silo/reb_silo_reb_art3.wav",
			length = 3.191995382309,
		},
	}

	L["i never really was on your side"] = {
		{
			path = "vo/spy_specialcompleted07.wav",
			length = 1.9446711540222,
		},
	}

	L["what do you think youre doing"] = {
		{
			path = "vo/Citadel/br_judithwhat.wav",
			length = 2.2969160079956,
		},
	}

	L["pick up some stuff and toss it"] = {
		{
			path = "vo/eli_lab/al_pickuptoss.wav",
			length = 1.1722902059555,
		},
	}

	L["hurry up or ill do it myself"] = {
		{
			path = "vo/outland_12a/launch/mag_launch_doitmyself.wav",
			length = 1.9621769189835,
		},
	}

	L["im running circles around ya"] = {
		{
			path = "vo/taunts/scout_taunts01.wav",
			length = 1.5557370185852,
		},
	}

	L["magnusson, did you hear that"] = {
	}

	L["yes judith, snd = what is it"] = {
	}

	L["i wouldnt say that too loud"] = {
		{
			path = "vo/npc/female01/answer10.wav",
			length = 1.3513605594635,
		},
		{
			path = "vo/npc/male01/answer10.wav",
			length = 1.8621768951416,
		},
	}

	L["ive got a rocket to launch"] = {
		{
			path = "vo/outland_12a/launch/mag_launch_chitchat02.wav",
			length = 1.4570294618607,
		},
	}

	L["hunters with our bare hands"] = {
		{
			path = "vo/outland_11a/silo/reb_silo_reb_art10.wav",
			length = 10.06934261322,
		},
	}

	L["just launch the damn thing"] = {
		{
			path = "vo/outland_12a/launch/mag_launch_whose.wav",
			length = 2.1130611896515,
		},
	}

	L["i agree its a total waste"] = {
		{
			path = "vo/Citadel/br_newleader_a.wav",
			length = 1.9964399337769,
		},
	}

	L["whats the meaning of this"] = {
		{
			path = "vo/k_lab/br_tele_02.wav",
			length = 1.0708390474319,
		},
	}

	L["about that beer i owed ya"] = {
		{
			path = "vo/trainyard/ba_thatbeer02.wav",
			length = 2.0448071956635,
		},
	}

	L["there is no time to waste"] = {
		{
			path = "vo/outland_01/intro/mag_transmit_nowaste01.wav",
			length = 1.5469161272049,
		},
	}

	L["i wonder where hes going"] = {
		{
			path = "vo/Citadel/al_wonderwhere.wav",
			length = 1.3431745767593,
		},
	}

	L["would you come over here"] = {
		{
			path = "npc/turret_floor/turret_autosearch_6.wav",
			length = 2.5866665840149,
		},
		post = function(chtsnd) chtsnd:GetPlayer():DoAnimationEvent( ACT_GMOD_GESTURE_BECON ) end,
	}

	L["i do believe im on fire"] = {
		{
			path = "vo/spy_autoonfire03.wav",
			length = 1.3612698316574,
		},
	}

	L["now ive seen everything"] = {
		{
			path = "vo/engineer_autodejectedtie02.wav",
			length = 1.607981801033,
		},
	}

	L["not so tough now are you"] = {
		{
			path = "vo/taunts/scout_taunts04.wav",
			length = 1.9214512109756,
		},
	}

	L["i can hardly believe it"] = {
		{
			path = "vo/outland_01/intro/eli_transmit_believe03.wav",
			length = 1.4906802177429,
		},
	}

	L["are you sure about that"] = {
		{
			path = "vo/npc/male01/answer37.wav",
			length = 0.71079367399216,
		},
	}

	L["what are you looking at"] = {
		{
			path = "vo/taunts/scout_taunts10.wav",
			length = 0.84752833843231,
		},
	}

	L["thats enough chit chat"] = {
		{
			path = "vo/outland_12a/launch/mag_launch_chitchat01.wav",
			length = 2.6238095760345,
		},
	}

	L["sandwich make me strong"] = {
		{
			path = "vo/heavy_sandwichtaunt03.wav",
			length = 3.1306803226471,
		},
	}

	L["i cant take it anymore"] = {
		{
			path = "vo/trainyard/wife_canttake.wav",
			length = 1.5496145486832,
		},
	}

	L["unforeseen consequences"] = {
		{
			path = "vo/outland_11a/silo/eli_silo_talk01.wav",
			length = 3.2266666889191,
		},
	}

	L["watch what youre doing"] = {
		{
			path = "vo/npc/female01/watchwhat.wav",
			length = 1.1290702819824,
		},
	}

	L["who wants some of this"] = {
		{
			path = "vo/taunts/scout_taunts07.wav",
			length = 1.0390930175781,
		},
	}

	L["spy sapping mah sentry"] = {
		{
			path = "vo/engineer_autoattackedbyspy03.wav",
			length = 1.8227664232254,
		},
	}

	L["stop youre killing me"] = {
		{
			path = "vo/npc/female01/vanswer13.wav",
			length = 1.2518140077591,
		},
	}

	L["why are you telling me"] = {
		{
			path = "vo/npc/male01/answer24.wav",
			length = 1.1542630195618,
		},
	}

	L["i said pick up the can"] = {
		{
			path = "npc/metropolice/vo/pickupthecan3.wav",
			length = 1.2824490070343,
		},
	}

	L["spy sappin mah sentry"] = {
		{
			path = "vo/engineer_autoattackedbyspy03.wav",
			length = 1.8227664232254,
		},
	}

	L["im gonna headbutt you"] = {
		{
			path = "vo/taunts/scout_taunts05.wav",
			length = 3.0534241199493,
		},
	}

	L["spy sappin mah sentry"] = {
		{
			path = "vo/engineer_autoattackedbyspy03.wav",
			length = 1.8227664232254,
		},
	}

	L["spy sapping my sentry"] = {
		{
			path = "vo/engineer_autoattackedbyspy03.wav",
			length = 1.8227664232254,
		},
	}

	L["listen here magnusson"] = {
		{
			path = "vo/outland_11a/silo/kl_silo_nowmag01.wav",
			length = 2.5493423938751,
		},
	}

	L["spy sappin my sentry"] = {
		{
			path = "vo/engineer_autoattackedbyspy03.wav",
			length = 1.8227664232254,
		},
	}

	L["im gonna headbut you"] = {
		{
			path = "vo/taunts/scout_taunts05.wav",
			length = 3.0534241199493,
		},
	}

	L["need a dispenser here"] = {
		{
			path = "vo/scout_needdispenser01.wav",
			length = 1.1639002561569,
		},
	}

	L["i love you sweetheart"] = {
		{
			path = "vo/outland_12a/launch/eli_launch_iloveyousweet.wav",
			length = 1.4729704856873,
		},
	}

	L["spy sapping ma sentry"] = {
		{
			path = "vo/engineer_autoattackedbyspy03.wav",
			length = 1.8227664232254,
		},
	}

	L["im gonna headbutt ya"] = {
		{
			path = "vo/taunts/scout_taunts05.wav",
			length = 3.0534241199493,
		},
	}

	L["spy sappin ma sentry"] = {
		{
			path = "vo/engineer_autoattackedbyspy03.wav",
			length = 1.8227664232254,
		},
	}

	L["dont drink the water"] = {
		{
			path = "vo/trainyard/cit_water.wav",
			length = 5.9684352874756,
		},
	}

	L["i know what you mean"] = {
		{
			path = "vo/npc/male01/answer08.wav",
			length = 0.73981857299805,
		},
	}

	L["ongoing sector sweep"] = {
		{
			path = "vo/outland_01/intro/over_camp.wav",
			length = 19.551156997681,
		},
	}

	L["im gonna headbut ya"] = {
		{
			path = "vo/taunts/scout_taunts05.wav",
			length = 3.0534241199493,
		},
	}

	L["spy sappin my sentry"] = {
		{
			path = "vo/engineer_autoattackedbyspy03.wav",
			length = 1.8227664232254,
		},
	}

	L["you got that from me"] = {
		{
			path = "vo/npc/female01/vanswer06.wav",
			length = 1.1538321971893,
		},
	}

	L["spy sappin ma sentry"] = {
		{
			path = "vo/engineer_autoattackedbyspy03.wav",
			length = 1.8227664232254,
		},
	}

	L["are you still there"] = {
		{
			path = "npc/turret_floor/turret_search_1.wav",
			length = 1.6268254518509,
		},
	}

	L["sorry for the scare"] = {
		{
			path = "vo/trainyard/ba_sorryscare.wav",
			length = 3.1238322257996,
		},
	}

	L["moist and delicious"] = {
		{
			path = "vo/heavy_sandwichtaunt02.wav",
			length = 2.8773469924927,
		},
	}

	L["say that to my face"] = {
		{
			path = "vo/taunts/scout_taunts03.wav",
			length = 2.4264853000641,
		},
	}

	L["magnusson is smart"] = {
		{
			path = "vo/outland_11a/silo/vort_silo_maghonor02.wav",
			length = 5.1202721595764,
		},
	}

	L["who touched my gun"] = {
		{
			path = "vo/taunts/heavy_taunts06.wav",
			length = 2.5251700878143,
		},
	}

	L["im coming for you"] = {
		{
			path = "vo/taunts/spy_taunts10.wav",
			length = 1.8750113248825,
		},
	}

	L["im talking to you"] = {
		{
			path = "vo/breencast/br_tofreeman02.wav",
			length = 2.1296372413635,
		},
	}

	L["put it over there"] = {
		{
			path = "vo/Citadel/br_gravgun.wav",
			length = 1.9662585258484,
		},
	}

	L["wheres your ball"] = {
		{
			path = "vo/eli_lab/al_wheresball.wav",
			length = 0.99913829565048,
		},
	}

	L["visit your mother"] = {
		{
			path = "vo/spy_DominationScout01.wav",
			length = 2.2106802463531,
		},
	}

	L["run for your life"] = {
		{
			path = "vo/npc/female01/runforyourlife02.wav",
			length = 1.4856916666031,
		},
	}

	L["youre all losers"] = {
		{
			path = "vo/taunts/scout_taunts13.wav",
			length = 1.0681178569794,
		},
	}

	L["start praying boy"] = {
		{
			path = "vo/taunts/engineer_taunts08.wav",
			length = 1.6021769046783,
		},
	}

	L["we have lift off"] = {
		{
			path = "vo/outland_12a/launch/mag_launch_launchsequence07.wav",
			length = 4.2610430717468,
		},
	}

	L["this is bullshit"] = {
		{
			path = "vo/npc/female01/question26.wav",
			length = 1.0009070634842,
		},
	}

	L["i dont hate you"] = {
		{
			path = "npc/turret_floor/turret_disabled_6.wav",
			length = 1.8053514957428,
		},
	}

	L["whats the point"] = {
		{
			path = "vo/npc/female01/gordead_ans12.wav",
			length = 0.91585034132004,
		},
	}

	L["pick up that can"] = {
		{
			path = "npc/metropolice/vo/pickupthecan1.wav",
			length = 0.82399094104767,
		},
	}

	L["its safer here"] = {
		{
			path = "vo/breencast/br_welcome07.wav",
			length = 1.2229478359222,
		},
	}

	L["can you hear me"] = {
		{
			path = "vo/aperture_ai/post_escape_bridge_02.wav",
			length = 0.83591836690903,
		},
	}

	L["hes right here"] = {
		{
			path = "vo/eli_lab/al_heshere.wav",
			length = 0.65469390153885,
		},
	}

	L["pick up the can"] = {
		{
			path = "npc/metropolice/vo/pickupthecan2.wav",
			length = 1.4770067930222,
		},
	}

	L["were launching"] = {
		{
			path = "vo/outland_12a/launch/mag_launch_launchsequence05.wav",
			length = 1.1270067691803,
		},
	}

	L["my rocket works"] = {
		{
			path = "vo/outland_12a/launch/mag_launch_launchsequence09a.wav",
			length = 3.5990250110626,
		},
	}

	L["whats going on"] = {
		{
			path = "vo/k_lab/al_whatsgoingon.wav",
			length = 0.88210886716843,
		},
	}

	L["you never know"] = {
		{
			path = "vo/npc/male01/answer22.wav",
			length = 0.76256233453751,
		},
	}

	L["om nom nom nom"] = {
		{
			path = "vo/SandwichEat09.wav",
			length = 2.066757440567,
		},
	}

	L["thank you baby"] = {
		{
			path = "vo/outland_11a/silo/eli_silo_thankyou02.wav",
			length = 0.75464850664139,
		},
	}

	L["i love you dad"] = {
		{
			path = "vo/outland_12a/launch/al_launch_iloveyoudad.wav",
			length = 1.8347618579865,
		},
	}

	L["rise and shine"] = {
		{
			path = "vo/gman_misc/gman_riseshine.wav",
			length = 6.6548752784729,
		},
	}

	L["pissing me off"] = {
		{
			path = "vo/k_lab/ba_pissinmeoff.wav",
			length = 1.4620407819748,
		},
	}

	L["fire fire fire"] = {
		{
			path = "vo/spy_autoonfire02.wav",
			length = 1.3554648160934,
		},
	}

	L["ill stay here"] = {
		{
			path = "vo/npc/female01/illstayhere01.wav",
			length = 0.79528343677521,
		},
	}

	L["can i help you"] = {
		{
			path = "npc/turret_floor/turret_search_3.wav",
			length = 1.3307029008865,
		},
	}

	L["we trusted you"] = {
		{
			path = "vo/npc/male01/wetrustedyou01.wav",
			length = 1.2233107089996,
		},
		{
			path = "vo/npc/male01/wetrustedyou02.wav",
			length = 1.0182086229324,
		},
	}

	L["it is sad day"] = {
		{
			path = "vo/heavy_jeers05.wav",
			length = 2.6935148239136,
		},
	}

	L["stop shooting"] = {
		{
			path = "npc/turret_floor/turret_shotat_3.wav",
			length = 1.4080045223236,
		},
	}

	L["thanks pallie"] = {
		{
			path = "vo/scout_thanks01.wav",
			length = 0.81560093164444,
		},
	}

	L["where are you"] = {
		{
			path = "vo/outland_06a/radio/mag_rad_expectedyou03.wav",
			length = 1.1549205780029,
		},
	}

	L["only a button"] = {
		{
			path = "vo/outland_12a/launch/mag_launch_onlyabutton.wav",
			length = 5.3406801223755,
		},
	}

	L["be right back"] = {
		{
			path = "vo/outland_11a/silo/al_silo_keepeye01.wav",
			length = 1.7078911066055,
		},
	}

	L["speak english"] = {
		{
			path = "vo/npc/female01/vanswer05.wav",
			length = 1.0966893434525,
		},
	}

	L["engineerlaugh"] = {
		{
			path = "vo/engineer_laughevil01.wav",
			length = 1.2074376344681,
		},
		{
			path = "vo/engineer_laughevil02.wav",
			length = 2.0027210712433,
		},
		{
			path = "vo/engineer_laughevil03.wav",
			length = 1.1784126758575,
		},
		{
			path = "vo/engineer_laughevil04.wav",
			length = 1.3438549041748,
		},
		{
			path = "vo/engineer_laughevil05.wav",
			length = 0.83591836690903,
		},
		{
			path = "vo/engineer_laughevil06.wav",
			length = 1.8111565113068,
		},
		{
			path = "vo/engineer_laughhappy01.wav",
			length = 2.0433559417725,
		},
		{
			path = "vo/engineer_laughhappy02.wav",
			length = 1.840181350708,
		},
		{
			path = "vo/engineer_laughhappy03.wav",
			length = 1.683446764946,
		},
		{
			path = "vo/engineer_laughlong01.wav",
			length = 4.6207709312439,
		},
		{
			path = "vo/engineer_laughshort01.wav",
			length = 1.5615419149399,
		},
		{
			path = "vo/engineer_laughshort02.wav",
			length = 1.4077097177505,
		},
		{
			path = "vo/engineer_laughshort03.wav",
			length = 1.219047665596,
		},
		{
			path = "vo/engineer_laughshort04.wav",
			length = 0.96362811326981,
		},
	}

	L["there you are"] = {
		{
			path = "npc/turret_floor/turret_active_7.wav",
			length = 1.7066667079926,
		},
		{
			path = "npc/turret_floor/turret_deploy_5.wav",
			length = 1.9866666793823,
		},
	}

	L["serve mankind"] = {
		{
			path = "vo/breencast/br_tofreeman12.wav",
			length = 1.429093003273,
		},
	}

	L["what was that"] = {
		{
			path = "vo/outland_01/intro/al_rbed_whatthat.wav",
			length = 0.80000001192093,
		},
	}

	L["rest my child"] = {
		{
			path = "vo/ravenholm/monk_kill03.wav",
			length = 2.0033559799194,
		},
	}

	L["what the hell"] = {
		{
			path = "vo/k_lab/ba_whatthehell.wav",
			length = 0.87698411941528,
		},
	}

	L["spy gentlemen"] = {
		{
			path = "vo/spy_cloakedspy03.wav",
			length = 1.0042630434036,
		},
	}

	L["just a minute"] = {
		{
			path = "vo/k_lab2/kl_cantleavelamarr.wav",
			length = 0.81589567661285,
		},
	}

	L["shut it down"] = {
		{
			path = "vo/k_lab/eli_shutdown.wav",
			length = 1.4982086420059,
		},
	}

	L["im with you"] = {
		{
			path = "vo/npc/male01/answer13.wav",
			length = 0.76950114965439,
		},
	}

	L["funny scream"] = {
		{
			path = "vo/ravenholm/monk_death07.wav",
			length = 6.0781860351563,
		},
	}

	L["im a genius"] = {
		{
			path = "vo/outland_12a/launch/mag_launch_launchsequence09b.wav",
			length = 5.1043086051941,
		},
	}

	L["check it out"] = {
		{
			path = "vo/outland_11a/magtraining/mirt_brief_yanktrunk01.wav",
			length = 0.61036282777786,
		},
	}

	L["there you go"] = {
		{
			path = "vo/outland_11a/magtraining/mag_tutor_nottoohard01.wav",
			length = 1.1536281108856,
		},
	}

	L["oh my god no"] = {
		{
			path = "vo/outland_12a/launch/al_launch_impaling01_alt2.wav",
			length = 1.8693196773529,
		},
	}

	L["oktober fest"] = {
		{
			path = "vo/medic_cheers06.wav",
			length = 1.8750113248825,
		},
		{
			path = "vo/taunts/medic_taunts16.wav",
			length = 3.4634921550751,
		},
	}

	L["im not deaf"] = {
		{
			path = "vo/outland_01/intro/mag_transmit_whatnow.wav",
			length = 2.9839682579041,
		},
	}

	L["gutwrenching"] = {
		{
			path = "npc/fast_zombie/fz_scream1.wav",
			length = 1.6591383218765,
		},
	}

	L["october fest"] = {
		{
			path = "vo/medic_cheers06.wav",
			length = 1.8750113248825,
		},
		{
			path = "vo/taunts/medic_taunts16.wav",
			length = 3.4634921550751,
		},
	}

	L["ok im ready"] = {
		{
			path = "vo/npc/male01/okimready03.wav",
			length = 1.0902267694473,
		},
		{
			path = "vo/npc/male01/okimready02.wav",
			length = 0.75725620985031,
		},
		{
			path = "vo/npc/male01/okimready01.wav",
			length = 0.93755102157593,
		},
		{
			path = "vo/npc/female01/okimready03.wav",
			length = 0.95346939563751,
		},
		{
			path = "vo/npc/female01/okimready02.wav",
			length = 0.97741496562958,
		},
		{
			path = "vo/npc/female01/okimready01.wav",
			length = 0.85551017522812,
		},
	}

	L["steamfriends"] = {
		{
			path = "friends/message.wav",
			length = 0.47891157865524,
		},
	}

	L["soliderlaugh"] = {
		{
			path = "vo/soldier_laughevil01.wav",
			length = 1.7124716043472,
		},
		{
			path = "vo/soldier_laughevil02.wav",
			length = 1.7531065940857,
		},
		{
			path = "vo/soldier_laughevil03.wav",
			length = 0.67337870597839,
		},
		{
			path = "vo/soldier_laughhappy01.wav",
			length = 1.3699773550034,
		},
		{
			path = "vo/soldier_laughhappy02.wav",
			length = 1.2248525619507,
		},
		{
			path = "vo/soldier_laughhappy03.wav",
			length = 2.1014058589935,
		},
		{
			path = "vo/soldier_laughlong01.wav",
			length = 3.4713833332062,
		},
		{
			path = "vo/soldier_laughlong02.wav",
			length = 4.8297505378723,
		},
		{
			path = "vo/soldier_laughlong03.wav",
			length = 4.0867118835449,
		},
		{
			path = "vo/soldier_laughshort01.wav",
			length = 1.152290225029,
		},
		{
			path = "vo/soldier_laughshort02.wav",
			length = 1.2712925672531,
		},
		{
			path = "vo/soldier_laughshort03.wav",
			length = 0.37732425332069,
		},
		{
			path = "vo/soldier_laughshort04.wav",
			length = 1.0797278881073,
		},
	}

	L["fiddlesticks"] = {
		{
			path = "vo/k_lab/kl_fiddlesticks.wav",
			length = 2.2442629337311,
		},
	}

	L["head humpers"] = {
		{
			path = "vo/npc/barney/ba_headhumpers.wav",
			length = 1.2460770606995,
		},
	}

	L["okadpowpoqwk"] = {
		{
			path = "vo/Breencast/br_overwatch07.wav",
			length = 48.456371307373,
		},
	}

	L["lead the way"] = {
		{
			path = "vo/npc/female01/leadtheway01.wav",
			length = 0.83446711301804,
		},
		{
			path = "vo/npc/female01/leadtheway02.wav",
			length = 0.84172338247299,
		},
		{
			path = "vo/npc/male01/leadtheway01.wav",
			length = 0.8376190662384,
		},
		{
			path = "vo/npc/male01/leadtheway02.wav",
			length = 0.66115647554398,
		},
	}

	L["what is that"] = {
		{
			path = "vo/aperture_ai/escape_02_sphere_curiosity-02.wav",
			length = 0.7343310713768,
		},
	}

	L["portal storm"] = {
		{
			path = "vo/outland_01/intro/al_rbed_aportalstorm.wav",
			length = 1.3120181560516,
		},
	}

	L["life support"] = {
		{
			path = "vo/outland_07/barn/al_barn_lifesupport02.wav",
			length = 0.86934238672256,
		},
	}

	L["ok lets go"] = {
		{
			path = "radio/go.wav",
			length = 1.3682539463043,
		},
	}

	L["put me down"] = {
		{
			path = "npc/turret_floor/turret_pickup_3.wav",
			length = 2.0480046272278,
		},
	}

	L["you need me"] = {
		{
			path = "vo/Citadel/br_youneedme.wav",
			length = 1.5195918083191,
		},
	}

	L["this is bad"] = {
		{
			path = "vo/npc/male01/gordead_ques10.wav",
			length = 0.70736962556839,
		},
	}

	L["so what now"] = {
		{
			path = "vo/outland_11a/silo/reb1_idles01.wav",
			length = 1.7066667079926,
		},
	}

	L["oktoberfest"] = {
		{
			path = "vo/medic_cheers06.wav",
			length = 1.8750113248825,
		},
		{
			path = "vo/taunts/medic_taunts16.wav",
			length = 3.4634921550751,
		},
	}

	L["god damn it"] = {
		{
			path = "vo/outland_12/reb1_lastwaveannounced03.wav",
			length = 4.4373469352722,
		},
	}

	L["get in here"] = {
		{
			path = "vo/canals/matt_getin.wav",
			length = 0.9745124578476,
		},
	}

	L["vital alert"] = {
		{
			path = "vo/outland_07/barn/over_barn.wav",
			length = 17.507823944092,
		},
	}

	L["fascinating"] = {
		{
			path = "vo/k_lab2/kl_slowteleport01.wav",
			length = 1.5657823085785,
		},
	}

	L["octoberfest"] = {
		{
			path = "vo/medic_cheers06.wav",
			length = 1.8750113248825,
		},
		{
			path = "vo/taunts/medic_taunts16.wav",
			length = 3.4634921550751,
		},
	}

	L["dont shoot"] = {
		{
			path = "npc/turret_floor/turret_shotat_2.wav",
			length = 1.3653514385223,
		},
	}

	L["great scott"] = {
		{
			path = "vo/k_lab2/kl_greatscott.wav",
			length = 1.6252380609512,
		},
	}

	L["headhumpers"] = {
		{
			path = "vo/npc/barney/ba_headhumpers.wav",
			length = 1.2460770606995,
		},
	}

	L["its a trap"] = {
		{
			path = "vo/outland_10/olde-inne/al_inn_trap.wav",
			length = 1.0026757717133,
		},
	}

	L["sniperlaugh"] = {
		{
			path = "vo/sniper_laughlong02.wav",
			length = 3.1927437782288,
		},
		{
			path = "vo/sniper_laughlong01.wav",
			length = 5.2477097511292,
		},
		{
			path = "vo/sniper_laughhappy02.wav",
			length = 0.80108845233917,
		},
		{
			path = "vo/sniper_laughhappy01.wav",
			length = 1.1842176914215,
		},
		{
			path = "vo/sniper_laughevil03.wav",
			length = 1.4396371841431,
		},
		{
			path = "vo/sniper_laughevil02.wav",
			length = 1.904036283493,
		},
		{
			path = "vo/sniper_laughevil01.wav",
			length = 2.1246259212494,
		},
	}

	L["sounds good"] = {
		{
			path = "vo/episode_1/c17/al_evac_soundsgood01.wav",
			length = 0.78657597303391,
		},
	}

	L["there he is"] = {
		{
			path = "vo/k_lab/ba_thereheis.wav",
			length = 0.79578232765198,
		},
	}

	L["who are you"] = {
		{
			path = "vo/k_lab/br_tele_03.wav",
			length = 1.0629024505615,
		},
	}

	L["one for me"] = {
		{
			path = "vo/npc/male01/oneforme.wav",
			length = 2.6738774776459,
		},
	}

	L["cut it out"] = {
		{
			path = "vo/trainyard/female01/cit_hit01.wav",
			length = 1.2171655893326,
		},
		{
			path = "vo/trainyard/male01/cit_hit01.wav",
			length = 0.78965985774994,
		},
	}

	L["had enough"] = {
		{
			path = "vo/outland_11a/magtraining/mag_tutor_hadenough.wav",
			length = 1.0288435220718,
		},
	}

	L["scoutlaugh"] = {
		{
			path = "vo/scout_laughlong02.wav",
			length = 4.7717008590698,
		},
		{
			path = "vo/scout_laughlong01.wav",
			length = 5.7469387054443,
		},
		{
			path = "vo/scout_laughhappy01.wav",
			length = 0.96943312883377,
		},
		{
			path = "vo/scout_laughhappy02.wav",
			length = 5.3870296478271,
		},
		{
			path = "vo/scout_laughhappy03.wav",
			length = 1.4338321685791,
		},
		{
			path = "vo/scout_laughhappy04.wav",
			length = 1.448344707489,
		},
	}

	L["heavysing2"] = {
		{
			path = "vo/heavy_cheers07.wav",
			length = 4.4001812934875,
		},
	}

	L["heavysing4"] = {
		{
			path = "vo/heavy_singing02.wav",
			length = 5.2693424224854,
		},
	}

	L["god dammit"] = {
		{
			path = "vo/outland_12/reb1_lastwaveannounced03.wav",
			length = 4.4373469352722,
		},
	}

	L["heavylaugh"] = {
		{
			path = "vo/heavy_laughlong02.wav",
			length = 3.1230838298798,
		},
		{
			path = "vo/heavy_laughlong01.wav",
			length = 6.5015873908997,
		},
		{
			path = "vo/heavy_laughhappy05.wav",
			length = 2.0259411334991,
		},
		{
			path = "vo/heavy_laughhappy01.wav",
			length = 1.155192732811,
		},
		{
			path = "vo/heavy_laughhappy02.wav",
			length = 2.1652607917786,
		},
		{
			path = "vo/heavy_laughhappy03.wav",
			length = 2.6935148239136,
		},
		{
			path = "vo/heavy_laughhappy04.wav",
			length = 1.9446711540222,
		},
	}
	
	L["dont shoot"] = {
		{
			path = "npc/turret_floor/turret_shotat_2.wav",
			length = 1.3653514385223,
		},
	}

	L["heavysing6"] = {
		{
			path = "vo/heavy_singing04.wav",
			length = 3.8346712589264,
		},
	}

	L["heavysing7"] = {
		{
			path = "vo/heavy_singing05.wav",
			length = 4.570680141449,
		},
	}

	L["i love you"] = {
		{
			path = "vo/episode_1/intro/al_dadiloveyou02.wav",
			length = 0.85603177547455,
		},
	}

	L["heavysing3"] = {
		{
			path = "vo/heavy_singing01.wav",
			length = 4.6720180511475,
		},
	}

	L["all aboard"] = {
		{
			path = "vo/episode_1/c17/al_finale_allaboard.wav",
			length = 0.8489795923233,
		},
	}

	L["mediclaugh"] = {
		{
			path = "vo/medic_laughevil01.wav",
			length = 0.91428571939468,
		},
		{
			path = "vo/medic_laughevil02.wav",
			length = 0.81560093164444,
		},
		{
			path = "vo/medic_laughevil03.wav",
			length = 1.0594104528427,
		},
		{
			path = "vo/medic_laughevil04.wav",
			length = 4.2724714279175,
		},
		{
			path = "vo/medic_laughevil05.wav",
			length = 3.0882539749146,
		},
		{
			path = "vo/medic_laughhappy01.wav",
			length = 3.4249432086945,
		},
		{
			path = "vo/medic_laughhappy02.wav",
			length = 3.0882539749146,
		},
		{
			path = "vo/medic_laughhappy03.wav",
			length = 1.9214512109756,
		},
		{
			path = "vo/medic_laughlong01.wav",
			length = 3.7616326808929,
		},
		{
			path = "vo/medic_laughlong02.wav",
			length = 6.5596370697021,
		},
		{
			path = "vo/medic_laughshort01.wav",
			length = 0.56308388710022,
		},
		{
			path = "vo/medic_laughshort02.wav",
			length = 0.71111112833023,
		},
		{
			path = "vo/medic_laughshort03.wav",
			length = 0.94621312618256,
		},
	}

	L["just a min"] = {
		{
			path = "vo/k_lab2/kl_cantleavelamarr.wav",
			length = 0.81589567661285,
		},
	}

	L["real scary"] = {
		{
			path = "vo/taunts/scout_taunts02.wav",
			length = 2.0259411334991,
		},
	}

	L["girlscream"] = {
		{
			path = "vo/episode_1/c17/al_elev_zombiesurprise.wav",
			length = 0.46882086992264,
		},
	}

	L["cant talk"] = {
		{
			path = "vo/trainyard/male01/cit_pedestrian03.wav",
			length = 2.5875964164734,
		},
	}

	L["heavysing1"] = {
		{
			path = "vo/heavy_cheers08.wav",
			length = 6.7105669975281,
		},
	}

	L["heavysing5"] = {
		{
			path = "vo/heavy_singing03.wav",
			length = 3.2106802463531,
		},
	}

	L["*tf2cheer*"] = {
		{
			path = "misc/happy_birthday.wav",
			length = 7.5638999938965,
		},
		{
			path = "vo/engineer_cheers01.wav",
			length = 1.387392282486,
		},
		{
			path = "vo/engineer_cheers02.wav",
			length = 1.8808163404465,
		},
		{
			path = "vo/engineer_cheers07.wav",
			length = 3.3320634365082,
		},
		{
			path = "vo/heavy_cheers01.wav",
			length = 1.3438549041748,
		},
		{
			path = "vo/heavy_cheers02.wav",
			length = 1.6428117752075,
		},
		{
			path = "vo/heavy_cheers04.wav",
			length = 1.9562811851501,
		},
		{
			path = "vo/heavy_cheers07.wav",
			length = 4.4001812934875,
		},
		{
			path = "vo/heavy_cheers08.wav",
			length = 6.7105669975281,
		},
		{
			path = "vo/medic_cheers01.wav",
			length = 1.0216779708862,
		},
		{
			path = "vo/pyro_cheers01.wav",
			length = 1.0133333206177,
		},
		{
			path = "vo/scout_cheers01.wav",
			length = 0.79528343677521,
		},
		{
			path = "vo/scout_cheers03.wav",
			length = 0.92879819869995,
		},
		{
			path = "vo/scout_cheers06.wav",
			length = 0.88235825300217,
		},
		{
			path = "vo/sniper_cheers01.wav",
			length = 0.98684805631638,
		},
		{
			path = "vo/sniper_cheers05.wav",
			length = 1.5325169563293,
		},
		{
			path = "vo/sniper_cheers07.wav",
			length = 1.149387717247,
		},
		{
			path = "vo/sniper_cheers08.wav",
			length = 1.381587266922,
		},
		{
			path = "vo/soldier_cheers05.wav",
			length = 1.1116553544998,
		},
		{
			path = "vo/soldier_cheers06.wav",
			length = 1.1232652664185,
		},
	}

	L["gee thanks"] = {
		{
			path = "vo/k_lab/ba_geethanks.wav",
			length = 0.83081632852554,
		},
	}

	L["god damnit"] = {
		{
			path = "vo/outland_12/reb1_lastwaveannounced03.wav",
			length = 4.4373469352722,
		},
	}

	L["good night"] = {
		{
			path = "npc/turret_floor/turret_retire_5.wav",
			length = 1.5786848068237,
		},
	}

	L["behind you"] = {
		{
			path = "vo/npc/female01/behindyou01.wav",
			length = 0.76770973205566,
		},
	}

	L["get going"] = {
		{
			path = "vo/canals/matt_go_nag04.wav",
			length = 0.76265305280685,
		},
	}

	L["excellent"] = {
		{
			path = "vo/eli_lab/al_excellent01.wav",
			length = 0.74814057350159,
		},
		{
			path = "vo/k_lab/kl_excellent.wav",
			length = 0.84414964914322,
		},
	}

	L["animorten"] = {
		{
			path = "vo/engineer_autoattackedbyspy03.wav",
			length = 1.8227664232254,
		},
		{
			path = "vo/npc/female01/yeah02.wav",
			length = 0.72489798069,
		},
		{
			path = "vo/medic_no01.wav",
			length = 0.53115648031235,
		},
		{
			path = "vo/npc/male01/yeah02.wav",
			length = 0.87521541118622,
		},
	}

	L["over here"] = {
		{
			path = "vo/streetwar/sniper/ba_overhere.wav",
			length = 1.1348526477814,
		},
		{
			path = "vo/trainyard/al_overhere.wav",
			length = 0.8297278881073,
		},
		post = function(chtsnd) chtsnd:GetPlayer():DoAnimationEvent( ACT_GMOD_GESTURE_BECON ) end,
	}

	L["thats it"] = {
		{
			path = "vo/k_lab/al_thatsit.wav",
			length = 0.61356008052826,
		},
	}

	L["rage quit"] = {
		{
			path = "vo/scout_domination19.wav",
			length = 2.6293423175812,
		},
	}

	L["attention"] = {
		{
			path = "vo/announcer_attention.wav",
			length = 1.6730386018753,
		},
	}

	L["wanna bet"] = {
		{
			path = "vo/npc/female01/answer27.wav",
			length = 0.5987074971199,
		},
	}

	L["headcrabs"] = {
		{
			path = "vo/npc/female01/headcrabs01.wav",
			length = 0.91501134634018,
		},
		{
			path = "vo/npc/female01/headcrabs02.wav",
			length = 0.83519273996353,
		},
		{
			path = "vo/npc/male01/headcrabs01.wav",
			length = 1.2759183645248,
		},
		{
			path = "vo/npc/male01/headcrabs02.wav",
			length = 0.82399094104767,
		},
	}

	L["nice shot"] = {
		{
			path = "vo/spy_niceshot01.wav",
			length = 0.86204081773758,
		},
		{
			path = "vo/soldier_niceshot01.wav",
			length = 0.83591836690903,
		},
		{
			path = "vo/sniper_niceshot01.wav",
			length = 0.61242628097534,
		},
		{
			path = "vo/scout_niceshot01.wav",
			length = 1.0013605356216,
		},
		{
			path = "vo/heavy_niceshot03.wav",
			length = 1.1697052717209,
		},
		{
			path = "vo/engineer_niceshot02.wav",
			length = 0.8591383099556,
		},
	}

	L["seventeen"] = {
		{
			path = "npc/metropolice/vo/seventeen.wav",
			length = 0.37743765115738,
		},
	}

	L["greetings"] = {
		{
			path = "vo/ravenholm/yard_greetings.wav",
			length = 4.4145579338074,
		},
	}

	L["same here"] = {
		{
			path = "vo/npc/male01/answer07.wav",
			length = 0.72655326128006,
		},
	}

	L["excuse me"] = {
		{
			path = "npc/turret_floor/turret_collide_2.wav",
			length = 1.161337852478,
		},
	}

	L["watch out"] = {
		{
			path = "vo/npc/female01/watchout.wav",
			length = 0.72707480192184,
		},
	}

	L["gentlemen"] = {
		{
			path = "vo/spy_battlecry01.wav",
			length = 0.72852605581284,
		},
	}

	L["stop that"] = {
		{
			path = "vo/trainyard/female01/cit_hit02.wav",
			length = 1.2171428203583,
		},
		{
			path = "vo/trainyard/male01/cit_hit02.wav",
			length = 0.92503398656845,
		},
	}

	L["haha yeah"] = {
		{
			path = "vo/outland_12/reb1_striderdown05.wav",
			length = 2.6026756763458,
		},
	}

	L["you idiot"] = {
		{
			path = "vo/outland_02/sheckley_idiot02.wav",
			length = 0.88478457927704,
		},
	}

	L["demolaugh"] = {
		{
			path = "vo/demoman_laughlong02.wav",
			length = 5.0503401756287,
		},
		{
			path = "vo/demoman_laughlong01.wav",
			length = 5.2244896888733,
		},
		{
			path = "vo/demoman_laughhappy02.wav",
			length = 2.3510203361511,
		},
		{
			path = "vo/demoman_laughhappy01.wav",
			length = 2.2175056934357,
		},
		{
			path = "vo/demoman_laughevil01.wav",
			length = 2.1130158901215,
		},
		{
			path = "vo/demoman_laughevil02.wav",
			length = 2.2929704189301,
		},
		{
			path = "vo/demoman_laughevil03.wav",
			length = 2.1594557762146,
		},
		{
			path = "vo/demoman_laughevil04.wav",
			length = 1.1261677742004,
		},
		{
			path = "vo/demoman_laughevil05.wav",
			length = 1.1842176914215,
		},
		{
			path = "vo/demoman_laughshort01.wav",
			length = 1.3409523963928,
		},
		{
			path = "vo/demoman_laughshort02.wav",
			length = 1.3061224222183,
		},
		{
			path = "vo/demoman_laughshort03.wav",
			length = 0.55292516946793,
		},
		{
			path = "vo/demoman_laughshort04.wav",
			length = 0.48471656441689,
		},
		{
			path = "vo/demoman_laughshort05.wav",
			length = 1.2625850439072,
		},
		{
			path = "vo/demoman_laughshort06.wav",
			length = 0.92589569091797,
		},
	}

	L["pyrolaugh"] = {
		{
			path = "vo/pyro_laughlong01.wav",
			length = 2.3520181179047,
		},
		{
			path = "vo/pyro_laughevil02.wav",
			length = 0.8853514790535,
		},
		{
			path = "vo/pyro_laughevil03.wav",
			length = 0.47467121481895,
		},
		{
			path = "vo/pyro_laughevil04.wav",
			length = 1.1733332872391,
		},
	}

	L["thank you"] = {
		{
			path = "vo/outland_12a/launch/mag_launch_thankyou03.wav",
			length = 0.50514739751816,
		},
	}

	L["you there"] = {
		{
			path = "vo/coast/bugbait/sandy_youthere.wav",
			length = 0.82335603237152,
		},
	}

	L["thank god"] = {
		{
			path = "vo/outland_01/intro/eli_transmit_believe02.wav",
			length = 1.2746711969376,
		},
	}

	L["any ideas"] = {
		{
			path = "vo/episode_1/intro/al_chasm_dogideas03.wav",
			length = 0.98249435424805,
		},
	}

	L["fantastic"] = {
		{
			path = "vo/npc/female01/fantastic01.wav",
			length = 1.0071655511856,
		},
		{
			path = "vo/npc/female01/fantastic02.wav",
			length = 0.9026757478714,
		},
		{
			path = "vo/npc/male01/fantastic01.wav",
			length = 1.7272335290909,
		},
		{
			path = "vo/npc/male01/fantastic02.wav",
			length = 0.83995467424393,
		},
	}

	L["you suck"] = {
		{
			path = "vo/test_two.wav",
			length = 1.1203627586365,
		},
	}

	L["thirteen"] = {
		{
			path = "npc/metropolice/vo/thirteen.wav",
			length = 0.19031746685505,
		},
	}

	L["this way"] = {
		{
			path = "vo/npc/barney/ba_followme01.wav",
			length = 1.1672109365463,
		},
	}

	L["my fault"] = {
		{
			path = "npc/turret_floor/turret_collide_4.wav",
			length = 1.2200000286102,
		},
	}

	L["good bye"] = {
		{
			path = "npc/turret_floor/turret_retire_1.wav",
			length = 0.8475056886673,
		},
	}

	L["fourteen"] = {
		{
			path = "npc/metropolice/vo/fourteen.wav",
			length = 0.30922901630402,
		},
	}

	L["mo([o]+)"] = {
		{
			path = "ambient/cow1.wav",
			length = 2.5077550411224,
		},
		{
			path = "ambient/cow2.wav",
			length = 3.1579139232635,
		},
		{
			path = "ambient/cow3.wav",
			length = 2.6993198394775,
		},
	}

	L["allright"] = {
		{
			path = "vo/eli_lab/al_allright01.wav",
			length = 0.70283448696136,
		},
	}

	L["lets go"] = {
		{
			path = "vo/npc/female01/letsgo01.wav",
			length = 0.65886622667313,
		},
		{
			path = "vo/npc/female01/letsgo02.wav",
			length = 0.61823129653931,
		},
		{
			path = "vo/npc/male01/letsgo01.wav",
			length = 1.2478004693985,
		},
		{
			path = "vo/npc/male01/letsgo02.wav",
			length = 0.73691612482071,
		},
	}

	L["spylaugh"] = {
		{
			path = "vo/spy_laughevil01.wav",
			length = 2.0027210712433,
		},
		{
			path = "vo/spy_laughevil02.wav",
			length = 1.4686621427536,
		},
		{
			path = "vo/spy_laughhappy01.wav",
			length = 1.8634014129639,
		},
		{
			path = "vo/spy_laughhappy02.wav",
			length = 1.1290702819824,
		},
		{
			path = "vo/spy_laughhappy03.wav",
			length = 1.6660317182541,
		},
		{
			path = "vo/spy_laughlong01.wav",
			length = 6.4667572975159,
		},
		{
			path = "vo/spy_laughshort01.wav",
			length = 0.77496600151062,
		},
		{
			path = "vo/spy_laughshort02.wav",
			length = 1.2596825361252,
		},
		{
			path = "vo/spy_laughshort03.wav",
			length = 0.87074828147888,
		},
		{
			path = "vo/spy_laughshort04.wav",
			length = 0.88816326856613,
		},
		{
			path = "vo/spy_laughshort05.wav",
			length = 0.7778685092926,
		},
		{
			path = "vo/spy_laughshort06.wav",
			length = 0.63854873180389,
		},
	}

	L["lift off"] = {
		{
			path = "vo/outland_12a/launch/mag_launch_launchsequence08c.wav",
			length = 2.6470749378204,
		},
	}

	L["now what"] = {
		{
			path = "vo/npc/female01/gordead_ans01.wav",
			length = 0.79664397239685,
		},
	}

	L["you fool"] = {
		{
			path = "vo/Citadel/br_youfool.wav",
			length = 0.92446714639664,
		},
	}

	L["eighteen"] = {
		{
			path = "npc/metropolice/vo/eighteen.wav",
			length = 0.34859409928322,
		},
	}

	L["oh great"] = {
		{
			path = "vo/episode_1/c17/al_pb1_ohgreat.wav",
			length = 0.87632650136948,
		},
	}

	L["good god"] = {
		{
			path = "vo/outland_01/intro/eli_transmit_goodgod.wav",
			length = 1.5466666221619,
		},
	}

	L["nineteen"] = {
		{
			path = "npc/metropolice/vo/nineteen.wav",
			length = 0.23219954967499,
		},
	}

	L["get down"] = {
		{
			path = "vo/npc/female01/getdown02.wav",
			length = 0.91573697328568,
		},
		{
			path = "vo/npc/male01/getdown02.wav",
			length = 0.87818592786789,
		},
	}

	L["incoming"] = {
		{
			path = "vo/k_lab2/ba_incoming.wav",
			length = 2.4329025745392,
		},
		{
			path = "vo/npc/male01/incoming02.wav",
			length = 0.9090022444725,
		},
		{
			path = "vo/canals/female01/stn6_incoming.wav",
			length = 1.0505669116974,
		},
		{
			path = "vo/canals/male01/stn6_incoming.wav",
			length = 2.0555329322815,
		},
	}

	L["cumsound"] = {
		{
			path = "physics/flesh/flesh_bloody_impact_hard1.wav",
			length = 0.36589568853378,
		},
	}

	L["grenades"] = {
		{
			path = "vo/streetwar/sniper/ba_nag_grenade05.wav",
			length = 2.1695010662079,
		},
	}

	L["what now"] = {
		{
			path = "vo/npc/female01/gordead_ques16.wav",
			length = 0.51780045032501,
		},
	}

	L["right on"] = {
		{
			path = "vo/npc/female01/answer32.wav",
			length = 0.65689343214035,
		},
	}

	L["fuck you"] = {
		{
			path = "vo/Streetwar/rubble/ba_tellbreen.wav",
			length = 5.1877098083496,
		},
	}

	L["tea time"] = {
		{
			path = "vo/outland_11a/silo/mag_silo_excuseme01.wav",
			length = 3.5759863853455,
		},
	}

	L["shall we"] = {
		{
			path = "vo/spy_battlecry02.wav",
			length = 0.63854873180389,
		},
	}

	L["good boy"] = {
		{
			path = "vo/outland_11/dogfight/al_str_goodboy.wav",
			length = 0.83201813697815,
		},
	}

	L["zombies"] = {
		{
			path = "vo/npc/male01/zombies01.wav",
			length = 1.2224262952805,
		},
		{
			path = "vo/npc/male01/zombies02.wav",
			length = 0.82238095998764,
		},
		{
			path = "vo/npc/female01/zombies01.wav",
			length = 0.88888889551163,
		},
		{
			path = "vo/npc/female01/zombies02.wav",
			length = 0.81995463371277,
		},
	}

	L["sixteen"] = {
		{
			path = "npc/metropolice/vo/sixteen.wav",
			length = 0.35333332419395,
		},
	}

	L["peekabo"] = {
		{
			path = "vo/taunts/spy_taunts06.wav",
			length = 0.62693876028061,
		},
	}

	L["whistle"] = {
		{
			path = "vo/taunts/spy_taunts05.wav",
			length = 1.7298866510391,
		},
	}

	L["kanskje"] = {
		{
			path = "vo/coast/barn/male01/lite_gunship02.wav",
			length = 0.8969841003418,
		},
	}

	L["at last"] = {
		{
			path = "vo/outland_12a/launch/kl_launch_atlast.wav",
			length = 1.3653514385223,
		},
	}

	L["careful"] = {
		{
			path = "vo/k_lab/al_careful.wav",
			length = 0.96256238222122,
		},
	}

	L["grenade"] = {
		{
			path = "vo/npc/barney/ba_grenade01.wav",
			length = 1.1414965391159,
		},
		{
			path = "vo/npc/barney/ba_grenade02.wav",
			length = 1.1918367147446,
		},
	}

	L["awesome"] = {
		{
			path = "vo/eli_lab/al_awesome.wav",
			length = 0.82247167825699,
		},
	}

	L["figures"] = {
		{
			path = "vo/npc/male01/answer03.wav",
			length = 0.58519273996353,
		},
	}

	L["traitor"] = {
		{
			path = "vo/episode_1/citadel/al_traitor.wav",
			length = 0.70312923192978,
		},
		{
			path = "vo/episode_1/citadel/al_traitor02.wav",
			length = 0.60124719142914,
		},
	}

	L["maggots"] = {
		{
			path = "vo/taunts/soldier_taunts01.wav",
			length = 1.0158730745316,
		},
	}

	L["warning"] = {
		{
			path = "vo/announcer_warning.wav",
			length = 1.6599773168564,
		},
	}

	L["*cheer*"] = {
		{
			path = "vo/coast/odessa/female01/nlo_cheer01.wav",
			length = 1.0434466600418,
		},
		{
			path = "vo/coast/odessa/female01/nlo_cheer02.wav",
			length = 1.0753741264343,
		},
		{
			path = "vo/coast/odessa/female01/nlo_cheer03.wav",
			length = 2.4729251861572,
		},
		{
			path = "vo/coast/odessa/male01/nlo_cheer01.wav",
			length = 3.3680045604706,
		},
		{
			path = "vo/coast/odessa/male01/nlo_cheer02.wav",
			length = 1.4649432897568,
		},
		{
			path = "vo/coast/odessa/male01/nlo_cheer03.wav",
			length = 3.0941951274872,
		},
		{
			path = "vo/coast/odessa/male01/nlo_cheer04.wav",
			length = 2.62868475914,
		},
	}

	L["kiss me"] = {
		{
			path = "vo/heavy_generic01.wav",
			length = 0.81269842386246,
		},
	}

	L["*cough*"] = {
		{
			path = "ambient/voices/cough1.wav",
			length = 1.0567346811295,
		},
		{
			path = "ambient/voices/cough2.wav",
			length = 0.54870748519897,
		},
		{
			path = "ambient/voices/cough3.wav",
			length = 0.61265307664871,
		},
		{
			path = "ambient/voices/cough4.wav",
			length = 0.92707484960556,
		},
	}

	L["excited"] = {
		{
			path = "vo/outland_12a/launch/mag_launch_launchsequence08d.wav",
			length = 8.8584127426147,
		},
	}

	L["failure"] = {
		{
			path = "vo/announcer_failure.wav",
			length = 1.8486394882202,
		},
	}

	L["oh noes"] = {
		{
			path = "vo/npc/male01/ohno.wav",
			length = 0.59782314300537,
		},
		{
			path = "vo/npc/female01/ohno.wav",
			length = 0.79238092899323,
		},
		{
			path = "vo/npc/female01/gordead_ans05.wav",
			length = 0.82716554403305,
		},
		{
			path = "vo/npc/alyx/ohno_startle01.wav",
			length = 1.1217687129974,
		},
		{
			path = "vo/npc/alyx/ohno_startle03.wav",
			length = 1.6478004455566,
		},
	}

	L["cries"] = {
		{
			path = "vo/outland_12a/launch/al_launch_pieta01d.wav",
			length = 1.6687982082367,
		},
		{
			path = "vo/outland_12a/launch/al_launch_pieta01j.wav",
			length = 4.1969842910767,
		},
		{
			path = "vo/outland_12a/launch/al_launch_pieta01q.wav",
			length = 2.576938867569,
		},
		{
			path = "vo/outland_12a/launch/al_launch_pieta01r.wav",
			length = 1.6946258544922,
		},
	}

	L["seagull"] = {
		{
			path = "ambient/creatures/seagull_idle1.wav",
			length = 1.7186621427536,
		},
		{
			path = "ambient/creatures/seagull_idle2.wav",
			length = 2.1307256221771,
		},
		{
			path = "ambient/creatures/seagull_idle3.wav",
			length = 0.43056690692902,
		},
		{
			path = "ambient/creatures/seagull_pain1.wav",
			length = 0.69718819856644,
		},
		{
			path = "ambient/creatures/seagull_pain2.wav",
			length = 0.43877550959587,
		},
		{
			path = "ambient/creatures/seagull_pain3.wav",
			length = 0.31954649090767,
		},
	}

	L["goodbye"] = {
		{
			path = "npc/turret_floor/turret_retire_1.wav",
			length = 0.8475056886673,
		},
	}

	L["bo([o]+)"] = {
		{
			path = "vo/heavy_jeers01.wav",
			length = 1.9446711540222,
		},
	}

	L["get out"] = {
		{
			path = "vo/canals/shanty_go_nag01.wav",
			length = 0.81616777181625,
		},
	}

	L["hold on"] = {
		{
			path = "vo/novaprospekt/al_holdon.wav",
			length = 1.1046712398529,
		},
	}

	L["welcome"] = {
		{
			path = "vo/Breencast/br_welcome01.wav",
			length = 3.8682765960693,
		},
	}

	L["take it"] = {
		{
			path = "vo/eli_lab/al_takeit.wav",
			length = 0.38977324962616,
		},
	}

	L["gunship"] = {
		{
			path = "vo/coast/barn/male01/lite_gunship02.wav",
			length = 0.8969841003418,
		},
		{
			path = "vo/coast/barn/male01/lite_gunship01.wav",
			length = 0.83086168766022,
		},
		{
			path = "vo/coast/barn/female01/lite_gunship02.wav",
			length = 0.5761451125145,
		},
		{
			path = "vo/coast/barn/female01/lite_gunship01.wav",
			length = 0.7880272269249,
		},
	}

	L["finally"] = {
		{
			path = "vo/npc/female01/finally.wav",
			length = 0.99265307188034,
		},
	}

	L["oh dear"] = {
		{
			path = "vo/k_lab/kl_ohdear.wav",
			length = 0.57646256685257,
		},
	}

	L["ah crap"] = {
		{
			path = "vo/outland_08/chopper/al_chop_enginefire02.wav",
			length = 1.1120181083679,
		},
	}

	L["oh yeah"] = {
		{
			path = "vo/npc/barney/ba_ohyeah.wav",
			length = 1.4270294904709,
		},
	}

	L["come on"] = {
		{
			path = "vo/npc/barney/ba_followme02.wav",
			length = 0.97054421901703,
		},
		{
			path = "vo/npc/barney/ba_followme03.wav",
			length = 1.2309523820877,
		},
		{
			path = "vo/citadel/al_comeon.wav",
			length = 0.66603171825409,
		},
	}

	L["fifteen"] = {
		{
			path = "npc/metropolice/vo/fifteen.wav",
			length = 0.27809524536133,
		},
	}

	L["alright"] = {
		{
			path = "vo/outland_11/dogfight/al_str_thanksagain01.wav",
			length = 0.48102042078972,
		},
	}

	L["quickly"] = {
		{
			path = "vo/outland_11a/silo/mag_silo_followquick04.wav",
			length = 0.56160998344421,
		},
	}

	L["anyone"] = {
		{
			path = "vo/outland_11a/silo/mag_silo_falsealarms03.wav",
			length = 0.89827662706375,
		},
	}

	L["chime4"] = {
		{
			path = "ambient/levels/canals/windchime4.wav",
			length = 1.1844670772552,
		},
	}

	L["cheers"] = {
		{
			path = "vo/spy_autocappedintelligence03.wav",
			length = 0.77206349372864,
		},
	}

	L["yeargh"] = {
		{
			path = "npc/fast_zombie/fz_scream1.wav",
			length = 1.6591383218765,
		},
	}

	L["follow"] = {
		{
			path = "vo/coast/cardock/le_followme.wav",
			length = 0.7926983833313,
		},
	}

	L["my god"] = {
		{
			path = "vo/outland_01/intro/al_transmit_grabbed01.wav",
			length = 1.0506802797318,
		},
	}

	L["hurray"] = {
		{
			path = "vo/coast/odessa/female01/nlo_cheer03.wav",
			length = 2.4729251861572,
		},
	}

	L["thirty"] = {
		{
			path = "npc/metropolice/vo/thirty.wav",
			length = 0.27578231692314,
		},
	}

	L["eleven"] = {
		{
			path = "npc/metropolice/vo/eleven.wav",
			length = 0.26176869869232,
		},
	}

	L["pigeon"] = {
		{
			path = "ambient/creatures/pigeon_idle1.wav",
			length = 0.95256233215332,
		},
		{
			path = "ambient/creatures/pigeon_idle2.wav",
			length = 0.71546483039856,
		},
		{
			path = "ambient/creatures/pigeon_idle3.wav",
			length = 0.82190477848053,
		},
		{
			path = "ambient/creatures/pigeon_idle4.wav",
			length = 1.3829025030136,
		},
	}

	L["omg no"] = {
		{
			path = "vo/outland_12a/launch/al_launch_impaling01_alt2.wav",
			length = 1.8693196773529,
		},
	}

	L["thanks"] = {
		{
			path = "vo/soldier_thanks01.wav",
			length = 0.62693876028061,
		},
		{
			path = "vo/soldier_thanks02.wav",
			length = 0.71401357650757,
		},
		{
			path = "vo/scout_thanks01.wav",
			length = 0.81560093164444,
		},
		{
			path = "vo/medic_thanks01.wav",
			length = 0.90557825565338,
		},
		{
			path = "vo/heavy_thanks01.wav",
			length = 1.0071655511856,
		},
		{
			path = "vo/heavy_thanks03.wav",
			length = 0.96027213335037,
		},
		{
			path = "vo/sniper_thanks01.wav",
			length = 0.5659863948822,
		},
		{
			path = "vo/demoman_thanks01.wav",
			length = 0.92299318313599,
		},
	}

	L["lamarr"] = {
		{
			path = "vo/k_lab/kl_lamarr.wav",
			length = 2.2307484149933,
		},
		{
			path = "/vo/k_lab2/kl_comeoutlamarr.wav",
			length = 1.0708390474319,
		},
		{
			path = "vo/k_lab/kl_islamarr.wav",
			length = 1.0055102109909,
		},
		{
			path = "vo/k_lab2/kl_lamarrwary02.wav",
			length = 3.4874603748322,
		},
		{
			path = "vo/k_lab2/kl_lamarr.wav",
			length = 1.8226983547211,
		},
		{
			path = "vo/k_lab2/kl_cantleavelamarr_b.wav",
			length = 3.8101813793182,
		},
	}

	L["steady"] = {
		{
			path = "vo/outland_12a/launch/mag_launch_launchsequence06.wav",
			length = 1.4746031761169,
		},
	}

	L["oh god"] = {
		{
			path = "vo/npc/female01/gordead_ans04.wav",
			length = 0.76630383729935,
		},
	}

	L["nix da"] = {
		{
			path = "vo/medic_no03.wav",
			length = 0.64435374736786,
		},
	}

	L["listen"] = {
		{
			path = "vo/outland_10/olde-inne/al_ambush_listen.wav",
			length = 0.73403626680374,
		},
	}

	L["get in"] = {
		{
			path = "vo/episode_1/c17/al_elev_getingetin.wav",
			length = 0.98539680242538,
		},
	}

	L["oh shi"] = {
		{
			path = "vo/citadel/br_ohshit.wav",
			length = 1.2653287649155,
		},
	}

	L["dangit"] = {
		{
			path = "vo/engineer_negativevocalization12.wav",
			length = 1.7937414646149,
		},
		{
			path = "vo/engineer_negativevocalization11.wav",
			length = 1.1087528467178,
		},
		{
			path = "vo/engineer_negativevocalization10.wav",
			length = 1.1784126758575,
		},
	}

	L["chime1"] = {
		{
			path = "ambient/levels/canals/windchine1.wav",
			length = 8.546802520752,
		},
	}

	L["magots"] = {
		{
			path = "vo/taunts/soldier_taunts01.wav",
			length = 1.0158730745316,
		},
	}

	L["chime2"] = {
		{
			path = "ambient/levels/canals/windchime2.wav",
			length = 1.7732880115509,
		},
	}

	L["gogogo"] = {
		{
			path = "radio/com_go.wav",
			length = 1.3292063474655,
		},
	}

	L["cheese"] = {
		{
			path = "vo/npc/male01/question06.wav",
			length = 3.4074831008911,
		},
	}

	L["got it"] = {
		{
			path = "vo/episode_1/citadel/al_doorhacks01b.wav",
			length = 0.56521540880203,
		},
	}

	L["twelve"] = {
		{
			path = "npc/metropolice/vo/twelve.wav",
			length = 0.37582767009735,
		},
	}

	L["indeed"] = {
		{
			path = "vo/outland_12a/launch/mag_launch_indeed.wav",
			length = 0.69655328989029,
		},
	}

	L["please"] = {
		{
			path = "vo/trainyard/wife_please.wav",
			length = 1.1068707704544,
		},
	}

	L["twenty"] = {
		{
			path = "npc/metropolice/vo/twenty.wav",
			length = 0.29634919762611,
		},
	}

	L["woohoo"] = {
		{
			path = "vo/coast/odessa/female01/nlo_cheer02.wav",
			length = 1.0753741264343,
		},
	}

	L["spits"] = {
		{
			path = "vo/taunts/sniper_taunts23.wav",
			length = 1.0100680589676,
		},
		{
			path = "/vo/taunts/sniper_taunts01.wav",
			length = 1.4686621427536,
		},
	}

	L["sing1"] = {
		{
			path = "vo/eli_lab/al_hums.wav",
			length = 2.9383220672607,
		},
	}

	L["error"] = {
		{
			path = "buttons/button8.wav",
			length = 0.63777780532837,
		},
	}

	L["choke"] = {
		{
			path = "player/pl_drown1.wav",
			length = 0.84464854001999,
		},
	}

	L["oh no"] = {
		{
			path = "vo/npc/male01/ohno.wav",
			length = 0.59782314300537,
		},
		{
			path = "vo/npc/female01/ohno.wav",
			length = 0.79238092899323,
		},
		{
			path = "vo/npc/female01/gordead_ans05.wav",
			length = 0.82716554403305,
		},
		{
			path = "vo/npc/alyx/ohno_startle01.wav",
			length = 1.1217687129974,
		},
		{
			path = "vo/npc/alyx/ohno_startle03.wav",
			length = 1.6478004455566,
		},
	}

	L["weird"] = {
		{
			path = "vo/episode_1/citadel/al_core_controlcrazy01.wav",
			length = 0.86929702758789,
		},
	}

	L["hacks"] = {
		{
			path = "vo/npc/female01/hacks02.wav",
			length = 0.60879820585251,
		},
		{
			path = "vo/npc/female01/hacks01.wav",
			length = 0.6378231048584,
		},
		{
			path = "vo/npc/male01/hacks02.wav",
			length = 0.77433109283447,
		},
	}

	L["alert"] = {
		{
			path = "vo/announcer_alert.wav",
			length = 1.3508616685867,
		},
	}

	L["cmon"] = {
		{
			path = "vo/npc/barney/ba_followme02.wav",
			length = 0.97054421901703,
		},
		{
			path = "vo/npc/barney/ba_followme03.wav",
			length = 1.2309523820877,
		},
		{
			path = "vo/citadel/al_comeon.wav",
			length = 0.66603171825409,
		},
	}

	L["yippy"] = {
		{
			path = "vo/engineer_cheers07.wav",
			length = 3.3320634365082,
		},
	}

	L["no d:"] = {
		{
			path = "vo/npc/male01/no02.wav",
			length = 1.3854421377182,
		},
		post = function(chtsnd) chtsnd:GetPlayer():DoAnimationEvent( ACT_GMOD_GESTURE_DISAGREE ) end,
	}

	L["kaze?"] = {
		{
			path = "vo/Citadel/br_youneedme.wav",
			length = 1.5195918083191,
		},
		{
			path = "vo/Citadel/br_gravgun.wav",
			length = 1.9662585258484,
		},
		{
			path = "vo/Citadel/br_judithwhat.wav",
			length = 2.2969160079956,
		},
		{
			path = "vo/Citadel/br_newleader_a.wav",
			length = 1.9964399337769,
		},
		{
			path = "vo/k_lab/br_tele_02.wav",
			length = 1.0708390474319,
		},
		{
			path = "vo/k_lab/br_tele_03.wav",
			length = 1.0629024505615,
		},
		{
			path = "vo/Citadel/br_yesjudith.wav",
			length = 1.3907710313797,
		},
		{
			path = "vo/Citadel/br_youfool.wav",
			length = 0.92446714639664,
		},
		{
			path = "vo/Citadel/br_youneedme.wav",
			length = 1.5195918083191,
		},
		{
			path = "vo/citadel/br_no.wav",
			length = 0.78303855657578,
		},
		{
			path = "vo/citadel/br_laugh01.wav",
			length = 3.8755328655243,
		},
		{
			path = "vo/breencast/br_welcome07.wav",
			length = 1.2229478359222,
		},
		{
			path = "vo/citadel/br_ohshit.wav",
			length = 1.2653287649155,
		},
		{
			path = "vo/breencast/br_tofreeman12.wav",
			length = 1.429093003273,
		},
		{
			path = "vo/breencast/br_tofreeman02.wav",
			length = 2.1296372413635,
		},
	}

	L["hurry"] = {
		{
			path = "vo/eli_lab/al_intoairlock04.wav",
			length = 0.80698412656784,
		},
	}

	L["never"] = {
		{
			path = "vo/citadel/eli_nonever.wav",
			length = 0.62045353651047,
		},
	}

	L["uh oh"] = {
		{
			path = "vo/novaprospekt/al_uhoh_np.wav",
			length = 0.69757372140884,
		},
	}

	L["sing2"] = {
		{
			path = "vo/eli_lab/al_hums_b.wav",
			length = 4.7082767486572,
		},
	}

	L["so um"] = {
		{
			path = "vo/outland_12a/launch/mag_launch_thankyou02.wav",
			length = 1.1377551555634,
		},
	}

	L["seven"] = {
		{
			path = "npc/metropolice/vo/seven.wav",
			length = 0.24111111462116,
		},
	}

	L["teddy"] = {
		{
			path = "ambient/creatures/teddy.wav",
			length = 0.59727889299393,
		},
	}

	L["moanf"] = {
		{
			path = "vo/npc/female01/moan01.wav",
			length = 2.1143310070038,
		},
		{
			path = "vo/npc/female01/moan02.wav",
			length = 1.3680952787399,
		},
		{
			path = "vo/npc/female01/moan03.wav",
			length = 1.0986168384552,
		},
		{
			path = "vo/npc/female01/moan04.wav",
			length = 1.0986168384552,
		},
		{
			path = "vo/npc/female01/moan05.wav",
			length = 1.451020359993,
		},
	}

	L["again"] = {
		{
			path = "vo/episode_1/c17/al_strider_again.wav",
			length = 0.67845803499222,
		},
	}

	L["eight"] = {
		{
			path = "npc/metropolice/vo/eight.wav",
			length = 0.13791383802891,
		},
	}

	L["hello"] = {
		{
			path = "vo/eli_lab/mo_airlock03.wav",
			length = 0.55285716056824,
		},
		{
			path = "vo/outland_11a/silo/mag_silo_falsealarms01.wav",
			length = 0.61938774585724,
		},
		{
			path = "vo/aperture_ai/post_escape_bridge_01.wav",
			length = 0.58049887418747,
		},
		{
			path = "vo/aperture_ai/escape_00_part1_nag01-1.wav",
			length = 0.83226758241653,
		},
		post = function(chtsnd) chtsnd:GetPlayer():DoAnimationEvent( ACT_GMOD_GESTURE_WAVE ) end,

	}

	L["ready"] = {
		{
			path = "vo/episode_1/c17/al_pb1_ready.wav",
			length = 0.60353744029999,
		},
	}

	L["boink"] = {
		{
			path = "vo/scout_specialcompleted02.wav",
			length = 0.48036280274391,
		},
	}

	L["cries"] = {
		{
			path = "vo/outland_12a/launch/al_launch_pieta01d.wav",
			length = 1.6687982082367,
		},
		{
			path = "vo/outland_12a/launch/al_launch_pieta01j.wav",
			length = 4.1969842910767,
		},
		{
			path = "vo/outland_12a/launch/al_launch_pieta01q.wav",
			length = 2.576938867569,
		},
		{
			path = "vo/outland_12a/launch/al_launch_pieta01r.wav",
			length = 1.6946258544922,
		},
	}

	L["three"] = {
		{
			path = "npc/metropolice/vo/three.wav",
			length = 0.2187981903553,
		},
	}

	L["ohshi"] = {
		{
			path = "vo/citadel/br_ohshit.wav",
			length = 1.2653287649155,
		},
	}

	L["dont"] = {
		{
			path = "vo/outland_12a/launch/al_launch_dadimnot02.wav",
			length = 0.84986394643784,
		},
	}

	L["cough"] = {
		{
			path = "ambient/voices/cough1.wav",
			length = 1.0567346811295,
		},
		{
			path = "ambient/voices/cough2.wav",
			length = 0.54870748519897,
		},
		{
			path = "ambient/voices/cough3.wav",
			length = 0.61265307664871,
		},
		{
			path = "ambient/voices/cough4.wav",
			length = 0.92707484960556,
		},
	}

	L["ninja"] = {
		{
			path = "vo/scout_beingshotinvincible17.wav",
			length = 0.26535147428513,
		},
		{
			path = "vo/scout_beingshotinvincible08.wav",
			length = 0.24133786559105,
		},
		{
			path = "vo/scout_beingshotinvincible16.wav",
			length = 0.20267572999001,
		},
		{
			path = "vo/scout_beingshotinvincible13.wav",
			length = 0.17666666209698,
		},
		{
			path = "vo/scout_beingshotinvincible12.wav",
			length = 0.16934239864349,
		},
	}

	L["sweet"] = {
		{
			path = "vo/eli_lab/al_sweet.wav",
			length = 0.90598636865616,
		},
	}

	L["moanm"] = {
		{
			path = "vo/npc/male01/moan01.wav",
			length = 2.6814513206482,
		},
		{
			path = "vo/npc/male01/moan02.wav",
			length = 2.7980272769928,
		},
		{
			path = "vo/npc/male01/moan03.wav",
			length = 2.3316779136658,
		},
		{
			path = "vo/npc/male01/moan04.wav",
			length = 1.9271655082703,
		},
		{
			path = "vo/npc/male01/moan05.wav",
			length = 1.7130385637283,
		},
	}

	L["phail"] = {
		{
			path = "vo/announcer_failure.wav",
			length = 1.8486394882202,
		},
	}

	L["oops"] = {
		{
			path = "vo/k_lab/ba_whoops.wav",
			length = 0.43712016940117,
		},
		{
			path = "vo/npc/female01/whoops01.wav",
			length = 0.48206350207329,
		},
		{
			path = "vo/npc/male01/whoops01.wav",
			length = 0.40922901034355,
		},
	}

	L["yes!"] = {
		{
			path = "vo/citadel/al_success_yes_nr.wav",
			length = 2.2283446788788,
		},
	}

	L["nope"] = {
		{
			path = "vo/engineer_no01.wav",
			length = 0.36861678957939,

		},
		post = function(chtsnd) chtsnd:GetPlayer():DoAnimationEvent( ACT_GMOD_GESTURE_DISAGREE ) end,
	}

	L["yeah"] = {
		{
			path = "vo/npc/female01/yeah02.wav",
			length = 0.72489798069,
		},
		{
			path = "vo/npc/male01/yeah02.wav",
			length = 0.87521541118622,
		},
		post = function(chtsnd) chtsnd:GetPlayer():DoAnimationEvent( ACT_GMOD_GESTURE_AGREE ) end,
	}

	L["nine"] = {
		{
			path = "npc/metropolice/vo/nine.wav",
			length = 0.18791383504868,
		},
	}

	L["crap"] = {
		{
			path = "vo/outland_06a/radio/al_rad_crap.wav",
			length = 1.3440135717392,
		},
	}

	L["woah"] = {
		{
			path = "vo/outland_01/intro/al_rbed_whoa.wav",
			length = 0.86401361227036,
		},
	}

	L["zero"] = {
		{
			path = "npc/metropolice/vo/zero.wav",
			length = 0.27106577157974,
		},
	}

	L["five"] = {
		{
			path = "npc/metropolice/vo/five.wav",
			length = 0.26299318671227,
		},
	}

	L["good"] = {
		{
			path = "vo/outland_11/dogfight/al_str_good.wav",
			length = 0.84934240579605,
		},
	}

	L["okey"] = {
		{
			path = "vo/npc/male01/ok02.wav",
			length = 0.64480727910995,
		},
		{
			path = "vo/npc/male01/ok01.wav",
			length = 0.46235826611519,
		},
		{
			path = "vo/npc/female01/ok01.wav",
			length = 0.48616778850555,
		},
		{
			path = "vo/npc/female01/ok02.wav",
			length = 0.49850338697433,
		},
	}

	L["bonk"] = {
		{
			path = "vo/scout_specialcompleted03.wav",
			length = 0.44553288817406,
		},
	}

	L["mate"] = {
		{
			path = "vo/episode_1/npc/female01/cit_remarks08.wav",
			length = 4.0841045379639,
		},
		{
			path = "vo/episode_1/npc/male01/cit_remarks08.wav",
			length = 3.7851927280426,
		},
	}

	L["damn"] = {
		{
			path = "vo/outland_01/intro/al_rbed_whatnow01.wav",
			length = 0.68535149097443,
		},
	}

	L["fail"] = {
		{
			path = "vo/announcer_failure.wav",
			length = 1.8486394882202,
		},
	}

	L["bird"] = {
		{
			path = "ambient/levels/coast/coastbird1.wav",
			length = 1.6721088886261,
		},
		{
			path = "ambient/levels/coast/coastbird2.wav",
			length = 1.3468934297562,
		},
		{
			path = "ambient/levels/coast/coastbird3.wav",
			length = 2.3687527179718,
		},
		{
			path = "ambient/levels/coast/coastbird4.wav",
			length = 1.1263039112091,
		},
		{
			path = "ambient/levels/coast/coastbird5.wav",
			length = 1.4455101490021,
		},
		{
			path = "ambient/levels/coast/coastbird6.wav",
			length = 1.3933559656143,
		},
		{
			path = "ambient/levels/coast/coastbird7.wav",
			length = 0.45281177759171,
		},
	}

	L["sure"] = {
		{
			path = "vo/eli_lab/al_gravgun.wav",
			length = 0.50990927219391,
		},
	}

	L["pong"] = {
		{
			path = "vo/scout_beingshotinvincible26.wav",
			length = 0.46666666865349,
		},
	}

	L["eugh"] = {
		{
			path = "vo/outland_12a/launch/mag_launch_check12a.wav",
			length = 0.91877549886703,
		},
	}

	L["wuss"] = {
		{
			path = "vo/scout_beingshotinvincible36.wav",
			length = 0.45734694600105,
		},
	}

	L["halp"] = {
		{
			path = "vo/npc/male01/help01.wav",
			length = 0.46748298406601,
		},
		{
			path = "vo/streetwar/sniper/male01/c17_09_help01.wav",
			length = 1.2301586866379,
		},
		{
			path = "vo/streetwar/sniper/male01/c17_09_help02.wav",
			length = 0.75888890028,
		},
		{
			path = "vo/canals/arrest_helpme.wav",
			length = 1.7047392129898,
		},
	}

	L["duck"] = {
		{
			path = "vo/npc/barney/ba_duck.wav",
			length = 1.0245578289032,
		},
	}

	L["attn"] = {
		{
			path = "vo/announcer_attention.wav",
			length = 1.6730386018753,
		},
	}

	L["look"] = {
		{
			path = "vo/outland_07/barn/al_barn_podslaunched01.wav",
			length = 0.8173696398735,
		},
	}

	L["aowl"] = {
		{
			path = "vo/trainyard/cit_pacing.wav",
			length = 8.9190702438354,
		},
	}

	L["ping"] = {
		{
			path = "vo/scout_beingshotinvincible23.wav",
			length = 0.44800454378128,
		},
	}

	L["burp"] = {
		{
			path = "vo/burp02.wav",
			length = 0.29750567674637,
		},
		{
			path = "vo/burp03.wav",
			length = 0.37374150753021,
		},
		{
			path = "vo/burp04.wav",
			length = 0.92879819869995,
		},
		{
			path = "vo/burp05.wav",
			length = 2.1618595123291,
		},
		{
			path = "vo/burp02.wav",
			length = 0.29750567674637,
		},
		{
			path = "vo/burp06.wav",
			length = 0.56018137931824,
		},
		{
			path = "vo/burp07.wav",
			length = 0.98231291770935,
		},
	}

	L["done"] = {
		{
			path = "vo/streetwar/nexus/ba_done.wav",
			length = 0.87145125865936,
		},
	}

	L["gtho"] = {
		{
			path = "vo/npc/male01/gethellout.wav",
			length = 2.4458277225494,
		},
	}

	L["sshh"] = {
		{
			path = "vo/outland_06a/radio/al_rad_sh.wav",
			length = 1.4853514432907,
		},
	}

	L["move"] = {
		{
			path = "vo/spy_go01.wav",
			length = 0.57759636640549,
		},
	}

	L["phew"] = {
		{
			path = "vo/episode_1/c17/al_elev_phew.wav",
			length = 1.0681178569794,
		},
	}

	L["four"] = {
		{
			path = "npc/metropolice/vo/four.wav",
			length = 0.24977324903011,
		},
	}

	L["spit"] = {
		{
			path = "vo/taunts/sniper_taunts23.wav",
			length = 1.0100680589676,
		},
		{
			path = "vo/taunts/sniper_taunts01.wav",
			length = 1.4686621427536,
		},
	}

	L["nein"] = {
		{
			path = "vo/medic_no01.wav",
			length = 0.53115648031235,
		},
	}

	L["okay"] = {
		{
			path = "vo/npc/male01/ok02.wav",
			length = 0.64480727910995,
		},
		{
			path = "vo/npc/male01/ok01.wav",
			length = 0.46235826611519,
		},
		{
			path = "vo/npc/female01/ok01.wav",
			length = 0.48616778850555,
		},
		{
			path = "vo/npc/female01/ok02.wav",
			length = 0.49850338697433,
		},
	}

	L["haha"] = {
		{
			path = "vo/npc/barney/ba_laugh01.wav",
			length = 1.315328836441,
		},
		{
			path = "vo/npc/barney/ba_laugh02.wav",
			length = 1.4632879495621,
		},
		{
			path = "vo/npc/barney/ba_laugh04.wav",
			length = 1.413968205452,
		},
		{
			path = "vo/citadel/br_laugh01.wav",
			length = 3.8755328655243,
		},
	}

	L["tf6"] = {
		{
			path = "vo/announcer_ends_6sec.wav",
			length = 1.2451701164246,
		},
	}

	L["run"] = {
		{
			path = "vo/npc/male01/strider_run.wav",
			length = 2.0011336803436,
		},
	}

	L["tf5"] = {
		{
			path = "vo/announcer_ends_5sec.wav",
			length = 1.0956915616989,
		},
	}

	L["wow"] = {
		{
			path = "vo/outland_07/barn/al_barn_putusdown01.wav",
			length = 0.84800451993942,
		},
	}

	L["one"] = {
		{
			path = "npc/metropolice/vo/one.wav",
			length = 0.16777777671814,
		},
	}

	L["huh"] = {
		{
			path = "vo/episode_1/intro/al_hopelessnoaccess02.wav",
			length = 0.37877550721169,
		},
	}

	L["no!"] = {
		{
			path = "vo/npc/male01/no02.wav",
			length = 1.3854421377182,
		},
		{
			path = "vo/npc/male01/no01.wav",
			length = 1.3793424367905,
		},
		{
			path = "vo/coast/odessa/female01/nlo_cubdeath01.wav",
			length = 2.1246259212494,
		},
		{
			path = "vo/coast/odessa/female01/nlo_cubdeath02.wav",
			length = 0.74594104290009,
		},
		{
			path = "vo/streetwar/alyx_gate/al_no.wav",
			length = 0.93965989351273,
		},
		{
			path = "vo/npc/barney/ba_no01.wav",
			length = 1.1253061294556,
		},
		{
			path = "vo/npc/barney/ba_no02.wav",
			length = 1.0149886608124,
		},
		{
			path = "vo/citadel/br_no.wav",
			length = 0.78303855657578,
		},
		post = function(chtsnd) chtsnd:GetPlayer():DoAnimationEvent( ACT_GMOD_GESTURE_DISAGREE ) end,
	}

	L["noo"] = {
		{
			path = "vo/npc/male01/no02.wav",
			length = 1.3854421377182,
		},
		{
			path = "vo/npc/male01/no01.wav",
			length = 1.3793424367905,
		},
		{
			path = "vo/coast/odessa/female01/nlo_cubdeath01.wav",
			length = 2.1246259212494,
		},
		{
			path = "vo/coast/odessa/female01/nlo_cubdeath02.wav",
			length = 0.74594104290009,
		},
		{
			path = "vo/streetwar/alyx_gate/al_no.wav",
			length = 0.93965989351273,
		},
		{
			path = "vo/npc/barney/ba_no01.wav",
			length = 1.1253061294556,
		},
		{
			path = "vo/npc/barney/ba_no02.wav",
			length = 1.0149886608124,
		},
		{
			path = "vo/citadel/br_no.wav",
			length = 0.78303855657578,
		},
	}

	L["plz"] = {
		{
			path = "vo/trainyard/wife_please.wav",
			length = 1.1068707704544,
		},
	}

	L["ops"] = {
		{
			path = "vo/k_lab/ba_whoops.wav",
			length = 0.43712016940117,
		},
		{
			path = "vo/npc/female01/whoops01.wav",
			length = 0.48206350207329,
		},
		{
			path = "vo/npc/male01/whoops01.wav",
			length = 0.40922901034355,
		},
	}

	L["bye"] = {
		{
			path = "npc/turret_floor/turret_retire_1.wav",
			length = 0.8475056886673,
		},
	}

	L["cum"] = {
		{
			path = "vo/ravenholm/engage02.wav",
			length = 1.0060317516327,
		},
		{
			path = "vo/ravenholm/engage03.wav",
			length = 0.98417234420776,
		},
	}

	L["sex"] = {
		{
			path = "vo/episode_1/npc/female01/cit_remarks08.wav",
			length = 4.0841045379639,
		},
		{
			path = "vo/episode_1/npc/male01/cit_remarks08.wav",
			length = 3.7851927280426,
		},
	}

	L["ssh"] = {
		{
			path = "vo/outland_06a/radio/al_rad_sh.wav",
			length = 1.4853514432907,
		},
	}

	L["yes"] = {
		{
			path = "vo/npc/vortigaunt/yes.wav",
			length = 0.85231292247772,
		},
		post = function(chtsnd) chtsnd:GetPlayer():DoAnimationEvent( ACT_GMOD_GESTURE_AGREE ) end,
	}

	L["tf3"] = {
		{
			path = "vo/announcer_ends_3sec.wav",
			length = 1.152290225029,
		},
	}

	L["tf2"] = {
		{
			path = "vo/announcer_ends_2sec.wav",
			length = 1.0303854942322,
		},
	}

	L["tf1"] = {
		{
			path = "vo/announcer_ends_1sec.wav",
			length = 1.5151020288467,
		},
	}

	L["yay"] = {
		{
			path = "vo/coast/odessa/female01/nlo_cheer01.wav",
			length = 1.0434466600418,
		},
	}

	L["ten"] = {
		{
			path = "npc/metropolice/vo/ten.wav",
			length = 0.17299319803715,
		},
	}

	L["brb"] = {
		{
			path = "vo/outland_11a/silo/al_silo_keepeye01.wav",
			length = 1.7078911066055,
		},
	}

	L["tf4"] = {
		{
			path = "vo/announcer_ends_4sec.wav",
			length = 1.4251247644424,
		},
	}

	L["tf8"] = {
		{
			path = "vo/announcer_ends_8sec.wav",
			length = 0.85333335399628,
		},
	}

	L["hax"] = {
		{
			path = "vo/npc/female01/hacks02.wav",
			length = 0.60879820585251,
		},
		{
			path = "vo/npc/female01/hacks01.wav",
			length = 0.6378231048584,
		},
		{
			path = "vo/npc/male01/hacks02.wav",
			length = 0.77433109283447,
		},
	}

	L["tf9"] = {
		{
			path = "vo/announcer_ends_9sec.wav",
			length = 1.2770974636078,
		},
	}

	L["six"] = {
		{
			path = "npc/metropolice/vo/six.wav",
			length = 0.20333333313465,
		},
	}

	L["tf7"] = {
		{
			path = "vo/announcer_ends_7sec.wav",
			length = 1.1726076602936,
		},
	}

	L["ar3"] = {
		{
			path = "vo/outland_11a/silo/reb_silo_reb_art2.wav",
			length = 5.5466666221619,
		},
	}

	L["lol"] = {
		{
			path = "vo/npc/barney/ba_laugh01.wav",
			length = 1.315328836441,
		},
		{
			path = "vo/npc/barney/ba_laugh02.wav",
			length = 1.4632879495621,
		},
		{
			path = "vo/npc/barney/ba_laugh04.wav",
			length = 1.413968205452,
		},
		{
			path = "vo/citadel/br_laugh01.wav",
			length = 3.8755328655243,
		},
	}

	L["hai"] = {
		{
			path = "vo/npc/female01/hi01.wav",
			length = 0.37807255983353,
		},
		{
			path = "vo/npc/female01/hi02.wav",
			length = 0.31541949510574,
		},
		{
			path = "vo/npc/male01/hi01.wav",
			length = 0.23557822406292,
		},
		{
			path = "vo/npc/male01/hi02.wav",
			length = 0.34301587939262,
		},
	}

	L["dad"] = {
		{
			path = "vo/outland_12a/launch/al_launch_daddad01.wav",
			length = 0.70365077257156,
		},
		{
			path = "vo/outland_12a/launch/al_launch_daddad02.wav",
			length = 0.80557823181152,
		},
		{
			path = "vo/outland_12a/launch/al_launch_dadimnot01.wav",
			length = 0.56258505582809,
		},
		{
			path = "vo/outland_12a/launch/al_launch_dadimnot01.wav",
			length = 0.56258505582809,
		},
		{
			path = "vo/outland_12a/launch/al_launch_dadcry.wav",
			length = 1.8347846269608,
		},
		{
			path = "vo/outland_12a/launch/al_launch_nodad01.wav",
			length = 1.3440816402435,
		},
	}

	L["why"] = {
		{
			path = "npc/turret_floor/turret_disabled_7.wav",
			length = 1.640589594841,
		},
	}

	L["nah"] = {
		{
			path = "vo/engineer_no02.wav",
			length = 0.690793633461,
		},
	}

	L["two"] = {
		{
			path = "npc/metropolice/vo/two.wav",
			length = 0.23859409987926,
		},
	}

	L["kay"] = {
		{
			path = "vo/npc/male01/ok02.wav",
			length = 0.64480727910995,
		},
		{
			path = "vo/npc/male01/ok01.wav",
			length = 0.46235826611519,
		},
		{
			path = "vo/npc/female01/ok01.wav",
			length = 0.48616778850555,
		},
		{
			path = "vo/npc/female01/ok02.wav",
			length = 0.49850338697433,
		},
	}

	L["hay"] = {
		{
			path = "vo/npc/female01/hi01.wav",
			length = 0.37807255983353,
		},
		{
			path = "vo/npc/female01/hi02.wav",
			length = 0.31541949510574,
		},
		{
			path = "vo/npc/male01/hi01.wav",
			length = 0.23557822406292,
		},
		{
			path = "vo/npc/male01/hi02.wav",
			length = 0.34301587939262,
		},
	}

	L["aah"] = {
		{
			path = "vo/k_lab/kl_ahhhh.wav",
			length = 0.73158729076385,
		},
	}

	L["no"] = {
		{
			path = "vo/medic_no02.wav",
			length = 0.39328798651695,
		},
		{
			path = "vo/sniper_no01.wav",
			length = 0.51954650878906,
		},
		{
			path = "vo/spy_no02.wav",
			length = 0.42376416921616,
		},
		{
			path = "vo/scout_no02.wav",
			length = 0.52680271863937,
		},
		post = function(chtsnd) chtsnd:GetPlayer():DoAnimationEvent( ACT_GMOD_GESTURE_DISAGREE ) end,
	}

	L["ok"] = {
		{
			path = "vo/npc/male01/ok02.wav",
			length = 0.64480727910995,
		},
		{
			path = "vo/npc/male01/ok01.wav",
			length = 0.46235826611519,
		},
		{
			path = "vo/npc/female01/ok01.wav",
			length = 0.48616778850555,
		},
		{
			path = "vo/npc/female01/ok02.wav",
			length = 0.49850338697433,
		},
	}

	L["ah"] = {
		{
			path = "vo/outland_07/barn/al_barn_lifesupport01.wav",
			length = 0.38367345929146,
		},
	}

	L["hm"] = {
		{
			path = "vo/k_lab/al_hmm.wav",
			length = 0.25126984715462,
		},
		{
			path = "vo/k_lab/al_buyyoudrink01.wav",
			length = 0.29308390617371,
		},
	}

	L["oh"] = {
		{
			path = "vo/eli_lab/mo_hereseli01.wav",
			length = 0.23984126746655,
		},
	}

	L["hi"] = {
		{
			path = "vo/npc/female01/hi01.wav",
			length = 0.37807255983353,
		},
		{
			path = "vo/npc/female01/hi02.wav",
			length = 0.31541949510574,
		},
		{
			path = "vo/npc/male01/hi01.wav",
			length = 0.23557822406292,
		},
		{
			path = "vo/npc/male01/hi02.wav",
			length = 0.34301587939262,
		},
		post = function(chtsnd) chtsnd:GetPlayer():DoAnimationEvent( ACT_GMOD_GESTURE_WAVE ) end,

	}

	L["sh"] = {
		{
			path = "",
		},

		pre = function(chtsnd)
			chatsounds.StopAllSounds()
		end,
	}

	L["6"] = {
		{
			path = "vo/outland_12a/launch/kl_launch_6.wav",
			length = 1.0666667222977,
		},
	}

	L["5"] = {
		{
			path = "vo/outland_12a/launch/kl_launch_5.wav",
			length = 0.98666667938232,
		},
	}

	L["9"] = {
		{
			path = "vo/outland_12a/launch/kl_launch_9.wav",
			length = 1.2053514719009,
		},
	}

	L["3"] = {
		{
			path = "vo/outland_12a/launch/kl_launch_3.wav",
			length = 1.109342455864,
		},
	}

	L["8"] = {
		{
			path = "vo/outland_12a/launch/kl_launch_8.wav",
			length = 0.73600906133652,
		},
	}

	L["2"] = {
		{
			path = "vo/outland_12a/launch/kl_launch_2.wav",
			length = 0.8133333325386,
		},
	}

	L["7"] = {
		{
			path = "vo/outland_12a/launch/kl_launch_7.wav",
			length = 0.9173469543457,
		},
	}

	L["4"] = {
		{
			path = "vo/outland_12a/launch/kl_launch_4.wav",
			length = 0.93868482112885,
		},
	}

	L["1"] = {
		{
			path = "vo/outland_12a/launch/kl_launch_1.wav",
			length = 1.2560091018677,
		},
	}

	L["explosion"] = {
		{
			path = "weapons/explode3.wav",
		},
		{
			path = "weapons/explode4.wav",
		},
		{
			path = "weapons/explode5.wav",
		},
	}

	L["move gear up"] = {
		{
			path = "vo/heavy_moveup01.wav",
			length = 0.94331067800522
		},
	}

	L["move gear forward"] = {
		{
			path = "vo/heavy_moveup02.wav",
			length = 1.5151020288467
		},
	}

	L["fight me"] = {
		{
			path = "vo/heavy_meleedare11.wav",
			length = 0.63999998569489
		},
	}

	L["i destroy coward toys"] = {
		{
			path = "vo/heavy_specialcompleted02.wav",
			length = 3.5410430431366
		},
	}

	L["medic"] = {
		{
			path = "vo/medic_medic02.wav",
			length = 0.72852605581284
		},
		{
			path = "vo/medic_medic03.wav",
			length = 1.5238095521927
		},
		{
			path = "vo/demoman_medic03.wav",
			length = 0.90557825565338
		},
		{
			path = "vo/demoman_medic02.wav",
			length = 0.90557825565338
		},
		{
			path = "vo/demoman_medic01.wav",
			length = 0.91718822717667
		},
		{
			path = "vo/engineer_medic02.wav",
			length = 0.67047619819641
		},
		{
			path = "vo/engineer_medic03.wav",
			length = 0.91428571939468
		},
		{
			path = "vo/pyro_medic01.wav",
			length = 0.68000000715256
		},
		{
			path = "vo/scout_medic01.wav",
			length = 0.63564628362656
		},
		{
			path = "vo/scout_medic02.wav",
			length = 0.64435374736786
		},
	}

	L["ye gottam"] = {
		{
			path = "player/survivor/voice/producer/killconfirmation06.wav",
			length = 1.3804534673691,
		},
	}
	L["gottam2"] = {
		{
			path = "player/survivor/voice/producer/killconfirmation05.wav",
			length = 0.7297505736351,
		},
	}

c.EndList()