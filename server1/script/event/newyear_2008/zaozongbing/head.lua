--制作物品lib
--by 小浪多多
--2007-09-06
newyear2008_makezongzi = {}
tbclassname = newyear2008_makezongzi
tbclassname.TITLE = "L祄 b竛h ch璶g"
tbclassname.DA_START = 0802020000	--开始时间
tbclassname.DA_END 	= 0803022400	--结束时间
tbclassname.LIMIT_LEVEL = 50		--等级限制

--月饼制作需要材料
tbclassname.tb_Mareial =
{
	select1 = {
		{G=6,D=1,P=1662,szname="B竛h ch璶g thng h筺g",num=1,nMoney=0},
		{G=6,D=1,P=1653,szname="L� b竛h",num=4},
		{G=6,D=1,P=1654,szname="G筼 n誴",num=3},
		{G=6,D=1,P=1655,szname="u xanh",num=2},
		{G=6,D=1,P=1656,szname="Th辴 heo ",num=1},
		{G=6,D=1,P=1660,szname="B� quy誸 l祄 b竛h ch璶g thng h筺g",num=1},
		},
	select2 = {
		{G=6,D=1,P=1663,szname="B竛h ch璶g h秓 h筺g",num=1,nMoney=0},
		{G=6,D=1,P=1653,szname="L� b竛h",num=4},
		{G=6,D=1,P=1654,szname="G筼 n誴",num=3},
		{G=6,D=1,P=1655,szname="u xanh",num=2},
		{G=6,D=1,P=1656,szname="Th辴 heo ",num=1},
		{G=6,D=1,P=1661,szname="B� quy誸 l祄 b竛h ch璶g h秓 h筺g",num=1}
		},
	select3 = {
		{G=6,D=1,P=1664,szname="B竛h ch璶g thng",num=1,nMoney=20000},
		{G=6,D=1,P=1653,szname="L� b竛h",num=4},
		{G=6,D=1,P=1654,szname="G筼 n誴",num=3},
		{G=6,D=1,P=1655,szname="u xanh",num=2},
		{G=6,D=1,P=1656,szname="Th辴 heo ",num=1},
		},
--	select4 = {
--		{G=6,D=1,P=1513,szname="烤猪月饼",num=1,nMoney=200000},
--		{G=6,D=1,P=1503,szname="粉包",num=4},
--		{G=6,D=1,P=1504,szname="糖包",num=4},
--		{G=6,D=1,P=1505,szname="鸡蛋包",num=4},
--		{G=6,D=1,P=1509,szname="猪肉包",num=1},
--		},
--	select5 = {
--		{G=6,D=1,P=1514,szname="月饼礼盒",num=1,nMoney=300000},
--		{G=6,D=1,P=1510,szname="绿豆月饼",num=1},
--		{G=6,D=1,P=1511,szname="莲子月饼",num=1},
--		{G=6,D=1,P=1512,szname="烤鸡月饼",num=1},
--		{G=6,D=1,P=1513,szname="烤猪月饼",num=1},
--		},		
}

