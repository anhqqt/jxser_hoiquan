-- ====================== 文件信息 ======================

-- 剑侠情缘网络版一“带艺投师”头文件

-- Edited by 子非魚
-- 2008/02/28 12:10

-- ======================================================

IncludeLib("LEAGUE");
Include("\\script\\misc\\daiyitoushi\\toushi_head.lua");
Include("\\script\\misc\\daiyitoushi\\toushi_resetbase.lua");
Include("\\script\\lib\\gb_modulefuncs.lua");


-- 检查“带艺投师”，退出门派的条件：等级达到120级，或120级以上
function toushiCheckApplyState()
	if (GetLevel() < 120) then
		return TOUSHI_LVLERR;
	end
	
	if (GetLastFactionNumber() == -1) then
		return TOUSHI_NOFACTERR;
	end
	
	return TOUSHI_SUCCEED;
end


-- 检查“带艺投师”，加入新门派条件
function toushiCheckTransFactState(nFactionNumb, nStage)
	local bFlag			= GetTask(TSK_TOUSHI_FLAG);				-- 获得转投师门的标记
	local nMyFacNumb	= GetLastFactionNumber();				-- 获得原门派ID
	local nSex			= GetSex();								-- 角色性别
	local nLastChange   = GetTask(TSK_LAST_CHANGE_FACTION)      -- 上次转投师门标记
	local nCurTime      = tonumber( GetCurServerTime() );
	
	if (bFlag == 0) then
		return TOUSHI_FLAGERR;
	end
	
	if (bFlag >= 2) then
		return TOUSHI_UNKNOWN;
	end
	
	if (nMyFacNumb == -1) then
		return TOUSHI_NOFACTERR;
	end
	--B� gi韎 h筺 th阨 gian chuy觧 m玭 ph竔 - Modified By DinhHQ - 20110813
--	if ((nCurTime - nLastChange) < TOUSHI_COLDDOWN_TIME) then
--	    return TOUSHI_TIMEERR;
--	end
	
	if ((nSex == 0 and (nFactionNumb == 4 or nFactionNumb == 5)) or (nSex == 1 and nFactionNumb == 0)) then
		return TOUSHI_MALEERR;
	end
	
	if (nMyFacNumb == nFactionNumb) then
		return TOUSHI_EQFACTERR;
	end
	
	if (GetLevel() < 120) then
		return TOUSHI_LVLERR;
	end
	
	if (nStage == 2) then
		if (check_zhuansheng_league(LG_WLLSLEAGUE) == 1) then
			return TOUSHI_LGERR;
		end
		
		if (CalcItemCount(2,0,-1,-1,-1) > 0) then
			return TOUSHI_EQUIPERR;
		end
	end
	
	if (GetTask(TSK_TOUSHI_COUNT) == 0 and CalcFreeItemCellCount() < 2) then
		return TOUSHI_NOFREEBAG;
	end
	
	return TOUSHI_SUCCEED;
end


function toushiGetHierarchTitle(nFactionNumb)
	if (nFactionNumb == 7 or nFactionNumb == 3) then			-- 五毒教，天忍教 为教主
		return TB_TOUSHI_HIERARCH[2];
	elseif (nFactionNumb == 1 or TB_TOUSHI_HIERARCH == 6) then	-- 天王帮，丐帮 为帮主
		return TB_TOUSHI_HIERARCH[3];
	else														-- 其他 为掌门
		return TB_TOUSHI_HIERARCH[1];
	end
end


function toushiGetSexName(nSex)
	if (nSex == 0) then
		return "Nam";
	else
		return "N� ";
	end
end


function OnCancel()
end

function daiyitoushi_main(nFactionNumb)
	if (gb_GetModule("SWITH_DAIYITOUSHI") ~= 1) then
		Say("Xin l鏸, c玭g n╪g n祔 t筸 th阨  b� ng, th阨 gian m� l筰 s� oc th玭g b竜 sau ", 0);
		return 1;
	end
	
	local nFlag	= GetTask(TSK_TOUSHI_FLAG);
	local tbDes	= {"<dec><npc>Thi猲 h� i lo筺 nh�  ng祔 h玬 nay, c竎 i m玭 ph竔 trong v� l﹎ ai c騨g ch� bi誸 lo cho c竔 l頸 c馻 m譶h, t飝 theo chi課 s� m� b� quan,  trung nh﹏ v� l﹎ th� b� t鎛 th蕋 h琻 qu� n鯽. V� k� v� l﹎ hng h醓, tr飊g t﹏ ch蕁 h璶g v� l﹎. T玭 m謓h v� l﹎ minh ch�, k� t� h玬 nay c竎 i m玭 ph竔 x鉧 b� c竎 quy t綾, m� r閚g m玭 quy, cho ph衟 c竎  t� gia nh藀 c竎 m玭 ph竔 kh竎,  c飊g nhau 蕁 ch鴑g v� h鋍, s竛g l藀 ra nh鱪g tuy謙 h鋍 v� c玭g m韎 l�, trung h璶g ng� v� l﹎."};
	
	if (nFlag == 0) then
		tinsert(tbDes, format("Цi ngh� u s�, chuy觧 m玭 ph竔/#toushiApplyEnter(%d)", nFactionNumb));
	elseif (nFlag == 1) then
		tinsert(tbDes, format("Цi ngh� u s�, b竔 nh藀 m玭 h�/#toushiTransEnter(%d)", nFactionNumb));
	elseif (nFlag == 2 and GetLastFactionNumber() == nFactionNumb) then
		tbDes	= {"<dec><npc>N誹 nh� ngi  mu鑞 gia nh藀 b鎛 ph秈, sau n祔 ph秈 chuy猲 t﹎ m� kh� luy謓, s韒 c� ng祔 ng� ra 頲 tuy謙 k� v� h鋍"};
	else
		tbDes	= {"<dec><npc>Xem ra, v� <sex> n祔 mang g竛h n苙g tr猲 vai tr飊g t﹏ ch蕁 h璶g v� l﹎."};
	end
	
	tinsert(tbDes, "K誸 th骳 i tho筰/OnCancel");
	
	CreateTaskSay(tbDes);
