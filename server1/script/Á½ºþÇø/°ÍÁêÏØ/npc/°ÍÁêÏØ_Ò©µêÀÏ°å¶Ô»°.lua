--description: 两湖区 巴陵县 药店老板对话（天王帮40级任务、新手任务小渔爹爹的病）
--author: yuanlan	
--date: 2003/4/26
-- Update: Dan_Deng(2003-08-10)
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
function main(sel)
	UTask_tw = GetTask(3)
	UTask_world18 = GetTask(46)
	if (UTask_tw == 40*256+20) then						-- 天王40级任务
		Talk(5, "L40_tw_talk2", "T筰 h� l�  t� Thi猲 Vng bang, c� m閠 ng m玭 b� tr髇g n鋍 r緉 X輈h Li謒. Xin th莕 y cho thu鑓 gi秈!", "R緉 X輈h Li謒 �? Th藅 l� nguy hi觤 qu�!..Ta c� th� c鴘, c竔 kh� l� ph秈 t譵 頲 dc li謚  ph鑙 thu鑓!", "Kh玭g bi誸 ph秈 c莕 nh鱪g dc li謚 g�?", "Зy l� b� quy誸 gia truy襫, nh璶g ngi l�  t� Thi猲 Vng n猲 ta n鉯 cho nghe! C莕 c� <color=Red>da th籲 l籲 <color> v� <color=Red>L鬰 Th� Quy<color>. T譵 頲 hai th� n祔 th� ng m玭 c馻 ngi s� 頲 c鴘", "Kh玭g bi誸 c� th� t譵 hai th� n祔 � u?")
	elseif(UTask_world18 == 1) then				-- 新手村小渔任务
		Talk(1,"","H�?B� c馻 Ti觰 Ng� b謓h �? Ngi n ch薽 r錳! Ta v鮝 b竛 vi猲 T� B� ho祅 cu鑙 c飊g cho  t� Thi猲 Vng. Hay l� ngi h醝 th� 玭g ta xem")
		Msg2Player("Ch� dc 甶誱 cho bi誸 T� B� ho祅  b竛 h誸. B筺 h穣 甶 h醝 th�  t� Thi猲 Vng Bang. ")
		AddNote("T� B� ho祅  b竛 h誸. B筺 h穣 甶 h醝 th�  t� Thi猲 Vng Bang. ")
	elseif (UTask_tw == 40*256+50) then
		Say("Nghe n鉯 trong <color=Red>Ph鬰 L璾 ng<color> c� <color=Red>Th籲 l祅 <color> v�<color=Red>L鬰 Th� Quy<color>, c� ngi tr猲 <color=Red>Thi猲 Vng o<color>  nh譶 th蕐. Ch� c莕 t譵 頲 n� th� ng m玭 s� 頲 c鴘", 2, "Ta mua 輙 thu鑓 trc /yes", "Ta ph秈 l藀 t鴆 甶 t譵 thu鑓 d蒼/no")
	else							-- 非任务状态
		Say("B鎛 ti謒 u l� th莕 dc! C� b謓h s� kh醝 b謓h, kh玭g b謓h s� kh醗, gi� c� ph秈 ch╪g. Mua m閠 輙 ch�?", 3, "Giao d辌h/yes", "Ta n nh薾 nhi謒 v� S� nh藀/yboss","Kh玭g giao d辌h/no");
	end
end;

function L40_tw_talk2()
	Talk(2,"","Nghe n鉯 trong <color=Red>Ph鬰 L璾 ng<color> c� <color=Red>Th籲 l祅 <color> v�<color=Red>L鬰 Th� Quy<color>, c� ngi tr猲 <color=Red>Thi猲 Vng o<color>  nh譶 th蕐", " t� Ng� th莕 y!")
	SetTask(3, 40*256+50)								-- 天王40级任务
	AddNote("Ng� th莕 y t筰 Ba L╪g huy謓 cho bi誸: mu鑞 gi秈 n鋍 r緉 c莕 c� da th籲 l籲  v� L鬰 Th� Quy")
	Msg2Player("Mu鑞 tr� 頲 n鋍 c馻 чc x�, c莕 ph秈 c� da Th籲 l籲  v� L鬰 Th� Quy.")
end;

function yes()
	Sale(39);  			--弹出交易框
end;

function no()
end;
