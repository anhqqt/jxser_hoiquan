--coding by romandou 2004-12-22
--战役的报名点Npc对话脚本

IncludeLib("BATTLE")
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\battleinfo.lua")

Include("\\script\\battles\\vngbattlesign.lua")


function main()
dofile("script/battles/battlejoin.lua");	
	local nWorld, _, _ = GetWorldPos()
	--if nWorld ~= 162 then
		--Talk(1, "", "Ch鴆 n╪g  ng.")
		--return
	--end
	local nOldSubWorld = SubWorld
		if ( GetLevel() >= 40 and GetLevel() < 80 ) then
		SubWorld = SubWorldID2Idx(323)
	elseif ( GetLevel() >= 80 and GetLevel() < 120 ) then
		SubWorld = SubWorldID2Idx(324)
		else
			SubWorld = SubWorldID2Idx(325)
	end
	bt_setnormaltask2type()
	if (BT_GetGameData(GAME_BATTLEID) == 0 ) then
		Say("Чi qu﹏ c馻 ta v蒼 ch璦 xu蕋 ph竧! H穣 t筸 th阨 ngh� ng琲 i tin nh�!",0)
		SubWorld = nOldSubWorld
		return
	end

-------------------------------------------------------------------	
--判断玩家等级与报名点等级是否相适合
	wid = SubWorldIdx2ID(SubWorld);
	local pl_level = GetLevel() --玩家等级
	local bt_level = 0;	-- 当前地图所属的战役等级
	
	if (pl_level < 40 ) then
		Say("Chi課 trng ch� d祅h cho ngi t� c蕄 40 tr� l猲, ngi ch璦  甶襲 ki謓. C� g緉g t藀 luy謓 th猰 甶!",2, "Л頲!/bt_oncancel", "Ta mu鑞 t譵 hi觰 th玭g tin chi課 d辌h./bt_onbattleinfo");--？？“你的等级小于40级或者没有带足银两。”
		SubWorld = nOldSubWorld
		return 
	elseif (pl_level < 80) then
		bt_level = 1
	elseif (pl_level < 120) then
		bt_level = 2
	else
		bt_level = 3
	end;
		if ( GetLevel() >= 40 and GetLevel() < 80 ) then
		SubWorld = SubWorldID2Idx(323)
	elseif ( GetLevel() >= 80 and GetLevel() < 120 ) then
		SubWorld = SubWorldID2Idx(324)
		else
			SubWorld = SubWorldID2Idx(325)
	end
	if (tbGAME_SIGNMAP[bt_level] ~= wid) then
		 local maplevel = bt_map2battlelevel(wid)
		 if ( maplevel == 0) then
		 	print("B竜 danh T鑞g Kim, ID c� v蕁 , xin b� ph薾 v薾 h祅h ki觤 tra g蕄!");
		 	SubWorld = nOldSubWorld
		 	return 	
		 end
		 Say("Khu v鵦 n祔 l� "..szGAME_GAMELEVEL[maplevel]..", Ъng c蕄 c馻 ngi hi謓 gi� ch� c� th� "..szGAME_GAMELEVEL[bt_level].." b竜 danh!", 0)--？？没有分等级的提示信息		 
		 SubWorld = nOldSubWorld
		 return
	end

-------------------------------------------------------------------	
	if ( GetLevel() >= 40 and GetLevel() < 80 ) then
		SubWorld = SubWorldID2Idx(323)
	elseif ( GetLevel() >= 80 and GetLevel() < 120 ) then
		SubWorld = SubWorldID2Idx(324)
		else
			SubWorld = SubWorldID2Idx(325)
	end
	battlemap = SubWorldID2Idx(BT_GetGameData(GAME_MAPID));
	if (battlemap < 0) then
		Say("Ti襫 phng c� v蕁 , t筸 th阨 kh玭g th� ti課 h祅h T鑞g Kim i chi課!", 0 )
		SubWorld = nOldSubWorld
		return
	end

	tempSubWorld = SubWorld;
	SubWorld = battlemap
	state = GetMissionV(MS_STATE);
	if (state == 0) then
		Say("Xin l鏸! Чi chi課 v蒼 ch璦 b総 u! L莕 sau quay l筰 nh�!", 0 )
		SubWorld = tempSubWorld;		
		return
	elseif (state == 3) then
		Say("Xin l鏸! Чi chi課  k誸 th骳! L莕 sau quay l筰 nh�!", 0)
		SubWorld = tempSubWorld;
		return
	else
		battlename = BT_GetBattleName();
	end;
	SubWorld = tempSubWorld;
	
		if ( GetLevel() >= 40 and GetLevel() < 80 ) then
		SubWorld = SubWorldID2Idx(323)
	elseif ( GetLevel() >= 80 and GetLevel() < 120 ) then
		SubWorld = SubWorldID2Idx(324)
		else
			SubWorld = SubWorldID2Idx(325)
	end
