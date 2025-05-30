IncludeLib("LEAGUE")
IncludeLib("TITLE")
Include("\\script\\lib\\gb_modulefuncs.lua");
TASK_ACTIVE_TITLE = 1122
CW_TITLE_TIME = 7*24*60*60*18;
TB_CITYWAR_ARRANGE = {
				{3,4},--凤翔
				{1,2},--成都
				{2,3},--大理
				{5,6},--汴京
				{4,5},--襄阳
				{0,1},--扬州
				{6,0},--临安
			}
			
-----购买攻城战道具 start
function AskDeal()
	Say("D鬾g c� h� tr� c玭g th祅h chi課 c鵦 k� hi謚 d鬾g, ch� c� th� d飊g Nguy猲 b秓  mua! Kh竎h quan n誹 b� l� kh玭g mua th� th藅 v� c飊g ng ti誧!", 4, 
	--"浑石裂/DealBuy", 
	"Nghi謙 Long Xung Xa/#DealBuy(1)", 
	"V﹏ K� Binh ph� /#DealBuy(2)", 
	"Ngoan C� Binh ph� /#DealBuy(3)", 
	"Kh玭g c莕 u/OnCancelBuy");
end;

function DealBuy(ItemID)
	if (ItemID == 0) then
		SetTaskTemp(15, 29);
	elseif (ItemID == 1) then
		SetTaskTemp(15, 30);
	elseif (ItemID == 2) then
		SetTaskTemp(15, 31);
	elseif (ItemID == 3) then
		SetTaskTemp(15, 32);
	else
		return
	end;
	Say("Do qu� nhi襲 ngi mua! Kh竎h quan ch� c� th� mua m閠 l莕 m� th玦!C� ng � kh玭g?", 2, "Mu鑞/DoBuy", "ta ngh� l筰 xem /OnCancelBuy");
end;

function DoBuy()
	TheItem = GetTaskTemp(15);
	if (TheItem >= 29 and TheItem <= 32) then
		if (GetItemCountEx(343) > 0) then
			DelItemEx(343);
			AddItem(6,1,TheItem,1,0,0);
			WriteLog(format("%s d飊g kim nguy猲 b秓 343  mua 1 o c� c玭g th祅h >> %s",GetName(),TheItem));
			Say("Kh竎h quan th藅 bi誸 xem h祅g!", 0);
		else
			Say("Kh竎h quan 產ng tr猽 ch鋍 ti觰 nh﹏ hay th藅 s� kh玭g c� Nguy猲 B秓?", 0);
		end;
	end;
end;
function OnCancelBuy()
	Say("Ch骳 ngh躠 s� k� khai c th緉g, s韒 ca kh骳 kh秈 ho祅!", 0);
end;
-----购买攻城战道具 end

--获得到7天后 20:00分 的时间祯
function getUsedLine()
	local nh = tonumber(GetLocalDate("%H"));
	local nm = tonumber(GetLocalDate("%M"));
	return (CW_TITLE_TIME-((nh-20)*60+nm)*60*18);
end;

--获得当前报名攻城战的城市
--nSel=1,报名；nSel=2,攻城
function getSigningUpCity(nSel)
	local nWeek = tonumber(GetLocalDate("%w"));
	for i = 1, getn(TB_CITYWAR_ARRANGE)do
		if (TB_CITYWAR_ARRANGE[i][nSel] == nWeek) then
			return i;
		end;
	end;
end;

-- 检查领奖条件
function check_award_condition(city_index, show_talk)
	if (city_index == 0) then
		if (show_talk == 1) then
			Talk(1, "", "<#> Ch� c� bang ph竔 chi誱 頲 th祅h th� m韎 nh薾 頲 ph莕 thng, h穣 d蒼 anh em c馻 m譶h 甶 chi誱 m閠 th祅h n祇 甶!")
		end
		return 0
	end
	
	--local tong_master = GetTongMaster()
	--local player_name = GetName()
	--if (tong_master ~= player_name) then
