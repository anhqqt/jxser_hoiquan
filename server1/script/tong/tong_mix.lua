--tong_action.lua
--帮会操作，程序访问的接口
function DefFun2(n1, n2)
	return 1
end
function DefFun3(n1, n2, n3)
	return 1
end
Include("\\script\\tong\\workshop\\workshop_setting.lua")

if MODEL_GAMESERVER == 1 or MODEL_RELAY == 1 then
--------------------如果非客户端---------------------------
IncludeLib("TONG")
Include("\\script\\tong\\contribution_entry.lua")
Include("\\script\\tong\\log.lua")
Include("\\script\\tong\\addtongnpc.lua")

if MODEL_GAMESERVER == 1 then
Include("\\script\\maps\\checkmap.lua")
Include("\\script\\lib\\gb_taskfuncs.lua")
end

-------------------资金转化关系----------------------
--存取钱
function MONEYFUND_ADD_R(nTongID, nAdd)
	if (TONG_GetMoney(nTongID) + nAdd < 0)then
		return 0
	end
	local szMember = TONGM_GetName(nTongID, ExecutorId);
	local szMsg;
	if (nAdd > 0) then
		szMsg = szMember.."  ng g鉷 "..nAdd.." lng v祇 ng﹏ qu� bang h閕"
	else
		szMsg = szMember.."  r髏 t� ng﹏ qu� bang h閕"..(-nAdd).." lng"
	end	
	Msg2Tong(nTongID, szMsg)
	if (abs(nAdd) >= 1000000) then
		TONG_ApplyAddEventRecord(nTongID, szMsg);	-- 帮会事件记录
		cTongLog:WriteInfTB("FUND", "moneyadd", nTongID, {add = nAdd})
	end
	return 1
end
function MONEYFUND_ADD_G_1(nTongID, nAdd)
	local nCash = GetCash()
	if (nCash < nAdd)then
		Msg2Player("Kh玭g  ng﹏ lng!")
		return 0
	end
	local nMax = 2000000000	--20亿
	if (abs(nAdd) > nMax) then
		Msg2Player("Ng﹏ lng n筽 v祇 qu� nhi襲!")
		return 0
	end
	--先付钱再加资金
	if (nAdd > 0)then	--存钱
		if Pay(nAdd) ~= 1 then
			return 0
		end
	else				--取钱
		if nCash > nMax + nAdd then --取出后大于nMax
			Msg2Player("Kh玭g th� r髏 ng﹏ lng! S� ng﹏ lng trong h祅h trang s� vt m鴆 cho ph衟!")
			return 0
		end
	end
	return 1
end
function MONEYFUND_ADD_G_2(nTongID, nAdd)
	--先扣资金再给钱
	if (nAdd < 0)then
		Earn(-nAdd)
	end
	return 1
end

--帮会资金转建设基金
function MONEYFUND2BUILDFUND_R(nTongID, nOffer)
	if (TONG_GetMoney(nTongID) < nOffer)then
		return 0
	end
	local nCurFund = TONG_GetWeekBuildFund(nTongID)
	local nAdd = floor(nOffer/COEF_CONTRIB_TO_VALUE)
	if (nCurFund +  nAdd > tongGetWeekBuildUpper(nTongID, TONG_GetBuildLevel(nTongID)))then
		return 0
	end
	if (TONG_ApplyAddMoney(nTongID, -nOffer) == 1 and TONG_ApplyAddBuildFund(nTongID, nAdd) == 1)then
		TONG_ApplyAddWeekBuildFund(nTongID, nAdd)
		local szMember = TONGM_GetName(nTongID, ExecutorId);
		local szMsg = szMember.." l祄 cho"..nOffer.."Ng﹏ s竎h bang chuy觧 "..nAdd.." v筺 lng v祇 ng﹏ s竎h ki課 thi誸"
		TONG_ApplyAddTaskValue(nTongID, TONGTSK_MONEYFUND2BF, nAdd)
		TONG_ApplyAddEventRecord(nTongID, szMsg);	-- 帮会事件记录
		Msg2Tong(nTongID, szMsg);
		cTongLog:WriteInfTB("FUND", "moneyfund2buildfund", nTongID, {money = nOffer, buildfund = nAdd})
		return 1
	end
	return 0
end
function MONEYFUND2BUILDFUND_G_1(nTongID, nOffer)
	if (TONG_GetMoney(nTongID) < nOffer)then
		Msg2Player("Ng﹏ s竎h bang h閕 kh玭g ")
		return 0
	end
	if (nOffer < 10000)then
		Msg2Player("Chuy觧 kho秐 t鑙 thi觰 l� 1 v筺 lng!")
		return 0
	end
	local nCurFund = TONG_GetWeekBuildFund(nTongID)
	if (nCurFund + nOffer/COEF_CONTRIB_TO_VALUE > tongGetWeekBuildUpper(nTongID, TONG_GetBuildLevel(nTongID)))then
		Msg2Player("Kh玭g th� chuy觧 ng﹏, v� s� l祄 ng﹏ s竎h ki課 thi誸 bang vt qu� gi韎 h筺 tu莕!")
		return 0
	end
	return 1
end
MONEYFUND2BUILDFUND_G_2 = DefFun2

--建设基金转战备基金
function BUILDFUND2WARFUND_R(nTongID, nOffer)
	if (TONG_GetBuildFund(nTongID) >= nOffer)then
		if (TONG_ApplyAddBuildFund(nTongID, -nOffer) == 1 and TONG_ApplyAddWarBuildFund(nTongID, nOffer) == 1) then
			local szMember = TONGM_GetName(nTongID, ExecutorId);
			local szMsg = szMember.." l祄 cho"..nOffer.." v筺 ng﹏ s竎h ki課 thi誸 chuy觧 sang ng﹏ s竎h chi課 b�."
			TONG_ApplyAddTaskValue(nTongID, TONGTSK_BF2WF, nOffer)	
			TONG_ApplyAddEventRecord(nTongID, szMsg);	-- 帮会事件记录
			Msg2Tong(nTongID, szMsg);
			cTongLog:WriteInfTB("FUND", "buildfund2warfund", nTongID, {buildfund2warfund = nOffer})
			return 1
		end		
	end
	return 0
end
function BUILDFUND2WARFUND_G_1(nTongID, nOffer)
	if (TONG_GetBuildFund(nTongID) <  nOffer)then
		Msg2Player("Ng﹏ s竎h ki課 thi誸 bang kh玭g !")
		return 0
	end
	return 1
end
BUILDFUND2WARFUND_G_2 = DefFun2

--成员金钱转建设基金
function MONEY2BUILDFUND_R(nTongID, nOffer)
	local nTotalBuildfundAdd = floor(nOffer / 10000)
	local nBuildfundAdd = 0
	local nStoredAdd = 0
	local nCurBuildFund = TONG_GetWeekBuildFund(nTongID)
	local nWeekBuildUpper = tongGetWeekBuildUpper(nTongID, TONG_GetBuildLevel(nTongID))
	if (nCurBuildFund >= nWeekBuildUpper)then
		nStoredAdd = nTotalBuildfundAdd
		nBuildfundAdd = 0
	elseif (nCurBuildFund + nTotalBuildfundAdd >= nWeekBuildUpper)then
		nStoredAdd = nTotalBuildfundAdd -  (nWeekBuildUpper - nCurBuildFund)
		nBuildfundAdd = nTotalBuildfundAdd - nStoredAdd
	else
		nStoredAdd = 0
		nBuildfundAdd = nTotalBuildfundAdd
	end
	if (nBuildfundAdd > 0)then
		TONG_ApplyAddBuildFund(nTongID, nBuildfundAdd)
		TONG_ApplyAddWeekBuildFund(nTongID, nBuildfundAdd)
	end
	if (nStoredAdd > 0)then
		TONG_ApplyAddStoredBuildFund(nTongID, nStoredAdd)
	end
	local szMember = TONGM_GetName(nTongID, ExecutorId);
	local szMsg = szMember.."  ng g鉷 "..(nOffer / 10000).." v筺 lng v祇 ng﹏ s竎h ki課 thi誸 bang"
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_MONEY2BF, nTotalBuildfundAdd)
	if (nOffer >= 1000000) then
		TONG_ApplyAddEventRecord(nTongID, szMsg);	-- 帮会事件记录
	end
	Msg2Tong(nTongID, szMsg);
	cTongLog:WriteInfTB("FUND", "money2buildfund", nTongID, {money = nOffer, buildfund = nBuildfundAdd, storebuildfund = nStoredAdd})
	return 1
