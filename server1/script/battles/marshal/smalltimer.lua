IncludeLib("BATTLE");
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\marshal\\head.lua")
Include("\\script\\event\\jiefang_jieri\\200904\\qianqiu_yinglie\\sj_announce.lua")		-- 解放活动之千秋英烈
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\battles\\songjingtetan_position.lua")
Include("\\script\\activitysys\\config\\32\\talkdailytask.lua")

tbIndex = {}	-- 选中的坐标的Index
tbPoint = {}	-- 当前被选择的坐标集合
tbNpc = 
{
	[1] = 
	{
		nNpcId = 1685,  --npc Id
		nLevel = 95,		-- 等级
--		nSeries = 1,		-- 五行
		bNoRevive = 1,			-- 不重生
		szName = "c Th竚",		-- 名字
		nIsboss = 1,
		nCurCamp = 1,	--阵营 1宋 2金
	},
	[2] = 
	{
		nNpcId = 1686,  --npc Id
		nLevel = 95,		-- 等级
--		nSeries = 1,		-- 五行
		bNoRevive = 1,			-- 不重生
		szName = "c Th竚",		-- 名字
		nIsboss = 1,
		nCurCamp = 2,	--阵营 1宋 2金
	}
}  


function SelectPosition(nRandomCount)
	for i=1,4 do
		tbIndex[i] = random(1,nRandomCount)
		local bFlag = 1
		for j=1,i-1 do
			if tbIndex[j] == tbIndex[i] then
				bFlag = 0
				break
			end
		end
		if bFlag == 0 then
			i = i - 1
		end
	end
end

function AddTeTan(nNowTimeCount)
	if tbAppearTime[nNowTimeCount - RUNGAME_TIME] == 1 then
		local nrandomCount = 0
		-- 判定当前地图的Id
		local nNowMapId = BT_GetGameData(GAME_MAPID)
		if nNowMapId == 380 then
			tbPoint = tbPoint_map380
			nrandomCount = 10
		elseif nNowMapId == 383 then
			tbPoint = tbPoint_map383
			nrandomCount = 20
		else
			return
		end
		s_area = BT_GetGameData(GAME_CAMP1AREA) 	-- GAME_CAMP1AREA 宋 GAME_CAMP1AREA 金
		j_area = BT_GetGameData(GAME_CAMP2AREA)
		
		Msg2MSAll(MISSIONID, "c Th竚 m韎  ti課 v祇 chi課 trng r錳, m鋓 ngi nhanh ch鉵g h祅h ng!");
		
		SelectPosition(nrandomCount)
		local tbPosition_s = tbPoint[s_area]
		local tbPosition_j = tbPoint[j_area]
		for i=1,4 do
			local nIndex = tbIndex[i]
			tbNpc.szName = "c Th竚"
			basemission_CallNpc(tbNpc[1], nNowMapId, tbPosition_s[nIndex].x * 32, tbPosition_s[nIndex].y * 32)
			local msg = format("T╪g th猰 T鑞g Kim c Th竚: X = %d Y = %d",tbPosition_s[nIndex].x,tbPosition_s[nIndex].y)
			WriteLog(msg)
			tbNpc.szName = "c Th竚"
			basemission_CallNpc(tbNpc[2], nNowMapId, tbPosition_j[nIndex].x * 32, tbPosition_j[nIndex].y * 32)
			local msg = format("T╪g th猰 Kim c Th竚 : X = %d Y = %d",tbPosition_j[nIndex].x,tbPosition_j[nIndex].y)
			WriteLog(msg)
		end
	end
end

