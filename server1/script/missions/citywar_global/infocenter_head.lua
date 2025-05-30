IncludeLib("LEAGUE")
IncludeLib("TONG")
Include("\\script\\missions\\citywar_arena\\head.lua");
Include("\\script\\missions\\citywar_global\\head.lua");
Include("\\script\\missions\\citywar_global\\citywar_function.lua");
Include("\\script\\task\\system\\task_string.lua")
Include("\\script\\lib\\common.lua")
Include("\\script\\missions\\citywar_global\\ladder.lua")
MapTab = {};
MapTab[1]= {213, 1633, 3292};
MapTab[2]= {214, 1633, 3292};
MapTab[3]= {215, 1633, 3292};
MapTab[4]= {216, 1633, 3292};
MapTab[5]= {217, 1633, 3292};
MapTab[6]= {218, 1633, 3292};
MapTab[7]= {219, 1633, 3292};
MapTab[8]= {220, 1633, 3292};
MapCount = getn(MapTab);

LGTSK_QINGTONGDING_COUNT = 1;	--报名竞投的 挑战令数量
LGTSK_CITYWAR_SIGNCOUNT = 2;	--当前竞投的次数

LEAGUETYPE_CITYWAR_SIGN = 508;
LEAGUETYPE_CITYWAR_FIRST = 509;
nCityWar_Item_ID_G = 6		--攻城战信物G ID
nCityWar_Item_ID_D = 1	--攻城战信物D ID
nCityWar_Item_ID_P = 1499		--攻城战信物P ID
TIAOZHANLING_TASK_DATE = 1839 --挑战令记录领取时期,1.时间(年%y),2.时间(月)，3.时间(日),4.领取次数
TIAOZHANLING_TASK_COUNT = 1840 --挑战令交纳次数
	
function OnCancel()
end;

function PreEnterGame()
	--如果玩家所在帮会正在进行擂台赛,则自动进入该场地
	TongName, result = GetTong()
	if (TongName ~= "") then
		for i = 0, 7 do
			if (IsArenaBegin(i) == 1) then
				Tong1, Tong2 = GetArenaBothSides(i);
				if (Tong1 == TongName or Tong2 == TongName) then
					EnterBattle(i);
					return
				end;
			end;
		end;
	end;

	--否则,请玩家自己选择进入哪一个
	EnterGame();
end;

function EnterGame()
	ExtraArenaInfo = {"<#> (Kho秐g tr鑞g) ", "<#> (Kho秐g tr鑞g) ", "<#> (Kho秐g tr鑞g) ", "<#> (Kho秐g tr鑞g) ", "<#> (Kho秐g tr鑞g) ", "<#> (Kho秐g tr鑞g) ", "<#> (Kho秐g tr鑞g) ", "<#> (Kho秐g tr鑞g) "};
	for i = 0, 7 do
		if (IsArenaBegin(i) == 1) then
			Tong1, Tong2 = GetArenaBothSides(i);
			ExtraArenaInfo[i + 1] = " ("..Tong1.." vs "..Tong2..") "
		end;
	end;

	Say("B筺 mu鑞 v祇 c玭g th祅h chi課 d� tuy觧 thi u l玦 i kh玭g??", 9, "<#> L玦 i 1"..ExtraArenaInfo[1].."/EnterBattle", "<#> L玦 i 2"..ExtraArenaInfo[2].."/EnterBattle", "<#> L玦 i 3"..ExtraArenaInfo[3].."/EnterBattle", "<#> L玦 i 4"..ExtraArenaInfo[4].."/EnterBattle", "<#> L玦 i 5"..ExtraArenaInfo[5].."/EnterBattle", "<#> L玦 i 6"..ExtraArenaInfo[6].."/EnterBattle", "<#> L玦 i 7"..ExtraArenaInfo[7].."/EnterBattle", "<#> L玦 i 8"..ExtraArenaInfo[8].."/EnterBattle","Kh玭g 甶 n鱝/OnCancel");
end;

function EnterBattle(nBattleId)

	if (IsArenaBegin(nBattleId) ~= 1) then 
		return 
	end;

	SetFightState(0)
	--设置返回点
	M,X,Y = GetWorldPos();
	SetTask(300, M);
	SetTask(301, X);
	SetTask(302, Y);

	NewWorld(MapTab[nBattleId + 1][1], MapTab[nBattleId + 1][2], MapTab[nBattleId + 1][3]);
end;


-- function main()
	--
--	ArenaMain();
-- end

--报名指定城市擂台赛 [wxb 2004-3-31](废弃2006-11-22)
function SignupACity(sel)
	CityID = sel + 1;
	if (IsSigningUp(CityID) == 1) then
		SetTaskTemp(15, CityID);
		AskClientForNumber("SignUpFinal", 1000000, 99999999, "Xin nh藀 s� ti襫 u th莡 v祇:");
	else
		Say("<#><"..GetCityAreaName(CityID).."<#> >th祅h, b竜 danh tr薾 L玦 i ch璦 b総 u ", 0);
	end;
end;

--报名唯一的正在报名阶段的擂台赛 [wxb 2004-3-31](废弃2006-11-22)
function SignUpTheOne()
	CityID = 0;
	for i = 1, 7 do
		if (IsSigningUp(i) == 1) then
			CityID = i;
		end;
	end;

	if (IsSigningUp(CityID) == 1) then
		SetTaskTemp(15, CityID);
		AskClientForNumber("SignUpFinal", 1000000, 99999999, "Xin nh藀 s� ti襫 u th莡 v祇:");
	else
		Say("<#><"..GetCityAreaName(CityID).."<#> >th祅h, b竜 danh tr薾 L玦 i ch璦 b総 u ", 0);
	end;
end;

--玩家输入投标金后到这里 [wxb 2004-3-31](废弃2006-11-22)
function SignUpFinal(Fee)
	CityID = GetTaskTemp(15);
	SignUpCityWarArena(CityID, Fee);
end;