end
function MONEY2BUILDFUND_G_1(nTongID, nOffer)
	if (nOffer < 10000)then
		Msg2Player("M鏸 l莕 quy猲 g鉷 t鑙 thi觰 l� 1 v筺 lng!")
		return 0
	end
	if (GetCash() < nOffer)then
		Msg2Player("Ng﹏ lng kh玭g !")
		return 0
	end
	if (TONGM_GetFigure(nTongID, GetName()) == TONG_RETIRE)then
		Msg2Player("萵 s� kh玭g th� ng g鉷!")
		return 0
	end
	local nContribution = floor(nOffer/COEF_CONTRIB_TO_VALUE)
	local nWeekTotal = GetWeeklyOffer()
	if (nWeekTotal + nContribution > MAX_WEEK_CONTRIBUTION)then
		Msg2Player("Kh玭g th� ng g鉷, v� l祄 cho 甶觤 c鑞g hi課 t輈h l騳 s� vt qu� gi韎 h筺 tu莕!")
		return 0
	end
	Pay(nOffer)
	AddWeeklyOffer(nContribution)
	AddCumulateOffer(nContribution)
	if (AddContribution(nContribution) ~= 1)then
		return 0
	end
	Msg2Player("B筺 ng g鉷 <color=gold>"..nOffer.."<color> lng v祇 ng﹏ s竎h ki課 thi誸 bang, nh薾 頲 <color=green>"..nContribution.."<color> 甶觤 c鑞g hi課")
	return 1
end
MONEY2BUILDFUND_G_2 = DefFun2

--成员贡献度转储备贡献度
function CONTRIBUTION2STOREOFFER_R(nTongID, nExecutor, nOffer)
	-- if (TONG_ApplyAddStoredOffer(nTongID, nOffer) ~= 1)then
	if (TONG_ContributeOffer(nTongID, nExecutor, nOffer) ~= 1) then
		return 0
	end
	local szMember = TONGM_GetName(nTongID, ExecutorId);
	local szMsg = szMember.."  ng g鉷 "..nOffer.." 甶觤 c鑞g hi課 v祇 ng﹏ s竎h c鑞g hi課 bang"
	if (nOffer >= 100) then
		TONG_ApplyAddEventRecord(nTongID, szMsg);	-- 帮会事件记录
	end
	Msg2Tong(nTongID, szMsg);
	cTongLog:WriteInfTB("FUND", "contribution2storeoffer", nTongID, {contribution2storeoffer = nOffer})
	return 1
end
function CONTRIBUTION2STOREOFFER_G_1(nTongID, nExecutor, nOffer)
	-- 扣除贡献度时不向relay申请，因为relay也会执行相应脚本函数 wangbin 2009-4-13
	if (GetContribution() < nOffer or AddContribution(-nOffer, 0) ~= 1)then
		Msg2Player("觤 c鑞g hi課 kh玭g !")
		return 0
	end
	return 1
end
CONTRIBUTION2STOREOFFER_G_2 = DefFun3

-- 储备贡献度转成员贡献度（群发）
g_szFigure = { "To祅 th� bang h閕", "Bang ch� ", "Trng L穙", "чi trng", "е t� ", "萵 s�" }
function STOREOFFER2CONTRIBUTION1_R(nTongID, nFigure, nOffer)
	if (TONG_IsExist(nTongID) ~= 1)then
		return 0
	end
	-- local nCounts = TONG_GetOnlineCount(nTongID, nFigure)
	-- if (TONG_GetStoredOffer(nTongID) >= nCounts * nOffer)then
		-- if (TONGM_ApplyAddOfferEx(nTongID, nFigure, nOffer) ~= 1)then		
		--	return 0
		-- end		
		-- if (TONG_ApplyAddStoredOffer(nTongID, -nCounts * nOffer) ~= 1)then
		-- return 0
		-- end	
	if (TONG_DistributeOfferToGroup(nTongID, nFigure, nOffer) == 1) then
		local szMaster = TONGM_GetName(nTongID, ExecutorId);
		local szMsg = szMaster.."Th祅h vi猲 tr猲 m筺g"..g_szFigure[nFigure+2].."("..nCounts.." ngi) 頲 ph﹏ ph竧 "..nOffer.." 甶觤 c鑞g hi課!"
		TONG_ApplyAddEventRecord(nTongID, szMsg);	-- 帮会事件记录
		Msg2Tong(nTongID, szMsg);
		cTongLog:WriteInfTB("FUND", "storeoffer2contribution1", nTongID, {storeoffer2contribution = nOffer})
		return 1
	end
	return 0
end
function STOREOFFER2CONTRIBUTION1_G_1(nTongID, nFigure, nOffer)
	local nCounts = TONG_GetOnlineCount(nTongID, nFigure)
	if (TONG_GetStoredOffer(nTongID) < nCounts * nOffer)then
		Msg2Player("Ng﹏ s竎h c鑞g hi課 kh玭g   ph竧!")
		return 0
	end	
	return 1
end
STOREOFFER2CONTRIBUTION1_G_2 = DefFun3

-- 储备贡献度转成员贡献度（单人）
function STOREOFFER2CONTRIBUTION2_R(nTongID, nMemberID, nOffer)
	if (TONGM_IsExist(nTongID, nMemberID) == 0)then
		return 0
	end
	-- if (TONG_GetStoredOffer(nTongID) >= nOffer)then
	-- 	TONG_ApplyAddStoredOffer(nTongID, -nOffer)
	-- 	TONGM_ApplyAddOffer(nTongID, nMemberID, nOffer)
	if (TONG_DistributeOfferToMember(nTongID, nMemberID, nOffer) == 1) then
		local szMaster = TONGM_GetName(nTongID, ExecutorId);
		local szMember = TONGM_GetName(nTongID, nMemberID);
		local szMsg = format("%s ph竧 cho %s %d 甶觤 c鑞g hi課 d� tr�",szMaster,szMember,nOffer);
		if (nOffer > 100)then
			TONG_ApplyAddEventRecord(nTongID, szMsg);	-- 帮会事件记录
		end
		Msg2Tong(nTongID, szMsg);
		cTongLog:WriteInfTB("FUND", "storeoffer2contribution2", nTongID, {storeoffer2contribution = nOffer, member = szMember})
		return 1
	end
	return 0
end
function STOREOFFER2CONTRIBUTION2_G_1(nTongID, nMemberID, nOffer)
	if (TONGM_IsExist(nTongID, nMemberID) == 0)then
		Msg2Player("Ng﹏ s竎h 甶觤 c鑞g hi課 ch� c� th� ph竧 cho th祅h vi猲 trong bang!")
		return 0
	end
	if (TONG_GetStoredOffer(nTongID) < nOffer)then
		Msg2Player("Ng﹏ s竎h c鑞g hi課 kh玭g !")
		return 0
	end	
	return 1
end
STOREOFFER2CONTRIBUTION2_G_2 = DefFun3