function OnTimer()
	t = GetMissionV(MS_TIMER1) + 1;--计数器，统计当前定时器触发了多少次了
	SetMissionV(MS_TIMER1, t)
	
	--Storm 加奖励积分
	local add_time = 60 * FRAME2TIME / TIMER_1
	storm_addm_mspointex(1, MISSIONID, (t - RUNGAME_TIME) / add_time)

	local lsf_level = BT_GetGameData(GAME_LEVEL)
	if (lsf_level == 1) then
		resultstr = "Khu v鵦 S� c蕄 "
	elseif (lsf_level == 2) then
		resultstr = "Khu v鵦 Trung c蕄 "
	elseif (lsf_level == 3) then
		resultstr = "Khu v鵦 Cao c蕄 "
	end
	
	if (t == RUNGAME_TIME) then --如果到了正式开战时刻，则停止报名，正式进入战斗阶段
		RunMission(MISSIONID)
		AddGlobalCountNews(resultstr.."Th阨 gian b竜 danh Phong V﹏ Lu薾 Ki誱 (phng th鴆 b秓 v� Nguy猲 So竔)  k誸 th骳. Chi課 u ch輓h th鴆 b総 u", 2);
		Msg2MSAll(MISSIONID, "Phong V﹏ Lu薾 Ki誱 ch輓h th鴆 khai chi課! C竎 chi課 s�! X玭g l猲!");
		WriteLog("marshal battle is entering fight state. now member count="..GetMSPlayerCount(MISSIONID, 1)..":"..GetMSPlayerCount(MISSIONID, 2))
		-- 日常任务刷新对话NPC
		%tbTalkDailyTask:AddTalkNpc(BT_GetGameData(GAME_MAPID), BT_GetGameData(GAME_MAPID));
	end

	if (t < RUNGAME_TIME and mod(t, 18) == 0) then
		RestTime = (RUNGAME_TIME - t) * TIMER_1 / FRAME2TIME
		RestMin, RestSec = GetMinAndSec(RestTime);
		if (RestSec == 0) then
			str1 = resultstr.."<#> Chi課 d辌h Phong V﹏ Lu薾 Ki誱 (Phng th鴆 B秓 v� Nguy猲 so竔) 產ng trong giai 畂筺 b竜 danh. C竎 hi謕 kh竎 mu鑞 tham gia h穣 nhanh ch鉵g n Tng Dng ho芻 Chu Ti猲 tr蕁  b竜 danh. (ho芻 s� d鬾g Phong V﹏ Chi猽 Th�) .Th阨 gian b竜 danh c遪 l筰 l�:"..RestMin.." ph髏. 襲 ki謓 tham gia: C蕄 kh玭g 輙 h琻 40, ph� b竜 danh 1 Phong V﹏ Chi猽 Binh L謓h. Sau khi khai chi課 n誹 nh� v蒼 ch璦 n gi韎 h筺 cao nh蕋 th� v蒼 c� th� b竜 danh v祇 ti誴";
			str2 = "<#>C竎h th阨 gian khai chi課 ch� c遪:"..RestMin.."ph髏"
		else
			str1 = resultstr.."<#> Chi課 d辌h Phong V﹏ Lu薾 Ki誱 (Phng th鴆 B秓 v� Nguy猲 so竔) 產ng trong giai 畂筺 b竜 danh. C竎 hi謕 kh竎 mu鑞 tham gia h穣 nhanh ch鉵g n Tng Dng ho芻 Chu Ti猲 tr蕁  b竜 danh. (ho芻 s� d鬾g Phong V﹏ Chi猽 Th�) .Th阨 gian b竜 danh c遪 l筰 l�:"..RestMin.."ph髏"..RestSec.." gi﹜. 襲 ki謓 tham gia: C蕄 kh玭g 輙 h琻 40, ph� b竜 danh 1 Phong V﹏ Chi猽 Binh L謓h. Sau khi khai chi課 n誹 nh� v蒼 ch璦 n gi韎 h筺 cao nh蕋 th� v蒼 c� th� b竜 danh v祇 ti誴";
			str2 = "<#>C竎h th阨 gian khai chi課 ch� c遪:"..RestMin.."ph髏"..RestSec.." gi﹜"
		end
		AddGlobalCountNews(str1, 2);
		Msg2MSAll(MISSIONID,str2);		--通知场内玩家开战剩余时间
	end
	
	if (t >= RUNGAME_TIME) then
		AddTeTan(t)  -- 增加宋金特探
		
		if (t == RUNGAME_TIME) then --正式开战的第一次触发时，产生战斗Npc的生成规则数据
			sf_buildfightnpcdata()
		else
			--到开战后半小时看双方总积分，积分小的一方产生元帅
			if (t == BOSS_TIME) then
				if (GetMissionV(MS_TOTALPOINT_S) < GetMissionV(MS_TOTALPOINT_J)) then
					marshal_down(1)
					SetMissionV(MS_MARSHAL, 1)
				elseif(GetMissionV(MS_TOTALPOINT_S) > GetMissionV(MS_TOTALPOINT_J)) then
					marshal_down(2)
					SetMissionV(MS_MARSHAL, 2)
				elseif(GetMissionV(MS_TOTALPOINT_S) == GetMissionV(MS_TOTALPOINT_J)) then
					marshal_down(2)
					marshal_down(1)
					SetMissionV(MS_MARSHAL, 3)
				end
			end

			if (t == VANISHGAME_TIME) then	--到最后20分钟时将另一方的元帅产生
				mar = GetMissionV(MS_MARSHAL)
				if (mar == 1) then
					marshal_down(2)
				elseif (mar == 2) then
					marshal_down(1)
				end
			end
			
			bt_pop2signmap()	--将在后营（fight=0）的玩家送回报名点
			
			--每一分钟通告当前双方积分，和npc
			if (mod(t, 3) == 0 ) then
				sf_callfightnpc(t - RUNGAME_TIME, VANISHGAME_TIME - RUNGAME_TIME)	-- 产生战斗Npc				
				msstr = "C玭g c竜: hi謓 gi� t鎛g t輈h l騳 c馻 2 phe l� "..GetMissionV(MS_TOTALPOINT_S)..":"..GetMissionV(MS_TOTALPOINT_J);
				Msg2MSAll(MISSIONID, msstr)
			end
			
			bt_announce(lsf_level, t);
			TB_QIANQIU_YINGLIE0904:announce(lsf_level, t);
		end
	end
