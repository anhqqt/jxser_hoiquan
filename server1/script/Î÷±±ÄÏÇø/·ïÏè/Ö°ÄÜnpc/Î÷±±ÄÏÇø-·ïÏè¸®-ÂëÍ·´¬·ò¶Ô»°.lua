--西北南区 凤翔府 码头船夫对话
--suyu
--200306015

CurWharf = 1;
Include("\\script\\global\\station.lua")
Include("\\script\\missions\\autohang\\function.lua")
---------------------------------------------------------------
function main(sel)
	if (GetLevel() >= 50) then
		Say("Ho祅g h� ch輓 kh骳 u鑞 quanh, em b� b猲 蕐 c遪 anh b猲 n祔....", 3, "Ng錳 thuy襫/WharfFun", "Kh玭g ng錳/OnCancel", " Уo Hoa o (7) /go_thd");
	else
		Say("Ho祅g h� ch輓 kh骳 u鑞 quanh, em b� b猲 蕐 c遪 anh b猲 n祔....", 2, "Ng錳 thuy襫/WharfFun", "Kh玭g ng錳/OnCancel");
	end

end;

---------------------------------------------------------------
function  OnCancel()

   Say("Kh玭g ti襫 kh玭g th� l猲 thuy襫! ",0)

end;

---------------------------------------------------------------
function go_thd()
	nRet = aexp_gotothd(241);
	-- if (nRet == 1) then
	--	Msg2Player("船夫：最近去桃花岛的人可真多。好吧，你坐好喽！")
	if (nRet == -1) then
		Talk(1,"","Ph� 甶 thuy襫 n Уo Hoa Фo "..AEXP_TICKET.."Lng, ngi c�  kh玭g? ")
	end
end
---------------------------------------------------------------
