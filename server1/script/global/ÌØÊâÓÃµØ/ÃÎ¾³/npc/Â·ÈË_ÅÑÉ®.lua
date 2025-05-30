-- 梦境 路人_叛僧.lua  洗点功能NPC

Include("\\script\\missions\\clearskill\\clearhole.lua");

function main()
	-- 非法状态
	if (CSP_CheckValid() == 0) then
		CSP_WriteLog("Ti課 nh藀 v祇 Фo T葃 T駓 m閠 c竎h kh玭g b譶h thng. ");
		Say("GM: <color=red>B筺 kh玭g th� v祇 o T葃 T駓,  b� h� th鑞g ghi nh�, xin h穣 甶 t譵 ngi ph鬰 v�  ch豱h l� l筰! <color> ", 1, "R阨 kh醝 o T葃 T駓 /LeaveHere_yes")
		return -1;
	end
	
	nLevel = GetLevel();
	if (nLevel < CSP_NEEDLEVEL) then
		Talk(1, "", "C蕄 c馻 ngi v蒼 ch璦 t "..CSP_NEEDLEVEL.."Ch璦 th� r阨 kh醝 o T葃 T駓. ")
		return -1;
	end

	nType = GetTask(CSP_TID_ClearType);
	if (nType == CSP_CTYPE_SKILL) then -- 只洗技能点
		local tbOpt = 
		{
			"T葃 甶觤 k� n╪g /DoClearSkill",
			"T╪g 甶觤 ti襪 n╪g/add_prop",
			"Kh玭g t葃 /OnCancel",
			"V� vi謈 T葃 T駓 /Help",
			"R阨 kh醝 o T葃 T駓 /LeaveHere",
		}
		Say("ngi ch� c� th� t葃 <color=blue> 甶觤 k� n╪g<color>. C� ng � t葃 kh玭g? ", getn(tbOpt), tbOpt)
	elseif (nType == CSP_CTYPE_PROP) then -- 只能潜能点
		local tbOpt = 
		{
			"T葃 甶觤 ti襪 n╪g/DoClearProp",
			"T╪g 甶觤 ti襪 n╪g/add_prop",
			"Kh玭g t葃 /OnCancel",
			"V� vi謈 T葃 T駓 /Help",
			"R阨 kh醝 o T葃 T駓 /LeaveHere",
		}
		Say("Ngi ch� c� th� t葃 <color=blue> 甶觤 ti襪 n╪g<color>. C� ng � t葃 kh玭g? ", getn(tbOpt), tbOpt)
	else -- if (nType == CSP_NEEDJEWEL_ALL) then -- 全洗(nType可能是0，或3)
		local tbOpt = 
		{
			 "T葃 甶觤 k� n╪g /DoClearSkill",
			 "T葃 甶觤 ti襪 n╪g/DoClearProp", 
			 "T╪g 甶觤 ti襪 n╪g/add_prop", 
			 "Kh玭g t葃 /OnCancel", 
			 "V� vi謈 T葃 T駓 /Help", 
			 "R阨 kh醝 o T葃 T駓 /LeaveHere"
		}
		Say("Ngi c� ng � t葃 t駓 kh玭g? ", getn(tbOpt),tbOpt)
	end;
end

function add_prop()
	Say("Th輈h Minh: Ngi mu鑞 t╪g 甶觤 k� n╪g n祇?", 4,
			"t╪g s鴆 m筺h/add_prop_str",
			"t╪g Th﹏ Ph竝/add_prop_dex",
			"t╪g Ngo筰 C玭g/add_prop_vit",
			"T╪g n閕 c玭g/add_prop_eng")
end

function add_prop_str()
	AskClientForNumber("enter_str_num", 0, GetProp(), "Xin h穣 nh藀 甶觤 s� s鴆 m筺h: ");
end

function add_prop_dex()
	AskClientForNumber("enter_dex_num", 0, GetProp(), "Xin h穣 nh藀 甶觤 s� th﹏ ph竝: ");
end

function add_prop_vit()
	AskClientForNumber("enter_vit_num", 0, GetProp(), "Xin h穣 nh藀 甶觤 s� ngo筰 c玭g:");
end

function add_prop_eng()
	AskClientForNumber("enter_eng_num", 0, GetProp(), "Xin h穣 nh藀 甶觤 s� n閕 c玭g: ");
end

function enter_str_num(n_key)
	if (n_key < 0 or n_key > GetProp()) then
		return
	end
	AddStrg(n_key);
end

function enter_dex_num(n_key)
	if (n_key < 0 or n_key > GetProp()) then
		return
	end
	AddDex(n_key);
end

function enter_vit_num(n_key)
	if (n_key < 0 or n_key > GetProp()) then
		return
	end
	AddVit(n_key);
end

function enter_eng_num(n_key)
	if (n_key < 0 or n_key > GetProp()) then
		return
	end
	AddEng(n_key);
end

function DoClearSkill()
	Say("Ngi ng � T葃 甶觤 k� n╪g kh玭g? ", 2, "T葃 甶觤 k� n╪g /DoClearSkillCore","Kh玭g t葃 /OnCancel")