if (BT_GetGameData(GAME_BATTLEID) ~= BT_GetData(PL_BATTLEID) or BT_GetGameData(GAME_BATTLESERIES) ~= BT_GetData(PL_BATTLESERIES)) then
	if (state ~= 1 and state ~= 2 ) then
		Say("Xin l鏸! Чi chi課  k誸 th骳! L莕 sau quay l筰 nh�!", 0)
		SubWorld = nOldSubWorld
		return 
	end

	if (bt_ncamp == 1) then
		Say("Chi課 d辌h ["..battlename.."]Chi課 d辌h  b総 u, m鋓 ngi h穣 v� t� d﹏ i t鑞g, t鬰 ng� c� c﹗: Thi猲 h� h璶g vong, th蕋 phu h鱱 tr竎h. Nay ngi kim x﹎ ph筸 b� c鈏 ch髇g ta, y l� l骳 b竜 hi誹 t nc, ch� c莕 c蕄 40 tr� l猲 v� c莕 1T鑞g Kim Chi猽 Binh L謓h B礽 th� c� th� n p qu鑓 gia r錳, n祇 ngi anh em c遪 ch莕 ch� g� n鱝!", 2, "Ta tham gia! (觤 t輈h l騳 tr� v� 0) /bt_joinsong", "в ta suy ngh� l筰!/bt_oncancel");
	else
		Say("Chi課 d辌h ["..battlename.."]Chi課 d辌h  b総 u, h靑 c竎 v� d騨g s� Kim qu鑓, th阨 kh綾 nh蕋 th鑞g thi猲 h� v� d裵 b鋘 T鑞g qu鑓 nam man c秐 阯g c馻 ch髇g ta  n. Nay Kim qu鑓 r蕋 c莕 s� tr� l鵦 c馻 c竎 ngi, ch� c莕 c蕄 40 tr� l猲 v� n閜 1 T鑞g Kim Chi猽 Binh L謓h B礽 l� c� th� n p qu鑓 gia r錳, n祇 ngi anh em c遪 ch莕 ch� g� n鱝!", 2, "Ta tham gia! (觤 t輈h l騳 tr� v� 0) /bt_joinjin", "в ta suy ngh� l筰!/bt_oncancel");
	end
	SubWorld = nOldSubWorld
	return	
end;
		if ( GetLevel() >= 40 and GetLevel() < 80 ) then
		SubWorld = SubWorldID2Idx(323)
	elseif ( GetLevel() >= 80 and GetLevel() < 120 ) then
		SubWorld = SubWorldID2Idx(324)
		else
			SubWorld = SubWorldID2Idx(325)
	end
--if (BT_GetData(PL_BATTLECAMP) ~= bt_ncamp) then
if (BT_GetGameData(GAME_KEY) == BT_GetData(PL_KEYNUMBER) and BT_GetData(PL_BATTLECAMP) ~= bt_ncamp) then
	if (bt_ncamp == 1) then
		Say("Nh譶 ngi m総 la m祔 lo衪, nh蕋 nh l� Kim qu鑓 gian t�! Ngi u! B総 l蕐 h緉!",0)
		Msg2Player("Ngi  u qu﹏ cho Kim qu鑓, h穣 n g苝 M� binh quan xin nh藀 chi課 trng!")
	else
		Say("T猲 Nam man kia, c� gan th﹎ nh藀 v祇 l穘h a i Kim, r� r祅g l� t� t譵 c竔 ch誸!",0)
		Msg2Player("Ngi  u qu﹏ cho Kim qu鑓, h穣 n g苝 M� binh quan xin nh藀 chi課 trng!")	
	end;
	SubWorld = nOldSubWorld
	return 
