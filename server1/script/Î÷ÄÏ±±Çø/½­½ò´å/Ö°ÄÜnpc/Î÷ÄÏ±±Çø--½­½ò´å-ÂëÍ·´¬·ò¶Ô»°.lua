--西南北区 江津村 码头船夫对话
--suyu
--200306015
-- Update: Dan_Deng(2003-08-21) 降低出村等级要求为5级

CurWharf = 2;
Include("\\script\\global\\station.lua")
---------------------------------------------------------------
function main(sel)

if (GetLevel() >= 5) then		--等级达到十级
	Say("Mu鑞 ng錳 thuy襫 甶 u v藋?", 2, "Ng錳 thuy襫/WharfFun", "Kh玭g ng錳/OnCancel");
else		
	Talk(1,"","B猲 ngo礽 lo筺 l筩, xem ngi tr鉯 g� kh玭g ch苩! Ra ngo礽 th玭 ta e kh玭g gi� 頲 m筺g u!")
end

end;

---------------------------------------------------------------
function  OnCancel()
   Say("Kh玭g ti襫 kh玭g th� l猲 thuy襫! ",0)
end;

---------------------------------------------------------------
