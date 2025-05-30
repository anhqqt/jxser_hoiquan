--description: 唐门唐一尘 20级任务、50级任务
--author: yuanlan	
--date: 2003/3/12
--Dan_Deng(2003-07-22), 加入门派任务的等级要求
-- Update: Dan_Deng(2003-08-13)
-- Update: Dan_Deng(2004-05-25) 洗清冤屈任务

Include("\\script\\global\\repute_head.lua")

function main()
	UTask_tm = GetTask(2);
	Uworld51 = GetTask(51)
--	if (GetTask(123) >= 80) and (Uworld51 < 10) and (GetReputeLevel(GetRepute()) >= 8) then		-- 洗清冤屈任务启动
		--		Talk(2,"Uworld51_get", 13429, 13430)
	if (Uworld51 == 20) then
		Talk(5,"Uworld51_30","Ta c騨g kh玭g khohuynh 蕐y ng nh譶, v蒼 產ng t譵 c竎h. Ch� v� cha ta hi謓 產ng nghi ng� ta, ta h祅h ng e kh玭g ti謓.","Nh璶g ta  bi誸 頲 m蕐 ng祔 trc c� m蕐 v� cao th� Thi誹 L﹎ g苝 n筺, thng t輈h r蕋 gi鑞g v韎 tuy謙 k� c馻 B鎛 m玭 g﹜ ra, cha ta nghi ng� ta  ti誸 l� tuy謙 k� c馻 m玭 ph竔.","Ngi n琲 甶 g苝 M玭 ch� gi秈 th輈h r�!","V� d鬾g th玦! Cha ta 產ng t鴆 gi薾 v鑞 kh玭g cho ta c� h閕 gi秈 th輈h. Ngay c� tin n祔 ta c騨g ch� nghe Л阯g H筩 n鉯 th玦.","N誹 v藋� M玭 ch� kh玭g c� th祅h ki課 v韎 ta, c� l� ta c� th� gi髉 玭g.")
	elseif (Uworld51 == 55) then
		Talk(6,"Uworld51_60","Nh蕋 Tr莕 c玭g t�, ta v鮝 nghe tin t鴆 t� Thi猲 Nh蒼 gi竜, chuy謓 竚 s竧 cao th� Thi誹 L﹎ qu� nhi猲 l� do h� l祄. B蕋 Nhi詍 c玭g t� v� mu鑞 tranh quy襫 v韎 ngi  甧m M藅 t辌h B鎛 m玭 a cho Thi猲 Nh蒼 gi竜.","Co chuy謓 v藋 sao? B蕋 Nhi詍 cho d� mu鑞 tr� th祅h M玭 ch� c騨g kh玭g n猲 l祄 v藋.","Цnh ti誧 ta 產ng b� nghi ng�, cha ta l筰 kh玭g tin ta n鉯, ta ph秈 l藀 t鴆 n thng lng v韎 Л阯g H筩 s� ph� m閠 ch髏.","M鬰 ti猽 th輈h s竧 ti誴 theo c馻 Thi猲 Nh蒼 gi竜 l� C竔 Bang, xin c玭g t� nh綾 nh� C竔 Bang tr竛h  Thi猲 Nh蒼 gi竜 th鮝 c� h穖 h筰.","B� ki誴 B鎛 m玭 l鋞 v祇 tay i th� nh蕋 nh ph秈 l蕐 l筰, hay l� nh� ngi ti猽 di謙 t猲 th輈h kh竎h, l蕐 l筰 b� ki誴.","Л頲 th玦!")
	elseif (Uworld51 == 70) and (HaveItem(377) == 1) then				-- 洗清冤屈任务：已经夺回秘笈
		Talk(2,"Uworld51_80","Nh蕋 Tr莕 c玭g t�! T筰 h�  ho祅 th祅h s� m謓h l蕐 l筰 b� ki誴."," t� ngi! Ta  thng lng v韎 Л阯g H筩 s� ph�, xin ngi h穣 n鉯 r� ch﹏ tng v韎 cha ta. V� chuy謓 n祔 do ngi 甶襲 tra 頲, ch� c� ngi n鉯 m韎 c� s鴆 thuy誸 ph鬰.")
	elseif (Uworld51 == 90) then
		Talk(2,"Uworld51_100","Cha ta n鉯 th� �? Hay qu�! Ta ph秈 b竜 tin n祔 cho H祄 Y猲 m韎 頲."," Ha ha! в ta 甶 m閠 chuy課, l莕 trc l� b竜 tin x蕌, l莕 n祔 ph秈  ta b� p.")
	elseif (GetFaction() == "tangmen") and (GetSeries() == 1) then
		if (UTask_tm == 20*256) and (GetLevel() >= 20) then		--20级任务启动
			Talk(2, "L20_get", " Ta c� 1 ngi c� t猲 l� <color=Red>Л阯g U<color>, l� ngi mu閕 mu閕 duy nh蕋 c馻 cha ta, nh璶g v�  l祄 tr竔 m玭 quy, k誸 h玭 v韎 ngi b猲 ngo礽,  b� T� ph� tr鬰 xu蕋 kh醝 gia m玭, hai mi n╩ nay ch璦 t鮪g g苝 m苩, ta bi誸 cha ta ngo礽 m苩 kh玭g n鉯, nh璶g trong l遪g r蕋 nh� n mu閕 mu閕.", "V藋 sao Chng m玭 kh玭g n b� ta v�, c� nh� 畂祅 vi猲?")
		elseif (UTask_tm == 20*256+60) then 
			Talk(2, "", "Л阯g U s� c�  tha th� cho Chng m玭. B� ta b秓 ta 甧m <color=Red>Kim H筺g khuy猲<color> n祔 giao cho Chng m玭.", "Th藅 �? Hay qu�! Ngi qu� l� c� b秐 l躰h, mau 甧m<color=Red> Kim H筺g khuy猲<color> giao cho cha ta! g ta 產ng � <color=Red>ph遪g kh竎h<color>.")
			Msg2Player("V� ph遪g Ngh� S� t譵 Л阯g Nh蕋 Tr莕, 頲 bi誸 Chng m玭 Л阯g C鮱 產ng � Ph遪g kh竎h.")
			SetTask(2,20*256+70)
		elseif (UTask_tm == 20*256+70) then
			Talk(1, "", "T鑤 qu�! Mau 甧m Kim H筺g khuy猲 giao cho cha ta! g ta 產ng � <color=Red>ph遪g kh竎h<color>.")
		elseif (UTask_tm == 50*256+20) then		--50级任务
			Talk(4, "", "Чi s� huynh! Huynh bi誸 t鑙 qua ai v祇 ph遪g 竚 kh� kh玭g?", "T鑙 qua h譶h nh� <color=Red>Tam s�  Л阯g H遖<color> v� <color=Red>Ng� s�  Л阯g Nguy猲 <color> � .", "Kh玭g bi誸 hi謓 gi� h� 產ng � u?", "<color=Red>Ng� s� <color> v鮝 m韎 v閕 v� n <color=Red>Giang T﹏ th玭<color>  th╩ ngi c藆 b� b謓h, tam s�  ra ngo礽 nh璶g kh玭g bi誸 甶 u. ")
			SetTask(2, 50*256+40)
			Msg2Player("T筰 ph遪g Ngh� s�, t� Л阯g Nh蕋 Tr莕 bi誸 頲 tam s� huynh Л阯g H遖 v� ng� s� huynh Л阯g Nguy猲 c� 甶 qua ph遪g 竚 Kh�, bi觰 hi謓 kh� nghi nh蕋.")
			AddNote("T筰 ph遪g Ngh� s�, t� Л阯g Nh蕋 Tr莕 bi誸 頲 tam s� huynh Л阯g H遖 v� ng� s� huynh Л阯g Nguy猲 c� 甶 qua ph遪g 竚 Kh�, hai ngi c� v� kh� nghi. Л阯g Nguy猲 甶 Giang T﹏ Th玭 th╩ ngi c藆, c遪 Л阯g H遖 kh玭g bi誸 甶 u n鱝.")
		elseif (UTask_tm == 50*256+40) then							--50级任务
			Talk(1,"","Sao ngi l筰 h醝 ai  v祇 ph遪g 竚 kh�? Х x秠 ra chuy謓 g� ph秈 kh玭g?")
		elseif (UTask_tm > 20*256) and (UTask_tm < 30*256) then					--已经接到20级任务，尚未完成
			Talk(1,"","Ch錸g c� ch誸 甶, c� c� c� n � trong ng玦 nh� tranh � h藆 s琻 <color=Red>V� T﹎ c鑓<color>. T�  b� 蕐 kh玭g mu鑞 g苝 m苩 ngi trong Л阯g m玭, ta  n  nhi襲 l莕 nh璶g ch� ng <color=Red>trc c鯽<color> th豱h an b�, l莕 n祔 nh� ngi v藋! ")
		elseif (UTask_tm >= 30*256) then					--已经完成20级任务，尚未出师
			Talk(1,""," t� ngi  h鉧 gi秈 ﹏ o竛 gi鱝 cha ta v� c� c�! ")
		else
			Talk(1,"","Л阯g m玭 l� m閠 tr� c閠 trong gi韎 v� l﹎, kh玭g nh鱪g d鵤 v祇 v� c玭g m� c遪 l� c玭g phu 竚 kh�. V� m苩 竚 kh� l� th� m筺h c馻 ch髇g ta.")
		end
	elseif (Uworld51 >= 10) and (Uworld51 < 100) then		-- 洗清冤屈任务：进行中
		Talk(1,"","Nh蕋 Tr莕 tuy l� b蕋 t礽 t� nh璶g kh玭g v� th� m� 甧m tuy謙 h鋍 v� c玭g truy襫 ra ngo礽. ")
	elseif (Uworld51 >= 100) then					-- 洗清冤屈任务：已经完成
		Talk(1,"","N誹 kh玭g ph秈 ngi gi髉 ta r鯽 s筩h oan t譶h, chuy謓 n祔 kh玭g bi誸 s� ra sao n鱝, ta v� H祄 Y猲 ph秈 c竚 琻 ngi m韎 ng!")
	elseif (UTask_tm >= 70*256) then							--已经出师
		Talk(1,"","C� r秐h nh� v� th╩ ch髇g ta.")
	else
		Talk(1,"","Ngi l�  t� m韎 nh藀 m玭 ph秈 kh玭g?")
	end