--		if (show_talk == 1) then
	--		Talk(1, "", "<#>只有帮主才能领取帮会奖励，叫你们帮主来吧")
		--end
		--return 0
	--end
	
	local wday = tonumber(GetLocalDate("%w"))	-- 今天是星期几？
	local hour = tonumber(GetLocalDate("%H"))
	if (wday ~= 1 or hour < 9 or hour >= 20) then
		if (show_talk == 1) then
			Talk(1, "", "<#> M鏸 tu莕 t� 9:00~20:00 l� th阨 gian l穘h thng, n gi�  t韎 甶")
		end
		return 0
	end

	local ndate = tonumber(GetLocalDate("%Y%m%d"))
	if (ndate == get_citybonus_task(city_index, CITYINFO_LEAGUETASK_BONUS)) then
		if (get_city_orecount(city_index) <= get_citybonus_task(city_index, CITYINFO_LEAGUETASK_COUNT)) then
			if (show_talk == 1) then
				Talk(1, "", "<#>Ph莕 thng tu莕 n祔  nh薾 h誸, tu莕 sau h穣 n nh�.")
			end
			return 0
		end;
	else
		set_citybonus_task(city_index, CITYINFO_LEAGUETASK_BONUS, ndate);
		set_citybonus_task(city_index, CITYINFO_LEAGUETASK_COUNT, 0);
	end

	return 1
end

TSK_CITYTONG_DATE = 2518
-- 领取占城帮会奖励
function talk_citytong_award()
	local city_index = gettongownercity()
	if (check_award_condition(city_index, 1) == 1) then
		Say("<#>Ph莕 thng bang chi誱 th祅h. Th祅h vi猲 bang chi誱 th祅h c� th� 甶 t譵 V� l﹎ truy襫 nh﹏  nh薾 ph莕 thng huy襫 tinh c蕄 5, m鏸 ngi c� th� nh薾 1 vi猲. Gi韎 h筺: Й Th祅h (L﹎ An v� Bi謓 Kinh) nh薾 300 vi猲 c蕄 5, Th祅h Th� (nh鱪g th祅h th� kh竎) nh薾 200 vi猲 huy襫 tinh c蕄 5. N誹 sau 18h00 v蒼 ch璦 nh薾 h誸 th� bang ch� trc 20h00 c� th� nh薾 s� c遪 l筰.",
			3,
			"<#>Ta mu鑞 nh薾 huy襫 tinh kho竛g th筩h/#take_tong_award(1)",
			"<#>Ta l� bang ch�, n  nh薾 ph莕 thng c遪 l筰/take_tong_resaward",
			"<#> T筸 th阨 ta kh玭g l穘h u/nothing")
	end
end

-- 领取红包
function take_tong_award(count)
	-- 一个红包占一个格子
	if (CalcFreeItemCellCount() < count) then
		Talk(1, "", "<#> H祅h trang c馻 ngi  y, ch豱h l� l筰 xong m韎 n l穘h thng.")
		return
	end
	
	local city_index = gettongownercity()
	if (check_award_condition(city_index, 0) == 0) then
		return
	end
	
	local nH = tonumber(GetLocalDate("%H"));
	if (nH >= 18) then
		Talk(1, "", "<#>Th阨 gian nh薾 thng c馻 m鏸 bang h閕 t� 9h00 n 18h00, h穣 n ng gi� n祔  nh薾 thng. цi v韎 ph莕 thng ch璦 頲 nh薾, h穣 th玭g b竜 cho bang ch� n nh薾 trc 20h00.");
		return 0;
	end;
	local today = tonumber(GetLocalDate("%Y%m%d"));
	local nMydate = GetTask(TSK_CITYTONG_DATE);
	if (nMydate ~= today) then
		AddItem(6,1,147,5,1,1);
		SetTask(TSK_CITYTONG_DATE, today);
		add_citybonus_task(city_index, CITYINFO_LEAGUETASK_COUNT, 1);
	local msg =	format("%s %s (%s) nh薾 %s huy襫 tinh c蕄 5 t� Kim s琻 chng m玭 nh﹏",GetLocalDate("[%y-%m-%d %H:%M] "),GetAccount(),GetName(),count)
		WriteLog(msg);
		Talk(1, "", "<#>Зy l� ph莕 thng c馻 ngi, h穣 nh薾 l蕐.")
	else
		Talk(1, "", "<#>Ngi  nh薾 ph莕 thng tu莕 n祔 r錳, i tu莕 sau nh�?");
	end
end

