Include("\\script\\global\\login_head.lua")
-- 120级技能任务头文件

LV120_SKILL_STATE = 2450	-- 存放当前任务状态的全局任务变量，初始值为1，为0表示任务已经完成
LV120_SKILL_ID = 2463		-- 纪⒓玩家120级技能ID
LOCK_MAP_SEQUENCE =		-- 存放解锁图顺序的全局任务变量
{
	{2451, 2452, 2453, 2454, 2455, 2456},	-- 第一重锁解锁图顺序
	{2457, 2458, 2459, 2460, 2461, 2462},	-- 第二重锁解锁图顺序
}

DGJ_WULINMIJI	= {6, 1, 1120}	-- 不太寻常的武林秘籍
COFFIN_MAP		= {6, 1, 1119}	-- 汴京东部盛发点地图
COFFIN			= {6, 1, 1121}	-- 神秘棺木
LOCK_MAP1		= {6, 1, 1122}	-- 棺木解锁图 第一重锁
LOCK_MAP2		= {6, 1, 1123}	-- 棺木解锁图 第二重锁
CADAVER			= {6, 1, 1124}	-- 奇异死尸
LV120SKILLBOOK	= {6, 1, 1125}	-- 120级技能诀要

COFFIN_POSITION = {37, 1832, 3439, 6, 6}	-- 棺材所在位置{地图, X坐标, Y坐标, X误差, Y误差}

LV120SKILL_NEW_NPC =	-- 孝建NPC列表
{	-- 格式 {NpcId, MapId, X, Y, Name, Script},
	{1203, 57, 1583, 3203, "Skill 120", "\\script\\task\\lv120skill\\npc\\衡山大厅_独耿剑的武林秘籍.lua"},
}

ORG_WULIMIJI	= {6, 1, 26}		-- 普通的武林秘籍
BANRUOXINJING	= {6, 1, 12}		-- 般若心经
XISUIJING		= {6, 1, 22}		-- 洗髓经
XINGHONGBAOSHI	= {4, 353, 1}		-- 猩红宝石
CRYSTAL =
{
	{4, 238, 1},		-- 蓝水晶
	{4, 239, 1},		-- 紫水晶
	{4, 240, 1},		-- ⑻水晶
}
BLUE_C = 1
PURPLE_C = 2
GREEN_C = 3

LOCK_MAP1_KEY =			-- 第一重锁答案
{
	{1,  CRYSTAL[GREEN_C]},
	{3,  CRYSTAL[PURPLE_C]},
	{11, CRYSTAL[BLUE_C]},
	{14, CRYSTAL[BLUE_C]},
	{22, CRYSTAL[PURPLE_C]},
	{24, CRYSTAL[GREEN_C]},
}

LOCK_MAP2_KEY =			-- 第二重锁答案
{
	{2,  CRYSTAL[GREEN_C]},
	{6,  CRYSTAL[PURPLE_C]},
	{10, CRYSTAL[BLUE_C]},
	{15, CRYSTAL[BLUE_C]},
	{19, CRYSTAL[GREEN_C]},
	{23, CRYSTAL[PURPLE_C]},
}

FACTION_TEXT = 			-- 门派系关文本定义
{
	[0] = {"<link=image[0,14]:\\spr\\npcres\\enemy\\enemy037\\enemy037_pst.spr>", "Huy襫 Nh﹏ Phng Trng", "Phng Trng"}, -- thi觰 l﹎ 
 [1] = {"<link=image[0,11]:\\spr\\npcres\\enemy\\enemy084\\enemy084_pst.spr>", "Dng Anh", "Bang Ch�"}, -- thi猲 vng 
[2] = {"<link=image[0,13]:\\spr\\npcres\\enemy\\enemy077\\enemy077_pst.spr>", "Л阯g C鮱", "Chng m玭"}, -- 阯g m玭 
[3] = {"<link=image[0,12]:\\spr\\npcres\\enemy\\enemy091\\enemy091_pst.spr>", "H綾 Di謓 Lang Qu﹏", "Gi竜 Ch�"}, -- ng� c 
[4] = {"<link=image[0,11]:\\spr\\npcres\\enemy\\enemy055\\enemy055_pst.spr>", "Thanh Hi觰 S� Th竔", "Chng m玭"}, -- nga mi 
[5] = {"<link=image[0,9]:\\spr\\npcres\\enemy\\enemy098\\enemy098_pst.spr>", "Du蒼 H祄 An", "Chng m玭"}, -- th髖 y猲 
[6] = {"<link=image[0,19]:\\spr\\npcres\\enemy\\enemy071\\enemy071_pst.spr>", "H� Nh﹏ Ng�", "Bang ch�"}, -- c竔 bang 
[7] = {"<link=image[0,9]:\\spr\\npcres\\enemy\\enemy103\\enemy103_pst.spr>", "Ho祅 Nhan H錸g Li謙", "Gi竜 ch�"}, -- thi猲 nh蒼 
[8] = {"<link=image[0,13]:\\spr\\npcres\\enemy\\enemy046\\enemy046_pst.spr>", " o nh蕋 ch﹏ nh﹏ ", "Chng m玭"}, -- v� 琻g 
[9] = {"<link=image[0,22]:\\spr\\npcres\\enemy\\enemy065\\enemy065_pst.spr>", "To祅 C� T�", "Chng m玭"}, -- c玭 l玭
}