-- 成员被踢出帮会
function MEMBER_KICK_R(nTongID, nMemberID, nFlag)
	if (TONGM_IsExist(nTongID, nMemberID) ~= 1) then
		return 0;
	end
	local nMemberFigure = TONGM_GetFigure(nTongID, nMemberID);
	if (nMemberFigure == 0 or nMemberFigure == 1) then
		local szExecutorName = TONGM_GetName(nTongID, ExecutorId);
		Msg2PlayerByName(szExecutorName, TB_TONG_FIGURE_NAME[nMemberFigure].." kh玭g th� b� tr鬰 xu蕋!");
		return 0;
	end
	local nStoredBuildFund = TONG_GetStoredBuildFund(nTongID)
	local nBuildFund = TONG_GetBuildFund(nTongID)
	local nWarFund = TONG_GetWarBuildFund(nTongID)
	local nOffer = TONGM_GetOffer(nTongID, nMemberID)
	if (nOffer <= 0) then
		local szExcutor = TONGM_GetName(nTongID, ExecutorId);
		local szMember = TONGM_GetName(nTongID, nMemberID);
		local szMsg = szExcutor.." tr鬰 xu蕋 "..szMember.." ra kh醝 bang h閕!"
		Msg2Tong(nTongID, szMsg)
		--TONG_ApplyAddEventRecord(nTongID, szMsg);	-- 帮会事件记录	
		cTongLog:WriteInfTB("MEMBER", "kick", nTongID, {member = szMember})
		return 1
	end
	-- 扣掉5%贡献度（向上取整）
	local nDel = (nOffer + 19) / 20
	TONGM_ApplyAddOffer(nTongID, nMemberID, -nDel)
	local nBuildDec = floor(nOffer * 0.6)
	local nWarBuildDec = floor(nOffer * 0.4)
	--战备基金不够减
	if (nWarFund < nWarBuildDec)then
		return 0
	end
	--储备不够减
	if (nStoredBuildFund < nBuildDec)then
		--再加建设还是不够减
		if (nBuildFund < nBuildDec - nStoredBuildFund)then
			return 0
		end
		TONG_ApplyAddStoredBuildFund(nTongID, -nStoredBuildFund)
		TONG_ApplyAddBuildFund(nTongID, nStoredBuildFund - nBuildDec)
	else
		TONG_ApplyAddStoredBuildFund(nTongID, -nBuildDec)		
	end
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_BFCONSUME, nBuildDec)
	TONG_ApplyAddWarBuildFund(nTongID, -nWarBuildDec)
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_WSCONSUME, nWarBuildDec)
	--帮会扣完了
	local szExcutor = TONGM_GetName(nTongID, ExecutorId);
	local szMember = TONGM_GetName(nTongID, nMemberID);
	local szMsg = szExcutor.." tr鬰 xu蕋 "..szMember.." tr鬰 xu蕋 kh醝 bang h閕, ng﹏ s竎h ki課 thi誸 d� tr� gi秏"..nBuildDec..
		" v筺, ng﹏ s竎h chi課 b� gi秏"..nWarBuildDec.." v筺!"
	Msg2Tong(nTongID, szMsg)	
	if (nStoredBuildFund < nBuildDec)then
		Msg2Tong(nTongID, "Khi tr鬰 xu蕋 ngi ng﹏ s竎h ki課 thi誸 d� tr� kh玭g , ph莕 thi誹 h魌 s� kh蕌 tr� v祇 ng﹏ s竎h ki課 thi誸!")	
	end
	--TONG_ApplyAddEventRecord(nTongID, szMsg);	-- 帮会事件记录	
	cTongLog:WriteInfTB("MEMBER", "kick", nTongID, {member = szMember, builddec = nBuildDec, warbuilddec = nWarBuildDec})
	return 1
end
function MEMBER_KICK_G_1(nTongID, nMemberID, nFlag)
	
	if (TONGM_IsExist(nTongID, nMemberID) ~= 1) then
		return 0;
	end
	local nMemberFigure = TONGM_GetFigure(nTongID, nMemberID);
	if (nMemberFigure == 0 or nMemberFigure == 1) then
		local szExecutorName = TONGM_GetName(nTongID, ExecutorId);
		Msg2Player(TB_TONG_FIGURE_NAME[nMemberFigure].." kh玭g th� b� tr鬰 xu蕋!");
		return 0;
	end
	
	local nKickCount = TONG_GetTaskValue(nTongID, TONGTSK_MEMBER_KICK_COUNT);	--剔除帮会成员的计数
	local nKickDate  = TONG_GetTaskValue(nTongID, TONGTSK_MEMBER_KICK_DATE);	--剔除帮会成员的计数日期
	local nDate 	 = tonumber(GetLocalDate("%Y%m%d"));						--当前日期
	
	if (nKickDate ~= nDate) then
		nKickCount = 0;
		nKickDate  = nDate;
		TONG_ApplySetTaskValue(nTongID, TONGTSK_MEMBER_KICK_COUNT, 	nKickCount);
		TONG_ApplySetTaskValue(nTongID, TONGTSK_MEMBER_KICK_DATE, 	nKickDate);
	end
	
	if(nKickCount >= MAX_KICK_COUNT) then
		local szMsg = format("M鏸 ng祔 ch� 頲 gi秈 t竛 %d bang ch髇g!",MAX_KICK_COUNT);
		Msg2Player(szMsg);
		return 0;
	end
	
	local nStoredBuildFund = TONG_GetStoredBuildFund(nTongID)
	local nBuildFund = TONG_GetBuildFund(nTongID)
	local nWarFund = TONG_GetWarBuildFund(nTongID)
	local nOffer = TONGM_GetOffer(nTongID, nMemberID)
	if (nOffer <= 0)then
		TONG_ApplySetTaskValue(nTongID, TONGTSK_MEMBER_KICK_COUNT, nKickCount+1);
		return 1
	end
	local nBuildDec = floor(nOffer * 0.6)
	local nWarBuildDec = floor(nOffer * 0.4)
	if (nFlag == 1)then
		Say("<#>Tr鬰 xu蕋 th祅h vi猲 s� kh蕌 tr� ng﹏ s竎h ki課 thi誸 d� tr� c馻 bang"..nBuildDec.." v筺 (n誹 ng﹏ s竎h ki課 thi誸 d� tr� kh玭g  s� tr� v祇 ng﹏ s竎h ki課 thi誸) v� ng﹏ s竎h chi課 b�"..nWarBuildDec.." v筺, c� ng � kh玭g?", 
			2, "Tr鬰 xu蕋/#KickConfirm("..nTongID..","..nMemberID..")", "H駓 b� /#Cancel")
	elseif (nFlag == 2)then
		--战备基金不够减
		if (nWarFund < nWarBuildDec)then
			Msg2Player("Sau khi tr鬰 xu蕋 th祅h vi猲, ng﹏ s竎h chi課 b� s� kh蕌 tr� th祅h s� ﹎, t筸 th阨 kh玭g th� tr鬰 xu蕋 th祅h vi猲!")
			return 0
		end
		--储备不够减
		if (nStoredBuildFund < nBuildDec)then
			--再加战备还是不够减
			if (nBuildFund < nBuildDec - nStoredBuildFund)then
				Msg2Player("Sau khi tr鬰 xu蕋 th祅h vi猲, ng﹏ s竎h ki課 thi誸 s� kh蕌 tr� th祅h s� ﹎, t筸 th阨 kh玭g th� tr鬰 xu蕋 th祅h vi猲!")
				return 0
			end
		end	
		
		TONG_ApplySetTaskValue(nTongID, TONGTSK_MEMBER_KICK_COUNT, nKickCount+1);
		return 1
	end
	return 0
end
function MEMBER_KICK_G_2(nTongID, nMemberID, nFlag)
	-- 直接在relay扣除5%贡献度。 wangbin 2009-4-15
	--注意当前的PlayerID是被踢者
	-- local nContribution = GetContribution()
	-- local nDel = (nContribution + 20 - 1) / 20	--扣掉5%贡献度（向上取整）
	-- AddContribution(-nDel)
	return 1
end
function KickConfirm(nTongID, nMemberID)
	TONG_ApplyKickMember(nTongID, nMemberID, 2)
end