tbclassname.tb_content =
{
	sztalk1 = "Th� b竛h: ng r秐h, d筼 n祔 sau ta kh玭g c� vi謈 g� l祄 nh�!",
	sztalk2 = "Th� b竛h: Th阨 gian qua th藅 nhanh, ch韕 m総  n t誸 r錳, tay ngh� l祄 b竛h ch璶g c馻 ta v蒼 n鎖 ti課g x璦 nay. M鏸 n╩ u kh玭g 輙 ngi n nh� ta l祄 gi飉, v� kh竎h quan n祔 ch糿g hay mu鑞 l祄 lo筰 n祇?",
	nselectsum = 3,
	szselect1 = format("Ta mu鑞 l祄 1 c竔 %s/#tbclassname:getmakeitemsign(1)",tbclassname.tb_Mareial.select1[1].szname),
	szselect2 = format("Ta mu鑞 l祄 1 c竔 %s/#tbclassname:getmakeitemsign(2)",tbclassname.tb_Mareial.select2[1].szname),
	szselect3 = format("Ta mu鑞 l祄 1 c竔 %s/#tbclassname:getmakeitemsign(3)",tbclassname.tb_Mareial.select3[1].szname),
	szno = "Nh﹏ ti謓 gh� qua th玦/NoChoice",
	szmakeItemUI = "ng! Xin l穙 b鑙 tr� t礽!/#tbclassname:makeItemUI(%d)",
	szlevel = "Th藅 ng ti誧, ng c蕄 kh玭g  50, kh玭g th� tham gia ho箃 ng n祔.",
	szmoney = "Th藅 ng ti誧, ng﹏ lng mang theo kh玭g .",
	szpay = "Xin l鏸, t礽 kho秐 c馻 b筺 ch璦 n筽 th�, kh玭g th� thng th鴆 v� ch� t筼 b竛h ch璶g th琺 ngon.",
	szremake = "Tr� l筰/main",
	szitemfree="Kh玭g  ch� tr鑞g, h穣 s緋 x誴 l筰 h祅h trang."
	
}

function tbclassname:funmsg(nsign)
		local szselect = tbclassname:getTaskItemName(nsign)
		local tbtemp = tbclassname.tb_Mareial[szselect]
		local szmsg = format("Ch骳 m鮪g b筺  nh薾 頲 %d <color=yellow>%s<color>.",
							 tbtemp[1].num,
							 tbtemp[1].szname)
		return szmsg
end

function tbclassname:funtalkmake(nsign)
	local sztalkmake = tbclassname:funtalkmareial(nsign)
	sztalkmake = format("%s, b筺 mu鑞 l祄 kh玭g?",sztalkmake)
	return sztalkmake
end

function tbclassname:funtalkmlimit(nsign)
		local sztalkmake = tbclassname:funtalkmareial(nsign)
		sztalkmake = format("%s thi誹 kh玭g th� l祄. H譶h nh� nguy猲 li謚 l祄 b竛h ch璶g kh玭g .",sztalkmake)
		return sztalkmake
end

function tbclassname:funtalkmareial(nsign)
		local szselect = tbclassname:getTaskItemName(nsign)
		local tbtemp = tbclassname.tb_Mareial[szselect]
		for ni,nitem in tbtemp do
			if ni ==1 then
					sztalkmake = format("Th� b竛h: Mu鑞 l祄 %d c竔 <color=red>%s<color>, c莕 ",
							 	tbtemp[1].num,
							 	tbtemp[1].szname)
			else
				  sztalkmake = format("%s%d c竔 <color=red>%s<color>, ",
						  	sztalkmake,
						  	tbtemp[ni].num,
						  	tbtemp[ni].szname)
			end
		end
		if tbtemp[1].nMoney > 0 then
					sztalkmake = format("%s<color=red>%d<color>,",
							sztalkmake,
							tbtemp[1].nMoney)
		end
		return sztalkmake
end

function tbclassname:check_event_date()
	local ndate = tonumber(GetLocalDate("%y%m%d%H%M"))
	if ( ( ndate > tbclassname.DA_START ) and ( ndate < tbclassname.DA_END ) ) then
		return 1
	end
	return 0
end

function tbclassname:check_level()		--判断等级
	if GetLevel() < tbclassname.LIMIT_LEVEL then
		return 0
	end 
	return 1
end

function tbclassname:check_money(nsign)		--判断钱
	szselect = tbclassname:getTaskItemName(nsign)
	if GetCash() < tbclassname.tb_Mareial[szselect][1].nMoney then
		return 0
	end
	return 1
end

function tbclassname:check_pay()		--判断充值用户
	if GetExtPoint(0) <= 0 then
		return 0
	end 
	return 1
end

function tbclassname:pack(...)
	return arg
end

function tbclassname:getTaskItemName(nsign)		--获得tb类别名
	return format("select%s",nsign)
end

function tbclassname:checkFreeCount(ncount) --判断身上剩余格数
	if CalcFreeItemCellCount() < ncount then
		return 0
	end
	return 1
end