FACTION_BOOK =			-- 门派技能书
{
	[0] = {{6, 1, 56}, {6, 1, 57}, {6, 1, 58}},				-- 少林
	[1] = {{6, 1, 37}, {6, 1, 38}, {6, 1, 39}},				-- 天王
	[2] = {{6, 1, 27}, {6, 1, 28}, {6, 1, 45}, {6, 1, 46}},	-- 唐门
	[3] = {{6, 1, 47}, {6, 1, 48}, {6, 1, 49}},				-- 五毒
	[4] = {{6, 1, 42}, {6, 1, 43}, {6, 1, 59}},				-- 峨嵋
	[5] = {{6, 1, 40}, {6, 1, 41}},							-- 翠烟
	[6] = {{6, 1, 54}, {6, 1, 55}},							-- 丐帮
	[7] = {{6, 1, 35}, {6, 1, 36}, {6, 1, 53}},				-- 天忍
	[8] = {{6, 1, 33}, {6, 1, 34}},							-- 武当
	[9] = {{6, 1, 50}, {6, 1, 51}, {6, 1, 52}},				-- 昆⒇
}

DIALOG_UI_TEXT =			-- 对话UI显示
{
	{"<link=image[0,10]:\\spr\\npcres\\enemy\\enemy111\\enemy111_pst.spr>", "чc C� Ki誱"},			-- 1 独耿剑
	{"<link=image[0,9]:\\spr\\npcres\\passerby\\passerby040\\passerby040s2.spr>", "Xa phu bi謓 kinh"},	-- 2 汴京车夫
	{"<link=image[0,9]:\\spr\\npcres\\passerby\\passerby072\\passerby072s1.spr>", "C� Th莕 To竛"},	-- 3 贾神算
	{"<link=image:\\spr\\Ui3\\120级技能任务\\task_wulin.spr>", "V� l﹎ b� t辌h"},						-- 4 不寻常的武林秘籍
	{"<link=image:\\spr\\Ui3\\120级技能任务\\bianjing_southeast.spr>", "Bi謓 kinh ng b� s� ph竧 甶觤 a "},	-- 5 汴京东部盛发点地图
	{"<link=image:\\spr\\Ui3\\120级技能任务\\task_coffin.spr>", "Th莕 B� Quan M閏"},					-- 6 神秘棺木
	{"<link=image:\\spr\\Ui3\\120级技能任务\\task_lockinfo.spr>", "Quan M閏 Gi秈 T醓 у"},				-- 7 棺木解锁图
	{"<link=image:\\spr\\Ui3\\120级技能任务\\task_corpse.spr>", "K� D� T� Thi"},					-- 8 奇异死尸（运功前）
	{"<link=image:\\spr\\Ui3\\120级技能任务\\task_corpse1.spr>", "K� D� T� Thi"},					-- 9 奇异死尸（运功后）
	{"<link=image:\\spr\\Ui3\\120级技能任务\\task_stunt.spr>", "K� N╪g 120"},				-- 10 120级技能决要
	{"<link=image:\\spr\\Ui3\\120级技能任务\\机关锁1-01.spr>", "M秐h v鬾 1 quan m閏 gi秈 t醓 "},			-- 11-16 棺木解锁图一 碎片
	{"<link=image:\\spr\\Ui3\\120级技能任务\\机关锁1-02.spr>", "M秐h v鬾 1 quan m閏 gi秈 t醓 "},
	{"<link=image:\\spr\\Ui3\\120级技能任务\\机关锁1-03.spr>", "M秐h v鬾 1 quan m閏 gi秈 t醓 "},
	{"<link=image:\\spr\\Ui3\\120级技能任务\\机关锁1-04.spr>", "M秐h v鬾 1 quan m閏 gi秈 t醓 "},
	{"<link=image:\\spr\\Ui3\\120级技能任务\\机关锁1-05.spr>", "M秐h v鬾 1 quan m閏 gi秈 t醓 "},
	{"<link=image:\\spr\\Ui3\\120级技能任务\\机关锁1-06.spr>", "M秐h v鬾 1 quan m閏 gi秈 t醓 "},
	{"<link=image:\\spr\\Ui3\\120级技能任务\\机关锁2-01.spr>", "M秐h v鬾 2 quan m閏 gi秈 t醓 "},			-- 17-22 棺木解锁图二 碎片
	{"<link=image:\\spr\\Ui3\\120级技能任务\\机关锁2-02.spr>", "M秐h v鬾 2 quan m閏 gi秈 t醓 "},
	{"<link=image:\\spr\\Ui3\\120级技能任务\\机关锁2-03.spr>", "M秐h v鬾 2 quan m閏 gi秈 t醓 "},
	{"<link=image:\\spr\\Ui3\\120级技能任务\\机关锁2-04.spr>", "M秐h v鬾 2 quan m閏 gi秈 t醓 "},
	{"<link=image:\\spr\\Ui3\\120级技能任务\\机关锁2-05.spr>", "M秐h v鬾 2 quan m閏 gi秈 t醓 "},
	{"<link=image:\\spr\\Ui3\\120级技能任务\\机关锁2-06.spr>", "M秐h v鬾 2 quan m閏 gi秈 t醓 "},
}