-- 成员退隐
function MEMBER_RETIRE_R(nTongID, nMemberID, bRetireOrNot)
	local szExecutorName = TONGM_GetName(nTongID, ExecutorId);
	local szMemberName = TONGM_GetName(nTongID, nMemberID);
	local nTodayDate = floor(GetSysCurrentTime() / (3600*24));
	local nFigure = TONGM_GetFigure(nTongID, nMemberID);
	if (bRetireOrNot == 1) then
		if (nFigure ~= 2 and nFigure ~= 3) then
			local szPerson = szMemberName;
			if (ExecutorId == nMemberID) then
				szPerson = "B筺 ";
			end
			Msg2PlayerByName(szExecutorName, szPerson.." m nhi謒 ch鴆 v� quan tr鋘g, kh玭g th� tho竔 萵, ch� c� i trng v� bang ch髇g m韎 c� th� tho竔 萵!");
			return 0;
		end
		local nRetiredMemberCount = TONG_GetMemberCount(nTongID, 4);
		if (nRetiredMemberCount >= floor((TONG_GetMemberCount(nTongID) + nRetiredMemberCount) * TONGMEMBER_RETIRE_MAX_RATE)) then
			Msg2PlayerByName(szExecutorName, "Trc m総 s� ngi tho竔 萵 c馻 bang  t gi韎 h筺, kh玭g th� ti誴 t鬰 s� d鬾g thao t竎 tho竔 萵"..nRetiredMemberCount);
			return 0;
		end
		local szMsg = ""
		if (ExecutorId ~= nMemberID) then
			if (TONGM_GetOnline(nTongID, nMemberID) == 1 or
				nTodayDate - TONGM_GetLastOnlineDate(nTongID, nMemberID) < TONGMEMBER_RETIRE_REQUIRE_DAY) then
					Msg2PlayerByName(szExecutorName, "Ch� c� th� cho tho竔 萵 i v韎 th祅h vi猲 kh玭g l猲 m筺g t� "..TONGMEMBER_RETIRE_REQUIRE_DAY.." ng祔 tr� l猲!");
					return 0;
			end
			szMsg = szExecutorName.." vs "..szMemberName.."Ti課 h祅h thao t竎 tho竔 萵"
		else
			szMsg = szMemberName.."Tho竔 萵 kh醝 bang h閕"
		end
		Msg2Tong(nTongID, szMsg);
		TONGM_ApplySetRetireDate(nTongID, nMemberID, nTodayDate);
		cTongLog:WriteInfTB("MEMBER", "retire", nTongID, {member = szMemberName})
	elseif (bRetireOrNot == 0) then
		if (nFigure ~= 4) then
			cTongLog:WriteErr("MEMBER", "unretire", nTongID, {member = szMemberName})
			return 0;
		end
		if (nTodayDate - TONGM_GetRetireDate(nTongID, nMemberID) < TONGMEMBER_UNRETIRE_REQUIRE_DAY) then
			Msg2PlayerByName(szExecutorName, "K� t� ng祔 tho竔 萵"..TONGMEMBER_UNRETIRE_REQUIRE_DAY.." ng祔 sau ng祔 tho竔 萵 m韎 c� th� h駓 b� tho竔 萵!");
			return 0;
		end
		Msg2PlayerByName(szExecutorName, "H駓 b� tho竔 萵 th祅h c玭g!");
		TONGM_ApplySetRetireDate(nTongID, nMemberID, 0);
		cTongLog:WriteInfTB("MEMBER", "unretire", nTongID, {member = szMemberName})
	end
	--周维护战备基金更新
	local nTongLevel = TONG_GetBuildLevel(nTongID)
	--0级帮会无周维护
	if nTongLevel <= 0 then
		return 1
	end
	local nConsume = wsGetAllDayConsume(nTongID)
	nConsume = nConsume + tongGetBaseMaintainFund(nTongID, nTongLevel)
	local nPerStandFund = floor(nConsume * 7 / TONG_GetMemberCount(nTongID, -1))
	TONG_ApplySetPerStandFund(nTongID, nPerStandFund)
	return 1;
end
function MEMBER_RETIRE_G_1(nTongID, nMemberID, bRetireOrNot)
	local nFigure = TONGM_GetFigure(nTongID, nMemberID);
	if (bRetireOrNot == 1) then
		local szMemberName = TONGM_GetName(nTongID, nMemberID);
		if (nFigure ~= 2 and nFigure ~= 3) then
			local szPerson = szMemberName;
			if (GetTongMemberID() == nMemberID) then
				szPerson = "B筺 ";
			end
			Msg2Player(szPerson.." m nhi謒 ch鴆 v� quan tr鋘g, kh玭g th� tho竔 萵, ch� c� i trng v� bang ch髇g m韎 c� th� tho竔 萵!");
			return 0;
		end
		local nRetiredMemberCount = TONG_GetMemberCount(nTongID, 4);
		if (nRetiredMemberCount >= floor((TONG_GetMemberCount(nTongID) + nRetiredMemberCount) * TONGMEMBER_RETIRE_MAX_RATE)) then
			Msg2Player("Trc m総 s� ngi tho竔 萵 c馻 bang  t gi韎 h筺, kh玭g th� ti誴 t鬰 s� d鬾g thao t竎 tho竔 萵");
			return 0;
		end
	else
		if (nFigure ~= 4) then	-- 不是隐士不允许退隐
			return 0;
		end
	end
	return 1;
end
MEMBER_RETIRE_G_2 = DefFun3

-- 成员上下线
function MEMBER_ONLINE_R(nTongID, nMemberID, bOnline)
	-- 上线
	if (bOnline == 1) then
	-- 下线
	else
		local nTodayDate = floor(GetSysCurrentTime() / (3600*24));
		TONGM_ApplySetLastOnlineDate(nTongID, nMemberID, nTodayDate);
	end
	return 1;
end
MEMBER_ONLINE_G_1 = DefFun3
MEMBER_ONLINE_G_2 = DefFun3

function MEMBER_REMOVE_R(nTongID, nMemberID)
	--周维护战备基金更新
	local nTongLevel = TONG_GetBuildLevel(nTongID)
	local szMember = TONGM_GetName(nTongID, nMemberID);
	cTongLog:WriteInfTB("MEMBER", "remove", nTongID, {member = szMember});
	--0级帮会无周维护
	if nTongLevel <= 0 then
		return 1
	end
	local nConsume = wsGetAllDayConsume(nTongID)
	nConsume = nConsume + tongGetBaseMaintainFund(nTongID, nTongLevel)
	local nPerStandFund = floor(nConsume * 7 / TONG_GetMemberCount(nTongID, -1))
	TONG_ApplySetPerStandFund(nTongID, nPerStandFund)
	return 1
end
MEMBER_REMOVE_G_1 = DefFun2
MEMBER_REMOVE_G_2 = DefFun2

-- 成员加入帮会
function MEMBER_ADD_R(nTongID, nMemberID, nOfferBring)
	local nBuildAdd = floor(nOfferBring * 0.6)
	local nWarBuildAdd = floor(nOfferBring * 0.4)
	TONG_ApplyAddStoredBuildFund(nTongID, nBuildAdd)
	TONG_ApplyAddWarBuildFund(nTongID, nWarBuildAdd)
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_BFADD, nBuildAdd)
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_WFADD, nWarBuildAdd)
	local szMember = TONGM_GetName(nTongID, nMemberID)
	local szMsg = szMember.." gia nh藀 b鎛 bang, ng﹏ s竎h ki課 thi誸 d� tr� bang h閕 t╪g"..nBuildAdd..
		" v筺, ng﹏ s竎h chi課 b� t╪g"..nWarBuildAdd.." v筺!"
	Msg2Tong(nTongID, szMsg)
	--TONG_ApplyAddEventRecord(nTongID, szMsg);	-- 帮会事件记录
	local szExecutor = TONGM_GetName(nTongID, ExecutorId);
	cTongLog:WriteInfTB("MEMBER", "add", nTongID, {member = szMember, buildadd = nBuildAdd, warbuildadd = nWarBuildAdd})
	--周维护战备基金更新
	local nTongLevel = TONG_GetBuildLevel(nTongID)
	--0级帮会无周维护
	if nTongLevel <= 0 then
		return 1
	end
	local nConsume = wsGetAllDayConsume(nTongID)
	nConsume = nConsume + tongGetBaseMaintainFund(nTongID, nTongLevel)
	local nPerStandFund = floor(nConsume * 7 / TONG_GetMemberCount(nTongID, -1))
	TONG_ApplySetPerStandFund(nTongID, nPerStandFund)
	return 1
end
MEMBER_ADD_G_1 = DefFun3
MEMBER_ADD_G_2 = DefFun3

function MEMBER_SETFIGURE_R(nTongID, nMemberID, nFigure)
	if (nFigure == TONG_ELDER)then
		if TONG_GetMemberCount(nTongID, TONG_ELDER) >= MAX_ELDER_COUNT then
			if ExecutorId and ExecutorId ~= 0 then 
				Msg2PlayerByName(TONGM_GetName(nTongID, ExecutorId), "S� lng trng l穙  t gi韎 h筺!");
			end	
			return 0
		end
	elseif (nFigure == TONG_MANAGER)then
		if TONG_GetMemberCount(nTongID, TONG_MANAGER) >= MAX_MANAGER_COUNT then
			if ExecutorId and ExecutorId ~= 0 then 
				Msg2PlayerByName(TONGM_GetName(nTongID, ExecutorId), "S� lng i trng  t gi韎 h筺!");
			end					
			return 0	
		end
	end
	local szMember = TONGM_GetName(nTongID, nMemberID);
	cTongLog:WriteInfTB("MEMBER", "setfigure", nTongID, {member = szMember, figure = nFigure});
	return 1
