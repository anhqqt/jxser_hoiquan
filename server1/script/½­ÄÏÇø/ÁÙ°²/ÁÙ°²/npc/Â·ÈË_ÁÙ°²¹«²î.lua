-- 江南区 临安 路人_临安公差.lua （消灭采花贼任务）
-- By: Dan_Deng(2004-05-27)

Include("\\script\\global\\repute_head.lua")

function main(sel)
	Uworld43 = GetTask(43)
--	if (Uworld43 < 10) and (GetLevel() >= 70) and (GetReputeLevel(GetRepute()) >= 6) then
		--		Say(10713 ,2,"奸淫妇女乃十恶不涉之罪，我既知晓，自然要管。/U43_get","没有/no")
	if (Uworld43 == 40) and (HaveItem(381) == 1) then
		Talk(6,"U43_40","Qu� nhi猲 kh玭g ngo礽 d� 畂竛 c馻 ta. Цm t芻 Th竔 Hoa n祔 v鑞 l� b鋘 � L玦 V﹏ tr筰 -do M筩 Kh玭g Nguy謙 c莔 u","L� c竔 t猲 M筩 Kh玭g Nguy謙 'V筺 hoa ch髇g trung qu�; phi課 di謕 b蕋 thi謕 th﹏'  sao?!","Ch輓h l� h緉! V鑞 xu竧 th﹏ t� m閠 'h祇 t閏 ph� qu�', ti猽 ti襫 hoang ph�. Sau khi ngi ti襫 nhi謒 c馻 L玦 V﹏ tr筰 qua i, h緉 ti誴 nh薾 t� nghi謕. Nh璶g kh玭g ph竧 huy 頲, ngc l筰 c遪 gi秈 t竛 s琻 tr筰, l祄 m閠 'l� t芻 c h祅h'. Khinh c玭g c馻 h緉 tuy謙 k�, trc gi� ch璦 ai c� th� b総 頲. H緉  h筰 kh玭g bi誸 bao nhi猽 ngi con g竔 trinh b筩h'. ","N鉯 nh� v藋, ngh躠 l� Sai i nh﹏  d� ra 頲 h祅h tung c馻 h緉 r錳?","N誹 n gi秐 nh� v藋 th� ta  kh玭g c莕 n ngi gi髉 s鴆. Ngi n祔 n - 甶 kh� li謚. Ch綾 ch緉 h緉 產ng mu鑞 甶 t譵 hai chi誧 'V﹏, L玦 thc ' (thc: ch譨 kh鉧) n祔  m� c鯽 l韓! Ngi  c� trong tay m閠 chi誧 'L玦 thc'r錳! Theo nh� ta t輓h to竛 th� chi誧 c遪 l筰 hi謓 產ng � trong tay c馻 tr筰 ch� V﹏ B� g. ","Ta s� 甶 t譵 chi誧 c遪 l筰. Kh玭g tr� ngi n祔 th� kh玭g bi誸 bao nhi猽 c� g竔 n鱝 s� b� l祄 nh鬰")
	elseif (Uworld43 == 80) and (HaveItem(382) == 1) then
		Talk(1,"U43_80","Qu� nhi猲 kh玭g ngo礽 d� 畂竛 c馻 ta, M筩 Kh玭g Nguy謙 hi謓 產ng 萵 n蕄 � trong th祅h L﹎ An n祔. Ngi h穣 ch辵 kh� t譵 cho th藅 k� lng. Theo ta c 畂竛 th� h緉 產ng � quanh v飊g T﹜ H� ")
	elseif (Uworld43 == 10) then
		Talk(1,"","L﹗ nh� v藋 m� v蒼 ch璦 t譵 頲 t玭g t輈h g� c馻 b鋘 Th竔 Hoa t芻 �?")
	elseif (Uworld43 == 20) then
		Talk(1,"","Kh玭g t譵 頲 doanh tr筰 c馻 ch髇g �? N誹 t譵 頲 chi誧 'V﹏ thc' th� t蕋 t譵 頲 n琲 b鋘 ch髇g 產ng tr� 萵")
	else
		Talk(1,"","Di ch﹏ Thi猲 T�, sao c遪 d竚 ph秐 ngh辌h! B蕋 c� k� n祇 l祄 c祅 � th祅h L﹎ An n祔, t鑤 nh蕋 l� ng  r琲 v祇 tay ta")
	end
end;

function U43_get()
	Talk(1,"","T鑤! Theo ta 甶襲 tra 頲 th� b鋘 t芻 Th竔 Hoa n祔 t� cho m譶h l� phong l璾, th輈h s� d鬾g qu箃. Ch髇g  t鮪g xu蕋 hi謓 � Th鬰 s琻. N琲  v鑞 l� s琻 tr筰 c馻 b鋘 ki誴 ph� L玦 V﹏. Trc ti猲 ngi h穣 v祇 n骾 Th鬰 s琻  t譵 g苝 L玦 B� Lang ch�. H緉 t蕋  bi誸 chuy謓 n祔. C� 甶襲, ngi n祔 v鑞 nham hi觤, c 竎. Ngi ph秈 n猲 c萵 th薾  ph遪g")
	SetTask(43,10)
	AddNote("Nh薾 nhi謒 v� do C玭g Sai th祅h L﹎ An 駓 th竎: Ti猽 di謙 b鋘 t芻 Th竔 Hoa.  d� th竚 t譶h h譶h c馻 ch髇g. Ch髇g  g﹜ ra li猲 ti誴 nhi襲 v� 竛 g莕 y. ")
	Msg2Player("Nh薾 nhi謒 v� do C玭g Sai th祅h L﹎ An 駓 th竎: Ti猽 di謙 b鋘 t芻 Th竔 Hoa.  d� th竚 t譶h h譶h c馻 ch髇g. Ch髇g  g﹜ ra li猲 ti誴 nhi襲 v� 竛 g莕 y. ")
end;

function U43_40()
	SetTask(43,50)
	Msg2Player("Sau  l筰 甶 t譵 V﹏ B� 璶g ch�  畂箃 l蕐 chi誧V﹏ thc (ch譨 kh鉧) ")
end

function U43_80()
	SetTask(43,90)
	Msg2Player("T譵 n琲 M筩 Kh玭g Nguy謙 產ng tr� 萵 � L﹎ An ")
end

function no()
end;