LV120SKILL_LIST =			-- 120级技能列表
{
	[0] = {709, 1, 0, 120, "K� N╪g 120", "Чi th鮝 nh� lai ch� "}, -- thi觰 l﹎ 
[1] = {708, 1, 1, 120, "K� N╪g 120", "Цo h� thi猲 "}, -- thi猲 vng 
[2] = {710, 1, 2, 120, "K� N╪g 120", "M辌h 秐h tung "}, -- 阯g m玭 
[3] = {711, 1, 3, 120, "K� N╪g 120", "H蕄 tinh y觤 "}, -- ng� c 
[4] = {712, 1, 4, 120, "K� N╪g 120", "B� nguy謙 ph藅 tr莕 "}, -- nga mi 
[5] = {713, 1, 5, 120, "K� N╪g 120", "Ng� quy誸 萵 "}, -- th髖 y猲 
[6] = {714, 1, 6, 120, "K� N╪g 120", "H錸 thi猲 kh� c玭g "}, -- c竔 bang 
[7] = {715, 1, 7, 120, "K� N╪g 120", "Ma ﹎ phi ph竎h "}, -- thi猲 nh蒼 
[8] = {716, 1, 8, 120, "K� N╪g 120", "Xu蕋 � b蕋 nhi詍 "}, -- v� 琻g 
[9] = {717, 1, 9, 120, "K� N╪g 120", "Lng nghi ch﹏ kh� "}, -- c玭 l玭
}

g_DescTable = {}		-- 全局临时对话字符串数组

function init_lv120skill()					-- 初始化任务
	if (GetTask(LV120_SKILL_STATE) == 0) then
		SetTask(LV120_SKILL_STATE, 1)
	end
	SyncTaskValue(LV120_SKILL_STATE)
	SyncTaskValue(LV120_SKILL_ID);
	lv120skill_debug()	-- 自动处理异常
end

function describe_talk(tDialog, szCall)		-- 对话函数
	local i = 0
	if (getn(tDialog) == 0) then return end
	repeat
		i = i + 1
	until (g_DescTable[i] == nil)
	g_DescTable[i] = tDialog
	if (szCall == nil) then szCall = "" end
	describe_basic(1, i, szCall)	
end

function describe_basic(nSeq, idxTable, szCallback)		-- 对话递归函数（内部）
	local tDialog = g_DescTable[idxTable]
	if (nSeq == getn(tDialog)) then
		if (szCallback == "") then
			Describe(tDialog[nSeq], 1, "K誸 th骳 i tho筰/quit")
		else
			Describe(tDialog[nSeq], 1, "Ti誴 t鬰 i tho筰/"..szCallback)
		end
		g_DescTable[idxTable] = nil
		return
	end
	Describe(tDialog[nSeq], 1, "Ti誴 t鬰 i tho筰 /#describe_basic("..(nSeq + 1)..", "..idxTable..", [["..szCallback.."]])")
end

function npc_string(nNpc, szDisplay, bFaction)			-- 获得NPC对玩家说话的字符串
	local tab = DIALOG_UI_TEXT[nNpc]
	if (bFaction ~= nil) then
		tab = FACTION_TEXT[nNpc]
	end
	return tab[1]..tab[2].."<link>:"..szDisplay
end

function speak_string(nNpc, szDisplay, bFaction)		-- 获得玩家对NPC所说话的字符串
	local tab = DIALOG_UI_TEXT[nNpc]
	if (bFaction ~= nil) then
		tab = FACTION_TEXT[nNpc]
	end
	return tab[1]..GetName().."<link>:"..szDisplay
end

function self_string(nNpc, szDisplay, bFaction)			-- 获得玩家自白字符串
	if (nNpc == 0) then		-- 0表示无图示
		return "<color=orange>"..szDisplay.."<color>"
	end
	local tab = DIALOG_UI_TEXT[nNpc]
	if (bFaction ~= nil) then
		tab = FACTION_TEXT[nNpc]
	end
	return tab[1].."<link><color=orange>"..szDisplay.."<color>"
end

function add_lv120skillnpc()			-- 添加任务NPC
	for i = 1, getn(LV120SKILL_NEW_NPC) do
		local Tab = LV120SKILL_NEW_NPC[i]
		local idxMap = SubWorldID2Idx(Tab[2]);
		if (idxMap >= 0) then
			local idxNpc = AddNpc(Tab[1], 1, idxMap, Tab[3] * 32, Tab[4] * 32, 1, Tab[5])
			SetNpcScript(idxNpc, Tab[6])
		end
	end
end

function generate_sequence(tab)			-- 生成随机序列

	local nCount = getn(tab)
	local temp, nSeq, bAct = {}, 0, 0

	for i = 1, nCount do
		tinsert(temp, i)
		if (GetTask(tab[i]) < 1) or (GetTask(tab[i]) > getn(tab)) then bAct = 1 end	-- 如果有不合法钡㈦则全部重建
	end

	if (bAct == 1) then
		for i = 1, nCount do
			nSeq = random(1, getn(temp))
			SetTask(tab[i], temp[nSeq])
			SyncTaskValue(tab[i])
			tremove(temp, nSeq)
		end
	end

end

function add_item(tab)							-- 添加道具
	return AddItem(tab[1], tab[2], tab[3], 1, 0, 0)
end

function display_clip(nLockMap, nSeq, szCall)	-- 显示一张碎片
	local nIndex = 10 + 6 * (nLockMap - 1) + GetTask(LOCK_MAP_SEQUENCE[nLockMap][nSeq])
	Describe(DIALOG_UI_TEXT[nIndex][1]..DIALOG_UI_TEXT[nIndex][2].."<link>", 2, "X竎 nh薾/"..szCall, "K誸 th骳 i tho筰/quit")
end