end
MEMBER_SETFIGURE_G_1 = DefFun3
MEMBER_SETFIGURE_G_2 = DefFun3

-- 设置地图
function MAP_SET_R(nTongID, nMapID)
	if (TONG_GetTongMap(nTongID) ~= 0)then
		return 0
	end
	local szMsg = "Х c� khu v鵦 bang h閕 chung, nh蕄 v祇 n髏 <V祇 b鎛 bang>  甶 v祇 khu v鵦 n祔!"
	Msg2Tong(nTongID, szMsg)		
	TONG_ApplyAddHistoryRecord(nTongID, szMsg);	-- 帮会历史记录
	TONG_ApplyAddEventRecord(nTongID, szMsg);	-- 帮会事件记录
	cTongLog:WriteInfTB("MAP", "set", nTongID, {mapid = nMapID});
	return 1
end
MAP_SET_G_1	= DefFun2
MAP_SET_G_2	= DefFun2

function GenParam(aInfo)
	local i = aInfo[1]
	aInfo[1] = i+1
	local mapcopy = aDynMapCopy[i]
	return aDynMapCopyName[mapcopy]..aInfo[2]..mapcopy..")"
end

function EnterMap(nTongID, nMapCopy)
	if (GetFightState() ~= 0)then
		Msg2Player("Ch� c� th� 甶 v祇 t� khu v鵦 phi chi課 u!")
		return
	end
	local pos = GetMapEnterPos(nMapCopy)
	NewWorld(nMapCopy, pos.x, pos.y)
end

function CreatMap(nTongID, nMapCopy)
	TONG_ApplyCreatMap(nTongID, nMapCopy)
end

function BrowseMap(nTongID)
	local aInfo = {1, "/#EnterMap("..nTongID..","}		
	Say("<#>H穣 ch鋘 b秐  mu鑞 xem", 8, GenParam(aInfo),GenParam(aInfo),GenParam(aInfo),
		GenParam(aInfo),GenParam(aInfo),GenParam(aInfo),GenParam(aInfo),"Kh玭g xem n鱝!/#Cancel")
end

function SelectMap(nTongID)
	local aInfo = {1, "/#CreatMap("..nTongID..","}		
	Say("<#>Qu� bang mu鑞 x﹜ d鵱g bang � u?", 8, GenParam(aInfo),GenParam(aInfo),GenParam(aInfo),
		GenParam(aInfo),GenParam(aInfo),GenParam(aInfo),GenParam(aInfo),"C莕 suy x衪 l筰/#Cancel")
end

--地图创建申请
MAP_CREAT_R		= DefFun2
function MAP_CREAT_G_1(nTongID, nMapCopy)
	local nTongMap = TONG_GetTongMap(nTongID) 
	local nTongLevel = TONG_GetBuildLevel(nTongID)
	if (nTongMap > DYNMAP_ID_BASE) then
		Say("<#> Qu� bang  c� khu v鵦 ri猲g!", 0)
		return 0
	elseif (nMapCopy == 0 and nTongLevel < 2) then
		if(nTongMap > 0)then
			Say("<#>Bang h閕  c� khu v鵦 chung, khi ng c蕄 ki課 thi誸 t n 2 th� c� th� x﹜ d鵱g khu v鵦 ho箃 ng ri猲g!", 0)
			return 0
		else
			local nrand = mod(nTongID, 4) + 1
			local aNum = {
				gb_GetTask("TONG_PUBLIC_MAP", 1),
				gb_GetTask("TONG_PUBLIC_MAP", 2),
				gb_GetTask("TONG_PUBLIC_MAP", 3),
				gb_GetTask("TONG_PUBLIC_MAP", 4),
				}
			Say("<#>Hi謓 ng c蕄 ki課 thi誸 di c蕄 2, ch� c� th� d飊g khu v鵦 chung, h穣 ch鋘 1 khu v鵦 chung (n猲 d飊g khu v鵦 c� 輙 bang h閕):  ", 6,
			"L鵤 ch鋘 ng蓇 nhi猲/#PublicMap("..nTongID..","..nrand..")", 
			"Khu v鵦 chung 1 ( c� "..aNum[1].." bang h閕)/#PublicMap("..nTongID..",1)", 
			"Khu v鵦 chung 2 ( c� "..aNum[2].." bang h閕)/#PublicMap("..nTongID..",2)",
			"Khu v鵦 chung 3 ( c� "..aNum[3].." bang h閕)/#PublicMap("..nTongID..",3)", 
			"Khu v鵦 chung 4 ( c� "..aNum[4].." bang h閕)/#PublicMap("..nTongID..",4)",
			"H駓 b� /#Cancel"
			)
			return 0
		end
	end
	if (nMapCopy == 0) then
		Say("<#>Bang h閕 hi謓 t筰 c� th� s� h鱱 khu v鵦 ri猲g, c� mu鑞 th祅h l藀 kh玭g?", 2, "V祇 xem th�/#BrowseMap("..nTongID..")", 
			"T筼 b秐 /#SelectMap("..nTongID..")")
		return 0
	end
	return 1
end
MAP_CREAT_G_2	= DefFun2

function PublicMap(nTongID, nSelect)
	gb_AppendTask("TONG_PUBLIC_MAP", nSelect, 1)
	TONG_ApplySetTongMap(nTongID, aPublicMap[nSelect])
end

--地图创建成功
function MAP_CREATED_R(nTongID, dwMapID, nMapCopy)
	--首次创建的时候公告一下
	if (TONG_GetTongMap(nTongID) < DYNMAP_ID_BASE and nMapCopy > 0)then
		local mapname = aDynMapCopyName[nMapCopy]
		if (mapname == nil)then
			mapname = "Kh玭g bi誸 n琲 n祇"
		end
		local szMsg = "Xin ch骳 m鮪g, qu� bang  s� h鱱 khu v鵦 ho箃 ng ri猲g, bang ch髇g c� th� ch鋘 < v祇 b鎛 bang>  bc v祇!"
		Msg2Tong(nTongID, szMsg)
		TONG_ApplyAddHistoryRecord(nTongID, szMsg);	-- 帮会历史记录
		TONG_ApplyAddEventRecord(nTongID, szMsg);	-- 帮会事件记录
		cTongLog:WriteInfTB("MAP", "create", nTongID, {mapid = dwMapID, mapname = mapname})
	end
	return 1
