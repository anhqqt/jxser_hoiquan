--江南区 临安府 长江码头船夫对话
--suyu
--20031029

CurWharf = 11;
Include("\\script\\global\\station.lua")
Include("\\script\\missions\\autohang\\function.lua")

function main(sel)
	if (GetLevel() >= 50) then
		Say("Thuy襫 c馻 ta kh玭g ph秈 t莔 thng! T鮪g ch� qua i th莕 t� tng c馻 tri襲 nh! Mu鑞 甶 u ph秈 t trc!", 3, "Ng錳 thuy襫/WharfFun", "Kh玭g ng錳/OnCancel", "<#>  Уo Hoa o (1) ["..AEXP_TICKET.."<#> Lng]/go_thd");
	else
		Say("Thuy襫 c馻 ta kh玭g ph秈 t莔 thng! T鮪g ch� qua i th莕 t� tng c馻 tri襲 nh! Mu鑞 甶 u ph秈 t trc!", 2, "Ng錳 thuy襫/WharfFun", "Kh玭g ng錳/OnCancel")
	end
end;

function  OnCancel()
   Talk(1,"","Kh玭g ti襫 kh玭g th� ng錳 thuy襫! ")
end;

function go_thd()
	nRet = aexp_gotothd(235);
	-- if (nRet == 1) then
	--	Msg2Player("船夫：最近去桃花岛的人可真多。好吧，你坐好喽！")
	if (nRet == -1) then
		Talk(1,"","<#> Ph� 甶 Уo Hoa o"..AEXP_TICKET.."<#> ng﹏ lng, ngi tr� n鎖 kh玭g?")
	end
end