function lv120skill_report()					-- 向掌门报告情况
	local tDialog
	local nFaction = GetLastFactionNumber()
	local szCall = FACTION_TEXT[nFaction][3]
	if (nFaction == 0) or (nFaction == 8) or (nFaction == 6) or (nFaction == 4) then	-- 正派
		tDialog =
		{
			npc_string(nFaction, "Ai nha , th� ra l� ngi  bi誸 li評 chuy謓 x璦 . g莕 nh蕋 giang h� t nhi猲 thay i , � t鑞g nc , t� u t韎 畊玦 c騨g m﹜ 甧n gi╪g y , ta c騨g ngh� n chuy謓 n祔 , nh璶g l� b雐 v� "..szCall.." kh玭g th� t� ch鴆 甶襲 tra n猲 chuy謓 . sau  , m閠 輙 giang h� 萵 s� t竔 xu蕋 giang h� , 甶襲 tra n猲 chuy謓 . b鋘 h� ph竧 hi謓 mi m鬰 , m閠 ng祔 ng祔 hi觧 l� ra , mi m鬰 bi觰 hi謓 , 竚 ch� ﹎ m璾 v� : ng祔 nh蒼 d箉 !", 1), 
                        speak_string(nFaction, "Tho箃 nh譶 ch﹏ tng  r� r祅g , th藅 l� ng祔 nh蒼 ﹎ m璾 . ch� c� 甶襲 tra c竎 lo筰 ng v藅 ph竧 hi謓 , � tr猲 thi th� l璾 l筰 蕁 k� � tr猲 giang h� kh玭g xu蕋 hi謓 qua , ngo礽 ra , xu蕋 hi謓 r蕋 nhi襲 d� thng con d琲 , y l� hay kh玭g l� m韎 ng祔 nh蒼 t� thu藅 ?", 1), 
                        npc_string(nFaction, "V� b秓 v� i t鑞g , b秓 v� ch竛h ngh躠 , ta chu萵 b� i ph� chuy謓 n祔 ch i s竎h . ta c飊g m閠 s� cao th� b� quan s竛g l藀 m閠 chi猽 thng th鮝 tuy謙 h鋍 . m閠 m譶h ngi t譵 頲 r蕋 tr鋘g y誹 mi m鬰 , th藅 l� ng gi� khen ng頸 . ta quy誸 nh truy謓 c飊g ngi thng th鮝 v� c玭g , hy v鋘g ngi sau n祔 c� th�  thi猲 h� v� m蕐 m nhi謒 .", 1), 
                        speak_string(nFaction, " t� "..szCall.." tu﹏ theo "..szCall.." d箉 d� .", 1), 
                        npc_string(nFaction, "Th阨 gian c蕄 b竎h , cho n猲 n猲 v� c玭g ch� c� th� truy襫 th� m閠 ph莕 , sau n祔 mu鑞 c� g緉g tu luy謓 . n猲 v� c玭g ch� truy謓 c飊g ngi , nh鱪g m玭 ph竔 kh竎  t� c遪 kh玭g bi誸 . v� ph遪g ng鮝 sanh s� , ta  xem kh萿 quy誸 vi誸 xong , ch輓h ngi nghi猲 c鴘 甶 . theo nh� ngi b﹜ gi� ch t� ch蕋 , ngi s� r蕋 d� d祅g l躰h h閕 ch . ng r錳 , ngi 甶 chu萵 b� <color=white> b鎛 m玭 t蕋 c� k� n╪g , l祄 th祅h m閠 s竎h <color>.", 1), 
                        speak_string(nFaction, "Tu﹏ l謓h "..szCall.."  t� l藀 t鴆 ph鬰 m謓h .", 1),
		}
	elseif (nFaction == 2) or (nFaction == 1) or (nFaction == 5) then					-- 中立
		tDialog =
		{
			npc_string(nFaction, "Ai nha , th� ra l� ngi  bi誸 li評 chuy謓 x璦 . g莕 nh蕋 giang h� t nhi猲 thay i , � t鑞g nc , t� u t韎 畊玦 c騨g m﹜ 甧n gi╪g y , ta c騨g ngh� n chuy謓 n祔 , nh璶g l� b雐 v� "..szCall.." kh玭g th� t� ch鴆 甶襲 tra n猲 chuy謓 . sau  , m閠 輙 giang h� 萵 s� t竔 xu蕋 giang h� , 甶襲 tra n猲 chuy謓 . b鋘 h� ph竧 hi謓 mi m鬰 , m閠 ng祔 ng祔 hi觧 l� ra , mi m鬰 bi觰 hi謓 , 竚 ch� ﹎ m璾 v� : ng祔 nh蒼 d箉 !", 1), 
                        speak_string(nFaction, "Tho箃 nh譶 ch﹏ tng  r� r祅g , th藅 l� ng祔 nh蒼 ﹎ m璾 . ch� c� 甶襲 tra c竎 lo筰 ng v藅 ph竧 hi謓 , � tr猲 thi th� l璾 l筰 蕁 k� � tr猲 giang h� kh玭g xu蕋 hi謓 qua , ngo礽 ra , xu蕋 hi謓 r蕋 nhi襲 d� thng con d琲 , y l� hay kh玭g l� m韎 ng祔 nh蒼 t� thu藅 ?", 1), 
                        npc_string(nFaction, "V� ph遪g ng鮝 ng祔 nh辬 ﹎ m璾 , ta  ti課 h祅h t輈h c鵦 ch ﹎ th莔 甶襲 tra . ta c飊g m閠 s� cao th� b� quan s竛g l藀 m閠 chi猽 thng th鮝 tuy謙 h鋍 . m閠 m譶h ngi t譵 頲 r蕋 tr鋘g y誹 mi m鬰 , th藅 l� ng gi� khen ng頸 . ta quy誸 nh truy謓 c飊g ngi thng th鮝 v� c玭g , hy v鋘g ngi sau n祔 c� th�  thi猲 h� v� m蕐 m nhi謒 .", 1), 
                        speak_string(nFaction, " t� "..szCall.." tu﹏ theo "..szCall.." d箉 d� .", 1), 
                        npc_string(nFaction, "Th阨 gian c蕄 b竎h , cho n猲 n猲 v� c玭g ch� c� th� truy襫 th� m閠 ph莕 , sau n祔 mu鑞 c� g緉g tu luy謓 . n猲 v� c玭g ch� truy謓 c飊g ngi , nh鱪g m玭 ph竔 kh竎  t� c遪 kh玭g bi誸 . v� ph遪g ng鮝 sanh s� , ta  xem kh萿 quy誸 vi誸 xong , ch輓h ngi nghi猲 c鴘 甶 . theo nh� ngi b﹜ gi� ch t� ch蕋 , ngi s� r蕋 d� d祅g l躰h h閕 ch . ng r錳 , ngi 甶 chu萵 b� <color=white> b鎛 m玭 t蕋 c� k� n╪g , l祄 th祅h m閠 s竎h <color>.", 1), 
                        speak_string(nFaction, "Tu﹏ l謓h "..szCall.."  t� l藀 t鴆 ph鬰 m謓h .", 1),
		}
	elseif (nFaction == 3) or (nFaction == 9) then										-- 邪派
		tDialog =
		{
			npc_string(nFaction, "Ai nha , th� ra l� ngi  bi誸 li評 chuy謓 x璦 . g莕 nh蕋 giang h� t nhi猲 thay i , � t鑞g nc , t� u t韎 畊玦 c騨g m﹜ 甧n gi╪g y , ta c騨g ngh� n chuy謓 n祔 , nh璶g l� b雐 v� "..szCall.." kh玭g th� t� ch鴆 甶襲 tra n猲 chuy謓 . sau  , m閠 輙 giang h� 萵 s� t竔 xu蕋 giang h� , 甶襲 tra n猲 chuy謓 . b鋘 h� ph竧 hi謓 mi m鬰 , m閠 ng祔 ng祔 hi觧 l� ra , mi m鬰 bi觰 hi謓 , 竚 ch� ﹎ m璾 v� : ng祔 nh蒼 d箉 !", 1), 
                        speak_string(nFaction, "Tho箃 nh譶 ch﹏ tng  r� r祅g , th藅 l� ng祔 nh蒼 ﹎ m璾 . ch� c� 甶襲 tra c竎 lo筰 ng v藅 ph竧 hi謓 , � tr猲 thi th� l璾 l筰 蕁 k� � tr猲 giang h� kh玭g xu蕋 hi謓 qua , ngo礽 ra , xu蕋 hi謓 r蕋 nhi襲 d� thng con d琲 , y l� hay kh玭g l� m韎 ng祔 nh蒼 t� thu藅 ?", 1), 
                        npc_string(nFaction, "B鎛 m玭 l祄 sao c� th� r琲 � ph輆 sau h緉 � u ? v� v藋 , ta  ti課 h祅h ﹎ th莔 甶襲 tra , ng th阨 x竎 nh : kh玭g th�  cho ng祔 nh蒼 i v韎 ch髇g ta b蕋 l頸 , trong c� ngi c� th阨 c� ch� t筼 thi猲 h� h鏽 lo筺 . ta c飊g m閠 s� cao th� b� quan s竛g l藀 m閠 chi猽 thng th鮝 tuy謙 h鋍 . m閠 m譶h ngi t譵 頲 r蕋 tr鋘g y誹 mi m鬰 , th藅 l� ng gi� khen ng頸 . "..szCall.." n╩ 蕐 , r蕋 nhi襲 c� m lc ch anh h飊g m韎 c� th� m nhi謒 , nh璶g l� , m閠 m譶h ngi t譵 頲 r蕋 tr鋘g y誹 mi m鬰 , th藅 l� ng gi� khen ng頸 . ta quy誸 nh truy謓 c飊g ngi tuy謙 h鋍 , sau n祔 gi髉 ta n鎖 danh thi猲 h� ", 1), 
                        speak_string(nFaction, " t� "..szCall.." tu﹏ theo "..szCall.." d箉 d� .", 1), 
                        npc_string(nFaction, "Th阨 gian c蕄 b竎h , cho n猲 n猲 v� c玭g ch� c� th� truy襫 th� m閠 ph莕 , sau n祔 mu鑞 c� g緉g tu luy謓 . n猲 v� c玭g ch� truy謓 c飊g ngi , nh鱪g m玭 ph竔 kh竎  t� c遪 kh玭g bi誸 . v� ph遪g ng鮝 sanh s� , ta  xem kh萿 quy誸 vi誸 xong , ch輓h ngi nghi猲 c鴘 甶 . theo nh� ngi b﹜ gi� ch t� ch蕋 , ngi s� r蕋 d� d祅g l躰h h閕 ch . ng r錳 , ngi 甶 chu萵 b� <color=white> b鎛 m玭 t蕋 c� k� n╪g , l祄 th祅h m閠 s竎h <color>.", 1), 
                        speak_string(nFaction, "Tu﹏ l謓h "..szCall.."  t� l藀 t鴆 ph鬰 m謓h .", 1),
		}
	elseif (nFaction == 7) then															-- 天忍
		tDialog =
		{
			npc_string(nFaction, "Th藅 l� kh玭g h� l� ng祔 nh蒼 d箉  t� , kh玭g c� g� c� th� qu� li評 con m総 c馻 ngi . g莕 nh蕋 , giang h� t nhi猲 h鏽 lo筺 , th藅 l� kh玭g c� c� ngh� n , y l� ta ng祔 nh蒼 d箉 ch� t筼 ra s� 畂an , ha ha . ngi  畂竛 頲 , ta c騨g kh玭g d鑙 g箃 ngi . g莕 nh蕋 , ng祔 nh蒼 d箉 tri謚 t藀 m閠 輙 v� l﹎ cao th� , luy謓 th祅h li評 m閠 lo筰 c鵦 m筺h ch t� thu藅 . n鎖 甶猲 ch ng v藅 c飊g n籱 � trong quan t礽 ch thi th� , u l� ch髇g ta c玭g lao , c騨g t� r� , ta i kim qu鑓 甧m c� m閠 l莕 nh chinh ph箃 .", 1), 
                        speak_string(nFaction, "Gi竜 ch� anh minh , ta 甧m v� kim qu鑓 th鑞g nh蕋 thi猲 h� ch nghi謕 l韓 ph� thang o h醓 ", 1), 
                        npc_string(nFaction, "L莕 n祔 ng lo筺 r蕋 nghi猰 m藅 , tin t鴆 c騨g kh玭g c� truy襫 kh緋 c竎 m玭 ph竔 , c� ngi m韎 v鮝  l� ra tin t鴆 s� ch誸 . nh鱪g thi th� n祔 u l� t鑞g nc ph竔 ch gi竛 甶謕 , c騨g coi l� l祄 cho ta th� nghi謒 . ta l祄 c竔 n祔 , c騨g kh玭g ph秈 mu鑞 ngi gi� b� m藅 , ngi l� b鎛 m玭 ngi c馻 . nh璶g l� , ngi l� h鱱 d騨g h鱱 m璾 ngi c馻 , c� th� m nhi謒 i m nhi謒 , ha ha . h玬 nay ta truy襫 cho ngi tuy謙 h鋍 , kh玭g mu鑞 c� ph� kim qu鑓 t輓 nhi謒 i v韎 ngi . ", 1), 
                        speak_string(nFaction, " t� "..szCall.." tu﹏ theo "..szCall.." d箉 d� .", 1), 
                        npc_string(nFaction, "Th阨 gian c蕄 b竎h , cho n猲 n猲 v� c玭g ch� c� th� truy襫 th� m閠 ph莕 , sau n祔 mu鑞 c� g緉g tu luy謓 . n猲 v� c玭g ch� truy謓 c飊g ngi , nh鱪g m玭 ph竔 kh竎  t� c遪 kh玭g bi誸 . v� ph遪g ng鮝 sanh s� , ta  xem kh萿 quy誸 vi誸 xong , ch輓h ngi nghi猲 c鴘 甶 . theo nh� ngi b﹜ gi� ch t� ch蕋 , ngi s� r蕋 d� d祅g l躰h h閕 ch . ng r錳 , ngi 甶 chu萵 b� <color=white> b鎛 m玭 t蕋 c� k� n╪g , l祄 th祅h m閠 s竎h <color>.", 1), 
                         speak_string(nFaction, "Tu﹏ l謓h "..szCall.."  t� l藀 t鴆 ph鬰 m謓h .", 1),
		}
	end
	describe_talk(tDialog)
	SetTask(LV120_SKILL_STATE, 18)
	SyncTaskValue(LV120_SKILL_STATE)