--查询昨天竞投挑战令的情况
function citywar_CheckVotes()
	local nCityId = getSigningUpCity(1);
	local tbVotes = citywar_tbLadder:GetInfo()
	local szMsg = format("<dec><npc>B猲 di l� bang h閕 tham gia u gi� khi猽 chi課 l謓h <%s>: <enter>%s%s%s<enter>", GetCityAreaName(nCityId), strfill_center("STT",4, " "), strfill_center("Bang h閕", 20, " "), strfill_center("S� lng", 20, " "))
	local res = {}
	for i = 1, getn(tbVotes) do
		tinsert(res, strfill_center(i, 4, " "))
		tinsert(res, strfill_center(tbVotes[i].szName, 20, " "))
		tinsert(res, strfill_center(tbVotes[i].nValue, 20, " "))
		tinsert(res, "<enter>")
	end
	PushString(szMsg)
	for i = 1, getn(res) do
		AppendString(res[i])
	end
	szMsg = PopString()
	TaskSayList(szMsg, "C竚 琻! Ta  r� r錳./OnCancel")
end
--入口
function ArenaMain()
	local nCityId = getSigningUpCity(1);--GetArenaTargetCity()
	if (tonumber(GetLocalDate("%H"))>= 18 and tonumber(GetLocalDate("%H")) < 19 and getSignUpState(nCityId) == 1) then
		Say(format("Hi謓 t筰 c玭g th祅h chi課 th祅h <%s> 產ng cho b竜 danh, ngi mu鑞 ng k� kh玭g?",GetCityAreaName(nCityId)), 7, "B竜 danh c玭g th祅h chi課/SignUpCityWar", "Ta mu鑞 xem t譶h h譶h b竜 danh c玭g th祅h chi課/ViewCityWarTong","Ta mu鑞 xem s� lng khi猽 chi課 l謓h c馻 bang/ViewTiaoZhanLing","T譵 hi觰 t譶h h譶h c玭g th祅h chi課/GameInfo", "S� ngh� Th祅h chi課 l謓h b礽/TokenCard", "Mua d鬾g c� h� tr� C玭g th祅h chi課/AskDeal", "Kh玭g mu鑞 g� c� /OnCancel");
	else
		Say("Зy l� n琲 ngh� s� c玭g th祅h chi課, ngi n c� vi謈 g�?",
			7,
			"Ta n giao l謓h b礽/GiveTiaoZhanLing",
			"Xem t譶h h譶h u gi� khi猽 chi課 l謓h/citywar_CheckVotes" ,
			"Ta mu鑞 xem s� lng khi猽 chi課 l謓h c馻 bang/ViewTiaoZhanLing",
			"T譵 hi觰 t譶h h譶h c玭g th祅h chi課/GameInfo",
			"S� ngh� Th祅h chi課 l謓h b礽/TokenCard",
			"Mua d鬾g c� h� tr� C玭g th祅h chi課/AskDeal",
			"Kh玭g mu鑞 g� c� /Cancel");
	end;
end;

--查看已经报名参加攻城战的帮会
function ViewCityWarTong()
	local caption = nil
	local nCityId = getSigningUpCity(1);
	local nlgID = LG_GetLeagueObj(LEAGUETYPE_CITYWAR_SIGN, cityid_to_lgname(nCityId)) 
	--LEAGUETYPE_CITYWAR_SIGN, cityid_to_lgname(nCityId),
	local nlgcount = LG_GetMemberCount(nlgID)
	if nlgcount == 0 then
		caption = "<dec>Hi謓 tai ch璦 c� bang h閕 n祇 b竜 danh c玭g th祅h."	
	else
		caption = "<dec>Bang h閕 b竜 danh c玭g th祅h chi課: \n"
		PushString(caption)
		for nindex=0,nlgcount do
			szTongName = LG_GetMemberInfo(nlgID,nindex)
			AppendString("<color=yellow>")
			AppendString(szTongName)
			AppendString("<color>\t")
		end
		caption = PopString()
	end
	local option = {"Tr� v�/ArenaMain", "Tho竧 ra/OnCancel"}
	TaskSay(caption, option)
end

--交纳挑战令
function GiveTiaoZhanLing()
	if checkBangHuiLimit() == 0 then
			Say("Xin l鏸! Чi hi謕 ch璦 gia nh藀 bang h閕 n祇 c�!",0);
			return 0;
	end
	local nDate = tonumber(tonumber(GetLocalDate("%y"))..tonumber(GetLocalDate("%m"))..tonumber(GetLocalDate("%d")));
	local nLibao = GetTask(TIAOZHANLING_TASK_DATE);
	local nOlddate = tonumber(GetByte(nLibao,1)..GetByte(nLibao,2)..GetByte(nLibao,3));
	local nCount = GetTask(TIAOZHANLING_TASK_COUNT);
	if ( nOlddate == nDate and nCount >= 300) then
			Say("M鏸 ng祔 giao n筽 t鑙 產 300 l謓h b礽. H玬 nay ngi  giao 300 l謓h b礽 r錳, ng祔 mai h穣 ti誴 t鬰.",0)
			return 0;
	end
	if ( nOlddate ~= nDate ) then
		SetTask(TIAOZHANLING_TASK_DATE,SetByte(GetTask(TIAOZHANLING_TASK_DATE),1,tonumber(GetLocalDate("%y"))));
		SetTask(TIAOZHANLING_TASK_DATE,SetByte(GetTask(TIAOZHANLING_TASK_DATE),2,tonumber(GetLocalDate("%m"))));
		SetTask(TIAOZHANLING_TASK_DATE,SetByte(GetTask(TIAOZHANLING_TASK_DATE),3,tonumber(GetLocalDate("%d"))));
		SetTask(TIAOZHANLING_TASK_COUNT,0);
	end

	local szlgname = GetTongName();
	--****判断是否创建了该社团
	checkCreatLG(szlgname);
	
	--**判断是否加入了该社团
	checkJoinLG(szlgname);
	local szTongName, nTongID = GetTongName();
	local nsum = LG_GetMemberTask(TIAOZHANLING_LGTYPE,TIAOZHANLING_LGName,szTongName,LGTSK_TIAOZHANLING_COUNT)
	if nsum >= 2000000000 then   --上限达20亿则不能再提交
		Say("T鎛g s� v� l﹎ l謓h  t gi韎 h筺. L骳 kh竎 th� l筰 v藋.",0)
		return 0;
	end
	--**提交挑战令
	GiveItemUI("Giao n閜 khi猽 chi課 l謓h", "Khi猽 chi課 l謓h c� th� i 50000 甶觤 kinh nghi謒, d飊g  b竜 danh c玭g th祅h chi課 cho bang h閕.", "sure_GiveTiaoZhanLing", "OnCancel");
end

