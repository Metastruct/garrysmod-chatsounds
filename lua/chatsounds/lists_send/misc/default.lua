


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
			
			if not sound then
				chtsnd:SetSoundPath("misc/null.wav")
				return 
			end
			
			chtsnd:SetSoundPath(sound.path)
			chtsnd:SetPitch(c.GeneratePitch(sound, chtsnd:GetSeed()))
			chtsnd:SetDuration(c.GetSoundDuration(sound.path))
		end,
	}
c.EndList()


c.StartList("default")
	L["animorten"] = {
		{
			path = "vo/engineer_autoattackedbyspy03.mp3",
			length = 1.8227664232254,
		},
		{
			path = "vo/npc/female01/yeah02.wav",
			length = 0.72489798069,
		},
		{
			path = "vo/medic_no01.mp3",
			length = 0.53115648031235,
		},
		{
			path = "vo/npc/male01/yeah02.wav",
			length = 0.87521541118622,
		},
	}
	
	L["a predictable failure doctor freeman"] = {
		{
			path = "vo/citadel/br_mock04.wav",
			length = 3.5630612373352,
		},
	}

	L["im in the middle of a critical test"] = {
		{
			path = "vo/trainyard/kl_whatisit02.wav",
			length = 2.4687528610229,
		},
	}

	L["prepare for unforeseen consequences"] = {
		{
			path = "vo/outland_11a/silo/al_silo_prepare02.wav",
			length = 2.8666665554047,
		},
	}

	L["what am i supposed to do about it"] = {
		{
			path = "vo/npc/female01/answer29.wav",
			length = 1.2367347478867,
		},
	}

	L["there is no such thing as an ar3"] = {
		{
			path = "vo/outland_11a/silo/reb_silo_reb_art3.wav",
			length = 3.191995382309,
		},
	}

	L["pick up some stuff and toss it"] = {
		{
			path = "vo/eli_lab/al_pickuptoss.wav",
			length = 1.1722902059555,
		},
	}

	L["theres no such thing as an ar3"] = {
		{
			path = "vo/outland_11a/silo/reb_silo_reb_art3.wav",
			length = 3.191995382309,
		},
	}

	L["what do you think youre doing"] = {
		{
			path = "vo/citadel/br_judithwhat.wav",
			length = 2.2969160079956,
		},
	}

	L["hurry up or ill do it myself"] = {
		{
			path = "vo/outland_12a/launch/mag_launch_doitmyself.wav",
			length = 1.9621769189835,
		},
	}

	L["hunters with our bare hands"] = {
		{
			path = "vo/outland_11a/silo/reb_silo_reb_art10.wav",
			length = 10.06934261322,
		},
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

	L["just launch the damn thing"] = {
		{
			path = "vo/outland_12a/launch/mag_launch_whose.wav",
			length = 2.1130611896515,
		},
	}

	L["whats the meaning of this"] = {
		{
			path = "vo/k_lab/br_tele_02.wav",
			length = 1.0708390474319,
		},
	}

	L["there is no time to waste"] = {
		{
			path = "vo/outland_01/intro/mag_transmit_nowaste01.wav",
			length = 1.5469161272049,
		},
	}

	L["i agree its a total waste"] = {
		{
			path = "vo/citadel/br_newleader_a.wav",
			length = 1.9964399337769,
		},
	}

	L["about that beer i owed ya"] = {
		{
			path = "vo/trainyard/ba_thatbeer02.wav",
			length = 2.0448071956635,
		},
	}

	L["would you come over here"] = {
		{
			path = "npc/turret_floor/turret_autosearch_6.wav",
			length = 2.5866665840149,
			post = function(chtsnd) chtsnd:GetPlayer():DoAnimationEvent( ACT_GMOD_GESTURE_BECON ) end,
		},
	}

	L["i wonder where hes going"] = {
		{
			path = "vo/citadel/al_wonderwhere.wav",
			length = 1.3431745767593,
		},
	}

	L["i can hardly believe it"] = {
		{
			path = "vo/outland_01/intro/eli_transmit_believe03.wav",
			length = 1.4906802177429,
		},
	}

	L["unforeseen consequences"] = {
		{
			path = "vo/outland_11a/silo/eli_silo_talk01.wav",
			length = 3.2266666889191,
		},
	}

	L["are you sure about that"] = {
		{
			path = "vo/npc/male01/answer37.wav",
			length = 0.71079367399216,
		},
	}

	L["thats enough chit chat"] = {
		{
			path = "vo/outland_12a/launch/mag_launch_chitchat01.wav",
			length = 2.6238095760345,
		},
	}

	L["i cant take it anymore"] = {
		{
			path = "vo/trainyard/wife_canttake.wav",
			length = 1.5496145486832,
		},
	}

	L["why are you telling me"] = {
		{
			path = "vo/npc/male01/answer24.wav",
			length = 1.1542630195618,
		},
	}

	L["watch what youre doing"] = {
		{
			path = "vo/npc/female01/watchwhat.wav",
			length = 1.1290702819824,
		},
	}

	L["i said pick up the can"] = {
		{
			path = "npc/metropolice/vo/pickupthecan3.wav",
			length = 1.2824490070343,
		},
	}

	L["stop youre killing me"] = {
		{
			path = "vo/npc/female01/vanswer13.wav",
			length = 1.2518140077591,
		},
	}

	L["listen here magnusson"] = {
		{
			path = "vo/outland_11a/silo/kl_silo_nowmag01.wav",
			length = 2.5493423938751,
		},
	}

	L["i love you sweetheart"] = {
		{
			path = "vo/outland_12a/launch/eli_launch_iloveyousweet.wav",
			length = 1.4729704856873,
		},
	}

	L["i know what you mean"] = {
		{
			path = "vo/npc/male01/answer08.wav",
			length = 0.73981857299805,
		},
	}

	L["dont drink the water"] = {
		{
			path = "vo/trainyard/cit_water.wav",
			length = 5.9684352874756,
		},
	}

	L["you got that from me"] = {
		{
			path = "vo/npc/female01/vanswer06.wav",
			length = 1.1538321971893,
		},
	}

	L["ongoing sector sweep"] = {
		{
			path = "vo/outland_01/intro/over_camp.wav",
			length = 19.551156997681,
		},
	}

	L["sorry for the scare"] = {
		{
			path = "vo/trainyard/ba_sorryscare.wav",
			length = 3.1238322257996,
		},
	}

	L["are you still there"] = {
		{
			path = "npc/turret_floor/turret_search_1.wav",
			length = 1.6268254518509,
		},
	}

	L["magnusson is smart"] = {
		{
			path = "vo/outland_11a/silo/vort_silo_maghonor02.wav",
			length = 5.1202721595764,
		},
	}

	L["im talking to you"] = {
		{
			path = "vo/breencast/br_tofreeman02.wav",
			length = 2.1296372413635,
		},
	}

	L["run for your life"] = {
		{
			path = "vo/npc/female01/runforyourlife02.wav",
			length = 1.4856916666031,
		},
	}

	L["put it over there"] = {
		{
			path = "vo/citadel/br_gravgun.wav",
			length = 1.9662585258484,
		},
	}

	L["wheres your ball"] = {
		{
			path = "vo/eli_lab/al_wheresball.wav",
			length = 0.99913829565048,
		},
	}

	L["we have lift off"] = {
		{
			path = "vo/outland_12a/launch/mag_launch_launchsequence07.wav",
			length = 4.2610430717468,
		},
	}

	L["pick up that can"] = {
		{
			path = "npc/metropolice/vo/pickupthecan1.wav",
			length = 0.82399094104767,
		},
	}

	L["this is bullshit"] = {
		{
			path = "vo/npc/female01/question26.wav",
			length = 1.0009070634842,
		},
	}

	L["pick up the can"] = {
		{
			path = "npc/metropolice/vo/pickupthecan2.wav",
			length = 1.4770067930222,
		},
	}

	L["i dont hate you"] = {
		{
			path = "npc/turret_floor/turret_disabled_6.wav",
			length = 1.8053514957428,
		},
	}

	L["my rocket works"] = {
		{
			path = "vo/outland_12a/launch/mag_launch_launchsequence09a.wav",
			length = 3.5990250110626,
		},
	}

	L["whats the point"] = {
		{
			path = "vo/npc/female01/gordead_ans12.wav",
			length = 0.91585034132004,
		},
	}

	L["can you hear me"] = {
		{
			path = "vo/aperture_ai/post_escape_bridge_02.wav",
			length = 0.83591836690903,
		},
	}

	L["pissing me off"] = {
		{
			path = "vo/k_lab/ba_pissinmeoff.wav",
			length = 1.4620407819748,
		},
	}

	L["its safer here"] = {
		{
			path = "vo/breencast/br_welcome07.wav",
			length = 1.2229478359222,
		},
	}

	L["rise and shine"] = {
		{
			path = "vo/gman_misc/gman_riseshine.wav",
			length = 6.6548752784729,
		},
	}

	L["hes right here"] = {
		{
			path = "vo/eli_lab/al_heshere.wav",
			length = 0.65469390153885,
		},
	}

	L["i love you dad"] = {
		{
			path = "vo/outland_12a/launch/al_launch_iloveyoudad.wav",
			length = 1.8347618579865,
		},
	}

	L["thank you baby"] = {
		{
			path = "vo/outland_11a/silo/eli_silo_thankyou02.wav",
			length = 0.75464850664139,
		},
	}

	L["you never know"] = {
		{
			path = "vo/npc/male01/answer22.wav",
			length = 0.76256233453751,
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

	L["were launching"] = {
		{
			path = "vo/outland_12a/launch/mag_launch_launchsequence05.wav",
			length = 1.1270067691803,
		},
	}

	L["whats going on"] = {
		{
			path = "vo/k_lab/al_whatsgoingon.wav",
			length = 0.88210886716843,
		},
	}

	L["only a button"] = {
		{
			path = "vo/outland_12a/launch/mag_launch_onlyabutton.wav",
			length = 5.3406801223755,
		},
	}

	L["what the hell"] = {
		{
			path = "vo/k_lab/ba_whatthehell.wav",
			length = 0.87698411941528,
		},
	}

	L["ill stay here"] = {
		{
			path = "vo/npc/female01/illstayhere01.wav",
			length = 0.79528343677521,
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

	L["just a minute"] = {
		{
			path = "vo/k_lab2/kl_cantleavelamarr.wav",
			length = 0.81589567661285,
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

	L["rest my child"] = {
		{
			path = "vo/ravenholm/monk_kill03.wav",
			length = 2.0033559799194,
		},
	}

	L["what was that"] = {
		{
			path = "vo/outland_01/intro/al_rbed_whatthat.wav",
			length = 0.80000001192093,
		},
	}

	L["where are you"] = {
		{
			path = "vo/outland_06a/radio/mag_rad_expectedyou03.wav",
			length = 1.1549205780029,
		},
	}

	L["stop shooting"] = {
		{
			path = "npc/turret_floor/turret_shotat_3.wav",
			length = 1.4080045223236,
		},
	}

	L["serve mankind"] = {
		{
			path = "vo/breencast/br_tofreeman12.wav",
			length = 1.429093003273,
		},
	}

	L["fiddlesticks"] = {
		{
			path = "vo/k_lab/kl_fiddlesticks.wav",
			length = 2.2442629337311,
		},
	}

	L["portal storm"] = {
		{
			path = "vo/outland_01/intro/al_rbed_aportalstorm.wav",
			length = 1.3120181560516,
		},
	}

	L["what is that"] = {
		{
			path = "vo/aperture_ai/escape_02_sphere_curiosity-02.wav",
			length = 0.7343310713768,
		},
	}

	L["funny scream"] = {
		{
			path = "vo/ravenholm/monk_death07.wav",
			length = 6.0781860351563,
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
			path = "vo/breencast/br_overwatch07.wav",
			length = 48.456371307373,
		},
	}

	L["life support"] = {
		{
			path = "vo/outland_07/barn/al_barn_lifesupport02.wav",
			length = 0.86934238672256,
		},
	}

	L["shut it down"] = {
		{
			path = "vo/k_lab/eli_shutdown.wav",
			length = 1.4982086420059,
		},
	}

	L["check it out"] = {
		{
			path = "vo/outland_11a/magtraining/mirt_brief_yanktrunk01.wav",
			length = 0.61036282777786,
		},
	}

	L["oh my god no"] = {
		{
			path = "vo/outland_12a/launch/al_launch_impaling01_alt2.wav",
			length = 1.8693196773529,
		},
	}

	L["there you go"] = {
		{
			path = "vo/outland_11a/magtraining/mag_tutor_nottoohard01.wav",
			length = 1.1536281108856,
		},
	}

	L["gutwrenching"] = {
		{
			path = "npc/fast_zombie/fz_scream1.wav",
			length = 1.6591383218765,
		},
	}

	L["steamfriends"] = {
		{
			path = "friends/message.wav",
			length = 0.47891157865524,
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

	L["fascinating"] = {
		{
			path = "vo/k_lab2/kl_slowteleport01.wav",
			length = 1.5657823085785,
		},
	}

	L["god damn it"] = {
		{
			path = "vo/outland_12/reb1_lastwaveannounced03.wav",
			length = 4.4373469352722,
		},
	}

	--VINH'LL FIX IT@@
	L["vinhll fix it"] = {
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

	L["vital alert"] = {
		{
			path = "vo/outland_07/barn/over_barn.wav",
			length = 17.507823944092,
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

	L["im a genius"] = {
		{
			path = "vo/outland_12a/launch/mag_launch_launchsequence09b.wav",
			length = 5.1043086051941,
		},
	}

	L["who are you"] = {
		{
			path = "vo/k_lab/br_tele_03.wav",
			length = 1.0629024505615,
		},
	}

	L["put me down"] = {
		{
			path = "npc/turret_floor/turret_pickup_3.wav",
			length = 2.0480046272278,
		},
	}

	L["im with you"] = {
		{
			path = "vo/npc/male01/answer13.wav",
			length = 0.76950114965439,
		},
	}

	L["so what now"] = {
		{
			path = "vo/outland_11a/silo/reb1_idles01.wav",
			length = 1.7066667079926,
		},
	}

	L["headhumpers"] = {
		{
			path = "vo/npc/barney/ba_headhumpers.wav",
			length = 1.2460770606995,
		},
	}

	L["sounds good"] = {
		{
			path = "vo/episode_1/c17/al_evac_soundsgood01.wav",
			length = 0.78657597303391,
		},
	}

	L["get in here"] = {
		{
			path = "vo/canals/matt_getin.wav",
			length = 0.9745124578476,
		},
	}

	L["there he is"] = {
		{
			path = "vo/k_lab/ba_thereheis.wav",
			length = 0.79578232765198,
		},
	}

	L["great scott"] = {
		{
			path = "vo/k_lab2/kl_greatscott.wav",
			length = 1.6252380609512,
		},
	}

	L["im not deaf"] = {
		{
			path = "vo/outland_01/intro/mag_transmit_whatnow.wav",
			length = 2.9839682579041,
		},
	}

	L["you need me"] = {
		{
			path = "vo/citadel/br_youneedme.wav",
			length = 1.5195918083191,
		},
	}

	L["this is bad"] = {
		{
			path = "vo/npc/male01/gordead_ques10.wav",
			length = 0.70736962556839,
		},
	}

	L["just a min"] = {
		{
			path = "vo/k_lab2/kl_cantleavelamarr.wav",
			length = 0.81589567661285,
		},
	}

	L["ok lets go"] = {
		{
			path = "radio/go.wav",
			length = 1.3682539463043,
		},
	}

	L["good night"] = {
		{
			path = "npc/turret_floor/turret_retire_5.wav",
			length = 1.5786848068237,
		},
	}

	L["its a trap"] = {
		{
			path = "vo/outland_10/olde-inne/al_inn_trap.wav",
			length = 1.0026757717133,
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

	L["i love you"] = {
		{
			path = "vo/episode_1/intro/al_dadiloveyou02.wav",
			length = 0.85603177547455,
		},
	}

	L["behind you"] = {
		{
			path = "vo/npc/female01/behindyou01.wav",
			length = 0.76770973205566,
		},
	}

	L["all aboard"] = {
		{
			path = "vo/episode_1/c17/al_finale_allaboard.wav",
			length = 0.8489795923233,
		},
	}

	L["girlscream"] = {
		{
			path = "vo/episode_1/c17/al_elev_zombiesurprise.wav",
			length = 0.46882086992264,
		},
	}

	L["had enough"] = {
		{
			path = "vo/outland_11a/magtraining/mag_tutor_hadenough.wav",
			length = 1.0288435220718,
		},
	}

	L["god dammit"] = {
		{
			path = "vo/outland_12/reb1_lastwaveannounced03.wav",
			length = 4.4373469352722,
		},
	}

	L["dont shoot"] = {
		{
			path = "npc/turret_floor/turret_shotat_2.wav",
			length = 1.3653514385223,
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

	L["thank you"] = {
		{
			path = "vo/outland_12a/launch/mag_launch_thankyou03.wav",
			length = 0.50514739751816,
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

	L["ye gottam"] = {
		{
			path = "player/survivor/voice/producer/killconfirmation06.wav",
			length = 1.3804534673691,
		},
	}

	L["greetings"] = {
		{
			path = "vo/ravenholm/yard_greetings.wav",
			length = 4.4145579338074,
		},
	}

	L["cant talk"] = {
		{
			path = "vo/trainyard/male01/cit_pedestrian03.wav",
			length = 2.5875964164734,
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

	L["watch out"] = {
		{
			path = "vo/npc/female01/watchout.wav",
			length = 0.72707480192184,
		},
	}

	L["haha yeah"] = {
		{
			path = "vo/outland_12/reb1_striderdown05.wav",
			length = 2.6026756763458,
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

	L["any ideas"] = {
		{
			path = "vo/episode_1/intro/al_chasm_dogideas03.wav",
			length = 0.98249435424805,
		},
	}

	L["wanna bet"] = {
		{
			path = "vo/npc/female01/answer27.wav",
			length = 0.5987074971199,
		},
	}

	L["seventeen"] = {
		{
			path = "npc/metropolice/vo/seventeen.wav",
			length = 0.37743765115738,
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

	L["same here"] = {
		{
			path = "vo/npc/male01/answer07.wav",
			length = 0.72655326128006,
		},
	}

	L["thank god"] = {
		{
			path = "vo/outland_01/intro/eli_transmit_believe02.wav",
			length = 1.2746711969376,
		},
	}

	L["excuse me"] = {
		{
			path = "npc/turret_floor/turret_collide_2.wav",
			length = 1.161337852478,
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

	L["you idiot"] = {
		{
			path = "vo/outland_02/sheckley_idiot02.wav",
			length = 0.88478457927704,
		},
	}

	L["you there"] = {
		{
			path = "vo/coast/bugbait/sandy_youthere.wav",
			length = 0.82335603237152,
		},
	}

	L["get going"] = {
		{
			path = "vo/canals/matt_go_nag04.wav",
			length = 0.76265305280685,
		},
	}

	L["what now"] = {
		{
			path = "vo/npc/female01/gordead_ques16.wav",
			length = 0.51780045032501,
		},
	}

	L["nineteen"] = {
		{
			path = "npc/metropolice/vo/nineteen.wav",
			length = 0.23219954967499,
		},
	}

	L["good god"] = {
		{
			path = "vo/outland_01/intro/eli_transmit_goodgod.wav",
			length = 1.5466666221619,
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

	L["this way"] = {
		{
			path = "vo/npc/barney/ba_followme01.wav",
			length = 1.1672109365463,
		},
	}

	L["thirteen"] = {
		{
			path = "npc/metropolice/vo/thirteen.wav",
			length = 0.19031746685505,
		},
	}

	L["allright"] = {
		{
			path = "vo/eli_lab/al_allright01.wav",
			length = 0.70283448696136,
		},
	}

	L["fourteen"] = {
		{
			path = "npc/metropolice/vo/fourteen.wav",
			length = 0.30922901630402,
		},
	}

	L["grenades"] = {
		{
			path = "vo/streetwar/sniper/ba_nag_grenade05.wav",
			length = 2.1695010662079,
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

	L["fuck you"] = {
		{
			path = "vo/streetwar/rubble/ba_tellbreen.wav",
			length = 5.1877098083496,
		},
	}

	L["thats it"] = {
		{
			path = "vo/k_lab/al_thatsit.wav",
			length = 0.61356008052826,
		},
	}

	L["now what"] = {
		{
			path = "vo/npc/female01/gordead_ans01.wav",
			length = 0.79664397239685,
		},
	}

	L["tea time"] = {
		{
			path = "vo/outland_11a/silo/mag_silo_excuseme01.wav",
			length = 3.5759863853455,
		},
	}

	L["good bye"] = {
		{
			path = "npc/turret_floor/turret_retire_1.wav",
			length = 0.8475056886673,
		},
	}

	L["eighteen"] = {
		{
			path = "npc/metropolice/vo/eighteen.wav",
			length = 0.34859409928322,
		},
	}

	L["lift off"] = {
		{
			path = "vo/outland_12a/launch/mag_launch_launchsequence08c.wav",
			length = 2.6470749378204,
		},
	}

	L["right on"] = {
		{
			path = "vo/npc/female01/answer32.wav",
			length = 0.65689343214035,
		},
	}

	L["my fault"] = {
		{
			path = "npc/turret_floor/turret_collide_4.wav",
			length = 1.2200000286102,
		},
	}

	L["you fool"] = {
		{
			path = "vo/citadel/br_youfool.wav",
			length = 0.92446714639664,
		},
	}

	L["good boy"] = {
		{
			path = "vo/outland_11/dogfight/al_str_goodboy.wav",
			length = 0.83201813697815,
		},
	}

	L["cumsound"] = {
		{
			path = "physics/flesh/flesh_bloody_impact_hard1.wav",
			length = 0.36589568853378,
		},
	}

	L["oh great"] = {
		{
			path = "vo/episode_1/c17/al_pb1_ohgreat.wav",
			length = 0.87632650136948,
		},
	}

	L["hold on"] = {
		{
			path = "vo/novaprospekt/al_holdon.wav",
			length = 1.1046712398529,
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

	L["at last"] = {
		{
			path = "vo/outland_12a/launch/kl_launch_atlast.wav",
			length = 1.3653514385223,
		},
	}

	L["goodbye"] = {
		{
			path = "npc/turret_floor/turret_retire_1.wav",
			length = 0.8475056886673,
		},
	}

	L["take it"] = {
		{
			path = "vo/eli_lab/al_takeit.wav",
			length = 0.38977324962616,
		},
	}

	L["fifteen"] = {
		{
			path = "npc/metropolice/vo/fifteen.wav",
			length = 0.27809524536133,
		},
	}

	L["quickly"] = {
		{
			path = "vo/outland_11a/silo/mag_silo_followquick04.wav",
			length = 0.56160998344421,
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

	L["cheer"] = {
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

	L["ah crap"] = {
		{
			path = "vo/outland_08/chopper/al_chop_enginefire02.wav",
			length = 1.1120181083679,
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

	L["alright"] = {
		{
			path = "vo/outland_11/dogfight/al_str_thanksagain01.wav",
			length = 0.48102042078972,
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

	L["get out"] = {
		{
			path = "vo/canals/shanty_go_nag01.wav",
			length = 0.81616777181625,
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

	L["excited"] = {
		{
			path = "vo/outland_12a/launch/mag_launch_launchsequence08d.wav",
			length = 8.8584127426147,
		},
	}

	L["sixteen"] = {
		{
			path = "npc/metropolice/vo/sixteen.wav",
			length = 0.35333332419395,
		},
	}

	L["careful"] = {
		{
			path = "vo/k_lab/al_careful.wav",
			length = 0.96256238222122,
		},
	}

	L["finally"] = {
		{
			path = "vo/npc/female01/finally.wav",
			length = 0.99265307188034,
		},
	}

	L["welcome"] = {
		{
			path = "vo/breencast/br_welcome01.wav",
			length = 3.8682765960693,
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

	L["figures"] = {
		{
			path = "vo/npc/male01/answer03.wav",
			length = 0.58519273996353,
		},
	}

	L["oh dear"] = {
		{
			path = "vo/k_lab/kl_ohdear.wav",
			length = 0.57646256685257,
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

	L["oh yeah"] = {
		{
			path = "vo/npc/barney/ba_ohyeah.wav",
			length = 1.4270294904709,
		},
	}

	L["awesome"] = {
		{
			path = "vo/eli_lab/al_awesome.wav",
			length = 0.82247167825699,
		},
	}

	L["kanskje"] = {
		{
			path = "vo/coast/barn/male01/lite_gunship02.wav",
			length = 0.8969841003418,
		},
	}

	L["gottam2"] = {
		{
			path = "player/survivor/voice/producer/killconfirmation05.wav",
			length = 0.7297505736351,
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

	L["chime1"] = {
		{
			path = "ambient/levels/canals/windchine1.wav",
			length = 8.546802520752,
		},
	}

	L["hurray"] = {
		{
			path = "vo/coast/odessa/female01/nlo_cheer03.wav",
			length = 2.4729251861572,
		},
	}

	L["follow"] = {
		{
			path = "vo/coast/cardock/le_followme.wav",
			length = 0.7926983833313,
		},
	}

	L["steady"] = {
		{
			path = "vo/outland_12a/launch/mag_launch_launchsequence06.wav",
			length = 1.4746031761169,
		},
	}

	L["eleven"] = {
		{
			path = "npc/metropolice/vo/eleven.wav",
			length = 0.26176869869232,
		},
	}

	L["chime4"] = {
		{
			path = "ambient/levels/canals/windchime4.wav",
			length = 1.1844670772552,
		},
	}

	L["oh god"] = {
		{
			path = "vo/npc/female01/gordead_ans04.wav",
			length = 0.76630383729935,
		},
	}

	L["got it"] = {
		{
			path = "vo/episode_1/citadel/al_doorhacks01b.wav",
			length = 0.56521540880203,
		},
	}

	L["twenty"] = {
		{
			path = "npc/metropolice/vo/twenty.wav",
			length = 0.29634919762611,
		},
	}

	L["omg no"] = {
		{
			path = "vo/outland_12a/launch/al_launch_impaling01_alt2.wav",
			length = 1.8693196773529,
		},
	}

	L["woohoo"] = {
		{
			path = "vo/coast/odessa/female01/nlo_cheer02.wav",
			length = 1.0753741264343,
		},
	}

	L["my god"] = {
		{
			path = "vo/outland_01/intro/al_transmit_grabbed01.wav",
			length = 1.0506802797318,
		},
	}

	L["thirty"] = {
		{
			path = "npc/metropolice/vo/thirty.wav",
			length = 0.27578231692314,
		},
	}

	L["please"] = {
		{
			path = "vo/trainyard/wife_please.wav",
			length = 1.1068707704544,
		},
	}

	L["chime2"] = {
		{
			path = "ambient/levels/canals/windchime2.wav",
			length = 1.7732880115509,
		},
	}

	L["twelve"] = {
		{
			path = "npc/metropolice/vo/twelve.wav",
			length = 0.37582767009735,
		},
	}

	L["gogogo"] = {
		{
			path = "radio/com_go.wav",
			length = 1.3292063474655,
		},
	}

	L["indeed"] = {
		{
			path = "vo/outland_12a/launch/mag_launch_indeed.wav",
			length = 0.69655328989029,
		},
	}

	L["oh shi"] = {
		{
			path = "vo/citadel/br_ohshit.wav",
			length = 1.2653287649155,
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

	L["yeargh"] = {
		{
			path = "npc/fast_zombie/fz_scream1.wav",
			length = 1.6591383218765,
		},
	}

	L["anyone"] = {
		{
			path = "vo/outland_11a/silo/mag_silo_falsealarms03.wav",
			length = 0.89827662706375,
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

	L["get in"] = {
		{
			path = "vo/episode_1/c17/al_elev_getingetin.wav",
			length = 0.98539680242538,
		},
	}

	L["cheese"] = {
		{
			path = "vo/npc/male01/question06.wav",
			length = 3.4074831008911,
		},
	}

	L["listen"] = {
		{
			path = "vo/outland_10/olde-inne/al_ambush_listen.wav",
			length = 0.73403626680374,
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

	L["choke"] = {
		{
			path = "player/pl_drown1.wav",
			length = 0.84464854001999,
		},
	}

	L["three"] = {
		{
			path = "npc/metropolice/vo/three.wav",
			length = 0.2187981903553,
		},
	}

	L["sweet"] = {
		{
			path = "vo/eli_lab/al_sweet.wav",
			length = 0.90598636865616,
		},
	}

	L["eight"] = {
		{
			path = "npc/metropolice/vo/eight.wav",
			length = 0.13791383802891,
		},
	}

	L["sing2"] = {
		{
			path = "vo/eli_lab/al_hums_b.wav",
			length = 4.7082767486572,
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

	L["ohshi"] = {
		{
			path = "vo/citadel/br_ohshit.wav",
			length = 1.2653287649155,
		},
	}

	L["uh oh"] = {
		{
			path = "vo/novaprospekt/al_uhoh_np.wav",
			length = 0.69757372140884,
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

	L["teddy"] = {
		{
			path = "ambient/creatures/teddy.wav",
			length = 0.59727889299393,
		},
	}

	L["weird"] = {
		{
			path = "vo/episode_1/citadel/al_core_controlcrazy01.wav",
			length = 0.86929702758789,
		},
	}

	L["so um"] = {
		{
			path = "vo/outland_12a/launch/mag_launch_thankyou02.wav",
			length = 1.1377551555634,
		},
	}

	L["error"] = {
		{
			path = "buttons/button8.wav",
			length = 0.63777780532837,
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

	L["hurry"] = {
		{
			path = "vo/eli_lab/al_intoairlock04.wav",
			length = 0.80698412656784,
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

	L["sing1"] = {
		{
			path = "vo/eli_lab/al_hums.wav",
			length = 2.9383220672607,
		},
	}

	L["kaze"] = {
		{
			path = "vo/citadel/br_youneedme.wav",
			length = 1.5195918083191,
		},
		{
			path = "vo/citadel/br_gravgun.wav",
			length = 1.9662585258484,
		},
		{
			path = "vo/citadel/br_judithwhat.wav",
			length = 2.2969160079956,
		},
		{
			path = "vo/citadel/br_newleader_a.wav",
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
			path = "vo/citadel/br_yesjudith.wav",
			length = 1.3907710313797,
		},
		{
			path = "vo/citadel/br_youfool.wav",
			length = 0.92446714639664,
		},
		{
			path = "vo/citadel/br_youneedme.wav",
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

	L["seven"] = {
		{
			path = "npc/metropolice/vo/seven.wav",
			length = 0.24111111462116,
		},
	}

	L["no"] = {
		{
			path = "vo/npc/male01/no02.wav",
			length = 1.3854421377182,
		},
		post = function(chtsnd) chtsnd:GetPlayer():DoAnimationEvent( ACT_GMOD_GESTURE_DISAGREE ) end,
	}

	L["ready"] = {
		{
			path = "vo/episode_1/c17/al_pb1_ready.wav",
			length = 0.60353744029999,
		},
	}

	L["never"] = {
		{
			path = "vo/citadel/eli_nonever.wav",
			length = 0.62045353651047,
		},
	}

	L["duck"] = {
		{
			path = "vo/npc/barney/ba_duck.wav",
			length = 1.0245578289032,
		},
	}

	L["eugh"] = {
		{
			path = "vo/outland_12a/launch/mag_launch_check12a.wav",
			length = 0.91877549886703,
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

	L["nine"] = {
		{
			path = "npc/metropolice/vo/nine.wav",
			length = 0.18791383504868,
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

	L["four"] = {
		{
			path = "npc/metropolice/vo/four.wav",
			length = 0.24977324903011,
		},
	}

	L["five"] = {
		{
			path = "npc/metropolice/vo/five.wav",
			length = 0.26299318671227,
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

	L["damn"] = {
		{
			path = "vo/outland_01/intro/al_rbed_whatnow01.wav",
			length = 0.68535149097443,
		},
	}

	L["crap"] = {
		{
			path = "vo/outland_06a/radio/al_rad_crap.wav",
			length = 1.3440135717392,
		},
	}

	L["dont"] = {
		{
			path = "vo/outland_12a/launch/al_launch_dadimnot02.wav",
			length = 0.84986394643784,
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

	L["phew"] = {
		{
			path = "vo/episode_1/c17/al_elev_phew.wav",
			length = 1.0681178569794,
		},
	}

	L["sshh"] = {
		{
			path = "vo/outland_06a/radio/al_rad_sh.wav",
			length = 1.4853514432907,
		},
	}

	L["look"] = {
		{
			path = "vo/outland_07/barn/al_barn_podslaunched01.wav",
			length = 0.8173696398735,
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

	L["zero"] = {
		{
			path = "npc/metropolice/vo/zero.wav",
			length = 0.27106577157974,
		},
	}

	L["woah"] = {
		{
			path = "vo/outland_01/intro/al_rbed_whoa.wav",
			length = 0.86401361227036,
		},
	}

	L["aowl"] = {
		{
			path = "vo/trainyard/cit_pacing.wav",
			length = 8.9190702438354,
		},
	}

	L["good"] = {
		{
			path = "vo/outland_11/dogfight/al_str_good.wav",
			length = 0.84934240579605,
		},
	}

	L["sure"] = {
		{
			path = "vo/eli_lab/al_gravgun.wav",
			length = 0.50990927219391,
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

	L["yes"] = {
		{
			path = "vo/citadel/al_success_yes_nr.wav",
			length = 2.2283446788788,
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

	L["ssh"] = {
		{
			path = "vo/outland_06a/radio/al_rad_sh.wav",
			length = 1.4853514432907,
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

	L["ar3"] = {
		{
			path = "vo/outland_11a/silo/reb_silo_reb_art2.wav",
			length = 5.5466666221619,
		},
	}

	L["brb"] = {
		{
			path = "vo/outland_11a/silo/al_silo_keepeye01.wav",
			length = 1.7078911066055,
		},
	}

	L["run"] = {
		{
			path = "vo/npc/male01/strider_run.wav",
			length = 2.0011336803436,
		},
	}

	L["yes"] = {
		{
			path = "vo/npc/vortigaunt/yes.wav",
			length = 0.85231292247772,
		},
		post = function(chtsnd) chtsnd:GetPlayer():DoAnimationEvent( ACT_GMOD_GESTURE_AGREE ) end,
	}

	L["no"] = {
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

	L["one"] = {
		{
			path = "npc/metropolice/vo/one.wav",
			length = 0.16777777671814,
		},
	}

	L["two"] = {
		{
			path = "npc/metropolice/vo/two.wav",
			length = 0.23859409987926,
		},
	}

	L["huh"] = {
		{
			path = "vo/episode_1/intro/al_hopelessnoaccess02.wav",
			length = 0.37877550721169,
		},
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

	L["ten"] = {
		{
			path = "npc/metropolice/vo/ten.wav",
			length = 0.17299319803715,
		},
	}

	L["why"] = {
		{
			path = "npc/turret_floor/turret_disabled_7.wav",
			length = 1.640589594841,
		},
	}

	L["bye"] = {
		{
			path = "npc/turret_floor/turret_retire_1.wav",
			length = 0.8475056886673,
		},
	}

	L["six"] = {
		{
			path = "npc/metropolice/vo/six.wav",
			length = 0.20333333313465,
		},
	}

	L["wow"] = {
		{
			path = "vo/outland_07/barn/al_barn_putusdown01.wav",
			length = 0.84800451993942,
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

	L["plz"] = {
		{
			path = "vo/trainyard/wife_please.wav",
			length = 1.1068707704544,
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

	L["yay"] = {
		{
			path = "vo/coast/odessa/female01/nlo_cheer01.wav",
			length = 1.0434466600418,
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

	L["oh"] = {
		{
			path = "vo/eli_lab/mo_hereseli01.wav",
			length = 0.23984126746655,
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
			if chatsounds.AllowStopSounds:GetBool() or chtsnd:GetPlayer() == LocalPlayer() then
				chatsounds.StopAllSounds()
			end
		end,
	}

	L["5"] = {
		{
			path = "vo/outland_12a/launch/kl_launch_5.wav",
			length = 0.98666667938232,
		},
	}

	L["8"] = {
		{
			path = "vo/outland_12a/launch/kl_launch_8.wav",
			length = 0.73600906133652,
		},
	}

	L["7"] = {
		{
			path = "vo/outland_12a/launch/kl_launch_7.wav",
			length = 0.9173469543457,
		},
	}

	L["6"] = {
		{
			path = "vo/outland_12a/launch/kl_launch_6.wav",
			length = 1.0666667222977,
		},
	}

	L["4"] = {
		{
			path = "vo/outland_12a/launch/kl_launch_4.wav",
			length = 0.93868482112885,
		},
	}

	L["3"] = {
		{
			path = "vo/outland_12a/launch/kl_launch_3.wav",
			length = 1.109342455864,
		},
	}

	L["9"] = {
		{
			path = "vo/outland_12a/launch/kl_launch_9.wav",
			length = 1.2053514719009,
		},
	}

	L["1"] = {
		{
			path = "vo/outland_12a/launch/kl_launch_1.wav",
			length = 1.2560091018677,
		},
	}

	L["2"] = {
		{
			path = "vo/outland_12a/launch/kl_launch_2.wav",
			length = 0.8133333325386,
		},
	}
c.EndList()