end

function lv120skill_submit()				-- 提交本派全部技能书UI
	GiveItemUI("сng b鎛 m玭 to祅 b� k� n╪g s竎h ", " m b鎛 m玭 t蕋 c� k� n╪g s竎h b� v祇 l� c� th� t 頲 120 k� n╪g b� t辌h.", "submit_skillbook", "quit")
end

function submit_skillbook(nCount)			-- 提交本派全部技能书

	local nFaction = GetLastFactionNumber()
	local szCall = FACTION_TEXT[nFaction][3]
	local idxBook, g, d, p = 0, 0, 0, 0
	local book, temp = {}, {}

	if (nCount == 0) then
		lv120skill_submit()
		return
	end

	for i = 1, getn(FACTION_BOOK[nFaction]) do
		tinsert(temp, FACTION_BOOK[nFaction][i])
	end

	for i = 1, nCount do
		idxBook = GetGiveItemUnit(i)
		g, d, p = GetItemProp(idxBook)
		for j = 1, getn(temp) do
			if (g == temp[j][1]) and (d == temp[j][2]) and (p == temp[j][3]) then
				tremove(temp, j)
				tinsert(book, idxBook)
				break
			end
		end
	end

	if (getn(temp) == 0) then
		local tDialog =
		{
			npc_string(nFaction, "L祄 vi謈 lanh l頸 l筰 c� m韎 ngi c馻 th藅 l� kh� c莡 a, ta  cho ngi b� quy誸 li評, ch輓h ngi nghi猲 c鴘 m閠 ch髏 li襫 c� th� l躰h ng� ", 1), 
                        speak_string(nFaction, " t� "..szCall.." 產 t� ch� gi竜 , b﹜ gi� ta 甶 tu luy謓 .", 1), 
                        self_string(10, "M閠 h錳 c玭g phu : th阨 gian, ngi li襫 h鋍 頲 v� l﹎ thng th鮝 tuy謙 k� "),
		}
		describe_talk(tDialog)
		for i = 1, getn(book) do
			if (RemoveItemByIndex(book[i]) ~= 1) then		-- 取走玩家身上的技能书
				WriteLog("120 c蕄 k� n╪g - T総 b鎛 m玭 t蕋 c� k� n╪g s竎h -- h駓 thng k� n╪g s竎h.  Player ="..GetName().." Time = "..date("%y.%m.%d"))
				Msg2Player("H� th鑞g b� l鏸 , xin li猲 l筩 ph竧 頲 thng gi秈 quy誸!")
				return
			end
		end
		idxBook = add_item(LV120SKILLBOOK)	-- 获得120级技能书
		Msg2Player("Ngi t 頲 1"..GetItemName(idxBook))
		SetTask(LV120_SKILL_STATE, 19)
		SyncTaskValue(LV120_SKILL_STATE)
	else
		Describe("C莕 b� v祇 m閠 b� t蕋 c� s竎h k� n╪g, cho "..szCall.." l祄 th祅h 120 c蕄 thng th鮝 s竎h k� n╪g",2, "L祄 l筰/lv120skill_submit", "Tho竧/quit")
	end

