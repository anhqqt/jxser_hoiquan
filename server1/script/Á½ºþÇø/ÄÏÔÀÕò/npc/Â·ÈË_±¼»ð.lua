-- 南岳镇 路人 奔火
-- 2004/4/17 名驹奔火任务 by fangjieying

function main()
	Uworld76 = GetTask(76)
	if (Uworld76 == 10) then
		Talk(1,"","M閠 con tu蕁 m� ng n琲 g鑓 c﹜, h譶h nh� 產ng d醤g tai l猲 nghe l阨 b筺 n鉯")
		SetTask(76,20)
		Msg2Player("Xem ra con ng鵤 n祔  b� b謓h, vi謈 B祅h i gia nh� ph秈 ch╪g l� c� li猲 quan n chuy謓 n祔 ")
	elseif (Uworld76 == 50) and (HaveItem(375) == 1) then		-- 治好了
		DelItem(375)
		SetTask(76,60)
		DelMagic(396)
		if (HaveMagic(397) == -1) then		-- 必须没有技能的才给技能
			AddMagic(397)
		end
		Msg2Player("B筺 l躰h ng� 頲 t﹎ ph竝 V� L� tr飊g Sinh ")
		Talk(1,"","B筺 a Huy誸 D飊g h遖 cho ng鵤 nu鑤, ng th阨 v薾 kh雐 'Xu﹏ Phong V� L�' K� thu藅 T﹎ ph竝, m総 c馻 B玭 H醓 d莕 d莕 s竛g l猲. Cho n l骳 n祔 b筺 m韎 th藅 s� l躰h ng� 頲'V� L� ph鬰 sinh' T﹎ ph竝")
	elseif (Uworld76 >10) and (Uworld76 < 50) then
		Talk(1,"","B玭 H醓 h� vang l猲 m閠 ti課g nh� s蕀 ng ngang tai")
	elseif (Uworld76 > 50) then
		Talk(1,"","B筺  ch鱝 ln礹 b謓h cho B玭 H醓")
	else
		Talk(1,"","Зy l� con ng鵤 c� l玭g  nh� m竨, t猲 g鋓 'B玭H醓'")
	end
end
