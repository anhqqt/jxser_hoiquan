--西南北区 江津村 杂货店老板对话
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\global\\global_zahuodian.lua");

function main(sel)
	local buttons = store_sel_village_extend();
		Say("H祅g ch蕋 y trong ti觰 甶誱, Kh竎h quan mu鑞 mua g� n祇? H穣 v祇 xem th� 甶!",getn(buttons), buttons);
end;


function yes()
Sale(23);   			--弹出交易框
end;


function no()
end;






