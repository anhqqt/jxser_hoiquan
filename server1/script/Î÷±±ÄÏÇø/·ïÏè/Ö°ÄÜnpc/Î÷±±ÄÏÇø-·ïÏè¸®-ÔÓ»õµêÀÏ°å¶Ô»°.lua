--西北南区 凤翔府 杂货店老板对话
Include("\\script\\global\\global_zahuodian.lua");

function main(sel)
	local Buttons = store_sel_extend();
	Say("B鎛 ti謒 tuy nh� nh璶g th� g� c騨g c�. Kh竎h quan mu鑞 mua g�?", getn(Buttons), Buttons);
end;


function yes()
Sale(20); 		--弹出交易框
end;

function BuyChristmasCard()
	Sale(97);
end


function no()
end;

