-- 大理　职能　城门卫兵甲&城门卫兵乙
-- by：Dan_Deng(2003-09-16)
-- Update: Dan_Deng(2004-05-27) 小儿失踪任务

Include("\\script\\global\\repute_head.lua")
Include("\\script\\global\\map_helper.lua")
npc_name = "<#> V� binh Th祅h m玭"

function default_talk()
--	UTask_world42 = GetTask(42)	-- 设置任务变量
--	if ((UTask_world42 == 0) and (GetLevel() >= 80) and (GetReputeLevel(GetRepute()) >= 7)) then		-- 任务启动，声望等级和声望值的关系不是很明确，要问明白
--		Talk(6,"U42_get","城门卫兵甲：听说城里最近老有小孩无故失踪？","城门卫兵乙：是啊。我原来的姘头叶花，她二小子也不见了，最近常来烦我帮她找儿子。","玩家：两位，究竟怎么回事？","城门卫兵甲：呵呵，这位大侠仪表堂堂，英明神武，看来是想管管这档子事咯？","玩家：客气，路见不平拔刀相助是我辈本分。","城门卫兵乙：哎呀，今晚的酒钱好象没带够啊！")
--	else
		Talk(4,"","H玬 nay ta  th蕐 頲 9 m� nh﹏, kh玭g nh譶 th� ti誧, nh譶 kh玭g m蕋 ti襫 m�! ","Ti觰 t� n祔 h譶h nh� ch竛 s鑞g r錳!","Nh祅 h� th� c� nh祅 h�, nh譶 b猲 n祔 b猲 kia, l韓 l猲 c騨g t鑤!","Kh玭g sai! D竛g v� th藅 tuy謙! ")
--	end;
end;

function U42_get()
	Say("ng v藋! H穣 c遪 ng 5 v筺 lng.",2,"Hai v� i ca th� v� th藅/yes1","D鑙 頲 ngi nh璶g kh玭g d鑙頲 m譶h!/no")
end;

function yes1()
	if (GetCash()>=50000) then 
		Pay(50000)
		Talk(1,"","C竎 h� ra tay h祇 ph鉵g, h穣 甶 Dc Vng C鑓 h醝 o nh﹏ ch﹏ qu�, 玭g ta bi誸 nh鱪g vi謈 b� m藅 n祔.")
		SetTask(42, 10)
		AddNote("Nhi謒 v� Ti觰 Nhi m蕋 t輈h: Ti誴 nh薾 nhi謒 v�, 甶 Dc Vng C鑓 t譵 Qua Cc o nh﹏ h醝 v� tin t鴆 c馻 a tr�.")
		Msg2Player("Nhi謒 v� Ti觰 Nhi m蕋 t輈h: Ti誴 nh薾 nhi謒 v�, 甶 Dc Vng C鑓 t譵 Qua Cc o nh﹏ h醝 v� tin t鴆 c馻 a tr�.")
	else
		Talk(1,""," 甶! Ti襫 kh玭g c� l祄 Чi hi謕 g�, v� qu� l祄 ru閚g 甶!")
	end
end;

function no()
	Talk(1,""," 甶! Ti襫 kh玭g c� l祄 Чi hi謕 g�, v� qu� l祄 ru閚g 甶!")
end;