end

function calc_item(tab)
	return	CalcItemCount(-1, tab[1], tab[2], tab[3], -1)
end

-- 解决任务异常
function lv120skill_debug()
	local state = GetTask(LV120_SKILL_STATE)
	if (state <= 1) or (state >= 19) then return end
	if (state == 5) then debug_item(DGJ_WULINMIJI) return end
	if (state == 9) then debug_item(COFFIN_MAP) return end
	if (state >= 10) and (state <= 15) then debug_item(COFFIN) return end
	if (state == 16) then debug_item(CADAVER) return end
end

function debug_item(Item)
	if (calc_item(Item) < 1) then
		if (CalcFreeItemCellCount() < 1) then
			Msg2Player("? c蕄 120 ph竧 sinh sai l莔, xin m阨 l莕 n鱝 s鯽 sang l筰 trang b�, xu蕋 hi謓 m閠 ch� tr鑞g, ng th阨 xin m阨 l莕 n鱝 ng l鬰, h� th鑞g li襫 tr� l筰 i hi謕 m蕋 甶 ch .")
			return
		end
		local idxItem = add_item(Item)
		Msg2Player("Чi hi謕 t 頲 m韎 v鮝 m蕋 甶 ch  "..GetItemName(idxItem)..", b﹜ gi� c� th� ti誴 t鬰 nhi謒 v� c蕄 120")
	end