end
--

-- 带艺投师，转投门派
function toushiApplyEnter(nFactionNumb)
	
	local nTaskValue = GetTask(2885)
	local nTmpRes = floor(nTaskValue/100)
	if nTaskValue > 0 and mod(nTmpRes, 100) < 14 then
		Msg2Player("Ngi  nh薾 nhi謒 v� k� n╪g 150, xin h穣 ho祅 th祅h nhi謒 v� r錳 h穣 n g苝 ta")
		return 
	end
	local nSex	= GetSex();
	local szDes = "";
	local szHierarchTitle	= toushiGetHierarchTitle(nFactionNumb);
	
	if (GetLastFactionNumber() ~= nFactionNumb) then
		CreateTaskSay({TB_TOUSHI_ERR_MSG[TOUSHI_FLAGERR], "K誸 th骳 i tho筰/OnCancel"});
		return
	end
	
    local nLastChange   = GetTask(TSK_LAST_CHANGE_FACTION)      -- 上次转投师门标记
	local nCurTime      = tonumber( GetCurServerTime() );
	--B� gi韎 h筺 th阨 gian chuy觧 m玭 ph竔 - Modified By DinhHQ - 20110813
--	if ((nCurTime - nLastChange) < TOUSHI_COLDDOWN_TIME) then
--	    CreateTaskSay({TB_TOUSHI_ERR_MSG[TOUSHI_TIMEERR], "K誸 th骳 i tho筰/OnCancel"});
--	    return
--	end
	
	if (nSex == 1) then
		szDes = "{N誹 nh� c� 頲 t輓 v藅 c馻 bang ch� thi猲 vng bang Dng Anh th� c� th� gia nh藀 m玭 ph竔 thi猲 vng.}";
	end
	
	szDes	= format("<dec><npc>V� h鋍 trong gi韎 v� l﹎ c馻 ch髇g ta b竎 i uy猲 th﹎, l祄 s� ph� ta c騨g mu鑞 m� r閚g m玭 quy  c飊g nhau 鴑g ch輓h c竎 m玭 ph竔 kh竎, nay ta  ngi r阨 kh醝  b鎛 m玭 ta c騨g c� th� thu nh薾 %s m玭 ph竔  t� . %s<enter>, con 阯g c莡 mong v� h鋍 qu� kh玭g d� d祅g ch髏 n祇, l� m閠 s� ph� ta c騨g ph秈 th� th竎h ngi m閠 phen. N誹 nh� ngi c� th觷{t n c蕄 120}} h琻 n鱝 c遪 ph秈 t譵 v� y cho b鎛 ph竔 t輓 v藅  b� th蕋 l筩 t� l﹗ {{ 揟輓 V藅 M玭 Ph竔攠}, s� ph�  m韎 cho ngi h� s琻.", 
				toushiGetSexName(nSex),
				szDes);
	
	
	CreateTaskSay({szDes,
					format("%s y猲 t﹎,  t� s� 甧m t輓 v藅 v� y./OnCancel", szHierarchTitle),
					format("%s, Xin m阨 xem y c� ph秈 l� t輓 v藅 m玭 ph竔?/#toushiApplyMenPaiXinWu(%d)", szHierarchTitle, nFactionNumb),
					"K誸 th骳 i tho筰/OnCancel"
				});
end

-- 给与界面提交门派信物
function toushiApplyMenPaiXinWu()
	local bFlag = toushiCheckApplyState();
	if (bFlag == TOUSHI_SUCCEED) then
		GiveItemUI("Tr譶h t輓 v藅 m玭 ph竔", "B� t輓 v藅 m玭 ph竔 v祇 � tr鑞g b猲 di.", "toushiApplyShowXinWu", "OnCancel", 1);
	else
		CreateTaskSay({TB_TOUSHI_ERR_MSG[bFlag], "K誸 th骳 i tho筰/OnCancel"});
	end
end

