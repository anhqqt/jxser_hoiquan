--两湖区 巴陵县 铁匠对话
--update:zhaowenyi(2005-02-20)增加紫色及黄金装备铸造

Include("\\script\\global\\global_tiejiang.lua")

TIEJIANG_DIALOG = "<dec><npc>Vi謈 bu玭 b竛 � y r蕋 thu薾 l頸, n ngay c� c竎 huynh  c馻 Thi猲 Vng Bang thng n y nh� ta ch� t筼 binh kh�."

function main(sel)
	tiejiang_village()
end;


function yes()
Sale(37);  			--弹出交易框
end;
