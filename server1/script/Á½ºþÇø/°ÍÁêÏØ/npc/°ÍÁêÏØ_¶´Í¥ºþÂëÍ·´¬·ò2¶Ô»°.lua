--两湖区 巴陵县 洞庭湖码头船夫2对话
-- Update: Dan_Deng(2003-08-21) 降低出村等级要求为5级

function main(sel)
Say("C� i ta u s鑞g v韎 s玭g nc! чng ёnh h� kh玭g ch� n祇 ta kh玭g bi誸! Kh竎h quan mu鑞 甶 u?", 2, " Thi猲 Vng o /yes", "Kh玭g ng錳/no");
end;

function yes()
if (GetLevel() >= 5) then						--等级达到十级
	if (GetFaction() == "tianwang") then				--如果玩家是天王帮弟子，坐船不收钱
		Say("Huynh  c馻 Thi猲 Vng bang th� 甶 thuy襫 mi詎 ph�!", 1, "Xin 產 t� /ok1")
	else	
		Say("N琲  hi觤 nguy l緈! N誹 kh竎h quan mu鑞 甶 xin cho th猰 輙 ti襫!", 1, "Л頲. /ok2")
	end
else		
	Talk(1,"","Xin l鏸! Ngi ch璦 n c蕄 5, kh玭g  s鴆 ng錳 thuy襫 u!")
end
end;

function no()
end;


function ok1()
NewWorld(59, 1425, 3472)
SetFightState(0)								--转换为非战斗状态
end;


function ok2()
if (GetCash() >= 100) then							--参考值
	Pay(100)
	NewWorld(59, 1425, 3472)
	SetFightState(0)							--转换为非战斗状态	
else
	Say("Лa ngi 甶 c玭g kh玭g v藋 gia nh ta ch誸 i �?", 0)		
end
end;