function sure_GiveTiaoZhanLing(nCount)
	if nCount <= 0 then
		Say("Th藅 ng ti誧, ngi ch璦 giao v藅 ph萴 nhi謒 v� cho ta",2,"Giao l筰 v藅 ph萴/GiveTiaoZhanLing","в ta suy ngh� l筰/OnCancel");
		return 0;
	end
	for i = 1, nCount do
		local nItemidx = GetGiveItemUnit(i);
		local g, d, p = GetItemProp(nItemidx);
		if (g ~= nCityWar_Item_ID_G or d ~= nCityWar_Item_ID_D or p ~= nCityWar_Item_ID_P) then
			Say("Ta kh玭g nh薾 nh鱪g th� kh竎, ch� c莕 a ta <color=yellow>Khi猽 chi課 l謓h<color> l� 頲 r錳.", 2,"Giao l筰 v藅 ph萴/GiveTiaoZhanLing","в ta suy ngh� l筰/OnCancel");
			return 0;
		end;
	end;
	local nDate = tonumber(tonumber(GetLocalDate("%y"))..tonumber(GetLocalDate("%m"))..tonumber(GetLocalDate("%d")));
	local nLibao = GetTask(TIAOZHANLING_TASK_DATE);
	local nOlddate = tonumber(GetByte(nLibao,1)..GetByte(nLibao,2)..GetByte(nLibao,3));
	local nCountall = GetTask(TIAOZHANLING_TASK_COUNT);
	if ( nOlddate == nDate and nCountall+nCount > 300) then
			Say(format("Th藅 ng ti誧, h玬 nay ngi  n閜 v祇 %d khi猽 chi課 l謓h, ch� c莕 n閜 %d l謓h b礽 n鱝 l� 頲 r錳.",nCountall,300-nCountall),0)
			return 0;
	end
	if ( nOlddate ~= nDate ) then
		SetTask(TIAOZHANLING_TASK_DATE,SetByte(GetTask(TIAOZHANLING_TASK_DATE),1,tonumber(GetLocalDate("%y"))));
		SetTask(TIAOZHANLING_TASK_DATE,SetByte(GetTask(TIAOZHANLING_TASK_DATE),2,tonumber(GetLocalDate("%m"))));
		SetTask(TIAOZHANLING_TASK_DATE,SetByte(GetTask(TIAOZHANLING_TASK_DATE),3,tonumber(GetLocalDate("%d"))));
		SetTask(TIAOZHANLING_TASK_COUNT,0);
	end
	local nCityId = getSigningUpCity(1);
	local szTongName, nTongID = GetTongName();
	--local szplayName = GetName()
	--local nlg = LG_GetLeagueObj(TIAOZHANLING_LGTYPE,TIAOZHANLING_LGName);
	--local nlid = LG_GetLeagueObjByRole(TIAOZHANLING_LGTYPE, szTongName);
	--local nCurCount = LG_GetMemberTask(TIAOZHANLING_LGTYPE, szTongName, szplayName, LGTSK_QINGTONGDING_COUNT);
	local nCurCount = LG_GetMemberTask(TIAOZHANLING_LGTYPE,TIAOZHANLING_LGName,szTongName,LGTSK_TIAOZHANLING_COUNT)
	--ConsumeEquiproomItem(nCount, nCityWar_Item_ID_G, nCityWar_Item_ID_D, nCityWar_Item_ID_P, -1);
	for i = 1, nCount do
		local nItemidx = GetGiveItemUnit(i);
		RemoveItemByIndex(nItemidx)
	end;
	SetTask(TIAOZHANLING_TASK_COUNT,nCountall+nCount);
	--LG_ApplyAppendMemberTask(LEAGUETYPE_CITYWAR_SIGN, cityid_to_lgname(nCityId), szTongName, LGTSK_CITYWAR_SIGNCOUNT, 1, "", "")
	
	LG_ApplyAppendMemberTask(TIAOZHANLING_LGTYPE,TIAOZHANLING_LGName, szTongName, LGTSK_TIAOZHANLING_COUNT, nCount, "", "");
	
	
	--print(TIAOZHANLING_LGTYPE,TIAOZHANLING_LGName, szTongName, LGTSK_TIAOZHANLING_COUNT, nCount, "", "")
	--增加经验,提交1个增加5万经验
	nAddExp = nCount * 50000
	AddOwnExp(nAddExp)
	Msg2Player(format("B筺  n閜 v祇 %d khi猽 chi課 l謓h, nh薾 頲 %d 甶觤 kinh nghi謒",nCount,nAddExp))
	WriteLog(format("[C玭g th祅h chi課_giao khi猽 chi課 l謓h]Date:%s Account:%s Name:%s Tong:%s Count:%d Exp:%d",GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),szTongName,nCount,nAddExp))
end;

--查询挑战令
function ViewTiaoZhanLing()
		local szTongName, nTongID = GetTongName();
		if (nTongID == 0 or ( GetTongFigure() ~= TONG_MASTER and GetTongFigure() ~= TONG_ELDER)) then
			Say("Th藅 ng ti誧, ch� c� bang ch� v� trng l穙 m韎 c� th� xem th玭g tin s� lng Khi猽 Chi課 L謓h.", 0);
			return 0
		end
		--local szlgname = GetTongName();
		--****判断是否创建了该社团
		checkCreatLG(szTongName);
	
		--**判断是否加入了该社团
		checkJoinLG(szTongName);
		--local nCityId = getSigningUpCity(1);
		--local szTongName, nTongID = GetTongName();
		--local nlg = LG_GetLeagueObj(TIAOZHANLING_LGTYPE, szTongName);
		--local szplayName = GetName()
		--local nlid = LG_GetLeagueObjByRole(TIAOZHANLING_LGTYPE, szTongName);
		--Msg2Player(nlid)
		--local nCurCount = LG_GetMemberTask(nlid, LGTSK_TIAOZHANLING_COUNT)
		local nCurCount = LG_GetMemberTask(TIAOZHANLING_LGTYPE,TIAOZHANLING_LGName,szTongName,LGTSK_TIAOZHANLING_COUNT)
		
		Say(format("Qu� bang  n閜 v祇 <color=yellow>%d<color> khi猽 chi課 l謓h.",nCurCount),0)
end

--关于令牌的处理 start************************************************
function TokenCard()
	Say("Th祅h Chi課 l謓h b礽 d祅h cho nh鱪g ngi mu鑞 v祇 chi vi謓 cho bang h閕 c玭g th� th祅h! Xin cho h醝 m鬰 ch c馻 ngh躠 s�?", 4, "Mua Th祅h chi課 l謓h b礽/BuyCard", "Th� l謓h b礽/CheckCard", "Tr� l筰 l謓h b礽/ReturnCard", "Kh玭g l祄 g� c� /OnCancel");