end

function quit()
end


-- 120级技能书兑换
function lvl120skill_learn()
	Describe("C� c竔 g� kh� m� sao ?",4, 
               "Ta mu鑞 i s竎h k� n╪g c蕄 120 /lvl120skill_getbook", 
               "L祄 sao c� th� h鋍 頲  k� n╪g 120/lvl120skill_learninfo", 
               "Phng ph竝 uy謓 t藀 k� n╪g 120 /lvl120skill_skillinfo", 
               "в cho ta suy ngh� /no");
end;

function lvl120skill_skillinfo()
	local szInfo = format("%s%s%s%s%s%s%s%s%s%s", 
                  "<enter><color=green>1. nh tr竎h t 頲 <color>", 
                 "<enter>Luy謓 c蕄 khu v鵦 qu竔 v藅 : nh m閠 lo筰 tr竎h, xanh bi誧 boss, ho祅g kim boss;", 
                 "<enter>Ho箃 ng trung ch tr竎h : nh v祇 c鯽 th� nh蕋 ch tr竎h, s竧 th� boss;", 
                 "<enter>Nhi謒 v� trung ch tr竎h : nh v祇 ho祅g kim nhi謒 v� trung ch tr竎h ;", 
                 "<enter>T鑞g kim chi課 trng : s� d鬾g t輈h ph﹏ i h鋍 h醝 kinh nghi謒 nghi謒 tr� gi� , nh璶g l� , kh玭g th� vt qua m鏸 ngi thng h筺 .", 
                 "<enter><color=green>2. 駓 th竎 nhi謒 v� <color>", 
                  "<enter>S� d鬾g b筩h c﹗ ho祅 k� n╪g , r� r祅g c﹗ ho祅 k� n╪g , r� r祅g c﹗ ho祅 c hi謚 k� n╪g .", 
                  "<enter>B筩h c﹗ ho祅 k� n╪g : s� d鬾g sau 甧m  cao 120 k� n╪g ch luy謓 t藀  , m鏸 n╩ ph髏 luy謓 t藀  甧m gia t╪g m閠 l莕 .", 
                   "<enter>Чi c﹗ ho祅 k� n╪g : hi謚 qu� so m閠 lo筰 b筩h c﹗ ho祅 k� n╪g t╪g l莕 , m鏸 n╩ ph髏 luy謓 t藀  甧m gia t╪g m閠 l莕 ", 
                   "<enter>Чi c﹗ ho祅 c hi謚 : hi謚 qu� so m閠 lo筰 b筩h c﹗ ho祅 k� n╪g t╪g l莕 , m鏸 n╩ ph髏 luy謓 t藀  甧m gia t╪g m閠 l莕 ;" 
                   ); 
              Describe(szInfo, 
               2, 
            "Tr� v� /lvl120skill_learn", 
            "K誸 th骳 i tho筰 /no")
