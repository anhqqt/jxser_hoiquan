--西南北区 成都 船夫对话

CurWharf = 9;
Include("\\script\\global\\station.lua")
Include("\\script\\missions\\autohang\\function.lua")
---------------------------------------------------------------
function main(sel)
	if (GetLevel() >= 50) then
		Say("� y tuy kh玭g c� b誹 t祏 nh璶g ta c騨g c� c竎h a ngi 甶!", 2, " Уo Hoa o (6) /go_thd", "Kh玭g ng錳/OnCancel")
	else
		Talk(1, "", "Kh玭g bi誸 bao gi� � y m韎 c� m閠 b課 t祏!")
	end
end;

function  OnCancel()
   Talk(1,"","Kh玭g ti襫 kh玭g th� ng錳 thuy襫! ")
end;

---------------------------------------------------------------
function go_thd()
	nRet = aexp_gotothd(240);
	-- if (nRet == 1) then
	--	Msg2Player("船夫：最近去桃花岛的人可真多。好吧，你坐好喽！")
	if (nRet == -1) then
		Talk(1,"","Ph� 甶 thuy襫 n Уo Hoa Фo "..AEXP_TICKET.."Lng, ngi c�  kh玭g? ")
	end
end
---------------------------------------------------------------