end;

function BuyCard()
	if (GetName() == GetTongMaster()) then
		TongName, result = GetTong()
		for i = 1, 7 do
			Tong1, Tong2 = GetCityWarBothSides(i);
			if (Tong1 == TongName) then
				SetTaskTemp(15, CardTab[i * 2 - 1]);
				str_format = format("Th� ra i hi謕 l� ngi khi猽 chi課 th祅h %s, l頸 h筰 qu�, � y c� b竛 l謓h b礽 c玭g th祅h c� hi謚 l鵦 trong 5 ng祔 d祅h li猲 minh c馻 qu� bang, m鏸 l謓h b礽 gi� %s lng.",GetCityAreaName(i),CardPrice);
				Say(str_format, 2, "Mua m閠 輙/DealBuyCard", "T筸 th阨 kh玭g c莕/OnCancel");
				return
			elseif (Tong2 == TongName) then
				SetTaskTemp(15, CardTab[i * 2]);
				str_format = format("Th� ra i hi謕 l� th竔 th� th祅h %s, t筰 y c� b竛 l謓h b礽 th� th祅h c� hi謚 l鵦 5 ng祔 d祅h cho li猲 minh c馻 qu� bang, m鏸 l謓h b礽 gi� %s lng.",GetCityAreaName(i),CardPrice);
				Say(str_format, 2, "Mua m閠 輙/DealBuyCard", "T筸 th阨 kh玭g c莕/OnCancel");
				return
			end;
		end;
		Say("B筺 kh玭g c� quan h� g� v韎 c竎 bang ph竔 c玭g th� th祅h! Kh玭g th� s� d鬾g Th祅h chi課 l謓h b礽!", 0);
	else
		Say("Ch� c� bang ch� m韎 頲 mua Th祅h Chi課 l謓h b礽", 0);
	end;
end;

function DealBuyCard(CardID)
	AskClientForNumber("PayForCard", 1, 30, "B筺 c莕 bao nhi猽?");
end;

function PayForCard(count)
	CardItemID = GetTaskTemp(15);
	if (CardItemID > 0 and count > 0) then
		if (Pay(count * CardPrice) ~= 0) then
			for i = 1,count do
				AddEventItem(CardItemID);
			end;
			Say("Xin h穣 gi� k�! L謓h b礽 n祔 d飊g  ki觤 ch鴑g ng minh tr猲 chi課 trng! Xin ch� � th阨 gian tr猲 l謓h b礽, ch� c� hi謚 l鵦 5 ng祔, n誹 qu� th阨 gian s� kh玭g s� d鬾g 頲,c� th� quay l筰 y tr� l筰 v� l蕐 l筰 ph� ", 0);
		end;
	end;
end;

function CheckCard()
	count = 0;
	CardItemID = 0;
	for i=1,14 do
		newcount = count + GetItemCountEx(CardTab[i])
		if (newcount > count) then
			CardItemID = CardTab[i];
			count = newcount;
		end;
	end;
	if (count == 0) then
		Say("B筺 kh玭g h� c� l謓h b礽 n祇 trong ngi!", 0);
	elseif (count > 1) then
		Say("B筺 mang qu� nhi襲 Th祅h Chi課 l謓h b礽, kh玭g bi誸 b筺 mu鑞 ki觤 ch鴑g c竔 n祇! Xin ch� mang m閠 l謓h b礽 th玦!", 0);
	elseif (CardItemID ~= 0) then
		life = GetItemLife(CardItemID);
		if (life < 0) then
			Say("T譶h tr筺g t蕀 l謓h b礽 n祔 l�.......", 0);
		elseif (life < 7200) then
			Say(format("S� l謓h b礽 c玭g th祅h n祔 ph秈 頲 ph竧 trc %s ng祔, hi謓 v蒼 c遪 hi謚 l鵦.",floor(life/1440)), 0)
		else
			Say(format("S� l謓h b礽 c玭g th祅h n祔 ph秈 頲 ph竧 trc %s ng祔, hi謓  qu� h筺, kh玭g c遪 hi謚 l鵦 s� d鬾g.",floor(life/1440)), 0);
		end;
	end;
end;

function ReturnCard()
	count = 0;
	for i=1,14 do
		count = count + GetItemCountEx(CardTab[i]);
	end;
	if (count <= 0) then
		Say("B筺 kh玭g h� c� l謓h b礽 n祇 trong ngi!", 0);
	else
		str_format = format("L謓h b礽 c玭g th祅h 頲 thu l筰 v韎 gi� %s lng, ngi ng � tr� l筰 kh玭g?",count*ReturnCardPrice);
		Say(str_format, 2, "ta mu鑞 tr� l筰 /DealReturnCard", "Kh玭g, ta ch� h醝 ch髏 th玦/OnCancel");
	end;
end;

function DealReturnCard()
	money = 0;
	for i=1,14 do
		count = GetItemCountEx(CardTab[i]);
		if (count > 0) then
			money = money + count * ReturnCardPrice;
			for j=1,count do DelItemEx(CardTab[i]) end;
		end;
	end;
	Earn(money);
end;
--关于令牌的处理 end**************************************************

--AskDeal攻城战辅助道具 转到citywar_global\\citywar_function.lua

--了解攻城战情况 start************************************************
function GameInfo()
Say("Mu鑞 t譵 hi觰 th玭g tin th祅h th� n祇?", 9, GetCityAreaName(1).."/CityInfo", GetCityAreaName(2).."/CityInfo", GetCityAreaName(3).."/CityInfo", GetCityAreaName(4).."/CityInfo", GetCityAreaName(5).."/CityInfo", GetCityAreaName(6).."/CityInfo", GetCityAreaName(7).."/CityInfo", "Tr� v�/ArenaMain", "Kh玭g c莕 u/OnCancel");
end;

--"赛程安排/ArenaInfo", 
--"比武结果/AllArenaInfo", 
function CityInfo(nSel)
	local nCityId =  nSel + 1;
	SetTaskTemp(245, nCityId);
	if (nCityId < 1 or nCityId > 7) then 
		return
	end;
	Say(format("Mu鑞 t譵 hi觰 th玭g tin g� v� c玭g th祅h chi課 %s?",GetCityAreaName(nCityId)), 4, 
		"T譶h h譶h b竜 danh/RegisterInfo", 
		"C玭g th祅h chi課 s� /CityWarInfo", 
		"Tr� v�/GameInfo", 
		"Kh玭g c莕 u/OnCancel");
