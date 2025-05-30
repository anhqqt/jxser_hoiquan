Include("\\script\\missions\\clearskill\\head.lua");
Include("\\script\\task\\system\\task_string.lua");

TTID_CityIndex 	= 101;

-- 洗点洞(第一层)相关功能
-- 返回值: -1 失败，1成功
function CSP_EnterClearMap(nCityIndex)
	nLevel = GetLevel();
	if (nLevel < CSP_NEEDLEVEL) then
		Talk(1, "", "<#> Tr竛g s� ch璦 t c蕄"..CSP_NEEDLEVEL.."<#>, ch璦 th� v祇 o T葃 T駓")
		return -1;
	end
	
	if (GetCamp() == 0) then
		Talk(1, "", "Ngi kh玭g c� k� n╪g n祇, v藋 m� c騨g mu鑞 甶 t葃 t駓 �? ")
		return -1;
	end

	-- 将城市号记录到临时变量中
	SetTaskTemp(TTID_CityIndex, nCityIndex);
	
	-- 去洗髓岛的免费次数
	nResult = GetTask(CSP_TID_ClearFreeTime);
	if (nResult < CSP_MAXClearTime) then -- 免费进岛
		Say("<#> C� h閕 v祇 o t葃 T駓 mi詎 ph� ch� c�"..CSP_MAXClearTime.."<#> l莕. Tr竛g s�  suy ngh� k� ch璦?", 2, " o T葃 T駓/CSP_FreeEnterClearMap", "в ngh� th猰 m閠 ch髏 /gotocsm_no")
		return 1;
	else
		-- 没有免费机会了，找水晶或宝石
		strNoFree = 
		{
			"<#>Xa phu: L莕 d飊g mi詎 ph�  d飊g h誸, nh璶g c竎 h� c� th� s� d鬾g <color=blue>th駓 tinh (ho芻 b筩h ng鋍) <color> ho芻 <color=blue>tinh h錸g b秓 th筩h (ho芻 t� ng鋍) <color>  c� th� 甶 v祇 o t葃 t駓. Ngi c� ng � nh� v藋 kh玭g?",
			"<#> Ch� t葃 甶觤 k� n╪g [3 vi猲 Th駓 Tinh]/CSP_JEnterClearMap_Skill",
			"<#>Ch� t葃 甶觤 k� n╪g [B筩h Ng鋍]/CSP_JEnterClearMap_Skill2",
			"<#> Ch� t葃 甶觤 ti襪 n╪g [6 vi猲 Tinh H錸g B秓 Th筩h]/CSP_JEnterClearMap_Prop",
			"<#>Ch� t葃 甶觤 ti襪 n╪g [T� Ng鋍]/CSP_JEnterClearMap_Prop2",
			"<#> T葃 c� 甶觤 ti襪 n╪g v� k� n╪g [3 vi猲 Th駓 Tinh + 6 vi猲 Tinh H錸g B秓 Th筩h]/CSP_JEnterClearMap_All",
			"<#>T葃 甶觤 k� n╪g ti襪 n╪g [B筩h Ng鋍 + T� Ng鋍]/CSP_JEnterClearMap_All2",
			"<#> в ra ngh� l筰/CSP_Cancel"
		};
		-- Say(strNoFree[1], 7, strNoFree[2], strNoFree[3], strNoFree[4], strNoFree[5], strNoFree[6], strNoFree[7], strNoFree[8]);
		CreateTaskSay(strNoFree)
		return 1;
	end
	return 1;
end;

-- 免费进岛的机会
function CSP_FreeEnterClearMap()
	
	-- 记录进岛洗点类型
	SetTask(CSP_TID_ClearType, CSP_CTYPE_ALL); -- 全洗
	CSP_EnterClearMapCore();
end