end
MAP_CREATED_G_1 = DefFun2
--地图创建成功
function MAP_CREATED_G_2(nTongID, nMapID, nMapCopy)
	nMapIdx = SubWorldID2Idx(nMapID)
	-- 地图不在此服务器
	if nMapIdx < 0 or nMapCopy <= 0 then
		return 
	end
	-- 设置小地图名字
	SetWorldName(nMapIdx, TONG_GetName(nTongID).." - l穘h a")
	-- 设置类型为帮会地图
	SetMapType(nMapIdx, 1);
	-- 设置参数为TongID
	SetMapParam(nMapIdx, 0, nTongID);
	-- 加载所有帮会地图Npc
	add_one_citytong_npc(nMapIdx, nMapCopy);
	local nWorkshopID = TWS_GetFirstWorkshop(nTongID)
	local npcid
	while(nWorkshopID ~= 0)do
		local nUseLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
		if (nUseLevel > 0)then
			npcid = add_one_building(nMapIdx, nMapCopy, TWS_GetType(nTongID, nWorkshopID), nUseLevel)
			TWS_SetBuildingNpc(nTongID, nWorkshopID, npcid)
		end	
		nWorkshopID = TWS_GetNextWorkshop(nTongID, nWorkshopID)
	end
	local nCurLevel = TONG_GetBuildLevel(nTongID)
		if (nCurLevel == 4) then
			local nNpcIndex1 = AddNpc(1191, 1, nMapIdx, TB_TOTEMPOLE_POS[1][1] * 32, TB_TOTEMPOLE_POS[1][2] * 32, 1, "C閠 bi觰 tng bang h閕")--右
			TONG_ApplySetTaskValue(nTongID, TONGTSK_TOTEMINDEX[1], nNpcIndex1)
			SetNpcScript(nNpcIndex1, "\\script\\tong\\npc\\tong_totempole.lua")
			local nNpcIndex2 = AddNpc(1192, 1, nMapIdx, TB_TOTEMPOLE_POS[2][1] * 32, TB_TOTEMPOLE_POS[2][2] * 32, 1, "C閠 bi觰 tng bang h閕")--左
			TONG_ApplySetTaskValue(nTongID, TONGTSK_TOTEMINDEX[2], nNpcIndex2)
			SetNpcScript(nNpcIndex2, "\\script\\tong\\npc\\tong_totempole.lua")
			local nStuntID = TONG_GetTaskValue(nTongID, TONGTSK_STUNT_ID)
			if (nStuntID ~= 0) then
				AddNpcSkillState(nNpcIndex1, TB_STUNTID_INFO[nStuntID].skillid, 1, 1, 18*60*60*24*30)
				AddNpcSkillState(nNpcIndex2, TB_STUNTID_INFO[nStuntID].skillid, 1, 1, 18*60*60*24*30)
			end
		elseif (nCurLevel == 5) then
			local nNpcIndex1 = AddNpc(1191, 1, nMapIdx, TB_TOTEMPOLE_POS[1][1] * 32, TB_TOTEMPOLE_POS[1][2] * 32, 1, "C閠 bi觰 tng bang h閕")--右
			TONG_ApplySetTaskValue(nTongID, TONGTSK_TOTEMINDEX[1], nNpcIndex1)
			SetNpcScript(nNpcIndex1, "\\script\\tong\\npc\\tong_totempole.lua")
			local nNpcIndex2 = AddNpc(1192, 1, nMapIdx, TB_TOTEMPOLE_POS[2][1] * 32, TB_TOTEMPOLE_POS[2][2] * 32, 1, "C閠 bi觰 tng th祅h th")--左
			TONG_ApplySetTaskValue(nTongID, TONGTSK_TOTEMINDEX[2], 0)
			SetNpcScript(nNpcIndex2, "\\script\\tong\\npc\\city_totempole.lua")
			local nStuntID = TONG_GetTaskValue(nTongID, TONGTSK_STUNT_ID)
			local nCitySTID = tong_GetCityStuntID(nTongID)
			if (nStuntID ~= 0 and nCitySTID ~= 0) then
				AddNpcSkillState(nNpcIndex1, TB_STUNTID_INFO[nStuntID].skillid, 1, 1, 18*60*60*24*30)
				AddNpcSkillState(nNpcIndex2, TB_STUNTID_INFO[nCitySTID].skillid, 1, 1, 18*60*60*24*30)
			end
		end
	return 1
end

-- GameSvr帮会模块释放
function RELEASE_G()
	--处理数据缓存
	local nTongID = TONG_GetFirstTong()
	while nTongID ~= 0 do
		--帮会基金
		local nCurValue = TONG_GetTaskTemp(nTongID, TONG_FUNDTEMP)
		TongFundAdd(nTongID,  nCurValue)
		TONG_SetTaskTemp(nTongID, TONG_FUNDTEMP, 0)
		nTongID = TONG_GetNextTong(nTongID)
	end
	return 1
end

-- 进入帮会地图
function ENTER_TONG_MAP_G(nTongID)
	if (GetLevel() < 10) then
		Msg2Player("Ngi ch琲 c蕄 10 tr� l猲 m韎 c� th� bc v祇 l穘h a bang h閕!");
		return 0;
	end
	local dwSelfMapID = SubWorldIdx2ID(SubWorld);
	if (GetFightState() == 1 or (IsCityMap(dwSelfMapID) ~= 1 and IsFreshmanMap(dwSelfMapID) ~= 1 and IsTongMap(dwSelfMapID) ~= 1)) then
		Msg2Player("Ch� c� th� 甶 v祇 l穘h a bang h閕 t� nh鱪g khu v鵦 phi chi課 u!");
		return 0;
	end
	local szTongName = TONG_GetName(nTongID);
	if (szTongName == nil or szTongName == "") then
		Msg2Player("Bang h閕 n祔 kh玭g t錸 t筰, kh玭g th� v祇 khu v鵦 bang!");
		return 0;
	end
	local _,SelfTong = GetTongName()
--	if (SelfTong ~= nTongID)then
--		if TONG_GetTongMapBan(nTongID) ~= 0 then
--			Msg2Player(szTongName.." 没有开放地图禁制，无法进入！");
--	 		return 0;
--		end
--	end
	local dwTargetMapID = TONG_GetTongMap(nTongID);
	if (dwTargetMapID <= 0) then
		Msg2Player(szTongName.." Kh玭g c� khu v鵦 bang h閕, kh玭g th� 甶 v祇!");
	 	return 0;
	end
	if (dwTargetMapID == dwSelfMapID) then
		Msg2Player("B筺 產ng ng t筰 khu v鵦 n祔 r錳!");
		return 0;
	end
	local nMapCopy = TONG_GetTongMapTemplate(nTongID)
	local pos = GetMapEnterPos(nMapCopy)
	NewWorld(dwTargetMapID, pos.x, pos.y);	-- 以后地图进入点最好作为地图的一个属性
end

--设置地图
function CONFIGURE_TONG_MAP_G(nTongID)
	if (TONG_GetTongMap(nTongID) < DYNMAP_ID_BASE) then
		Msg2Player("Bang h閕 c� khu v鵦 ri猲g m韎 c� th� s� d鬾g ch鴆 n╪g n祔!")
		return 0		
	end
	local ban = TONG_GetTongMapBan(nTongID)
	local szBan = {[0]="Thi誸 l藀 c蕀 a/#SetTongMapBan("..nTongID..",1)",
				 [1]="H駓 b� c蕀 a/#SetTongMapBan("..nTongID..",0)"}
	local szState = {[0]="<color=green>Cho ph衟<color>",
				[1]="<color=red>Ng╪ c蕀<color>"}
	if (ban ~= 0)then
		ban = 1
	end	
	local szMsg = "C� th� l鵤 ch鋘 cho ph衟 hay ng╪ c蕀 th祅h vi猲 bang h閕 kh竎 th﹎ nh藀, t譶h tr筺g hi謓 t筰 l�:"
	Say(szMsg..szState[ban], 2, szBan[ban], "H駓 b�/#Cancel")
	return 1
end

function SetTongMapBan(nTongID, bOpen)
	TONG_ApplySetTongMapBan(nTongID, bOpen)
	local szExcutor = GetName();
	local szState = {[0]="Cho ph衟",
				[1]="Ng╪ c蕀"}	
	local szMsg = szExcutor.." Thay i t譶h tr筺g khu v鵦 th祅h: "..szState[bOpen]
	Msg2Player("Thi誸 l藀 th祅h c玭g!")
	TONG_ApplyAddEventRecord(nTongID, szMsg);
end

MAP_BAN_R = DefFun2
MAP_BAN_G_1 = DefFun2
function MAP_BAN_G_2(nTongID, bBan)
	local nMap = TONG_GetTongMap(nTongID)
	if (nMap <= DYNMAP_ID_BASE)then
		return 1
	end
	nMap = SubWorldID2Idx(nMap)
	if(bBan == 1 and nMap >= 0)then
		local nMapCopy = SubWorldIdx2MapCopy(nMap)
		local nPlayer = GetFirstPlayerAtSW(nMap)
		while(nPlayer > 0)do
			PlayerIndex = nPlayer
			local _,b = GetTongName()
			if (b ~= nTongID)then
				SetFightState(0)
				local pos = GetMapEnterPos(nMapCopy)
				SetPos(pos.x, pos.y)
				Msg2Player("Khu v鵦 n祔  頲 thi誴 l藀 c蕀 a, kh玭g th� bc v祇!")
			end
			nPlayer = GetNextPlayerAtSW(nMap)
		end
	end
	return 1
end