-- 出示信物判断，并进行退出门派处理
-- 这里的退出门派仅仅设置允许转投他门变量标记
function toushiApplyShowXinWu(nCount)
	if (nCount ~= 1) then
		CreateTaskSay({"<dec><npc>T輓 V藅 M玭 Ph竔 kh玭g ph秈 l� m鉵  ch琲 c馻 tr� con. Kh玭g l� ngi mu鑞 l祄 m� m総 ta hay sao?", 
						"Tr譶h l筰 m玭 ph竔 t輓 v藅/toushiApplyMenPaiXinWu",
						"M筺 ph衟 cho ta t譵 l筰 m閠 l莕 n鱝/OnCancel"
					});
		return 0;
	end
	
	local nItemIdx = GetGiveItemUnit(nCount);		--由给与界面中物品序号获得物品索引
	local nG, nD, nP = GetItemProp(nItemIdx);		--获得物品的ID属性值
	local szKey = join({nG, nD, nP});
	
	if (szKey ~= join(TB_TOUSHI_MENPAIXINWU)) then
		CreateTaskSay({"<dec><npc>T輓 V藅 M玭 Ph竔 kh玭g ph秈 l� m鉵  ch琲 c馻 tr� con. Kh玭g l� ngi mu鑞 l祄 m� m総 ta hay sao?", 
						"Tr譶h l筰 m玭 ph竔 t輓 v藅/toushiApplyMenPaiXinWu",
						"M筺 ph衟 cho ta t譵 l筰 m閠 l莕 n鱝/OnCancel"
					});
		return 0;
	end
	
	--
	RemoveItemByIndex(nItemIdx);					-- 删除门派信物
	SetTask(TSK_TOUSHI_FLAG, 1);					-- 设置带艺投师申请成功标记
	WriteLog(format("[%s]\t%s\tName:%s\tAccount:%s\tLevel:%d,FactionId:%d%s",
				"Цi ngh� u s�",
				GetLocalDate("%Y-%m-%d %X"),
				GetName(), GetAccount(),
				GetLevel(), GetLastFactionNumber(),
				"Лa ra m玭 ph竔 t輓 v藅, y猽 c莡 chuy觧 m玭 ph竔 th祅h c玭g"));
				
	CreateTaskSay({"<dec><npc>ng v藅 n祔 r錳, ta ph� chu萵 cho ngi h� s琻, ta mong r籲g ngi s韒 c� ng祔 ng� ra 頲 tuy謙 k� v� h鋍  quang i ng� v� l﹎.", "е t� nh蕋 nh s� nghe l阨 d箉 c馻 s� ph�/OnCancel"});
end

-- 带艺投师，拜入门墙
function toushiTransEnter(nFactionNumb)
	local nTaskValue = GetTask(2885)
	local nTmpRes = floor(nTaskValue/100)
	if nTaskValue > 0 and mod(nTmpRes, 100) < 14 then
		Msg2Player("Ngi  nh薾 nhi謒 v� k� n╪g 150, xin h穣 ho祅 th祅h nhi謒 v� r錳 h穣 n g苝 ta")
		return 
	end
	local bFlag				= toushiCheckTransFactState(nFactionNumb, 1);
	local nSex				= GetSex();
	local szHierarchTitle	= toushiGetHierarchTitle(nFactionNumb);
	
	if (bFlag == TOUSHI_SUCCEED) then
		
		local szDes = "<dec><npc>V� <sex> n祔, ngi  t譵 頲 阯g n ch� c馻 ta y, ta bu閏 ngi ph秈 qu猲 甶 nh鱪g tuy謙 h鋍 m� ngi  l穘h ng� 頲 t� s� ph� c馻 ngi. {{ ngi ph秈 bi誸 r籲g  l� gia nh藀 b鎛 m玭, th� nh鱪g v� c玭g  h鋍 trc y kh玭g th� s� d鬾g, 琻g nhi猲 ta s� truy襫 th� v� c玭g c馻 b鎛 ph竔 cho ngi, a ngi gia nh藀 b鎛 ph竔, ta tin tng r籲g s� kh玭g t鎛 th蕋 th� l鵦.}} ngi  ngh� k� ch璦 , qu� th鵦 l� ngi mu鑞 gia nh藀 b鎛 ph竔 hay kh玭g?";
		
		if (nFactionNumb == 1 and nSex == 1) then
			szDes = "<dec><npc>V� <sex> n祔, ngi  t譵 頲 阯g n ch� c馻 ta y, ta bu閏 ngi ph秈 qu猲 甶 nh鱪g tuy謙 h鋍 m� ngi  l穘h ng� 頲 t� s� ph� c馻 ngi. C� 甶襲 b鎛 ph竔 ta v鑞 d� kh玭g thu nh薾 n�  t�, l� v� s� r籲g n�  t� s� kh玭g l躰h ng� 頲 c玭g ph竝 thu莕 dng c馻 b鎛 ph竔. M穒 cho n n鯽 n╩ trc y b鎛 bang ch� v� t譶h t 頲 m閠 Thi誴 C� Phng, m韎 t譵 頲 c玭g ph竝 ch� gi秈. Ch� l� b� dc � trong phng thu鑓 n祔 c騨g kh玭g l蕐 g� 鎛 nh cho l緈, c莕 ph秈 c� b鎛 bang ch� truy襫 c玭g  th玭g kinh m筩h. N誹 nh� ngi c� th� t譵 頲 {{ T輓 v藅 c馻 b鎛 bang ch� }}, m韎 c� th� gia nh藀 b鎛 bang. Ngo礽 ra {{ ngi c騨g ph秈 bi誸 r籲g  l� gia nh藀 b鎛 m玭, th� nh鱪g v� c玭g  h鋍 trc y kh玭g th� s� d鬾g, 琻g nhi猲 ta s� truy襫 th� v� c玭g c馻 b鎛 ph竔 cho ngi, a ngi gia nh藀 b鎛 ph竔, ta tin tng r籲g s� kh玭g t鎛 th蕋 th� l鵦.}} ngi  ngh� k� ch璦 , qu� th鵦 l� ngi mu鑞 gia nh藀 b鎛 ph竔 hay kh玭g?";
		end
		
		CreateTaskSay({szDes, 
				format("%s, ta  ngh� k� r錳, mu鑞 gia nh藀 m玭 ph竔 c馻 b鎛 bang./#toushiTransSureTodo(%d)", szHierarchTitle, nFactionNumb),
				format("%s,  ta suy ngh� th猰/OnCancel", szHierarchTitle),
			});
		
	else
		CreateTaskSay({TB_TOUSHI_ERR_MSG[bFlag], "K誸 th骳 i tho筰/OnCancel"});
	end