end

----------------------------------------------------------------------
--正式报名时的条件是，
--1、已经报了本次的战役
--2、已经是本方战役的阵营了
--3、与本次战局的战局等级相符了

--正式可以报名了

	--Storm 加入挑战
	say_index = 1
	storm_ask2start(1)
end;

--正常的宋金大战对话
function storm_goon_start()
	local nOldSubWorld = SubWorld
		if ( GetLevel() >= 40 and GetLevel() < 80 ) then
		SubWorld = SubWorldID2Idx(323)
	elseif ( GetLevel() >= 80 and GetLevel() < 120 ) then
		SubWorld = SubWorldID2Idx(324)
		else
			SubWorld = SubWorldID2Idx(325)
	end
	say_index = 1
	local mem_song, mem_jin = bt_checkmemcount_balance(
	if (mem_song == nil or mem_jin == nil) then
		return
	end
	
	local tb_words = {
		"Tr鑞g tr薾  r襫 vang! Sao ngi ch璦 tham gia",
		"Ch骳 m鮪g b筺  ch輓h th鴆 tr� th祅h tng s� c馻 i T鑞g! H穣 ch鴑g t� b秐 l躰h c馻 m譶h 甶!",
		"Ch骳 m鮪g b筺  ch輓h th鴆 tr� th祅h tng s� c馻 i Kim! H穣 ch鴑g t� b秐 l躰h c馻 m譶h 甶!"
	}
	local szMsg = "Hi謓 th阨 qu﹏ s� 2 b猲 l�: "..mem_song.." --- "..mem_jin
	Say(szMsg, 2, "H穣 cho ta tham gia/bt_enterbattle", "в ta suy ngh� l筰!/bt_oncancel");
	if (bt_getgn_awardtimes() ~= 1) then
		Msg2Player("Chi課 d辌h l莕 n祔 l� <color=yellor>Иm Huy Ho祅g<color>, ph莕 thng g蕄 i so v韎 b譶h thng! C� h閕 kh玭g n猲 b� qua!")
	end
	SubWorld = nOldSubWorld
end

function bt_enterbattle()
	local nOldSubWorld = SubWorld
		if ( GetLevel() >= 40 and GetLevel() < ) then
		SubWorld = SubWorldID2Idx(323)
	elseif ( GetLevel() >= 80 and GetLevel() < 120 ) then
		SubWorld = SubWorldID2Idx(324)
		else
			SubWorld = SubWorldID2Idx(325)
	end
	local nWeekDay = tonumber(GetLocalDate("%w"))
	
	if nWeekDay == 2 or nWeekDay == 4 or nWeekDay == 6 then
		local nHour = tonumber(GetLocalDate("%H%M"))
		if( nHour >= 2045 and nHour < 2300)then
			local nNpcIndex = GetLastDiagNpc()
			local szNpcName = GetNpcName(nNpcIndex)
			local szTong = GetTong()
			if szTong ~= nil and szTong ~= "" then
				if 2 == bt_ncamp then
					if GetCityOwner(4) ~= szTong and GetCityOwner(7) == szTong then--4是汴京，7是临安, 2是金方
						Msg2Player("Bang h閕 chi誱 th祅h L﹎ An ch� 頲 b竜 danh b猲 T鑞g!")
						SubWorld = nOldSubWorld
						return
					end
				elseif 1 == bt_ncamp then
					if GetCityOwner(4) == szTong and GetCityOwner(7) ~= szTong then--4是汴京，7是临安，1是宋方
						Msg2Player("Bang h閕 chi誱 th祅h Bi謓 Kinh ch� 頲 b竜 danh b猲 Kim!")
						SubWorld = nOldSubWorld
						return
					end
				else
					SubWorld = nOldSubWorld
					return
				end
			end
		end
	end
	
	local mem_song, mem_jin = bt_checkmemcount_balance()
	if (mem_song == nil or mem_jin == nil) then
		SubWorld = nOldSubWorld
		return
	end
	
	if	bt_checkmem_for_guozan() == 0 then
		SubWorld = nOldSubWorld
		return
	end
	
	MapId = BT_GetGameData(GAME_MAPID);
	
	if (MapId > 0) then
		idx = SubWorldID2Idx(MapId);
		
		if (idx < 0) then
			Say("Xin l鏸, ti襫 tuy課 產ng c� v蕁 , t筸 th阨 kh玭g th� v祇 chi課 trng.",0)
			SignMapId = SubWorldIdx2ID(SubWorld);
			BattleId = BT_GetGameData(GAME_BATTLEID);
			print("ERROR !!!Battle[%d]Level[%d]'s BattleMap[%d] and SignMap[%d] Must In Same Server!", BattleId, BT_GetGameData(GAME_LEVEL),MapId, SignMapId); 
			SubWorld = nOldSubWorld
			return
		end
		--tinhpn20100804: IPBonus
		if (GetTask(TASKID_COUNT_X2TONGKIM) == 1) then
			SetTask(TASKID_COUNT_X2TONGKIM, 0)
			SetTask(TASKID_RECIEVE_BONUS_TK, 1)
		else
			SetTask(TASKID_RECIEVE_BONUS_TK, 0)
		end
		
		--By: NgaVN
		--Kiem tra nguoi choi truoc khi join vao mission
		local nRet = tbVNG2011_ChangeSign:CheckChangeSign();
		local nTimeNow = tbVNG2011_ChangeSign:GetTimeNow()
		if ( nRet ~= 1 ) then
			Say(format("Chi課 trng c遪 <color=red>%d <color=red>ph髏 n鱝 c� th� b竜 danh", nTimeNow));
			SubWorld = nOldSubWorld
			return
		end

		SubWorld = idx;
		BT_SetData(PL_SERIESKILL, 0)
		SetTask(TV_SERIESKILL_REALY,0)
		BT_SetData(PL_BATTLECAMP, bt_ncamp)
		JoinMission(BT_GetGameData(GAME_RULEID), bt_ncamp)
		local SubWorld = OldSubWorld;
		SubWorld = nOldSubWorld
		return
	else
		Say("Xin l鏸! Ti襫 phng c� v蕁 , t筸 th阨 kh玭g th� v祇 chi課 trng", 0);
	end
	SubWorld = nOldSubWorld
end;

function bt_wantjin()
		Say("Ngi x竎 nh u qu﹏ cho Kim qu鑓? N誹  gia nh藀, n閕 trong 1 tu莕 ngi s� l� ngi c馻 ch髇g ta. Mu鑞 thay i, ph秈 i tu莕 sau!",2, "Ta nh蕋 nh gia nh藀 Kim qu鑓/bt_joinjin", "в ta suy ngh� l筰 !/bt_oncancel");
end;

function bt_wantsong()
		Say("Ngi x竎 nh u qu﹏ cho T鑞g qu鑓? N誹  gia nh藀, n閕 trong 1 tu莕 ngi s� l� ngi c馻 ch髇g ta. Mu鑞 thay i, ph秈 i tu莕 sau!",2, "Ta nh蕋 nh gia nh藀 T鑞g qu鑓/bt_joinsong", "в ta suy ngh� l筰 !/bt_oncancel");
end;

function bt_joinsong()
	local nOldSubWorld = SubWorld
		if ( GetLevel() >= 40 and GetLevel() < 80 ) then
		SubWorld = SubWorldID2Idx(323)
	elseif ( GetLevel() >= 80 and GetLevel() < 120 ) then
		SubWorld = SubWorldID2Idx(324)
		else
			SubWorld = SubWorldID2Idx(325)
	end	
	BT_SetData(PL_BATTLEID, BT_GetGameData(GAME_BATTLEID))
	BT_SetData(PL_BATTLESERIES, BT_GetGameData(GAME_BATTLESERIES))
	BT_SetData(PL_ROUND,BT_GetGameData(GAME_ROUND))
	BT_SetData(PL_KEYNUMBER, 0)
	BT_SetData(PL_BATTLEPOINT, 0)
	SetTask(1017, 0)
	SetTask(TV_SERIESKILL_REALY,0)
	BT_SetData(PL_BATTLECAMP, 0)
	Msg2Player("C玭g c竜: b総 u chi課 d辌h m韎, 甶觤 t輈h ph﹏ hi謓 gi� s� l� 0!")
	Msg2Player("Hoan ngh猲h! Hoan ngh猲h! Ngi T鑞g lu玭 l� anh h飊g!")

	--Storm 加入挑战
	say_index = 2
	storm_ask2start(1)
	SubWorld = nOldSubWorld
end;

function bt_joinjin()
	local nOldSubWorld = SubWorld
			if ( GetLevel() >= 40 and GetLevel() < 80 ) then
		SubWorld = SubWorldID2Idx(323)
	elseif ( GetLevel() >= 80 and GetLevel() < 120 ) then
		SubWorld = SubWorldID2Idx(324)
		else
			SubWorld = SubWorldID2Idx(325)
	end	
	BT_SetData(PL_BATTLEID, BT_GetGameData(GAME_BATTLEID))
	BT_SetData(PL_BATTLESERIES, BT_GetGameData(GAME_BATTLESERIES))
	BT_SetData(PL_ROUND,BT_GetGameData(GAME_ROUND))
	BT_SetData(PL_KEYNUMBER, 0)
	BT_SetData(PL_BATTLEPOINT, 0)
	SetTask(1017, 0)
	SetTask(TV_SERIESKILL_REALY,0)
	BT_SetData(PL_BATTLECAMP, 0)
	Msg2Player("C玭g c竜: b総 u chi課 d辌h m韎, 甶觤 t輈h ph﹏ hi謓 gi� s� l� 0!")
	Msg2Player("Hoan ngh猲h! Hoan ngh猲h! Kim qu鑓 kh玭g thi誹 anh t礽!")

	--Storm 加入挑战
	say_index = 3
	storm_ask2start(1)
	SubWorld = nOldSubWorld
end;

function bt_oncancel()

end

function bt_checkmemcount_balance()
	local mapid = BT_GetGameData(GAME_MAPID);
	if (mapid > 0) then
		if (SubWorldID2Idx(mapid) >= 0) then
			oldSubWorld = SubWorld
			SubWorld = SubWorldID2Idx(mapid)
			local mem_song = GetMSPlayerCount(BT_GetGameData(GAME_RULEID), 1)
			local mem_jin = GetMSPlayerCount(BT_GetGameData(GAME_RULEID), 2)
			SubWorld = oldSubWorld
			
			-- 国战宋金 特殊的人数平衡处理		
			if BT_GetGameData(GAME_BATTLEID) == 2 then
				if (bt_ncamp == 1 and mem_song >= BALANCE_GUOZHAN_MAXCOUNT) or (bt_ncamp == 2 and mem_jin >= BALANCE_GUOZHAN_MAXCOUNT) then
					 -- 人数超过100人限制，继续往下执行，限制人数差5人
				else
					 -- 人数未超过限制，忽略5人差额，直接允许进入
					return mem_song, mem_jin
				end
			end
			
			if (bt_ncamp == 1 and (mem_song - mem_jin) >= BALANCE_MAMCOUNT ) then
				Say("Hi謓 t筰 binh l鵦 phe ta l� <color=yellow>"..mem_song.." ngi<color>, ch phng l� <color=yellow>"..mem_jin.." ngi<color>, c竎h bi謙 <color=red>"..BALANCE_MAMCOUNT.." ngi<color>. Qu﹏ l鵦 c馻 ta hi謓 gi�  d� s鴆 ti猽 di謙 Kim binh! Tr竛g s� xin i tr薾 sau nh�!", 0)
				return
			elseif (bt_ncamp == 2 and (mem_jin - mem_song) >= BALANCE_MAMCOUNT ) then
				Say("Hi謓 t筰 binh l鵦 phe ta l� <color=yellow>"..mem_jin.." ngi<color>, ch phng l� <color=yellow>"..mem_song.." ngi<color>, c竎h bi謙 <color=red>"..BALANCE_MAMCOUNT.." ngi<color>. Qu﹏ l鵦 c馻 ta hi謓 gi�  d� s鴆 ti猽 di謙 T鑞g qu﹏. Tr竛g s� xin i tr薾 sau nh�!", 0)
				return
			else
				return mem_song, mem_jin
			end
		end
	end
	Say("Xin l鏸! Ti襫 phng c� v蕁 , t筸 th阨 kh玭g th� v祇 chi課 trng", 0);
	return nil
end

-- 国战宋金对进入的玩家做进一步的检查 1:放行 0:不让进入
function bt_checkmem_for_guozan()
	
	-- 非国战宋金直接放行
	if BT_GetGameData(GAME_BATTLEID) ~= 2 then
		return 1;
	end
	
	-- 之前已经通过检查，参加了战役，不必再检查了
--	if (BT_GetGameData(GAME_KEY) == BT_GetData(PL_KEYNUMBER) and BT_GetData(PL_BATTLECAMP) == bt_ncamp) then
--		return 1;
--	end
	
	local szCityOwner_LinAn		= GetCityOwner(7);	-- 临安的占领帮会
	local szCityOwner_Bianjin	= GetCityOwner(4);	-- 汴京的占领帮会
	local szMyTong				= GetTongName();	-- 自己的帮会
	
	-- 占城帮会数据错误
	if szCityOwner_LinAn == "" or szCityOwner_Bianjin == "" or szCityOwner_LinAn == szCityOwner_Bianjin then
		Say("L莕 qu鑓 chi課 T鑞g Kim n祔 kh玭g 頲 ph衟 m�", 0);
		return 0;
	end
	
	-- 通过帮会的身份进入
	if (szMyTong == szCityOwner_LinAn and bt_ncamp == 1) or (szMyTong == szCityOwner_Bianjin and bt_ncamp == 2) then
		return 1;
	end

	-- 奸细
	if (szMyTong == szCityOwner_LinAn and bt_ncamp == 2) or (szMyTong == szCityOwner_Bianjin and bt_ncamp == 1) then
		Say("Gian t� c馻 ch  chui v祇 i doanh r錳, h穣 mau mau b総!", 0);
		return 0;
	end
	
	-- 检查身上的令牌
	local nCount_song = CalcItemCount(3, 6, 1, 2057, -1);
	local nCount_jin  = CalcItemCount(3, 6, 1, 2058, -1);
	
	if nCount_song == 0 and nCount_jin == 0 then
		Say("Hai qu鑓 giao tranh, c莕 ph秈 c� qu鑓 chi課 l謓h b礽 c馻 m鏸 b猲 m韎 頲 ti課 v祇.", 0);
		return 0;
	end
	
	-- 身上有别国的令牌
	if (nCount_jin ~= 0 and bt_ncamp == 1) or (nCount_song ~= 0 and bt_ncamp == 2) then
		Say("Gian t� c馻 ch  chui v祇 i doanh r錳, h穣 mau mau b総!", 0);
		return 0;
	end
	
	-- 检查金钱
	--if (GetCash() < 3000) then
		--Say("Mu鑞 tham gia chi課 trng T鑞g Kim h穣 駈g h� 3000 lng", 0)
		--return 0;
	--end
	
	-- 扣除令牌
	local bPay = 0;
	
	if bt_ncamp == 1 then
		bPay = ConsumeItem(3, 1, 6, 1, 2057, -1); 
	elseif bt_ncamp == 2 then
		bPay = ConsumeItem(3, 1, 6, 1, 2058, -1); 
	end
	
	if bPay ~= 1 then
		Msg2Player("Kh蕌 tr� l謓h b礽 th蕋 b筰");
		return 0;
	end
	
	-- 允许通过
	return 1;
end