end;

function RegisterInfo()
	local nCityId = GetTaskTemp(245);
	
	if (nCityId < 1 or nCityId > 7) then 
		return
	end;
	
	local nHour = tonumber(GetLocalDate("%H"));
	if (nHour<18 or nHour>=19) then
		Say("Hi謓 t筰 kh玭g ph秈 l� th阨 gian b竜 danh c玭g th祅h chi課.", 2, "Tr� v�/GameInfo", "Kh玭g c莕 u/OnCancel");
		return 0;
	end;
	if (nCityId ~= getSigningUpCity(1) or getSignUpState(nCityId) ~= 1) then
		Say(format("Hi謓 t筰 c玭g th祅h chi課 <%s> kh玭g � giai 畂筺 b竜 danh.",GetCityAreaName(nCityId)), 2, "Tr� v�/GameInfo", "Kh玭g c莕 u/OnCancel");
		return 0;
	end;
	
	local szElector = getCityWarElector(cityid_to_lgname(nCityId))--"<暂无>"
	if (szElector == "" or szElector == nil) then
		szElector = "<T筸 th阨 kh玭g>";
	end;
Say(format("C玭g th祅h chi課 <%s> 產ng 頲 chu萵 b�, bang h閕 thi 畊a l謓h b礽 x誴 h筺g th� nh蕋 l� : %s<color=red><enter>N誹 c� bang n祇 c� s� lng l謓h b礽 b籲g v韎 bang x誴 th� 1, th� h� th鑞g s� ng蓇 nhi猲 ch鋘 ra bang c玭g th祅h cho ng祔 mai.<color>",GetCityAreaName(nCityId),szElector), 2, "Tr� v�/GameInfo", "Kh玭g c莕 u/OnCancel");
end;


function getCityWarElector(szLeagueName)
	local leagueObj = LG_GetLeagueObj(LEAGUETYPE_CITYWAR_FIRST, szLeagueName)

	if (leagueObj == 0) then
		return 
	end;
	local nMem = LG_GetMemberCount(leagueObj);
	if (nMem < 1) then
		return
	end;
	local szMem = "";
	local tbMem = {};
	for i = 0, nMem - 1 do
		szMem = LG_GetMemberInfo(leagueObj, i);
		ncount = LG_GetMemberTask(LEAGUETYPE_CITYWAR_SIGN, szLeagueName, szMem, LGTSK_QINGTONGDING_COUNT);
		if (getn(tbMem) == 0) then
			tbMem[1] = {szMem, ncount};
		else
			if (ncount == tbMem[1][2]) then
				tbMem[getn(tbMem) + 1] = {szMem, ncount};
			elseif (ncount > tbMem[1][2]) then
				tbMem = {};
				tbMem[getn(tbMem) + 1] = {szMem, ncount};
			end;
		end;
	end;
	--local szMem = LG_GetMemberInfo(leagueObj, 0)
	return tbMem[random(getn(tbMem))][1];
	--return LG_GetMemberInfo(leagueObj, 0)
end;

--赛程安排-(废弃2006-11-22)
function ArenaInfo()
	nCityId = GetTaskTemp(245);
	
	if (nCityId < 1 or nCityId > 7) then 
		return
	end;
	Say(GetArenaSchedule(nCityId), 0);
end;

function AllArenaInfo()
	nCityId = GetTaskTemp(245);
	
	if (nCityId < 1 or nCityId > 7) then 
		return
	end;
	--Say(GetArenaInfoByCity(nCityId), 0);
end;

function CityWarInfo()
	local nCityId = GetTaskTemp(245);
	
	if (nCityId < 1 or nCityId > 7) then 
		return
	end;
	local str_format = format("C玭g th祅h chi課 <%s> ng祔 mai: ",GetCityAreaName(nCityId));
	local str1, str2 = GetCityWarBothSides(nCityId);
	if (str1 ~= "" and str2 ~= "" ) then
		if (nCityId == getSigningUpCity(2)) then
			str_format = format("C玭g th祅h chi課 <%s> h玬 nay: ",GetCityAreaName(nCityId));
			if (HaveBeginWar(nCityId) == 1) then 
				str_format = format("Trc m総 <%s> 產ng � giai 畂筺 c玭g th祅h chi課: ",GetCityAreaName(nCityId));
			end;
		end;
		str_format = format("Phe th� %s l� %s, phe c玭g l� %s!",str_format,str2,str1);
		Say(str_format , 2, "Tr� v�/GameInfo", "Kh玭g c莕 u/OnCancel");
	else
		Say(format("Trc m総 %s ch璦 bc v祇 giai 畂筺 c玭g th祅h chi課!",GetCityAreaName(nCityId)) , 2, "Tr� v�/GameInfo", "Kh玭g c莕 u/OnCancel");
	end;
end;


--了解攻城战情况 end**************************************************

--领取攻城信物 start**************************************************
	function checkIsTakeQingtongDing(szTongName, nTongID, nCityId)
		if (nTongID == 0 or GetTongMaster()~= GetName()) then
			Say("Ch� c� bang ch� bang b竜 danh c玭g th祅h v� bang th蕋 b筰 trong cu閏 thi th� l謓h b礽 m韎 c� th� nh薾 l筰 t輓 v藅.", 0);
			return 0;
		end;
		if (nCityId < 1 or nCityId > 7) then
			return 0;
		end;
		
		local nHour = tonumber(GetLocalDate("%H"));
		if (nHour < 19) then
			Say("Th阨 gian nh薾 l筰 t輓 v藅 c玭g th祅h chi課  h誸, trong kho秐g th阨 gian t� 19h00 n 24h00 m鏸 ng祔, bang h閕 tranh 畊a l謓h b礽 th蕋 b筰 c� th� n ch� ta  nh薾 l筰 khi猽 chi課 l謓h.", 0)
			return 0;
		end;
		
		if (getSignUpState(nCityId) == 1) then
			Say(format("B竜 danh tham gia tranh 畊a l謓h b礽 th祅h %s cho ng祔 mai v蒼 ch璦 k誸 th骳, h穣 ti誴 t鬰 tham gia.",GetCityAreaName(nCityId)), 0);
			return 0;
		end;
		
		local szChallenger = GetCityWarBothSides(nCityId);
		if (szChallenger == szTongName) then
			Say(format("Qu� bang  tr� th祅h bang c玭g th祅h %s v祇 ng祔 mai, t輓 v藅 c玭g th祅h ta  giao l筰 cho th竔 th� r錳.",GetCityAreaName(nCityId)), 0);
			return 0;
		end;
		
		local szChallenger = GetCityOwner(nCityId);
		if (szChallenger == szTongName) then
			Say(format("Ngi  l� th竔 th� th祅h %s, kh玭g c莕 ph秈 nh薾 t輓 v藅 c玭g th祅h n鱝.",GetCityAreaName(nCityId)), 0);
			return 0;
		end;
		
		local nlid = LG_GetLeagueObjByRole(LEAGUETYPE_CITYWAR_SIGN, szTongName);
		if (FALSE(nlid)) then
			Say("Ch璦 b竜 danh tham gia c玭g th祅h chi課 ng祔 mai, � y kh玭g c� t輓 v藅 c馻 ngi.", 0);
			return 0;
		end;
		return 1;
	end;
	
	function getSignUpState(nCityId)
		return LG_GetLeagueTask(LEAGUETYPE_CITYWAR_SIGN, cityid_to_lgname(nCityId), 1);
	end;
	