end

-- 提示转职成功后,需要设置90级技能熟练度
function toushiTransSureTodo(nFactionNumb)
	local tbDescrib		= {"<dec><npc>Ngi c莕 ph秈 l鵤 ch鋘 con 阯g ch� c玭g:"};

	for k, v in TB_DAIYITOUSHI_FACTS[nFactionNumb + 1].tbSkillID[90] do
		if (type(v) == "table") then
			tbDescrib[getn(tbDescrib) + 1]	= format("%s/#toushiTransSure(%d, %d)", v[3], nFactionNumb, k);
		end
	end
	
	tbDescrib[getn(tbDescrib) + 1]	= "Ta c莕 ph秈 suy ngh� th猰/OnCancel";
	
	CreateTaskSay(tbDescrib);
end


-- 确认拜入门墙，判断角色状态，处理角色属性
function toushiTransSure(nFactionNumb, nMagicIdx)
	local bFlag	= toushiCheckTransFactState(nFactionNumb, 2);
	local nSex	= GetSex();
	local szLog	= "";
	
	if (bFlag == TOUSHI_SUCCEED) then
		
		if (nFactionNumb == 1 and nSex == 1) then
			--local ndnumzimu		= CalcItemCount(23, unpack(TB_TOUSHI_YANGYINGXINWU), -1);	-- 检查子母袋
			local ndnumbeibao	= CalcItemCount(3, TB_TOUSHI_YANGYINGXINWU[1],TB_TOUSHI_YANGYINGXINWU[2],TB_TOUSHI_YANGYINGXINWU[3], -1);	-- 检查背包
			
			if (ndnumbeibao >= 1) then
				ConsumeItem(3, 1, TB_TOUSHI_YANGYINGXINWU[1],TB_TOUSHI_YANGYINGXINWU[2],TB_TOUSHI_YANGYINGXINWU[3], -1);
			--elseif (ndnumzimu >= 1) then
			--	ConsumeItem(23, 1, unpack(TB_TOUSHI_YANGYINGXINWU), -1);
			
			else
				CreateTaskSay({TB_TOUSHI_ERR_MSG[TOUSHI_TWFEMALEERR], "K誸 th骳 i tho筰/OnCancel"});
				return TOUSHI_TWFEMALEERR;
			end
			
			szLog = "Giao t輓 v藅 c馻 Dng Anh th祅h c玭g";
		end
		
		local bTrans = toushiDoTransPlayer(GetLastFactionNumber(), nFactionNumb, nMagicIdx, szLog);			-- 处理角色相关属性
		
		-- 设置冷却时间
		local nCurTime = tonumber( GetCurServerTime() );
		SetTask(TSK_LAST_CHANGE_FACTION, nCurTime);
	else
		CreateTaskSay({TB_TOUSHI_ERR_MSG[bFlag], "K誸 th骳 i tho筰/OnCancel"});
	end
end


-- 转换角色加入对应门派
-- 设置角色五行，门派，称号，阵营，门派任务变量
function toushiDoTransPlayer(nMyFacNumb, nFactionNumb, nMagicIdx, szLog)
	LeaveTeam();															-- 先做离队操作
	
	local nLevel		= GetLevel();
	local tbOldSkill	= TB_DAIYITOUSHI_FACTS[nMyFacNumb + 1].tbSkillID;
	local tbNewSkill	= TB_DAIYITOUSHI_FACTS[nFactionNumb + 1].tbSkillID;
	local tb90SkillExp		= {};
	local tb120SkillExp	= {};
	local tb150SkillExp	= {};
	
	zhuansheng_clear_skill(0, 0)											-- 调用转生 洗技能点函数
	
	for i = 1, getn(tbOldSkill[90]) do										-- 保留原技能熟练度
		if (type(tbOldSkill[90][i]) == "table") then
			local nMagicLvl, nMagicExp, nMagicExpPre		= toushiGetMagicProp(tbOldSkill[90][i][1]);

--			if (nMagicLvl == 0) then
--				nMagicLvl = 1;
--			end

			if (tb90SkillExp.nShuliandu == nil) then
				tb90SkillExp.nShuliandu = {};
			end
			if (nMagicLvl > 0) then
				
				tb90SkillExp.nShuliandu[getn(tb90SkillExp.nShuliandu) + 1]	= {["nMagicLvl"] = nMagicLvl, ["nMagicExpPre"] = nMagicExpPre};
			end
		else
			
			if (HaveMagic(tbOldSkill[90][i]) >= 0) then
				tb90SkillExp.nJinengdian = 1;
			end
		end
	end
	
	sort(tb90SkillExp.nShuliandu, toushiSortSkillsExp);									-- 对熟练度等级经验做排序，给主攻路线加最高熟练度
	
	if (HaveMagic(tbOldSkill[120][1][1]) > 0) then							-- 保留120级技能熟练度
		local nMagicLvl, nMagicExp, nMagicExpPre		= toushiGetMagicProp(tbOldSkill[120][1][1]);
		