end;

function L20_get()
	DelItem(41)							--防止重接任务后，玩家捡起任务道具
	Say("thng lng", 2, "в ta ngh� c竎h xem sao/L20_get_yes", "Kh玭g c� c竎h/L20_get_no")
end;

function L20_get_yes()
	Talk(1,"","Ch錸g c� ch誸 甶, c� c� c� n � trong ng玦 nh� tranh � h藆 s琻 <color=Red>V� T﹎ c鑓<color>. T�  b� 蕐 kh玭g mu鑞 g苝 m苩 ngi trong Л阯g m玭, ta  n  nhi襲 l莕 nh璶g ch� ng <color=Red>trc c鯽<color> th豱h an b�, l莕 n祔 nh� ngi v藋! ")
	SetTask(2, 20*256+20)
	AddNote("T筰 ph遪g Ngh� s� (507,319) g苝 Л阯g Nh蕋 Tr莕, nh薾<color=red> nhi謒 v� Л阯g U<color>, n V� T﹎ C鑓 h鉧 gi秈 ﹏ o竛 huynh  gi鱝 s� c� Л阯g U v� chng m玭.")
	Msg2Player("T筰 s穘h Ngh� s� g苝 Л阯g Nh蕋 Tr莕, nh薾 nhi謒 v�:  V� T﹎ C鑓 hng B綾 h鉧 gi秈 ﹏ o竛 huynh  gi鱝 s� c� Л阯g U v� chng m玭.")