end

function sf_callfightnpc(usedtime, totaltime) 
	if (usedtime > totaltime) then
		return
	end
	local mapfile = GetMapInfoFile(BT_GetGameData(GAME_MAPID))
	s_area = BT_GetGameData(GAME_CAMP1AREA);
	j_area = BT_GetGameData(GAME_CAMP2AREA);
	for i = 2, 5 do 
		if (GetMissionV(MS_NPCCOUNT1_S + i - 1) > 0) then
			prenpccount = floor((usedtime - 1) / totaltime * GetMissionV(MS_NPCCOUNT1_S + i - 1))
			npccount = floor(usedtime / totaltime * GetMissionV(MS_NPCCOUNT1_S + i - 1))
			nowadd = npccount - prenpccount;
			if (nowadd > 0) then
				print("call song npc count= "..nowadd.."rank="..i)
				npcfile = GetIniFileData(mapfile, "Area_"..s_area, tbNPCPOS[random(2)]);
				bt_addrandfightnpc(npcfile, GetMissionV(MS_TRANK1_S + i - 1), GetMissionV(MS_RANK1LVL_S + i - 1), 1, nowadd, tabFILE_NPCDEATH[i], 1)
			end
		end
	end
	
	for i = 2, 5 do 
		if (GetMissionV(MS_NPCCOUNT1_J + i - 1) > 0) then
			prenpccount = floor((usedtime - 1) / totaltime * GetMissionV(MS_NPCCOUNT1_J + i - 1))
			npccount = floor(usedtime / totaltime * GetMissionV(MS_NPCCOUNT1_J + i - 1))
			nowadd = npccount - prenpccount
			if (nowadd > 0) then
				print("call jing npc count= "..nowadd.."rank="..i)
				npcfile = GetIniFileData(mapfile, "Area_"..j_area, tbNPCPOS[random(2)]);
				bt_addrandfightnpc(npcfile, GetMissionV(MS_TRANK1_J + i - 1), GetMissionV(MS_RANK1LVL_J + i - 1), 2, nowadd, tabFILE_NPCDEATH[i], 1)
			end
		end
	end
end

function marshal_down(camp)
	local mapfile = GetMapInfoFile(BT_GetGameData(GAME_MAPID))
	s_area = BT_GetGameData(GAME_CAMP1AREA);
	j_area = BT_GetGameData(GAME_CAMP2AREA);
	if (camp == 1) then
		enterpos = GetIniFileData(mapfile, "Area_"..s_area, "generalpos");
		x,y = bt_str2xydata(enterpos)	
		npcidx_s = AddNpc(GetMissionV(MS_TRANK1_S + 6 - 1), GetMissionV(MS_RANK1LVL_S + 6 - 1), SubWorld, x*32, y*32, 1, "Nguy猲 So竔", 1)
		SetNpcCurCamp(npcidx_s, 1)
		SetNpcDeathScript(npcidx_s, tabFILE_NPCDEATH[6])
		Msg2MSAll(MISSIONID, "<color=0x00FFFF>Phong V﹏ Lu薾 Ki誱 chi課 b竜: Nguy猲 So竔  xu蕋 hi謓")
	else
		enterpos = GetIniFileData(mapfile, "Area_"..j_area, "generalpos");
		x,y = bt_str2xydata(enterpos)	
		npcidx_j = AddNpc(GetMissionV(MS_TRANK1_J + 6 - 1), GetMissionV(MS_RANK1LVL_J + 6 - 1), SubWorld, x*32, y*32, 1, "Nguy猲 So竔", 1)
		SetNpcCurCamp(npcidx_j, 2)
		SetNpcDeathScript(npcidx_j, tabFILE_NPCDEATH[6])
		Msg2MSAll(MISSIONID, "<color=0x9BFF9B>Phong V﹏ Lu薾 Ki誱 chi課 b竜: Nguy猲 So竔  xu蕋 hi謓")
	end		
end