--中原北区 汴京府 铁匠2对话

Include("\\script\\global\\global_tiejiang.lua")

TIEJIANG_DIALOG = "<dec><npc>Чi h� gi� y v祇 xem nhanh n祇!"

function main(sel)
	tiejiang_city();
end;

function yes()
Sale(7);  			--弹出交易框
end;