end
function DoClearSkillCore()
--	if (Pay(100000) == 0) then
--		Say("释明：对不起，每次洗髓需10万两，你身上带的钱不够。", 0)
--		return
--	end

	i = HaveMagic(210)		-- 轻功另外操作
	j = HaveMagic(400)		-- “劫富济贫”另外操作
	n = RollbackSkill()		-- 清除技能并返回所有技能点（包括轻功等特殊技能）
	x = 0
	if (i ~= -1) then x = x + i end		-- 这两句判断是排除从未学过轻功的人返回-1从而导致点数计算错误情况
	if (j ~= -1) then x = x + j end
	rollback_point = n - x			-- 把技能点当做空闲点数返还，但先扣除轻功等
	if (rollback_point + GetMagicPoint() < 0) then		-- 如果洗成了负数，则当作0（为以后多次洗点保留）
		 rollback_point = -1 * GetMagicPoint()
	end
	AddMagicPoint(rollback_point)
	if (i ~= -1) then AddMagic(210,i) end			-- 如果学过轻功则加回原有等级
	if (j ~= -1) then AddMagic(400,j) end			-- 如果学过“劫富济贫”同样处理
	Msg2Player("T葃 T駓 th祅h c玭g! ngi  c� th� ph﹏ ph鑙 甶觤 "..rollback_point.."觤 k� n╪g c� th� ph﹏ ph鑙 l筰. ")
	Talk(1,"KickOutSelf","T葃 T駓 th祅h c玭g! ngi  c� th� ph﹏ ph鑙 甶觤 "..rollback_point.."觤 k� n╪g c� th� ph﹏ ph鑙 l筰. ")
end;

function DoClearProp()
	Say("Ngi ng � t葃 甶觤 ti襪 n╪g kh玭g? ", 2, "T葃 甶觤 ti襪 n╪g/DoClearPropCore", "Kh玭g t葃 /OnCancel")
end

function DoClearPropCore()
		base_str = {35,20,25,30,20}			-- 五行人物的天生属性值
		base_dex = {25,35,25,20,15}
		base_vit = {25,20,25,30,25}
		base_eng = {15,25,25,20,40}
		player_series = GetSeries() + 1

		Utask88 = GetTask(88)
		AddStrg(base_str[player_series] - GetStrg(1) + GetByte(Utask88,1))			-- 将已分配潜能重置（task(88)是任务中直接奖励的力量、身法等）
		AddDex(base_dex[player_series] - GetDex(1) + GetByte(Utask88,2))
		AddVit(base_vit[player_series] - GetVit(1) + GetByte(Utask88,3))
		AddEng(base_eng[player_series] - GetEng(1) + GetByte(Utask88,4))
end;

function OnCancel()
end;

function Help()
	strHelp = 
	{
		"Sau khi T葃 T駓, ngi c� th� 甶 ra ngo礽  nh v韎 m閏 nh﹏, ho芻 c� nh鉳 s� c飊g 甶 v祇 s琻 ng  th鵦 nghi謒 chi課 u, sau  r阨 kh醝 o m韎 頲 xem l�  ho祅 th祅h. ",
		"Ch� c莕 ngi kh玭g r阨 kh醝 o, ta s� gi髉 ngi t葃 t駓 v鮝 �!",
		"Ngo礽 kia c� C鋍 g� (3000 Sinh l鵦) ;  Bao c竧 (10000 Sinh l鵦) ; M閏 nh﹏ 30000 Sinh l鵦)  cho ngi th� nghi謒 hi謚 qu� t葃 t駓!",
		"N誹 mu鑞 thi u c� th� v祇 trong s琻 ng, cho d� c� th蕋 b筰 th� c騨g kh玭g b� t鎛 th蕋 g�. ",
		"Nh璶g b猲 trong s琻 ng th� l筰 r蕋 nh� nh裵, nhi襲 nh蕋 c騨g ch� ch鴄 頲 20 ngi, cho n猲 n誹 nh�  c�  ngi th� ngi kh玭g th� 甶 v祇. ",
		"Nh璶g b猲 trong s琻 ng th� l筰 r蕋 nh� nh裵, nhi襲 nh蕋 c騨g ch� ch鴄 頲 20 ngi, cho n猲 n誹 nh�  c�  ngi th� ngi kh玭g th� 甶 v祇. ",
		"Cu鑙 c飊g, khi n祇 ngi c秏 th蕐 甶觤 k� n╪g   h穣 n t譵 ta, ta s� a ngi tr� v� ch� c� "
	}
	Talk(7, "", strHelp[1], strHelp[2], strHelp[3], strHelp[4], strHelp[5], strHelp[6], strHelp[7]);
end;

function LeaveHere()
	Say("ngi cho r籲g  T葃 T駓 xong r錳 �? C� mu鑞 r阨 kh醝 kh玭g? ",2, "Mu鑞 r阨 kh醝 /LeaveHere2", "в ta suy ngh� k� l筰 xem/OnCanCel")
end

function LeaveHere2()
	Say("R阨 kh醝 o T葃 T駓, n誹 mu鑞 tr� l筰 s� r蕋 kh�. ngi v蒼 ki猲 quy誸 r阨 kh醝 ch�? ", 2, "ta th藅 s� mu鑞 r阨 kh醝 n琲 ma qu竔 n祔 /LeaveHere_yes", "ta v蒼 mu鑞 � l筰 /OnCanCel")
end

function LeaveHere_yes()
	W,X,Y = GetWorldPos();
	LeaveTeam()
	CSP_LeaveClearMap(W);
end