--		if (nMagicLvl == 0) then
--			nMagicLvl = 1;
--		end
		tb120SkillExp = {["nMagicLvl"] = nMagicLvl, ["nMagicExpPre"] = nMagicExpPre};
	end
	
	for i = 1, getn(tbOldSkill[150]) do
		if (type(tbOldSkill[150][i]) == "table") then
			local nMagicLvl, nMagicExp, nMagicExpPre		= toushiGetMagicProp(tbOldSkill[150][i][1]);
			
			if (tb150SkillExp.nShuliandu == nil) then
				tb150SkillExp.nShuliandu = {};
			end
			if (nMagicLvl > 0) then
				
				tb150SkillExp.nShuliandu[getn(tb150SkillExp.nShuliandu) + 1]	= {["nMagicLvl"] = nMagicLvl, ["nMagicExpPre"] = nMagicExpPre};
			end
		else
			
			if (HaveMagic(tbOldSkill[150][i]) >= 0) then
				tb150SkillExp.nJinengdian = 1;
			end
		end
	end
	
	sort(tb150SkillExp.nShuliandu, toushiSortSkillsExp);									-- 对熟练度等级经验做排序，给主攻路线加最高熟练度
	for i=1,getn(tb150SkillExp.nShuliandu) do
		print(tb150SkillExp.nShuliandu[i].nMagicLvl, tb150SkillExp.nShuliandu[i].nMagicExpPre)
	end
	
	for nSkillLvl, tbLvlSkill in tbOldSkill do							-- 删除旧门派技能
		for i = 1, getn(tbLvlSkill) do
			if (type(tbLvlSkill[i]) == "table") then
				DelMagic(tbLvlSkill[i][1]);
			else
				DelMagic(tbLvlSkill[i]);
			end
		end
	end
	
	--for nSkillLvl, tbLvlSkill in tbNewSkill do							-- 学习新门派技能
	for nSkillLvl = 10, 150, 10  do							-- 学习新门派技能
		local tbLvlSkill = tbNewSkill[nSkillLvl];
		if (tbLvlSkill) then
			if (nSkillLvl == 150) then
				toushiAdd150Skill(nMyFacNumb, nFactionNumb, tbOldSkill, tb150SkillExp, tbLvlSkill, nMagicIdx);	
			
			elseif (nSkillLvl == 120) then										-- 如果是120级技能,直接设置为旧120级技能等级和熟练度
				
				toushiAdd120Skill(tb120SkillExp, tbLvlSkill[1][1]);			
				
			elseif (nSkillLvl == 90) then									-- 如果是90级技能
				
				toushiAdd90Skill(nMyFacNumb, nFactionNumb, tbOldSkill, tb90SkillExp, tbLvlSkill, nMagicIdx);			-- 
				
			else															-- 如果是加点技能
				for i = 1, getn(tbLvlSkill) do 
					AddMagic(tbLvlSkill[i]);
				end
			end
		end
	end
	
	
	local nOldSeries	= GetSeries();
	local nNewSeries	= TB_DAIYITOUSHI_FACTS[nFactionNumb + 1].nSeries;
	
	toushiAddWuXingSkill(nOldSeries, nNewSeries);		-- 如果有五行技能，那么更换为新五行
	
	zhuansheng_clear_prop(0, 0, nNewSeries)			-- 调用转生 洗潜能点函数,以新五行洗点,各五行基础潜能点不一样
	
	SetSeries(nNewSeries);							-- 转换角色五行属性
	
	toushiResetMaxLife(nNewSeries, nLevel);			-- 角色对应五行等级 的基础血量
	toushiResetMaxMana(nNewSeries, nLevel);			-- 角色对应五行等级 的基础内力
	SetTask(TSK_TOUSHI_RESETBASE, 1);										-- 
	
	SetLastFactionNumber(TB_DAIYITOUSHI_FACTS[nFactionNumb + 1].nFacNumb);					-- 角色门派ID
	
	SetTask(TB_DAIYITOUSHI_FACTS[nMyFacNumb + 1].nTaskId_Fact, 0);				-- 清角色原门派任务变量
	
	if (GetFaction() ~= "M韎 nh藀 giang h� ") then
		SetFaction(TB_DAIYITOUSHI_FACTS[nFactionNumb + 1].szFacName);			-- 角色门派名称
		
		SetCamp(TB_DAIYITOUSHI_FACTS[nFactionNumb + 1].nCamp);					-- 对应门派阵营
		SetCurCamp(TB_DAIYITOUSHI_FACTS[nFactionNumb + 1].nCamp);				-- 对应门派阵营
		
		SetTask(TB_DAIYITOUSHI_FACTS[nFactionNumb + 1].nTaskId_Fact, TOUSHI_FACTION_HUISHI);	-- 门派任务变量,回师
	else
		SetTask(TB_DAIYITOUSHI_FACTS[nFactionNumb + 1].nTaskId_Fact, TOUSHI_FACTION_CHUSHI);	-- 门派任务变量,出师
	end
	
	SetRank(TB_DAIYITOUSHI_FACTS[nFactionNumb + 1].nRankId);					-- 角色头衔
	
	SetTask(TB_DAIYITOUSHI_FACTS[nFactionNumb + 1].nTaskId_137, 
					TB_DAIYITOUSHI_FACTS[nFactionNumb + 1].nValue_137);			-- 门派任务变量,出师
	
	SetTask(144, 0);	--免费洗点
	SetTask(TSK_TOUSHI_FLAG, 0);												-- 清带艺投师成功标记
	SetTask(TSK_TOUSHI_COUNT, GetTask(TSK_TOUSHI_COUNT) + 1);					-- 设置带艺投师成功次数
	
	if (GetByte(GetTask(TSK_ZHENPAILINGDAN_USECNT), 3) ~= 1) then
		SetItemBindState(AddItem(unpack(TB_TOUSHI_ZHENPAILINGDAN)), -2);			-- 赠送的物品为永久绑定
		SetItemBindState(AddItem(unpack(TB_TOUSHI_ZHENPAILINGYAO)), -2);
		SetTask(TSK_ZHENPAILINGDAN_USECNT, SetByte(GetTask(TSK_ZHENPAILINGDAN_USECNT), 3, 1))
		szLog = szLog..", thu 頲 tr蕁 ph竔 linh n v� tr蕁 ph竔 linh dc";
	end
	
	
	CreateTaskSay({"<dec><npc>N誹 nh� ngi  mu鑞 gia nh藀 b鎛 ph秈, sau n祔 ph秈 chuy猲 t﹎ m� kh� luy謓, s韒 c� ng祔 ng� ra 頲 tuy謙 k� v� h鋍. Зy l� hai vi猲 linh dc c馻 b鎛 ph竔, c� th� gi髉 ngi n﹏g cao c玭g l鵦, h穣 nh薾 l蕐 m� s� d鬾g.",
					"K誸 th骳 i tho筰/OnCancel"});
	
	Msg2Faction(format(TB_DAIYITOUSHI_FACTS[nFactionNumb + 1].szMsg, GetName()));
	
	WriteLog(format("[%s]\t%s\tName:%s\tAccount:%s\tLevel:%d,OldFactionId:%d,NewFactionId:%d,MainMagic:%d,%s",
				"Цi ngh� u s�",
				GetLocalDate("%Y-%m-%d %X"),
				GetName(), GetAccount(),
				GetLevel(), nMyFacNumb, nFactionNumb,nMagicIdx,
				"X� l� chuy觧 m玭 ph竔 th祅h c玭g"..szLog));
	KickOutSelf();