function take_tong_resaward()
	local city_index = gettongownercity()
	if (check_award_condition(city_index, 0) == 0) then
		return
	end
	
	local nH = tonumber(GetLocalDate("%H"));
	if (nH < 18 or nH >= 20) then
		Talk(1, "", "<#>Bang ch� v祇 m鏸 th� hai c� th� n nh薾 ph莕 thng c遪 l筰 trc 18h00 n 20h00, h穣 n ng gi�  nh薾.");
		return 0;
	end;
	
	if (GetName() ~= GetTongMaster()) then
		Talk(1, "", "<#>Ch� c� bang ch� m韎 c� th� nh薾 ph莕 thng bang h閕 c遪 l筰. H穣 th玭g b竜 cho bang ch� qu� bang n y nh薾 trc 20h00.");
		return 0;
	end;
	
	local nFreecell = CalcFreeItemCellCount();
	if (nFreecell < 20) then
		Talk(1, "", "<#>H祅h trang kh玭g  ch� tr鑞g, h穣 s緋 x誴 l筰 h祅h trang.")
		return 0;
	end;
	
	local nCount = get_city_orecount(city_index) - get_citybonus_task(city_index, CITYINFO_LEAGUETASK_COUNT);
	
	for i = 1, nCount do
		AddItem(6,1,147,5,1,1);
	end;
	add_citybonus_task(city_index, CITYINFO_LEAGUETASK_COUNT, nCount);
	local msg =	format("%s %s (%s) nh薾 %s huy襫 tinh c蕄 5 t� Kim s琻 chng m玭 nh﹏",GetLocalDate("[%y-%m-%d %H:%M] "),GetAccount(),GetName(),count)
	WriteLog(msg);
	Say(format("Зy l� ph莕 thng c馻 qu� bang, %s vi猲 huy襫 tinh c遪 l筰!",nCount), 0);
end;

function get_city_orecount(cityid)
	if (cityid == 4 or cityid == 7) then
		return 300;
	else
		return 200;
	end;
end;
--------------------------------------------------------------------------------
--得到一个玩家所在帮会占领的城市,返回索引值
function gettongownercity()
	--得到玩家帮会名称
	local strTongName = GetTongName()
	if (strTongName == nil or strTongName == "") then
		return 0
	end

	--分别得到七大城市的帮会名称与玩家帮会名称对比
	local strCityTongName

	for nCityID=1, 7 do
		strCityTongName = GetCityOwner(nCityID)
		if (strCityTongName ~= "" and strCityTongName == strTongName) then 
			return nCityID
		end
	end
	
	--表示玩家所在的帮会没有占领城市
	return 0
end

--如果为nil或0，返回1，否则返回0
function FALSE(nValue)
	if (nValue == nil or nValue == 0 or nValue == "") then
		return 1
	else
		return nil
	end
end

LEAGUETYPE_CITYWAR_SIGN = 508;
LEAGUETYPE_CITYWAR_FIRST = 509;
function checkCityWarLeague()
	for i = 1, 7 do
		local szLg = cityid_to_lgname(i);
		local nlid = LG_GetLeagueObj(LEAGUETYPE_CITYWAR_SIGN, szLg);
		if (FALSE(nlid)) then
			local nNewLeagueID = LG_CreateLeagueObj()	--生成社团数据对象(返回对象ID)
			LG_SetLeagueInfo(nNewLeagueID, LEAGUETYPE_CITYWAR_SIGN, szLg)	--设置社团信息(类型、名称)
			local ret = LG_ApplyAddLeague(nNewLeagueID, "", "");
			LG_FreeLeagueObj(nNewLeagueID);
		end;
		
		nlid = LG_GetLeagueObj(LEAGUETYPE_CITYWAR_FIRST, szLg);
		if (FALSE(nlid)) then
			local nNewLeagueID = LG_CreateLeagueObj()	--生成社团数据对象(返回对象ID)
			LG_SetLeagueInfo(nNewLeagueID, LEAGUETYPE_CITYWAR_FIRST, szLg)	--设置社团信息(类型、名称)
			local ret = LG_ApplyAddLeague(nNewLeagueID, "", "");
			LG_FreeLeagueObj(nNewLeagueID);
		end;
	end;
end;

function cityid_to_lgname(nCityID)
	return GetCityAreaName(nCityID);
end;

--仅在一台服务器上执行即可
--所以，判断有华山的地图

--Relay执行设置 攻城方
function citywar_appointchallenger(szCityName, szTongName)
	if (SubWorldID2Idx(2) >= 0 and not FALSE(szCityName) and not FALSE(szTongName)) then
		AppointChallenger(szCityName, szTongName)
	end;
end;

--Relay执行设置 城主
function citywar_appointviceroy(szCityName, szTongName)
	if (SubWorldID2Idx(2) >= 0 and not FALSE(szCityName) and not FALSE(szTongName)) then
		AppointViceroy(szCityName, szTongName)
	end;
end;