function TakeQingtongDing()
	local szTongName, nTongID = GetTongName();
	local nCityId = getSigningUpCity(1);
	if (checkIsTakeQingtongDing(szTongName, nTongID, nCityId) ~= 1) then
		return 0
	end;
	local ncount = LG_GetMemberTask(LEAGUETYPE_CITYWAR_SIGN, cityid_to_lgname(nCityId), szTongName, LGTSK_QINGTONGDING_COUNT);
	
	if (ncount < 1) then
		Say("T輓 v藅 b竜 danh c玭g th祅h ta  tr� l筰 h誸 cho ngi r錳.", 0);
	else
		Say(format("Ngi c� %s khi猽 chi課 l謓h, h穣 s緋 x誴 l筰 h祅h trang trc khi nh薾 l筰 l謓h b礽.",ncount), 3, "Ta mu鑞 nh薾 l穘h/#sure_takeQingtongDing("..ncount..")", "Tr� v�/ArenaMain", "L竧 n鱝 quay l筰 /OnCancel");
	end;
end;

function sure_takeQingtongDing(ncount)
	local szTongName, nTongID = GetTongName();
	local nCityId = getSigningUpCity(1);
	if (checkIsTakeQingtongDing(szTongName, nTongID, nCityId) == 1) then
		local nFree = CalcFreeItemCellCount();
		if (nFree > 6) then
			local szMsg = format("Зy l� <color=yellow>%s<color> khi猽 chi課 l謓h c馻 ngi.",ncount);
			if (nFree < ncount) then
				szMsg = format("Ngi c� <color=yellow>%s<color> khi猽 chi課 l謓h, v� h祅h trang kh玭g , ta tr� l筰 trc %s c竔. V蒼 c遪 <color=yellow>%s<color> c竔 ch璦 nh薾, h穣 nh薾 trc 24h00 ng祔 h玬 nay!",ncount,nFree,(ncount - nFree));
				ncount = nFree;
			end;
			for i =1, ncount do
				AddItem(nCityWar_Item_ID_G,nCityWar_Item_ID_D,nCityWar_Item_ID_P,1,1,1);--qingtongding
			end;
			LG_ApplyAppendMemberTask(LEAGUETYPE_CITYWAR_SIGN, cityid_to_lgname(nCityId), szTongName, LGTSK_QINGTONGDING_COUNT, -nFree);
			WriteLog(format("[Tranh 畊a c玭g th祅h chi課]%s Name:%s Account:%s Tong:%s Th祅h th�: %s Nh薾 l筰 khi猽 chi課 l謓h %s",date(),GetName(),GetAccount(),szTongName,cityid_to_lgname(nCityId),ncount));
			Say(szMsg, 0);
		else
			Say("H祅h trang kh玭g  ch� tr鑞g. Ch� � l� trc 24h00 ph秈 n nh薾 l筰 t輓 v藅, n誹 kh玭g s� kh玭g th� nh薾 l筰 n鱝.", 0);
		end;
	end;
end;

--领取攻城信物 end****************************************************

--报名攻城战 start****************************************************
function SignUpCityWar()
	local nCityId = getSigningUpCity(1);
	
	local szTongName, nTongID = GetTongName();
	
	if (checkSignUpCityWar(szTongName, nTongID, nCityId) ~= 1) then
		return 0;
	end;
	
	local szMsg = format("<dec>Hi謓 t筰 產ng ti課 h祅h b竜 danh th祅h %s.",GetCityAreaName(nCityId));
	local szElector = getCityWarElector(cityid_to_lgname(nCityId))--"<暂无>"
	
	if (szElector == "" or szElector == nil) then
		szElector = "<T筸 th阨 kh玭g>";
	end;

	local nlid = LG_GetLeagueObjByRole(LEAGUETYPE_CITYWAR_SIGN, szTongName);
	
	if (FALSE(nlid)) then
		szMsg = szMsg.."Ch� c莕 c� 'Khi猽 chi課 l謓h' th� c� th� tham gia tranh 畊a. Qui t綾 tranh 畊a: Bang h閕 ch璦 chi誱 th祅h c蕄 18 tr� l猲 c� th� s� d鬾g 'Khi猽 chi課 l謓h'  tham gia tranh 畊a. Th阨 gian tranh 畊a l� 18h00 n 19h00 m鏸 ng祔. Trc 19h00, bang h閕 n祇 t v祇 s� lng khi猽 chi課 l謓h nhi襲 nh蕋 s� nh薾 頲 quy襫 c玭g th祅h chi課 ng祔 mai.<color=red><enter>N誹 c� bang h閕 c� c飊g s� l謓h b礽 v韎 bang x誴 th� 1 th� h� th鑞g s� ng蓇 nhi猲 ch鋘 ra m閠 bang c玭g th祅h cho ng祔 mai.<color><enter>Bang h閕 hi謓 t筰 x誴 th� 1 l�: "..szElector
	else
		
		local nCount = LG_GetMemberTask(LEAGUETYPE_CITYWAR_SIGN, cityid_to_lgname(nCityId), szTongName, LGTSK_QINGTONGDING_COUNT);
		
		--print(LEAGUETYPE_CITYWAR_SIGN, cityid_to_lgname(nCityId), szTongName, LGTSK_QINGTONGDING_COUNT)
		szMsg = format("%sQui t綾 tranh 畊a : Bang h閕 ch璦 chi誱 th祅h c蕄 18 tr� l猲 c� th� s� d鬾g 'Khi猽 chi課 l謓h'  tham gia tranh 畊a. Th阨 gian tranh 畊a l� 18h00 n 19h00 m鏸 ng祔. Trc 19h00, bang h閕 n祇 t v祇 s� lng khi猽 chi課 l謓h nhi襲 nh蕋 s� nh薾 頲 quy襫 c玭g th祅h chi課 ng祔 mai.<color=red><enter>N誹 c� bang h閕 c� c飊g s� l謓h b礽 v韎 bang x誴 th� 1 th� h� th鑞g s� ng蓇 nhi猲 ch鋘 ra m閠 bang c玭g th祅h cho ng祔 mai.<color><enter>Bang h閕 hi謓 t筰 x誴 th� 1 l�: %s<enter>S� lng khi猽 chi課 l謓h tranh 畊a %s c馻 qu� bang l�: %s",szMsg,szElector,szTongName,nCount)
	end;
	TaskSayList(szMsg, "Ta mu鑞 tranh 畊a l謓h b礽/want_signupcitywar", "Tr� v�/ArenaMain", "в ta suy ngh� l筰/OnCancel");