end


function toushiSetTask(nTaskId, isHigh, nValue)
	local nTaskValue	= GetTask(nTaskId);
	local nTaskValue_H	= floor(nTaskValue / 2^16);
	local nTaskValue_L	= mod(nTaskValue, 2^16);
	
	if (isHigh == 1) then
		nTaskValue_H	= nValue;
	else
		nTaskValue_L	= nValue;
	end
	
	nTaskValue			= nTaskValue_H * 2^16 + nTaskValue_L;
	
	SetTask(nTaskId, nTaskValue);
	
	return nTaskValue;
end


function toushiAddTask(nTaskId, isHigh, nAdd)
	local nTaskValue	= GetTask(nTaskId);
	local nTaskValue_H	= floor(nTaskValue / 2^16);
	local nTaskValue_L	= mod(nTaskValue, 2^16);
	local nValue		= 0;
	
	if (isHigh == 1) then
		nTaskValue_H	= nValue;
	else
		nTaskValue_L	= nValue;
	end
	
	nValue			= nValue + nAdd;
	
	toushiSetTask(nTaskId, isHigh, nValue)
	
	return nTaskValue;
end


function toushiGetTask(nTaskId, isHigh)
	local nTaskValue	= GetTask(nTaskId);
	local nTaskValue_H	= floor(nTaskValue / 2^16);
	local nTaskValue_L	= mod(nTaskValue, 2^16);
	
	if (isHigh == 1) then
		return nTaskValue_H;
	else
		return nTaskValue_L;
	end
end


function toushiGetMagicProp(nMagicId)
	local nMagicLvl		= HaveMagic(nMagicId);
	
	if (nMagicLvl == -1) then
		return 0, 0, 0;
	end
	
	if (nMagicLvl <= 0) then
		nMagicLvl = 1;
	end
	
	if (nMagicLvl > 20) then
		nMagicLvl = 20;
	end
	
	local nMagicExp		= GetSkillExp(nMagicId);
	local nMagicExpPre	= floor((nMagicExp * 10000) / TB_TOUSHI_SKILLEXP[nMagicId][nMagicLvl]);
	
	return nMagicLvl, nMagicExp, nMagicExpPre;
end


-- 将原职业各技能熟练度排序
function toushiSortSkillsExp(tb1, tb2)
	if (tb1.nMagicLvl ~= tb2.nMagicLvl) then
		return tb1.nMagicLvl > tb2.nMagicLvl;
	else
		return tb1.nMagicExpPre > tb2.nMagicExpPre;
	end

end


