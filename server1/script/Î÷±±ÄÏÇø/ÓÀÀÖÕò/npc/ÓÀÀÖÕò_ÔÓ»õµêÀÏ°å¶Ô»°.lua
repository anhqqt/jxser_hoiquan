--西北南区 永乐镇 杂货店老板对话
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\global\\global_zahuodian.lua");

function main(sel)
	local buttons = store_sel_village_extend();
		Say("kh竎h quan mu鑞 c莕 mua g�? Th� g� c騨g c�!",getn(buttons), buttons);
end;


function yes()
Sale(84);   			--弹出交易框
end;


function no()
end;