end;

function want_signupcitywar()
	--local nCityId = getSigningUpCity(1);
	local szTongName, nTongID = GetTongName();
	--local nlid = LG_GetLeagueObjByRole(LEAGUETYPE_CITYWAR_SIGN, szTongName);
	
	
	local nCurCount = LG_GetMemberTask(TIAOZHANLING_LGTYPE,TIAOZHANLING_LGName,szTongName,LGTSK_TIAOZHANLING_COUNT)
	if nCurCount <= 0 then
		Say("Qu� bang kh玭g c� khi猽 chi課 l謓h, kh玭g th� giao n閜, h穣 thu th藀 khi猽 chi課 l謓h r錳 h穣 n t譵 ta.",0)
		return 0
	end
	if nCurCount > 1000000 then
		nCurCount = 1000000
	end
	AskClientForNumber("sure_signupcitywar", 0,nCurCount,"Giao n閜 khi猽 chi課 l謓h")
	--if (FALSE(nlid)) then
		--if (GetCash() >= 10000000) then
			--GiveItemUI("攻城战信物", "请将攻城战信物——挑战令放进去吧。", "sure_signupcitywar", "OnCancel");
		--else
			--Say("第一次报名攻城战需要较纳<color=yellow>1000W两<color>银子，你身上没有带这么多钱。你先准备好报名费再来吧。", 0);
		--end;
	--else
		--local nNum = LG_GetMemberTask(LEAGUETYPE_CITYWAR_SIGN, cityid_to_lgname(nCityId), szTongName,LGTSK_CITYWAR_SIGNCOUNT);
		--if (nNum >= 3) then
			--Say("您的竞投次数已经达到<color=yellow>3次<color>，您现在不能继续投注，请您等待竞投结果的公布。", 0);
		--else
			--GiveItemUI("攻城战信物", "每个挑战令可以换取5万点经验，挑战令可用来报名帮会攻城战。", "sure_signupcitywar", "OnCancel");
		--end;
	--end;
end;

function sure_signupcitywar(nCount)
	--Msg2Player(nCount)
	
	local nCityId = getSigningUpCity(1);--GetArenaTargetCity()
	if not (tonumber(GetLocalDate("%H"))>= 18 and tonumber(GetLocalDate("%H")) < 19 and getSignUpState(nCityId) == 1) then
		Talk(1, "", "Hi謓 t筰 kh玭g ph秈 l� th阨 gian b竜 danh c玭g th祅h chi課.")
		return 1
	end
	
	
	
	
	local szTongName, nTongID = GetTongName();
	local nTongCurCount = LG_GetMemberTask(TIAOZHANLING_LGTYPE,TIAOZHANLING_LGName,szTongName,LGTSK_TIAOZHANLING_COUNT)
	if nCount > nTongCurCount or nCount > 1000000 then
		Say("Khi猽 chi課 l謓h kh玭g , kh玭g th� giao n閜, xin h穣 thu th藀 ti誴 r錳 quay l筰.",0)
		return 1
	end
	local nCityId = getSigningUpCity(1);
	local nlg = LG_GetLeagueObj(LEAGUETYPE_CITYWAR_SIGN, cityid_to_lgname(nCityId));
	local nlid = LG_GetLeagueObjByRole(LEAGUETYPE_CITYWAR_SIGN, szTongName);
	if (FALSE(nlid)) then
			local nMemberID = LGM_CreateMemberObj() -- 生成社团成员数据对象(返回对象ID)
			--设置社团成员的信息(角色名、职位、社团类型、社团名称)
			LGM_SetMemberInfo(nMemberID, szTongName, 0, LEAGUETYPE_CITYWAR_SIGN, cityid_to_lgname(nCityId));
			LG_AddMemberToObj(nlg, nMemberID);
			local ret = LGM_ApplyAddMember(nMemberID, "", "")
			LGM_FreeMemberObj(nMemberID)
	end;

	--LG_ApplyAppendMemberTask(LEAGUETYPE_CITYWAR_SIGN, cityid_to_lgname(nCityId), szTongName, LGTSK_CITYWAR_SIGNCOUNT, 1, "", "")
	
	local nCurCount = LG_GetMemberTask(LEAGUETYPE_CITYWAR_SIGN, cityid_to_lgname(nCityId), szTongName, LGTSK_QINGTONGDING_COUNT);
	
	--LG_ApplyAppendMemberTask(LEAGUETYPE_CITYWAR_SIGN, cityid_to_lgname(nCityId), szTongName, LGTSK_QINGTONGDING_COUNT, nCount, "", "");
	--print(LEAGUETYPE_CITYWAR_SIGN, cityid_to_lgname(nCityId), szTongName, LGTSK_QINGTONGDING_COUNT, nCount)
	citywar_tbLadder:AddOneInGameServer(nTongID, cityid_to_lgname(nCityId), szTongName, nCount)
	
	
	LG_ApplyAppendMemberTask(TIAOZHANLING_LGTYPE,TIAOZHANLING_LGName, szTongName, LGTSK_TIAOZHANLING_COUNT, -nCount, "", "");
	
	WriteLog(format("[Tranh 畊a c玭g th祅h chi課]%s Name:%s Account:%s TongName:%s Th祅h th�: %s S� lng tranh 畊a c玭g th祅h: %s",date(),GetName(),GetAccount(),szTongName,cityid_to_lgname(nCityId),(nCount + nCurCount)));
	
	local szFirstTong = checkFirstSignUpChallenger(cityid_to_lgname(nCityId), szTongName, nCount + nCurCount);
	if (szFirstTong == szTongName) then
		Say(format("S� lng khi猽 chi課 l謓h bang %s hi謓 t筰 l�: <color=yellow>%s<color> c竔, t筸 th阨 x誴 th� 1, tuy nhi猲, h穣 lu玭 theo d鈏 t譶h h譶h bi課 ng.",szTongName,(nCount + nCurCount)), 0);
	else
		Say(format("S� lng khi猽 chi課 l謓h bang %s hi謓 t筰 l�: <color=yellow>%s<color> c竔. Bang h閕 x誴 th� 1 l� %s, qu� bang h穣 ti誴 t鬰 n� l鵦.",szTongName,(nCount + nCurCount),szFirstTong), 0);
	end;