-- 添加150级技能处理
--  150级技能任务只分完成和未进行，so未进行不给，完成全给
function toushiAdd150Skill(nMyFacNumb, nFactionNumb, tbOldSkill, tbOldSkillExp, tbNewSkill, nMagicIdx)
	local nOldNumb		= nMyFacNumb + 1;
	local nNewNumb		= nFactionNumb + 1;
	local tbAddSkill	= {};
	local tbFactStepList = {
		[5] = 6,
		[2] = 7,
		[4] = 7,
		[3] = 5,
		[6] = 9,
		[7] = 9,
		[0] = 6,
		[8] = 5,
		[1] = 4,
		[9] = 5,
	}
	
	if (mod(floor(GetTask(TSK_LV150_SKILL) / 100), 100) >= TOUSHI_150SKILL_TASKSTATE) then
	-- 如果150级技能任务变量为完成的处理
		--改变150任务完成的任务变量，门派支线的修改
		SetTask(TSK_LV150_SKILL, TOUSHI_150SKILL_TASKSTATE*100+tbFactStepList[nFactionNumb])
		
		local nCount	= getn(tbOldSkillExp.nShuliandu);
		local nAddCnt	= 0;
		
		if (nCount > 0) then
			nAddCnt			= nAddCnt + 1;
			tbAddSkill[1]	= {tbNewSkill[nMagicIdx][1], tbOldSkillExp.nShuliandu[nAddCnt].nMagicLvl, tbOldSkillExp.nShuliandu[nAddCnt].nMagicExpPre};						-- 先将主攻路线技能加记录
		else
			tbAddSkill[1] = {tbNewSkill[nMagicIdx][1], 1, 0};
		end
		print(150,tbAddSkill[1][1], tbAddSkill[1][2], tbAddSkill[1][3])
		for k = 1, getn(tbNewSkill) do
			if (type(tbNewSkill[k]) == "table") then											-- 如果是熟练度技能
				if (tbNewSkill[k][1] ~= tbNewSkill[nMagicIdx][1]) then											-- 按顺序给与熟练度
																								-- 如果旧门派技能熟练度不够安排
					if (nCount > nAddCnt) then													-- 则给与技能为一级，熟练度为0
						nAddCnt = nAddCnt + 1;
						tbAddSkill[getn(tbAddSkill) + 1] = {tbNewSkill[k][1], tbOldSkillExp.nShuliandu[nAddCnt].nMagicLvl, tbOldSkillExp.nShuliandu[nAddCnt].nMagicExpPre};
						print(tbNewSkill[k][1], tbOldSkillExp.nShuliandu[nAddCnt].nMagicLvl, tbOldSkillExp.nShuliandu[nAddCnt].nMagicExpPre)
					else
						tbAddSkill[getn(tbAddSkill) + 1] = {tbNewSkill[k][1], 1, 0};
						print(tbNewSkill[k][1], 1, 0)
					end
				end
			else																				-- 如果是加点技能，则记录要加
				tbAddSkill[getn(tbAddSkill) + 1] = tbNewSkill[k];								-- 在给与的时候直接给0级
			end
		end
	else
		return
	end
	
	for k = 1, getn(tbAddSkill) do
		if (type(tbAddSkill[k]) == "table") then
			AddMagic(tbAddSkill[k][1], tbAddSkill[k][2]);
			AddSkillExp(tbAddSkill[k][1], tbAddSkill[k][3], 1, 1);
		else
			AddMagic(tbAddSkill[k]);
		end
	end
end

-- 添加120级技能处理。如果原来有120级技能则给与新门派120级技能
function toushiAdd120Skill(tbOldSkill, nNewSkill)
	if (tbOldSkill.nMagicLvl and tbOldSkill.nMagicLvl > 0) then
		SetTask(LV120_SKILL_ID, nNewSkill);
		AddMagic(nNewSkill, tbOldSkill.nMagicLvl);
		AddSkillExp(nNewSkill, tbOldSkill.nMagicExpPre, 1, 1);
	end
end