-- 使用宝石换取进岛洗点的机会 - 技能点
-- JEnter - JewelEnter
function CSP_JEnterClearMap_Skill()
	j238 = GetItemCountEx(238)
	j239 = GetItemCountEx(239)
	j240 = GetItemCountEx(240)
	nJCount = j238 + j239 + j240;
	if (nJCount < CSP_NEEDJEWEL_SKILL) then
		Talk(1,"","Ngi kh玭g mang <color=blue>3 vi猲 Th駓 Tinh <color>. ng n鉵g ru閠 t譵  r錳 h穣 quay l筰. ")
		return -1;
	end
	if (nJCount > CSP_NEEDJEWEL_SKILL) then
		Talk(1, "", "Tr猲 ngi ngi 甧m theo r蕋 nhi襲 Th駓 Tinh, ta kh玭g ti謓 quy誸 nh gi飉 ngi s� d鬾g 3 vi猲 n祇, hay l� h穣 c蕋 nh鱪g th� c遪 d� v祇 rng ch鴄 ? ")
		return -1;
	end

	-- 扣水晶
	for i = 1,j238 do DelItemEx(238) end
	for i = 1,j239 do DelItemEx(239) end
	for i = 1,j240 do DelItemEx(240) end
	
	CSP_WriteLog("S� d鬾g r錳"..nJCount.."H箃 th駓 tinh, ti課 v祇 o T葃 T駓");
	-- 记录进岛洗点类型
	SetTask(CSP_TID_ClearType, CSP_CTYPE_SKILL); -- 洗技能点
	CSP_EnterClearMapCore(); -- 进入洗髓岛
	Msg2Player("Ti課 v祇 o T葃 t駓, b筺 c� th� c� v� s� l莕 t葃 甶觤 k� n╪g. ");

end;

-- 使用宝石换取进岛洗点的机会 - 潜能点
-- JEnter - JewelEnter
function CSP_JEnterClearMap_Prop()
	j353 = GetItemCountEx(353)
	if (j353 < CSP_NEEDJEWEL_PROP) then
		Talk(1,"","Ngi kh玭g mang <color=red>6 vi猲 Tinh H錸g B秓 Th筩h <color>. ng n鉵g ru閠, t譵  r錳 h穣 quay l筰. ")
		return -1;
	end
	
	-- 扣猩红宝石(六颗)
	for i = 1, CSP_NEEDJEWEL_PROP do DelItemEx(353) end

	CSP_WriteLog("S� d鬾g r錳"..CSP_NEEDJEWEL_PROP.."H箃 tinh h錸g b秓 th筩h, ti課 v祇 o T葃 T駓");
	-- 记录进岛洗点类型
	SetTask(CSP_TID_ClearType, CSP_CTYPE_PROP); -- 洗潜能点
	CSP_EnterClearMapCore(); -- 进入洗髓岛
	Msg2Player("Ti課 v祇 o T葃 t駓, b筺 c� th� c� v� s� l莕 t葃 甶觤 k� n╪g. ");
end;

-- 使用宝石换取进岛洗点的机会 - 技能点&潜能点
-- JEnter - JewelEnter
function CSP_JEnterClearMap_All()
	j353 = GetItemCountEx(353)
	if (j353 < CSP_NEEDJEWEL_PROP) then
		Talk(1,"","Ngi kh玭g mang <color=red>6 vi猲 Tinh H錸g B秓 Th筩h <color>. ng n鉵g ru閠, t譵  r錳 h穣 quay l筰. ")
		return -1;
	end
	
	j238 = GetItemCountEx(238)
	j239 = GetItemCountEx(239)
	j240 = GetItemCountEx(240)
	nJCount = j238 + j239 + j240;
	if (nJCount < CSP_NEEDJEWEL_SKILL) then
		Talk(1,"","Ngi kh玭g mang <color=blue>3 vi猲 Th駓 Tinh <color>. ng n鉵g ru閠 t譵  r錳 h穣 quay l筰. ")
		return -1;
	end
	if (nJCount > CSP_NEEDJEWEL_SKILL) then
		Talk(1, "", "Tr猲 ngi ngi 甧m theo r蕋 nhi襲 Th駓 Tinh, ta kh玭g ti謓 quy誸 nh gi飉 ngi s� d鬾g 3 vi猲 n祇, hay l� h穣 c蕋 nh鱪g th� c遪 d� v祇 rng ch鴄 ? ")
		return -1;
	end
	
	-- 扣猩红宝石(六颗)
	for i = 1,CSP_NEEDJEWEL_PROP do DelItemEx(353) end
	-- 扣水晶
	for i = 1,j238 do DelItemEx(238) end
	for i = 1,j239 do DelItemEx(239) end
	for i = 1,j240 do DelItemEx(240) end	

	CSP_WriteLog("S� d鬾g r錳"..nJCount.."H箃 th駓 tinh, v� "..CSP_NEEDJEWEL_PROP.."H箃 tinh h錸g b秓 th筩h, ti課 v祇 o T葃 T駓");
	SetTask(CSP_TID_ClearType, CSP_CTYPE_ALL); -- 洗技能点和潜能点
	CSP_EnterClearMapCore(); -- 进入洗髓岛
	Msg2Player("Ti課 v祇 o T葃 t駓, b筺 c� th� c� v� s� l莕 t葃 甶觤 k� n╪g. ");