function CITY_OCCUPY_R(nOwner, nPreOwner, nCityMap)
	TONG_ApplySetOccupyCityDay(nOwner, TONG_GetDay(nOwner));
	if (nPreOwner == 0)then
		return 1
	end
	TONG_ApplySetOccupyCityDay(nPreOwner, 0);
	--失去城池，5级帮降为4级
	if (TONG_GetBuildLevel(nPreOwner) >= 5) then
		TONG_ApplyDegrade(nPreOwner)
		local szMsg="Bang h閕 b� m蕋 th祅h, ng c蕄 ki課 thi誸 bang gi秏 xu鑞g c蕄 4"
		Msg2Tong(nPreOwner, szMsg)
		TONG_ApplyAddEventRecord(nPreOwner, szMsg);	
	end
	cTongLog:WriteInfTB("TONG", "occupy_city", nOwner, {preowner = nPreOwner, city = nCityMap});
	return 1
end

--帮会特技
--TONGTSK_STUNT_ID = 1011
--stunt开启/设置帮会特技
function CONFIGURE_TONG_STUNT_G()
	local _, nTongID = GetTongName()
	local nStuntID = TONG_GetTaskValue(nTongID, TONGTSK_STUNT_ID)
	if (nStuntID == 0) then	--没有开启特技
		Describe("H穣 l鵤 ch鋘 k� n╪g c bi謙 cho bang: ", 8,
					TB_STUNTID_INFO[1].name.."/StuntConfirm",
					TB_STUNTID_INFO[2].name.."/StuntConfirm",
					TB_STUNTID_INFO[3].name.."/StuntConfirm",
					TB_STUNTID_INFO[4].name.."/StuntConfirm",
					TB_STUNTID_INFO[5].name.."/StuntConfirm",
					TB_STUNTID_INFO[6].name.."/StuntConfirm",
					TB_STUNTID_INFO[7].name.."/StuntConfirm",
					"Ch� i thi誸 l藀/Cancel"		)
	else
		local szMsg = "K� n╪g hi謓 t筰 c馻 bang h閕 l�: "..
						"<enter><color=yellow>    "..TB_STUNTID_INFO[nStuntID].name.."<color>"..
						"<enter>Quy襫 ti誴 nh薾 k� n╪g: "..
						"<enter><color=yellow>    "..TB_STUNT_RIGHT_DS[TB_STUNTID_INFO[nStuntID].right].."<color>"..
						"<enter>Chi ph� b秓 tr� c k�:"..
						"<enter><color=yellow>    "..(TB_STUNTID_INFO[nStuntID].consume).." v筺 ti襫 chi課 b�".."<color>"..
						"<enter>T竎 d鬾g c馻 k� n╪g c bi謙:"..
						"<enter><color=yellow>    "..TB_STUNTID_INFO[nStuntID].describe.."<color>"
		szMsg = szMsg ..getStuntHelp(nStuntID, TB_STUNTID_INFO[nStuntID].right, TB_STUNTID_INFO[nStuntID].cycle, TB_STUNTID_INFO[nStuntID].maxmem)
		Describe(szMsg, 3, "Thay i k� n╪g/#CHANGE_STUNT_G_1("..nTongID..")", "B秓 tr� k� n╪g m� (t筸 ng璶g)/#PAUSED_STUNT_G_1("..nTongID..")", "R阨 kh醝/OnCancel")
	end
end

function PAUSED_STUNT_G_1(nTongID)
	local nPause = TONG_GetTaskValue(nTongID, TONGTSK_STUNT_PAUSE)
	local nswitch = 0
	local szMsg = ""
	if (nPause < 0 and nPause >= 4) then
		nPause = 0
		TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_PAUSE, nPause)
	end
	szMsg = "Tr筺g th竔 k� n╪g hi謓 t筰 c馻 bang l�:  "..TB_STUNT_PAUSESTATE[nPause][1].."<enter>Л頲 a v祇 b秓 tr� h祅g tu莕: "..TB_STUNT_PAUSESTATE[nPause][2]
	nswitch = TB_STUNT_PAUSESTATE[nPause][3]
	Describe(szMsg.."<enter>Ngi ng � ch�?", 2, "M�(ng)/#Paused_Stunt_Sure("..nTongID..","..nswitch..")", "H駓 b�/Cancel")
	return 1
end

function Paused_Stunt_Sure(nTongID, nSwitch)
	TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_PAUSE, nSwitch)
	if (nSwitch == 1 or nSwitch == 3) then
		Msg2Player("Tr筺g th竔 k� n╪g c馻 bang tu莕 sau s� i th祅h:  "..TB_STUNT_PAUSESTATE[nSwitch][2])
	else
		Msg2Player("Tr筺g th竔 k� n╪g c馻 bang tu莕 sau s� i th祅h:  "..TB_STUNT_PAUSESTATE[nSwitch][2])
	end
end

function StuntConfirm(nSel)
	local nStuntID = nSel + 1
	local szMsg = "K� n╪g 頲 ch鋘 hi謓 t筰 l�:"..
					"<enter><color=yellow>    "..TB_STUNTID_INFO[nStuntID].name.."<color>"..
					"<enter>Quy襫 ti誴 nh薾 k� n╪g: "..
					"<enter><color=yellow>    "..TB_STUNT_RIGHT_DS[TB_STUNTID_INFO[nStuntID].right].."<color>"..
					"<enter>Chi ph� b秓 tr� c k�:"..
					"<enter><color=yellow>    "..(TB_STUNTID_INFO[nStuntID].consume).." v筺 ti襫 chi課  b�<color>"..
					"<enter>T竎 d鬾g c馻 k� n╪g c bi謙:"..
					"<enter><color=yellow>    "..TB_STUNTID_INFO[nStuntID].describe.."<color>"
	szMsg = szMsg ..getStuntHelp(nStuntID, TB_STUNTID_INFO[nStuntID].right, TB_STUNTID_INFO[nStuntID].cycle, TB_STUNTID_INFO[nStuntID].maxmem)
	Describe(szMsg, 3, "уng � ch鋘/#StuntSureConfirm("..nStuntID..")", "Tr� v�/CONFIGURE_TONG_STUNT_G", "R阨 kh醝/OnCancel")
end

function getStuntHelp(nStuntID, nRight, nCycle, nMaxMem)
	local szMsg = ""
	if (nRight == 1) then
		szMsg = "<enter>K� n╪g hi謓 t筰 s� k衞 d礽 trong m閠 tu莕, trong kho秐g th阨 gian n祔 ch� c� th� nh薾 "..nMaxMem.." l莕."
	else
		szMsg = "<enter>K� n╪g hi謓 t筰 s� k衞 d礽 trong m閠 tu莕, trong kho秐g th阨 gian n祔 ch� c� th� nh薾 1 l莕 k� n╪g, ch� cho ph衟 "..nMaxMem.." ngi nh薾."
	end
	return szMsg
end

function CHANGE_STUNT_G_1(nTongID)
	local nStuntID = TONG_GetTaskValue(nTongID, TONGTSK_STUNT_ID)
	local nSwith = TONG_GetTaskValue(nTongID, TONGTSK_STUNT_SWICTH)
	if (nStuntID ~= 0) then	
		local szMsg = "K� n╪g hi謓 t筰 c馻 bang h閕 l�: "..TB_STUNTID_INFO[nStuntID].name
		if (nSwith ~= 0 and nSwith ~= nStuntID) then
			szMsg = szMsg .."<enter>K� n╪g mu鑞 thay i l�: "..TB_STUNTID_INFO[nSwith].name
		else
			szMsg = szMsg .."<enter>K� n╪g mu鑞 thay i l� : [kh玭g c鉣"
		end
		szMsg = szMsg ..getStuntHelp(nStuntID, TB_STUNTID_INFO[nStuntID].right, TB_STUNTID_INFO[nStuntID].cycle, TB_STUNTID_INFO[nStuntID].maxmem)
		szMsg = szMsg.."<enter>Mu鑙 thay i sang k� n╪g n祇?"
		
		Describe(szMsg, 8,
					TB_STUNTID_INFO[1].name.."/ChangeStuntConfirm",
					TB_STUNTID_INFO[2].name.."/ChangeStuntConfirm",
					TB_STUNTID_INFO[3].name.."/ChangeStuntConfirm",
					TB_STUNTID_INFO[4].name.."/ChangeStuntConfirm",
					TB_STUNTID_INFO[5].name.."/ChangeStuntConfirm",
					TB_STUNTID_INFO[6].name.."/ChangeStuntConfirm",
					TB_STUNTID_INFO[7].name.."/ChangeStuntConfirm",
					"Ch� i thi誸 l藀/Cancel"		)
	end
	return 1