end;

----------------------- 世界任务 --------------------------
function Uworld51_get()
	Say("Ai da! n鉯 ra d礽 l緈卌� th� gi髉 ta gi髉 ta chuy觧 l阨 Do穘 H祄 Y猲?",2,"Chuy謓  d� th玦, m� n閕 dung trong tin l� g� v藋?/Uworld51_get_yes","ta nh鴆 u l緈, ng礽 t譵 ngi kh竎 gi髉  甶./L20_get_no")
end

function Uworld51_get_yes()
	Talk(1,"","N鉯 v韎 c� ta: Cha ta kh玭g bi誸 th� n祇 t nhi猲 l筰 ph秐 i h玭 s� c馻 ch髇g ta, h玭 l� c� th� th� s� kh� kh╪, nh璶g c� ta ng qu� lo l緉g.")
	SetTask(51,10)
	Msg2Player("Ti誴 nh薾 nhi謒 v�: Gi髉 Л阯g Nh蕋 Tr莕 mang tin t韎 Do穘 H祄 Y猲.")
	AddNote("Ti誴 nh薾 nhi謒 v� 'R鯽 s筩h oan 鴆': Gi髉 Л阯g Nh蕋 Tr莕 a tin t韎 cho Do穘 H祄 Y猲.")
end

function Uworld51_30()
	SetTask(51,30)
	Msg2Player("B筺 quy誸 nh 甶 g苝 M玭 ch� Л阯g C鮱, gi髉 Л阯g Nh蕋 Tr莕 gi秈 th輈h.")
end

function Uworld51_60()
	SetTask(51,60)
	Msg2Player("Л阯g Nh蕋 Tr莕 m阨 b筺 甶 Ti課 C骳 ng ti猽 di謙 th輈h kh竎h Kim Qu鑓, 畂箃 b� ki誴 v�.")
end

function Uworld51_80()
	SetTask(51,80)
	Msg2Player("Л阯g Nh蕋 Tr莕 c秏 琻 b筺 gi髉 , ng th阨 hy v鋘g b筺 c� th� gi髉 玭g ta n鉯 r� v韎 M玭 ch� Л阯g C鮱.")
end

function Uworld51_100()
	SetTask(51,100)
	i = random(35,45)
	AddRepute(i)		-- 加声望
	Msg2Player("Л阯g Nh蕋 Tr莕 c竚 琻 s� gi髉  c馻 b筺, Danh v鋘g c馻 b筺 t╪g th猰"..i.."甶觤.")
	Msg2Player("B筺 t� nguy謓 甧m tin t鑤 b竜 cho Do穘 H祄 Y猲, gi髉 c� ta gi秏 b韙 s� lo ﹗ ch� i.")
end

function L20_get_no()
end;
