-- 江南区 桃花岛 路人_桃花隐士.lua
-- by: Dan_deng(2004-05-15)
-- 卖挂机药，查询时间，为洗点做合法性检查

Include("\\script\\global\\timerhead.lua")
Include("\\script\\missions\\autohang\\function.lua")
Include("\\script\\config\\cfg_features.lua")

function main()
	--Uworld137 = GetTask(137)
	--if (Uworld137 == 0) then						-- 第一次对话，需要检测技能更新
	--	if (check_faction() < 20) then			-- 需要更新其技能
	--		Talk(1,"","桃花隐士：相见即是有缘，既然来到桃花岛，先去见过你本门的长辈吧。说不定他们一高兴指点你两招就受用无用了哈。")
	--	else												-- 不需更新，直接跳过
	--		Talk(1,"","桃花隐士：欢迎一定来到桃花岛，看你气宇不凡，定是年轻有为的小朋友。")
	--	end
	-- elseif (Uworld137 < 20) then					-- 没有去更新技能的，不允许买挂机药
	--	Talk(1,"","桃花隐士：快去拜见你的本门长辈吧，我喜欢懂礼貌的好孩子。")
	--elseif (GetLevel() >= 50) then		-- 买挂机道具也要检测合法性
		-- Say("桃花隐士：桃花岛充满着灵气，是练功的宝地。喝碗<color=red>腊八粥<color>，轻轻松松功力自动提升！一碗可维持功效一小时。",3,"好，我喝/buy_yes","请问一下腊八粥功效还有多少时间/check_time","下次再说吧/OnCancel")
	--end
	
	strNeedLevel = "Уo Hoa Фo v� c竎h tuy謙 v韎 th� gi韎 b猲 ngo礽, 阯g 甶 nguy hi觤, kh玭g n<color=red> "..AEXP_NEEDLEVEL.."c蕄<color> m� mu鑞 v祇 y? V� luy謓 c玭g th猰 甶!";
	-- 免费双经验
	if (AEXP_IsFreeTimeDoubleExp() == 1) then-- 免费双经验日子
		nLevel = GetLevel();	
		if (nLevel < AEXP_NEEDLEVEL) then
			Say(strNeedLevel, 0);
		else
			Say("Hi謓 nay Уo Hoa o linh kh� r蕋 m筺h, l骳 n祔 luy謓 c玭g kh玭g c莕 ph秈 d飊g n ch竜 L筽 B竧. Nh鱪g b竧 ch竜  u鑞g c騨g s� kh玭g b� tr� th阨 gian. H玬 nay qu� l� m閠 ng祔 p tr阨. L穙 phu y c騨g c秏 th蕐 tinh th莕 ph蕁 ch蕁. Л頲 r錳! Чi hi謕 kh玭g c莕 t鑞 ng﹏ lng! C� h閕 hi誱 c�, h穣 tranh th� luy謓 c玭g 甶 nh�!", 0);
		end
		
		return 1;		
	end
	
	nLevel = GetLevel();	
	if (nLevel < AEXP_NEEDLEVEL) then
		Say(strNeedLevel, 0);
	else
		local tbSay = {}
		tinsert(tbSay,"Л頲! ta u鑞g! /buy_yes")
		tinsert(tbSay,"Xin h醝: Th� ch竜 n祔, u鑞g v祇 bao l﹗ sau m韎 c� c玭g hi謚? /check_time")
		if CFG_HONNGUYENLINHLO == 1 then
			tinsert(tbSay,"Ta mu鑞 ch� t筼 H鏽 Nguy猲 Linh L�/refine")
		end
		tinsert(tbSay,"L莕 sau s� n鉯 ti誴 /OnCancel")
		Say("Уo Hoa o linh kh� sung m穘. U鑞g th猰 b竧 <color=red>ch竜 L筽 B竧<color> sc玭g l鵦 s� t╪g l猲 r蕋 nhi襲. M鏸 b竧 c� c玭g hi謚 trong 1 gi�!",getn(tbSay),tbSay)
	end
end

-- 炼制混元灵露
function refine()
	DynamicExecute("\\script\\global\\jingli.lua", "dlg_entrance", PlayerIndex)
end

function check_faction()
	if (GetTask(3) >= 10*256) and (GetTask(3) ~= 75*256) then			-- 天王或此门派出师
		SetTask(137,3)
		return 3
	elseif (GetTask(7) >= 10*256) and (GetTask(7) ~= 75*256) then		-- 少林或此门派出师
		SetTask(137,7)
		return 7
	elseif (GetTask(2) >= 10*256) and (GetTask(2) ~= 75*256) then		-- 唐门或此门派出师
		SetTask(137,2)
		return 2
	elseif (GetTask(10) >= 10*256) and (GetTask(10) ~= 75*256) then	-- 五毒或此门派出师
		SetTask(137,10)
		return 10
	elseif (GetTask(1) >= 10*256) and (GetTask(1) ~= 75*256) then		-- 峨嵋或此门派出师
		SetTask(137,1)
		return 1
	elseif (GetTask(6) >= 10*256) and (GetTask(6) ~= 75*256) then		-- 翠烟或此门派出师
		SetTask(137,6)
		return 6
	elseif (GetTask(4) >= 10*256) and (GetTask(4) ~= 75*256) then		-- 天忍或此门派出师
		SetTask(137,4)
		return 4
	elseif (GetTask(8) >= 10*256) and (GetTask(8) ~= 75*256) then		-- 丐帮或此门派出师
		SetTask(137,8)
		return 8
	elseif (GetTask(5) >= 10*256) and (GetTask(5) ~= 75*256) then		-- 武当或此门派出师
		SetTask(137,5)
		return 5
	elseif (GetTask(9) >= 10*256) and (GetTask(9) ~= 75*256) then		-- 昆仑或此门派出师
		SetTask(137,9)
		return 9
	else																					-- 白名的，不需要更新
		SetTask(137,20)
		return 20
	end
