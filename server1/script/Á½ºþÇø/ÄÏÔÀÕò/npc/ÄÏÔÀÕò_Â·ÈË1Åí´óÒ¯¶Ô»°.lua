-- 南岳镇　路人　彭大爷 (名驹奔火任务)
-- 2004/4/17 名驹奔火任务 by fangjieying

Include("\\script\\global\\repute_head.lua")

function main()
	Uworld76 = GetTask(76)
--	if (GetLevel() >= 60) and (Uworld76 == 0) then       -- 符合任务条件
--		Talk (8,"","玩家：老大爷，您的茶饮下一口便满嘴生津，困乏全无啊。","彭大爷：不瞒您说，小老儿几十年的功夫，都花在这上面了。","玩家：在下经年奔波，常受日毒之害，若能天天喝到您的凉茶，那真是一大快活。","彭大爷：莫非你是江湖中人？","玩家：不错，老大爷真是目光如炬。","彭大爷：哎呀！太好了。小兄弟，我见你英气逼人，又是江湖朋友。小老儿这有一件事想请你帮忙，若能成则你那日行之苦也自可解。","玩家：大爷您切莫折煞小子，有事尽管说。","彭大爷：小兄弟看我身边这匹马。")
--		SetTask(76,10)
--		Msg2Player("探查彭大爷身边的马")
	if (Uworld76 == 10) then
		Talk (1,"","玭g h穣 xem con ng鵤 b猲 c筺h ta n祔. ")
	elseif (Uworld76 == 20) then
		SetTask(76,25)
		Talk (3,"W76_get","M祏 l玭g thu莕 khi誸, k� li謙 nh� ho�, b鑞 v� kh醗 m筺h, ch箉 nhanh nh� bay. Зy l� con ng鵤 tuy謙 v阨. ","Ngi th藅 l� c� m総 nh譶, con B玭 H醓 n祔 l� c馻 m閠 ti觰 l穙 . Sau khi 玭g 蕐 qua i th� do ta thay th� ch╩ s鉩. Ch� ti誧 l� c竎h y kh玭g l﹗, Ho� Nhi m綾 b謓h n猲 ng祔 c祅g y誹, c莕 ph秈 nhanh ch鉵g tr� li謚. ",". Цng ti誧 t筰 h� kh玭g ph秈 l� th莥 thu鑓, kh玭g  s鴆 gi秈 quy誸. ")
	elseif (Uworld76 == 25) then				-- 中断后重接任务的处理
		Talk(1,"W76_get","Th� n颠? уng � gi髉 l穙 kh玭g?")
	elseif (Uworld76 == 60) then
		Talk(1,"W76_prise","Qu� nhi猲  ch鱝 l祅h, kh玭g bi誸 ta ph秈 t� 琻 ngith� n祇 y!")
	elseif (Uworld76 == 30) then				-- 任务进行中
		if (HaveItem(393) == 0) then         -- 书信丢失处理
			Talk (1,"","Kh玭g ng� ti觰 huynh  l筰 b蕋 c萵 th�, th玦 頲 r錳  ta vi誸 l筰 b鴆 th� v藋. ")
			AddEventItem(393)			-- 通用书信
		else
			Talk (1,"","Ti觰 huynh , b謓h c馻 B玭 Ho� kh玭g th� i l﹗ 頲 n鱝 ph秈 nhanh l猲 th玦 ")
		end
	elseif (Uworld76 == 70) then			-- 任务已经完成
		Talk(1,"","Tuy B玭 Ho� kh玭g bi誸 n鉯 nh璶g ta nh譶 th蕐 n� r蕋 nh� ngi")
	else
		Talk(1,"","B筺 r�! Kh玭g c� vi謈 g� th� n猲 h鋍 m閠 ch髏 ngh� nghi謕, kh玭g n猲 c� ng祔 v竎 ki誱 ch衜 ch衜 gi誸 gi誸. ")
	end
end

function W76_get()
	Say("Kh玭g c莕 ti觰 huynh  ra tay. L穙 H竛 c� quen m閠 ngi, y thu藅 tinh th玭g, ch� b� tay v韎 nh鱪g ch鴑g b謓h qu� nghi猰 tr鋘g, l筰 kh玭g t譵 頲 ngi ng tin c藋. Mong ngic� th� gi髉 l穙 m閠 tay!",2,"Kh玭g c� v蕁  g�, nh蕋 nh s� l祄 頲 /W76_get_yes","H玬 nay ta c� vi謈, hay l�  l莕 sau /no")
end

function W76_get_yes()                                        -- 任务启动
	Talk(2,"","Л頲! Ta c� b鴆 th� n祔, n╩ x璦 ngi   ch辵 ﹏ c c馻 l穙, ngi h穣 giao cho ngi , 玭g ta nh蕋 nh s� n. Sau khi tr� xong cho B玭 H醓, ta s� xin 玭g ta d箉 cho ngi thu藅 'H錳 Th� б Tinh'","Dc Vng C鑓? B� Чo Nh﹏? Ha ha! Ti觰 t� v� 玭g ta c騨g c� duy猲 y! L莕 n祔 nh蕋 nh s� 頲, n誹 kh玭g s� kh玭g c遪 m苩 m騣  g苝 玭g.")
	SetTask(76,30)
	AddEventItem(393)			-- 通用书信
	Msg2Player("Nh薾 頲 m閠 b鴆 th� ch� B祅h Чi Gia, 甶 n Dc Vng C鑓 c鴘 s鑞g con ng鵤 qu� B玭 Ho� ")
	AddNote("Nh薾 頲 m閠 b鴆 th� ch� B祅h Чi Gia, 甶 n Dc Vng C鑓 c鴘 s鑞g con ng鵤 qu� B玭 Ho� ")
end

function W76_prise()
	Talk(1,"","B祅h Чi Gia kh玭g c莕 kh竎h kh�, ta c騨g nh�  m� h鋍 頲 輙 nhi襲 b秐 l躰h, c騨g 頲 l頸 ph莕 n祇")
	SetTask(76,70)
	add_repute = ReturnRepute(40,70,3)			-- 声望奖励：最大40点，从70级起每级递减3%
	AddRepute(add_repute)
	Msg2Player("Nhi謒 v� ho祅 th祅h, danh v鋘g c馻 b筺 頲 t╪g l猲 "..add_repute.."甶觤.")
	AddNote("Ch鱝 kh醝 b謓h cho con ng鵤 B玭 Ho�, ho祅 th祅h nhi謒 v� ")
end

function no()
end