end

function ChangeStuntConfirm(nSel)
	local _, nTongID = GetTongName()
	local nStuntID = nSel + 1
	local szMsg = "K� n╪g 頲 ch鋘 hi謓 t筰 l�:"..
					"<enter><color=yellow>    "..TB_STUNTID_INFO[nStuntID].name.."<color>"..
					"<enter>Quy襫 ti誴 nh薾 k� n╪g: "..
					"<enter><color=yellow>    "..TB_STUNT_RIGHT_DS[TB_STUNTID_INFO[nStuntID].right].."<color>"..
					"<enter>Chi ph� b秓 tr� c k�:"..
					"<enter><color=yellow>    "..(TB_STUNTID_INFO[nStuntID].consume).." v筺 ti襫 chi課  b�<color>"..
					"<enter>T竎 d鬾g c馻 k� n╪g c bi謙:"..
					"<enter><color=yellow>    "..TB_STUNTID_INFO[nStuntID].describe.."<color>";
	szMsg = szMsg ..getStuntHelp(nStuntID, TB_STUNTID_INFO[nStuntID].right, TB_STUNTID_INFO[nStuntID].cycle, TB_STUNTID_INFO[nStuntID].maxmem)
	Describe(szMsg, 3, "уng � ch鋘/#StuntSureConfirm("..nStuntID..")", "Tr� v�/#CHANGE_STUNT_G_1("..nTongID..")", "R阨 kh醝/OnCancel")
end

function StuntSureConfirm(nStuntID)
	local _, nTongID = GetTongName()
	TONG_ApplySetStunt(nTongID, nStuntID)
end

function STUNT_SET_R(nTongID, nStuntID)
	local szExecutorName = TONGM_GetName(nTongID, ExecutorId)
	if (TONG_GetBuildLevel(nTongID) < 4) then
		Msg2PlayerByName(szExecutorName, "Bang h閕 c蕄 di c蕄 4 kh玭g th� s� d鬾g k� n╪g c bi謙!");
		return 0
	end
	local nOldStuntID = TONG_GetTaskValue(nTongID, TONGTSK_STUNT_ID)
	-- 如果原来没有特技，则为启动特技（立即生效），否则为更改特技（维护后生效）
	if (nOldStuntID == 0) then
		local nday = TONG_GetDay(nTongID);
		TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_ID, nStuntID)
		TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD, TONG_GetWeek(nTongID))
		TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_MEMLIMIT, TB_STUNTID_INFO[nStuntID].maxmem)
		TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_ENABLED, 1)
		TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_PAUSE, 3)
		Msg2Tong(nTongID, "K� n╪g c bi謙 頲 m�, k� n╪g l� "..TB_STUNTID_INFO[nStuntID].name)
		TONG_ApplyAddEventRecord(nTongID, "K� n╪g c bi謙 頲 m�, k� n╪g l� "..TB_STUNTID_INFO[nStuntID].name)
	else
		TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_SWICTH, nStuntID)
		Msg2PlayerByName(szExecutorName, "Sau m閠 tu莕 th� k� n╪g s� i th祅h "..TB_STUNTID_INFO[nStuntID].name..".")
		return 0
	end
	cTongLog:WriteInfTB("TONG", "setstunt", nTongID, {stuntid = nStuntID});
	return 1
end
STUNT_SET_G_1	= DefFun2

function STUNT_SET_G_2(nTongID, nStuntID)
	if (nStuntID ~= 0) then
		for i = 1, getn(TONGTSK_TOTEMINDEX) do
			local nNpcIndex = TONG_GetTaskValue(nTongID, TONGTSK_TOTEMINDEX[i])
			if (nNpcIndex > 0) then
				for j=1, getn(TB_STUNTID_INFO) do
					RemoveNpcSkillState(nNpcIndex, TB_STUNTID_INFO[j].skillid)
				end
				AddNpcSkillState(nNpcIndex, TB_STUNTID_INFO[nStuntID].skillid, 1, 1, 18*60*60*24*30)
			end
		end
	end
end

---------客户端的全放在这。。。。。。。。。。。。
else
-----------------如果是客户端---------------
MONEYFUND_ADD_C_1 = DefFun2
MONEYFUND_ADD_C_2 = DefFun2
MONEYFUND2BUILDFUND_C_1 = DefFun2
MONEYFUND2BUILDFUND_C_2 = DefFun2
MAP_CREATED_C_1 = DefFun2
MAP_CREATED_C_2 = DefFun2
MAP_CREAE_C_1	= DefFun2
MAP_CREAT_C_2	= DefFun2
MAP_SET_C_1	= DefFun2
MAP_SET_C_1	= DefFun2
CONTRIBUTION2STOREOFFER_C_1 = DefFun3
CONTRIBUTION2STOREOFFER_C_2 = DefFun3
BUILDFUND2WARFUND_C_1 = DefFun2
BUILDFUND2WARFUND_C_2 = DefFun2
MONEY2BUILDFUND_C_1 = DefFun2
MONEY2BUILDFUND_C_2 = DefFun2
STOREOFFER2CONTRIBUTION1_C_1 = DefFun3
STOREOFFER2CONTRIBUTION1_C_2 = DefFun3
STOREOFFER2CONTRIBUTION2_C_1 = DefFun3
STOREOFFER2CONTRIBUTION2_C_2 = DefFun3
MEMBER_KICK_C_1 = DefFun3
MEMBER_KICK_C_2 = DefFun3
MEMBER_RETIRE_C_1 = DefFun3
MEMBER_RETIRE_C_2 = DefFun3
MEMBER_ONLINE_C_1 = DefFun3
MEMBER_ONLINE_C_2 = DefFun3
MEMBER_ADD_C_1 = DefFun3
MEMBER_ADD_C_2 = DefFun3
MEMBER_SETFIGURE_C_1 = DefFun3
MEMBER_SETFIGURE_C_2 = DefFun3
STUNT_SET_C_1	= DefFun2
STUNT_SET_C_2	= DefFun2

aPrompt= {"C� mu鑞 x﹜ d鵱g t竎 phng n祔 kh玭g?",
"C� mu鑞 h駓 b� t竎 phng n祔 kh玭g?",
"C� mu鑞 k輈h ho箃 t竎 phng n祔 kh玭g?",
"C� mu鑞 ng c鯽 t竎 phng n祔 kh玭g?",
"C� ng � n﹏g c蕄 t竎 phng n祔 kh玭g?",
"C� ng � 甶襲 ch豱h ng c蕄 s� d鬾g t竎 phng kh玭g?",
}
function GET_WORKSHOP_PROMPT(nTongID, nWorkshopID, nOpt)
	if (nOpt == 3)then
		return "Sau khi ng c鯽, mu鑞 k輈h ho箃 l筰 c莕 "..
		wsGetOpenCost(nTongID, TWS_GetType(nTongID, nWorkshopID), 
			TWS_GetUseLevel(nTongID, nWorkshopID)).." v筺 ti襫 ki課 thi誸, c� ng � ng c鯽 kh玭g?"
	end
	return aPrompt[nOpt+1]
end

end

-------------------公共的全放这。。。。。。。。。
-- 获取帮会建设基金周上限
function GET_WEEKBUILD_THRESHOLD(nTongID)
	return tongGetWeekBuildUpper(nTongID, TONG_GetBuildLevel(nTongID))
end

--周累积贡献度上限
function GET_WEEKLYOFFER_THRESHOLD()
	return MAX_WEEK_CONTRIBUTION
end

-- 获取帮会作坊数量上限	
function GET_WORKSHOP_COUNT_THRESHOLD(nTongID)
	return tongGetMaxWorkshopNum(nTongID, TONG_GetBuildLevel(nTongID))
end	

-- 获取帮会作坊等级上限
function GET_WORKSHOP_LEVEL_THRESHOLD(nTongID)
	return tongGetWorkshopUpperLevel(nTongID, TONG_GetBuildLevel(nTongID))
end

function GET_WORKSHOP_DATA(nTongID, nWorkshopID, nFlag)
	if (nFlag == 0)then
		return wsGetOpenCost(nTongID, TWS_GetType(nTongID, nWorkshopID), TWS_GetUseLevel(nTongID, nWorkshopID))
	end
	return 0
end

-- 取消
function Cancel()
end
