--中原南区 扬州府 杂货店老板对话
Include("\\script\\global\\global_zahuodian.lua");

function main(sel)
	local Buttons = store_sel_extend();
	Say("Л阯g th駓 Dng Ch﹗ c馻 ch髇g ta th玭g ra b鑞 ng�, l� n琲 c�  h祅g h鉧 t� Nam t韎 B綾, v� th� v藅 ph萴 ch髇g t玦 c�  Йng T﹜ Nam B綾, th� g� c騨g c�, mua m閠 輙 g� 甶?", getn(Buttons), Buttons);

end;


function yes()
Sale(5);  			--弹出交易框
end;

function BuyChristmasCard()
	Sale(97);
end


function no()
end;