end;

function CSP_Cancel()
end

-- 进岛的核心函数
function CSP_EnterClearMapCore()
	-- 从临时变量中取出城市号
	nCityIndex = GetTaskTemp(TTID_CityIndex);
	nMapID = CSP_GetClearMapID(nCityIndex);
	-- 地图找不到，返回
	if (nMapID == -1) then
		CSP_WriteLog("ID khu v鵦:"..nMapID.." t譵 kh玭g th蕐, v祇 o T葃 T駓 th蕋 b筰!");
		return -1;
	end

	LeaveTeam();
	nResult = NewWorld(nMapID,1615,3200);
	if (nResult == 0) then
		CSP_WriteLog("ID khu v鵦:"..nMapID.." Nh藀 甶觤 c� sai s鉻, v祇 o T葃 T駓 th蕋 b筰!");
		Msg2Player("Nh藀 甶觤 c� sai s鉻!");
		return -1;
	end
	
	-- 屏蔽某些功能：不能使用回城符、心心相映符，不允许摆摊
	DisabledUseTownP(1);
	DisabledUseHeart(1);
	DisabledStall(1);
	
	-- 设置非战斗状态
	SetFightState(0)
	
	-- 记录重生点(离开时复原)
	nSWID, nRevID = GetPlayerRev();
	SetTask(CSP_TID_RevivalSWID, nSWID);
	SetTask(CSP_TID_ReviveID, nRevID);
	
	-- 设置新的临时重生点
	SetRevPos(nMapID, CSP_RevieSWID);
	SetPunish(0);	
end;

-- 返回值: -1 失败，1成功
function CSP_LeaveClearMap(nClearMapID)
	nCityIndex = CSP_GetCityIndexByClearMap(nClearMapID);
	if (nCityIndex == -1) then
		return -1;
	end

	-- 恢复重生点(只有状态合法时，才重设重生点)
	if (CSP_CheckValid() == 1) then
		nSWID = GetTask(CSP_TID_RevivalSWID);
		nRevID = GetTask(CSP_TID_ReviveID);
		SetRevPos(nSWID, nRevID);
	end
		
	-- 关闭被屏蔽的功能：不能使用回城符、心心相映符，不允许摆摊
	DisabledUseTownP(0);
	DisabledUseHeart(0);
	DisabledStall(0);
	
	-- 离岛时离开队伍
	LeaveTeam();
	
	-- 设置非战斗状态
	SetFightState(0);
	SetPunish(1);
	SetLogoutRV(0);

	nResult = GetTask(CSP_TID_ClearFreeTime);
	if (nResult < CSP_MAXClearTime) then -- 免费进岛
		SetTask(CSP_TID_ClearFreeTime, nResult + 1) -- 记录免费次数
	else
		SetTask(CSP_TID_JewelEnterTime, GetTask(CSP_TID_JewelEnterTime) + 1) -- 记录使用宝石进入次数
	end
	

	if (nCityIndex == 1) then
		NewWorld(1, 1557, 3112) -- 凤翔		
	elseif (nCityIndex == 2) then
		NewWorld(11, 3193, 5192) -- 成都	
	elseif (nCityIndex == 3) then
		NewWorld(162, 1669, 3129) -- 大理	
	elseif (nCityIndex == 4) then
		NewWorld(37, 1598, 3000) -- 汴京
	elseif (nCityIndex == 5) then
		NewWorld(78, 1592, 3377) -- 襄阳
	elseif (nCityIndex == 6) then
		NewWorld(80, 1670, 2996) -- 扬州		
	elseif (nCityIndex == 7) then
		NewWorld(176, 1603, 2917) -- 临安
	else
		Msg2Player("H� th鑞g xu蕋 hi謓 s� c�! Vui l遪g t譵 nh﹏ vi猲 ph鬰 v� x竎 nh薾 gi秈 quy誸 v蕁 . ");
	end	
