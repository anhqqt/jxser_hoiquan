--西南北区 江津村 药店老板对话（江津村新手任务：吴老爹的药）
--suyu
-- Update: Dan_Deng(2003-08-11)
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")


function main(sel)
	UTask_world21 = GetTask(49);
	Uworld1000 = nt_getTask(1000)	
	if ((UTask_world21 == 1) and (HaveItem(179) == 0)) then
		Say("Ng� L穙 Th竔 nh� ngi n mua thu鑓 �? Ta  chu萵 b� s絥 cho ngi 10 vi猲 Xuy猲 B鑙 ho祅, t鎛g c閚g 200 lng. Nh緉 v韎 L穙 th竔 h穣 gi� g譶 s鴆 kh醗!",3,"Mua Xuy猲 B鑙 ho祅/buy","Mua m閠 輙 thu鑓 kh竎/yes","Kh玭g mua u/no")
	else
		Say("Ngi  ╪ 5 c鑓 t筽 lng, kh玭g ph竧 h醓 nh鴆 u m韎 l�! Ch� ta tuy nh� nh璶g tuy謙 i kh玭g thi誹 th� g�! Ngi c� mu鑞 mua 輙 thu鑓 kh玭g?", 3, "Giao d辌h/yes", "Ta n nh薾 nhi謒 v� S� nh藀/yboss","Kh玭g giao d辌h/no");
	end
end;

function buy()
	if(GetCash() >= 200)then
		Pay(200)
		AddEventItem(179) --得到药
		Msg2Player("Ngi 頲 mi vi猲 Xuy猲 B鑙 ho祅")
		AddNote("Mua 頲 Xuy猲 B鑙 ho祅")
	else
		Talk(1,"","Thu鑓 c馻 ngi ta gi� l筰 y, i c�  ti襫 r錳 h穣 quay l筰 l蕐 thu鑓!")
	end
end;

function yes()
	Sale(24)						--弹出交易框
end;

function no()
end;
