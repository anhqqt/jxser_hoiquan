--西北北区 龙门镇 黄河码头船夫对话
--suyu
--20031029

CurWharf = 10;
Include("\\script\\global\\station.lua")

function main(sel)
	if (GetLevel() >= 5) then		--等级达到五级
		Say("Ch髇g ta l祄 c玭g � tr猲 thuy襫 n祔 th﹖ l� c鵦 kh�! N緉g ch竬! Gi� qu藅! B﹜ gi� l筰 g苝 s鉵g to gi� l韓, e r籲g s� kh玭g ai s鑞g s鉻!", 2, "Ng錳 thuy襫/WharfFun", "Kh玭g ng錳/OnCancel")
	else		
		Talk(1,"","B猲 ngo礽 lo筺 l筩, xem ngi tr鉯 g� kh玭g ch苩! Ra ngo礽 th玭 ta e kh玭g gi� 頲 m筺g u!")
	end
end;

function  OnCancel()
   Talk(1,"","Kh玭g ti襫 kh玭g th� ng錳 thuy襫! ")
end;