end;


function CSP_JEnterClearMap_Skill2()
	if (CalcItemCount(3, 6, 1, 2390,-1) < CSP_NEEDJEWEL_SKILL2) then
		Talk(1,"","Xa phu: Tr猲 ngi kh玭g c� <color=blue>B筩h Ng鋍<color>. Hay l�  qu猲 � u  r錳?")
		return -1;
	end

	if (ConsumeItem(3, 1, 6,1,2390,-1) ~= 1) then
		return -1;
	end
	
	CSP_WriteLog(format("Х s� d鬾g %d B筩h Ng鋍, ti課 v祇 o t葃 t駓", CSP_NEEDJEWEL_SKILL2));
	-- 记录进岛洗点类型
	SetTask(CSP_TID_ClearType, CSP_CTYPE_SKILL); -- 洗技能点
	CSP_EnterClearMapCore(); -- 进入洗髓岛
	Msg2Player("Ti課 v祇 o T葃 t駓, b筺 c� th� c� v� s� l莕 t葃 甶觤 k� n╪g. ");

end;

-- 使用宝石换取进岛洗点的机会 - 潜能点
-- JEnter - JewelEnter
function CSP_JEnterClearMap_Prop2()
	if (CalcItemCount(3, 6, 1, 2391,-1) < CSP_NEEDJEWEL_PROP2) then
		Talk(1,"","Xa phu: Tr猲 ngi kh玭g c� <color=red>T� Ng鋍<color>. Hay l�  qu猲 � u  r錳?")
		return -1;
	end
	
	if (ConsumeItem(3, 1, 6,1,2391,-1) ~= 1) then
		return -1;
	end
	
	CSP_WriteLog(format("Х s� d鬾g %d T� Ng鋍, ti課 v祇 o t葃 t駓", CSP_NEEDJEWEL_PROP2));
	-- 记录进岛洗点类型
	SetTask(CSP_TID_ClearType, CSP_CTYPE_PROP); -- 洗潜能点
	CSP_EnterClearMapCore(); -- 进入洗髓岛
	Msg2Player("Ti課 v祇 o T葃 t駓, b筺 c� th� c� v� s� l莕 t葃 甶觤 k� n╪g. ");
end;

-- 使用宝石换取进岛洗点的机会 - 技能点&潜能点
-- JEnter - JewelEnter
function CSP_JEnterClearMap_All2()
	if (CalcItemCount(3, 6, 1, 2390,-1) < CSP_NEEDJEWEL_SKILL2) then
		Talk(1,"","Xa phu: Tr猲 ngi kh玭g c� <color=blue>B筩h Ng鋍<color>. Hay l�  qu猲 � u  r錳?")
		return -1;
	end
	
	if (CalcItemCount(3, 6, 1, 2391,-1) < CSP_NEEDJEWEL_PROP2) then
		Talk(1,"","Xa phu: Tr猲 ngi kh玭g c� <color=red>T� Ng鋍<color>. Hay l�  qu猲 � u  r錳?")
		return -1;
	end
	
	if (ConsumeItem(3, 1, 6,1,2390,-1) ~= 1 or ConsumeItem(3, 1, 6,1,2391,-1) ~= 1) then
		return -1;
	end
	
	CSP_WriteLog(format("Х s� d鬾g %d %s v� %d %s, ti課 v祇 o t葃 t駓",CSP_NEEDJEWEL_SKILL2, "B筩h Ng鋍", CSP_NEEDJEWEL_PROP2, "T� Ng鋍") );
	SetTask(CSP_TID_ClearType, CSP_CTYPE_ALL); -- 洗技能点和潜能点
	CSP_EnterClearMapCore(); -- 进入洗髓岛
	Msg2Player("Ti課 v祇 o T葃 t駓, b筺 c� th� c� v� s� l莕 t葃 甶觤 k� n╪g. ");
end;


