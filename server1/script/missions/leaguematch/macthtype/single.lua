Include("\\script\\missions\\leaguematch\\tb_head.lua")
--==============混合单人赛相关数据===============

if (not tmp_process_data) then
	return
end

--全部混合单人赛相关数据
WLLS_DATA = {
	
	name = "Кn u t� do",
	
	--地图信息
	match_type = {
		{
			name = "",
			level = 1,
			ladder = 10235,
			map = {
				{396, 560, 397, "(1)"},
				{398, 561, 399, "(2)"},
				{400, 562, 401, "(3)"},
				{402, 563, 403, "(4)"},
				{404, 564, 405, "(5)"},
				{406, 565, 407, "(6)"},
				{408, 566, 409, "(7)"},
				{410, 567, 411, "(8)"},
			},
		},
		{
			name = "",
			level = 2,
			ladder = 10236,
			map = {
				{540, 570, 541, "(1)"},
				{542, 571, 543, "(2)"},
				{544, 572, 545, "(3)"},
				{546, 573, 547, "(4)"},
				{548, 574, 549, "(5)"},
				{550, 575, 551, "(6)"},
				{552, 576, 553, "(7)"},
				{554, 577, 555, "(8)"},
			},
		},
	},
	
	award_rank = {
		{	--排行奖励，新秀
			{1, 4000},	--第1名
			{2, 3000},	--第2名
			{3, 2500},	--第3名
			{4, 2000},	--第4名
			{8, 1750},	--第5-8名
			{16, 1500},	--第9-16名
			{32, 1250},	--第17-32名
			{64, 1000},	--第33-64名
			{128, 750},	--第65-128名
			{256, 500},	--第129-256名
			{512, 250},	--第257-512名
		}, {	--联赛
			{1, 8000},	--第1名
			{2, 6000},	--第2名
			{3, 5000},	--第3名
			{4, 4000},	--第4名
			{8, 3500},	--第5-8名
			{16, 3000},	--第9-16名
			{32, 2500},	--第17-32名
			{64, 2000},	--第33-64名
			{128, 1500},--第65-128名
			{256, 1000},--第129-256名
			{512, 500},	--第257-512名
		}
	},
	
	max_member = 1,	--每个战队的最大人数
	
	text_main = {	--officer主对话（末尾差异部分）
		"L莕 n祔 l� n u t� do, c竎 hi謕 kh竎h h穣 c� g緉g luy謓 t藀, ch� ngay vinh quy",
		"L莕 n祔 l� n u t� do, c竎 hi謕 kh竎h h穣 c� g緉g luy謓 t藀, ch� ngay vinh quy",
	},
	
	--====Functions====
	--我的战队
	npc_mylg = function()
		local str_des = wlls_get_desc(1)
		local n_lid, n_mtype, n_job, str_lgname, n_memcount = wlls_lg_info()
		if (FALSE(n_lid)) then
			wlls_descript("<enter>  L莕 n祔"..str_des.."l� <color=red>n u t� do<color>, kh玭g c莕 ph秈 l藀 chi課 i. H� th鑞g s� ghi nh� l莕 thi u u ti猲 c馻 b筺")
			return
		end
	
		local n_mytype = LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE)
		local n_level, n_group = wlls_getcityinfo()
		local n_next = GetGlbValue(GLB_WLLS_NEXT)
		local str = "<enter>Chi課 i c馻 b筺 hi謓 l�:<color=yellow>"..str_lgname.."<color><enter>"
		if (n_mytype ~= n_next) then
			str = str .. "<enter>   <color=yellow>Ch� �: H筺 ch� thi u m颽 sau l� <color><color=red>"..WLLS_TAB[n_next].name.."<color><color=yellow>, n誹 mu鑞 thi u m颽 sau, xin h穣 l藀 chi課 i m韎.<color><enter>"
		end
		local tb_option = {}
		str = str.."<enter>   Trong th阨 gian <color=red>t筸 ngh�<color> ho芻 <color=red>ch璦 tham gia thi u m颽 trc<color>, b筺 c� th� r阨 chi課 i, chi課 i s� t� ng gi秈 t竛<color>."
		tb_option[getn(tb_option)+1] = "R阨 kh醝 i/wlls_want2leaveleague"
		tb_option[getn(tb_option)+1] = "Xem chi課 t輈h c馻 i/wlls_query_mylg"
		tb_option[getn(tb_option)+1] = "Ta ch� ti謓 gh� qua/OnCancel"
		wlls_descript(str, tb_option)
	end,
	
	--检查当前角色是否可以加入指定的战队
	check_addmem = function(n_capidx, n_lid, n_mtype)
		return "Kh玭g th� gia nh藀 i n u!"
	end,
	
}	--WLLS_DATA

tmp_process_data(WLLS_DATA)	
wllstab_additem(5,WLLS_DATA)