-- 添加90级技能处理
-- 	如果90级技能任务完成，则给与所有新门派90级技能
-- 	如果90级技能任务未完成，则按旧门派90级技能数量给与新门派技能
function toushiAdd90Skill(nMyFacNumb, nFactionNumb, tbOldSkill, tbOldSkillExp, tbNewSkill, nMagicIdx)
	local nOldNumb		= nMyFacNumb + 1;
	local nNewNumb		= nFactionNumb + 1;
	local tbAddSkill	= {};
	
	
	if (GetTask(TB_DAIYITOUSHI_FACTS[nOldNumb].nTaskId_90Skill) == TOUSHI_90SKILL_TASK) then
	-- 如果90级技能任务变量为完成的处理
		SetTask(TB_DAIYITOUSHI_FACTS[nNewNumb].nTaskId_90Skill, TOUSHI_90SKILL_TASK);	-- 新门派技能任务设置为完成
		
		local nCount	= getn(tbOldSkillExp.nShuliandu);
		local nAddCnt	= 0;
		
		if (nCount > 0) then
			nAddCnt			= nAddCnt + 1;
			tbAddSkill[1]	= {tbNewSkill[nMagicIdx][1], tbOldSkillExp.nShuliandu[nAddCnt].nMagicLvl, tbOldSkillExp.nShuliandu[nAddCnt].nMagicExpPre};						-- 先将主攻路线技能加记录
		else
			tbAddSkill[1] = {tbNewSkill[90][nMagicIdx], 1, 0};
		end
		
		for k = 1, getn(tbNewSkill) do
			if (type(tbNewSkill[k]) == "table") then											-- 如果是熟练度技能
				if (tbNewSkill[k][1] ~= tbNewSkill[nMagicIdx][1]) then											-- 按顺序给与熟练度
																								-- 如果旧门派技能熟练度不够安排
					if (nCount > nAddCnt) then													-- 则给与技能为一级，熟练度为0
						nAddCnt = nAddCnt + 1;
						tbAddSkill[getn(tbAddSkill) + 1] = {tbNewSkill[k][1], tbOldSkillExp.nShuliandu[nAddCnt].nMagicLvl, tbOldSkillExp.nShuliandu[nAddCnt].nMagicExpPre};
					else
						tbAddSkill[getn(tbAddSkill) + 1] = {tbNewSkill[k][1], 1, 0};
					end
				end
			else																				-- 如果是加点技能，则记录要加
				tbAddSkill[getn(tbAddSkill) + 1] = tbNewSkill[k];								-- 在给与的时候直接给0级
			end
		end
	else
		local tbOtherMagic	= {tbShuliandu = {}, tbJinengdian = {}};
		local nCount		= getn(tbOldSkillExp.nShuliandu);
		local nAddCnt		= 0;
		local nAddJinengCnt	= 0;
		
		if (nCount > 0) then
			nAddCnt = nAddCnt + 1;
			tbAddSkill[1]	= {tbNewSkill[nMagicIdx][1], tbOldSkillExp.nShuliandu[1].nMagicLvl, tbOldSkillExp.nShuliandu[1].nMagicExpPre};					-- 先将主攻路线技能加记录
		else
			tbOtherMagic.tbShuliandu[getn(tbOtherMagic.tbShuliandu) + 1]	= {tbNewSkill[nMagicIdx][1], 1, 0};
		end
		
		for k = 1, getn(tbNewSkill) do
			if (type(tbNewSkill[k]) == "table") then
				if (tbNewSkill[k][1] ~= tbNewSkill[nMagicIdx][1]) then
					if (nCount > nAddCnt) then
						nAddCnt = nAddCnt + 1;
						tbAddSkill[getn(tbAddSkill) + 1] = {tbNewSkill[k][1], tbOldSkillExp.nShuliandu[nAddCnt].nMagicLvl, tbOldSkillExp.nShuliandu[nAddCnt].nMagicExpPre};
						
					else
						
						tbOtherMagic.tbShuliandu[getn(tbOtherMagic.tbShuliandu) + 1]	= {tbNewSkill[k][1], 1, 0};
					end
				end
				
			else
				
				if (tbOldSkillExp.nJinengdian) then
					tbAddSkill[getn(tbAddSkill) + 1]	= tbNewSkill[k];
					nAddJinengCnt						= nAddJinengCnt + 1;
					
				else
					
					tbOtherMagic.tbJinengdian[getn(tbOtherMagic.tbJinengdian) + 1]	= tbNewSkill[k];
				end
			end
		end
		
		if (getn(tbOtherMagic.tbJinengdian) > 0) then
			for j = 1, getn(tbOtherMagic.tbJinengdian) do
				
				if (nCount - nAddCnt <= 0) then
					break
				end

				nAddCnt								= nAddCnt + 1;
				tbAddSkill[getn(tbAddSkill) + 1]	= tbOtherMagic.tbJinengdian[j];
				
			end
		end
		
		if (getn(tbOtherMagic.tbShuliandu) > 0) then
			for j = 1, getn(tbOtherMagic.tbShuliandu) do
				if (not tbOldSkillExp.nJinengdian or tbOldSkillExp.nJinengdian - nAddJinengCnt <= 0) then
					break
				end
				nAddJinengCnt						= nAddJinengCnt + 1;
				tbAddSkill[getn(tbAddSkill) + 1]	= tbOtherMagic.tbShuliandu[j];
				
			end
		end
		
	end
	
	SetTask(TB_DAIYITOUSHI_FACTS[nOldNumb].nTaskId_90Skill, 0);	-- 取消原职业90级技能任务
	
	for k = 1, getn(tbAddSkill) do
		if (type(tbAddSkill[k]) == "table") then
			AddMagic(tbAddSkill[k][1], tbAddSkill[k][2]);
			AddSkillExp(tbAddSkill[k][1], tbAddSkill[k][3], 1, 1);
			
		else
			
			AddMagic(tbAddSkill[k]);
		end
	end
end

-- 如果角色五行更换，那么五行技能也更换
function toushiAddWuXingSkill(nOldSeries, nNewSeries)
	if (nOldSeries ~= nNewSeries) then
		local nMagicLvl1	= HaveMagic(TB_WUXING_SKILL_ID[nOldSeries + 1].nMagicId1);
		local nMagicLvl2	= HaveMagic(TB_WUXING_SKILL_ID[nOldSeries + 1].nMagicId2);
		if (nMagicLvl1 ~= -1) then
			DelMagic(TB_WUXING_SKILL_ID[nOldSeries + 1].nMagicId1);
			AddMagic(TB_WUXING_SKILL_ID[nNewSeries + 1].nMagicId1);
		elseif (nMagicLvl2 >= 1) then
			local nMagicExp2	= GetSkillExp(TB_WUXING_SKILL_ID[nOldSeries + 1].nMagicId2);
			DelMagic(TB_WUXING_SKILL_ID[nOldSeries + 1].nMagicId2);
			AddMagic(TB_WUXING_SKILL_ID[nNewSeries + 1].nMagicId2, nMagicLvl2);
			AddSkillExp(TB_WUXING_SKILL_ID[nNewSeries + 1].nMagicId2, nMagicExp2, 1);
		end
	end
end