end;

function lvl120skill_learninfo()
	Describe("Чt t韎 120 c蕄, c� th� n ph竔 i l蕐 120 k� n╪g s竎h, s� d鬾g s竎h sau, 甧m h鋍 頲 120 k� n╪g, m鏸 ngi ch� c� th� i m閠 l莕 <enter> i l蕐 s竎h mu鑞 tu﹏ th� : m閠 quy觧 m﹎ n誹 t﹎ tr秈 qua , m閠 quy觧 b鎛 m玭 90 k� n╪g s竎h , m閠 vi猲  th緈 b秓 th筩h c飊g m閠 vi猲 th駓 tinh .", 
             2, 
            "Tr� v� /lvl120skill_learn", 
            "K誸 th骳 i tho筰 /no")
end;

function lvl120skill_getbook()
	-- 原任务进行到19结束，保持原值，兑换技能书成功，直接设为19
	local nstate = GetTask(LV120_SKILL_STATE);
	local nlevel = GetLevel();
	local nfact = GetLastFactionNumber();
	if (nstate == 19) then
		Describe("Th藅 l� ti誧 nu鑙, ngi  s� d鬾g k� n╪g c蕄 120",1 , "K誸 th骳 i tho筰 /no");
	elseif (nlevel < 120) then
		Describe("C蕄 b薱 kh玭g  120, kh玭g th� i s竎h ",1 , "K誸 th骳 i tho筰 /no");
	elseif (nfact < 0 or nfact > 9) then
		Describe("Ngi kh玭g gia nh藀 m玭 ph竔, kh玭g  甶襲 ki謓 i s竎h",1 , "K誸 th骳 i tho筰 /no");
	else
		if (lvl120skill_delallitem() == 1) then
			SetTask(LV120_SKILL_STATE, 19);
			add_item(LV120SKILLBOOK);
			Msg2Player("фi s竎h k� n╪g c蕄 120 th祅h c玭g.")
			WriteLog(format("[LvL120Skill]\t%s\tName:%s\tAccount:%s\tget a lvl120skillbook",
				GetLocalDate("%Y-%m-%d %X"),GetName(), GetAccount()))
		else
			Describe("Th藅 l� ti誧 nu鑙, mang v藅 ph萴 kh玭g h頿 y猽 c莡, xin m阨 ki觤 tra !", 1,"K誸 th骳 i tho筰 /no"); 
                     Msg2Player("C莕 thu th藀 v藅 ph萴 : m閠 quy觧b祅 nhc t﹎ kinh, m閠 quy觧 s竎h k� n╪g c蕄 90 c馻 b鎛 m玭, m閠 vi猲 tinh h錸g b秓 th筩h c飊g m閠 vi猲 th駓 tinh .");
		end;
	end;
end;
-- 120级技能书兑换

function lvl120skill_delallitem()
	if (lvl120skill_calccount(BANRUOXINJING) < 1) then
		return 0;
	end;
	local nfact = GetLastFactionNumber();
	for i = 1, getn(FACTION_BOOK[nfact]) do
		if (lvl120skill_calccount(FACTION_BOOK[nfact][i]) < 1) then
			return 0;
		end;
	end;

	if (lvl120skill_calccount(XINGHONGBAOSHI) < 1) then
		return 0;
	end;
	
	if (lvl120skill_calccrystal() < 1) then
		return 0;
	end;
	
	lvl120skill_delitem(BANRUOXINJING, 1);
	for i = 1, getn(FACTION_BOOK[nfact]) do
		lvl120skill_delitem(FACTION_BOOK[nfact][i], 1);
	end;
	lvl120skill_delitem(XINGHONGBAOSHI, 1);
	lvl120skill_delscrystal(1);
	return 1;
end;

function lvl120skill_calccount(tb_item)
	return CalcEquiproomItemCount(tb_item[1], tb_item[2], tb_item[3], -1);
end;
function lvl120skill_delitem(tb_item, ncount)
	if (ncount <= 0) then
		return 0;
	end;
	local np = ConsumeEquiproomItem(ncount, tb_item[1], tb_item[2], tb_item[3], -1);
	if (np == 1) then
		WriteLog(format("[LvL120Skill]\t%s\tName:%s\tAccount:%s\tDeleteItem Count=%d,G=%d,D=%d,P=%d,L=%d",
					GetLocalDate("%Y-%m-%d %X"),GetName(), GetAccount(),
					ncount, tb_item[1], tb_item[2], tb_item[3], -1));
	else
		print(format("Error!!!! DeleteItem Fail!!! Count=%d,G=%d,D=%d,P=%d,L=%d",
				ncount, tb_item[1], tb_item[2], tb_item[3], -1));
	end;
end;
function lvl120skill_calccrystal()
	local nsum = 0;
	for i = 1, getn(CRYSTAL) do
		nsum = nsum + lvl120skill_calccount(CRYSTAL[i]);
	end;
	return nsum;
end;
function lvl120skill_delscrystal(ncount)
	for i = 1, getn(CRYSTAL) do
		local ncrst = lvl120skill_calccount(CRYSTAL[i]);
		if (ncrst > ncount) then
			ncrst = ncount;
		end;
		lvl120skill_delitem(CRYSTAL[i], ncrst);
		ncount = ncount - ncrst;
		if (ncount <= 0) then
			break
		end;
	end;
end;



-- //越南版不处理上线时任务变量初始化
if (GetProductRegion() ~= "vn") then
	login_add(init_lv120skill, 2)
end