end;

function checkSignUpCityWar(szTongName, nTongID, nCityId)
	local nHour = tonumber(GetLocalDate("%H"));
	if (nTongID == 0 or GetTongMaster() ~= GetName()) then
		Say("Ngi kh玭g ph秈 l� bang ch�. Trong kho秐g th阨 gian t� 18h00 n 19h00, bang ch� bang h閕 ch璦 chi誱 th祅h c蕄 18 tr� l猲 c� th� n b竜 danh tham gia c玭g th祅h chi課 cho ng祔 h玬 sau.", 0);
	elseif (nHour < 18 or nHour >= 19) then
		Say("Hi謓 t筰 kh玭g ph秈 l� th阨 gian b竜 danh c玭g th祅h chi課. M鏸 ng祔 t� 18h00 n 19h00, bang h閕 ch璦 chi誱 th祅h c蕄 18 tr� l猲 c� th� n y b竜 danh tham gia c玭g th祅h chi課 cho ng祔 h玬 sau.", 0);
	elseif (TONG_GetExpLevel(nTongID) < 18) then
		Say("нi h醝 ng c蕄 bang h閕 t c蕄 18 tr� l猲 m韎 c� th� b竜 danh c玭g th祅h chi課 cho ng祔 h玬 sau.", 0);
	elseif (checkCityOwner(szTongName) ~= 0) then
		Say("Ngi  l� ch� th祅h, kh玭g c莕 ph秈 b竜 danh c玭g th祅h.", 0);
	elseif (checkCItyChallenger(szTongName) ~= 0) then
			Say(format("Ngi  l� phe khi猽 chi課 %s, kh玭g th� tranh 畊a l謓h b礽 trong ng祔 h玬 nay.",GetCityAreaName(checkCItyChallenger(szTongName))), 0);
	elseif (getSignUpState(nCityId) ~= 1) then
		Say("Hi謓 t筰 b竜 danh c玭g th祅h v蒼 ch璦 b総 u, h穣 chu萵 b� tinh th莕 s絥 s祅g", 0);
	else
		return 1;
	end;
	return 0;
end;

function checkCityOwner(szTongName)
	for i=1, 7 do
		if (GetCityOwner(i) == szTongName) then
			return i;
		end;
	end;
	return 0;
end;

function checkCItyChallenger(szTongName)
	for i=1, 7 do
		if (GetCityWarBothSides(i) == szTongName) then
			return i;
		end;
	end;
	return 0;
end;

function checkFirstSignUpChallenger(szLeagueName, szTongName, nCurCount)
	local szFirstTong = getCityWarElector(szLeagueName)
	local nlid = LG_GetLeagueObj(LEAGUETYPE_CITYWAR_FIRST, szLeagueName)
	
	if (FALSE(szFirstTong)) then
		local nMemberID = LGM_CreateMemberObj() -- 生成社团成员数据对象(返回对象ID)
		--设置社团成员的信息(角色名、职位、社团类型、社团名称)
		LGM_SetMemberInfo(nMemberID, szTongName, 0, LEAGUETYPE_CITYWAR_FIRST, szLeagueName);
		LG_AddMemberToObj(nlid, nMemberID);
		local ret = LGM_ApplyAddMember(nMemberID, "", "") ;
		
		LGM_FreeMemberObj(nMemberID);
		if (ret == 1) then
			LG_ApplyAppendMemberTask(LEAGUETYPE_CITYWAR_FIRST, szLeagueName, szTongName, LGTSK_QINGTONGDING_COUNT, nCurCount);
		end;
		return szTongName;
	end;
	
	nlid = LG_GetLeagueObj(LEAGUETYPE_CITYWAR_SIGN, szLeagueName);
	local nCount = LG_GetMemberCount(nlid);
	local szTemTong = szFirstTong;
	for i = 0, nCount - 1 do
		local szMem = LG_GetMemberInfo(nlid, i);
		if (szMem == szFirstTong) then
			local nMemCount = LG_GetMemberTask(LEAGUETYPE_CITYWAR_SIGN, szLeagueName, szMem, LGTSK_QINGTONGDING_COUNT);
			
			if (nMemCount <= nCurCount) then
				szTemTong = szTongName;
				break
			end;
		end;
	end;
	
	nlid = LG_GetLeagueObj(LEAGUETYPE_CITYWAR_FIRST, szLeagueName);
	if (szTemTong ~= szFirstTong) then
		local nMemberID = LGM_CreateMemberObj() -- 生成社团成员数据对象(返回对象ID)
		--设置社团成员的信息(角色名、职位、社团类型、社团名称)
		LGM_SetMemberInfo(nMemberID, szTemTong, 0, LEAGUETYPE_CITYWAR_FIRST, szLeagueName);
		LG_AddMemberToObj(nlid, nMemberID);
		local ret = LGM_ApplyAddMember(nMemberID, "", "") ;
		LGM_FreeMemberObj(nMemberID);
		--LG_ApplyDoScript(LEAGUETYPE_CITYWAR_FIRST, szLeagueName, szFirstTong, "\\script\\event\\citywar.lua", "citywar_removemem", szLeagueName.." "..szFirstTong);
		--LGM_ApplyRemoveMember(LEAGUETYPE_CITYWAR_FIRST, szLeagueName, szFirstTong);
	end;
	return getCityWarElector(szLeagueName);
end;
--报名攻城战 end******************************************************

