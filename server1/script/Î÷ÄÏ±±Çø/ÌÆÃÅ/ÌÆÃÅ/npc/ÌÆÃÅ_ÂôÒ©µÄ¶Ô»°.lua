--西南北区 唐门 卖药的弟子对话
-- Update: Dan_Deng(2003-08-21) 加入卖道具只卖给本帮

function main(sel)
	Uworld37 = GetByte(GetTask(37),1)
	if (GetFaction() == "tangmen") or (Uworld37 == 127) then
		Say(" thu藅 c馻 Tuy謙 Xu﹏ T萿 b鎛 m玭 c� th� n鉯 l� c b� thi猲 h�. Tuy謙 Xu﹏ T萿 甶襲 ch� nh鱪g dc ho祅 n祔.", 2, "Giao d辌h/yes", "Kh玭g giao d辌h/no")
	else
		Talk(1,"","M玭 ch� c� l謓h, dc ph萴 c馻 b鎛 m玭 kh玭g th� b竛 cho ngi ngo礽!")
	end
end;

function yes()
Sale(56)
end;

function no()
end;