end;

function check_time()

	-- 免费双经验
	if (AEXP_IsFreeTimeDoubleExp() == 1) then-- 免费双经验日子
		Say("Hi謓 nay Уo Hoa o linh kh� r蕋 m筺h, l骳 n祔 luy謓 c玭g kh玭g c莕 ph秈 d飊g n ch竜 L筽 B竧. Nh鱪g b竧 ch竜  u鑞g c騨g s� kh玭g b� tr� th阨 gian. C� h閕 hi誱 c�. Чi hi謕 h穣 tranh th� luy謓 c玭g 甶 nh�!", 0);
		return 1;
	end
	
	nCurValue = GetTask(AEXP_TASKID);
	
	if (nCurValue == 0) then	-- 可能从未喝过腊八粥
		Say("H譶h nh� <color=red>ch竜 L筽 B竧<color> c馻 ngi kh玭g c� t竎 d鬾g! H穣 mua th猰 b竧 n鱝 xem sao!", 0);
		return 0;
	end

	nTemp = mod(nCurValue, AEXP_TIME_ONE);
	nHours = (nCurValue - nTemp) / AEXP_TIME_ONE; -- 已喝的碗数(小时数)
	nMinutes = nTemp * 60 / AEXP_TIME_ONE;

	if (nHours == 0) and (nMinutes < AEXP_FREQ) then	-- 挂机时间不足
		Say("C玭g hi謚 c馻 ch竜 l筽 b竧  h誸! Ngi c莕 ph秈 mua th猰 m閠 輙 n鱝 m韎 c� th� ti誴 t鬰 ph竧 huy!", 0);
	elseif (nHours > 0) then				-- 还有1小时以上
		Say("C玭g hi謚 c馻 Ch竜 L筽 B竧 c遪 c� th� duy tr�<color=red> "..nHours.."<color>gi�<color=red>"..nMinutes.."<color> ph髏", 0);
	else
		Say("C玭g hi謚 c馻 Ch竜 L筽 B竧 c遪 c� th� duy tr�<color=red> "..nMinutes.."<color> ph髏", 0);
	end
end;

g_arBuyNumber = {1, 2, 4, 8}; -- 单位：小时
function buy_yes()
	nLevel = GetLevel();
	arBuyStr = {};
	nCount = getn(g_arBuyNumber);

	for i = 1, nCount do
		nNumber = g_arBuyNumber[i];
		nMoney = AEXP_GetNeedMoney(nLevel, nNumber);
		if (nMoney > 0) then
			arBuyStr[i] = ""..nNumber.."B竧 [ "..nMoney.." lng]".."/buy_deal";
		end
	end

	arBuyStr[nCount + 1] = "Ta ch璦 mu鑞 d飊g n!/OnCancel"
	Say("Ngi mu鑞 u鑞g m蕐 b竧?", nCount+1, arBuyStr);
end;

function buy_deal(nSel)
	nNumber = g_arBuyNumber[nSel+1]; -- 单位：小时
	
	--碗数检查 - start
	nCurValue = GetTask(AEXP_TASKID);
	temp = (AEXP_TIME_MAX - nCurValue) / AEXP_TIME_ONE; -- 目前可喝的碗数(小时数)
	nRemainNumber = floor(temp);
	if (nRemainNumber <= 0) then
		Msg2Player("B筺  u鑞g"..AEXP_HOUR_MAX.."B竧 ch竜 L筽 B竧, c秏 gi竎 t� m譶h c騨g kh玭g ╪ th猰 頲 t� n祇. C� l� sau 1 th阨 gian ti猽 h鉧 m韎 c� th� ╪ m蕐 b竧. ")
		return 0;
	end

	if (nNumber > nRemainNumber) then
		Msg2Player("b筺 c秏 th蕐 m譶h c� th� u鑞g t鑙 產"..AEXP_HOUR_MAX.."B竧 ch竜 L筽 B竧, b﹜ gi�  ╪ r錳 "..(AEXP_HOUR_MAX - nRemainNumber).."B竧. ")
		nNumber = nRemainNumber;
	end
	--碗数检查 - end

	nLevel = GetLevel();
	nMoney = AEXP_GetNeedMoney(nLevel, nNumber);
	if (GetCash() >= nMoney) then
		Pay(nMoney);
		nValueTotal = nCurValue + (AEXP_TIME_ONE * nNumber);
		SetTask(AEXP_TASKID,  nValueTotal);

		-- 碗数及时间提示 - start
		nTemp = mod(nValueTotal, AEXP_TIME_ONE);
		nHours = (nValueTotal - nTemp) / AEXP_TIME_ONE; -- 已喝的碗数(小时数)
		nMinutes = nTemp * 60 / AEXP_TIME_ONE;
		Msg2Player("B筺  u鑞g"..nNumber.."b譶h ch竜 L筽 B竧. C� th� t� ng luy謓 c玭g"..nHours.."gi� "..nMinutes.."ph髏");
		-- 碗数及时间提示 - end
				
		if (nCurValue == 0) then -- 可能是第一次喝
			Talk(1,"","Ch竜 L筽 B竧 ch� c� c玭g hi謚 tr猲 Уo Hoa o! N誹 u鑞g r錳 m� r阨 kh醝 y s� m蕋 t竎 d鬾g")
		end
	else
		Talk(1,"","Ch竜 L筽 B竧 l� m閠 dc ph萴 th莕 k�, kh玭g th� t苙g! Чi hi謕 h穣 mang "..nMoney.." lng n  mua!")
	end
end;

function OnCancel()
end;
