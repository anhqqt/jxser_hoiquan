--昆仑派 卖装备的弟子对话
-- Update: Dan_Deng(2003-08-21) 加入卖道具只卖给本帮

function main(sel)
	Uworld31 = GetByte(GetTask(31),2)
	if (GetFaction() == "kunlun") or (Uworld31 == 127) then
		Say("N鉯 n Thi猲 S� Чo B祇,ch� ph萴 c馻 b鎛 ph竔 t蕋 nhi猲 l� thi猲 h�  nh蕋,c� V� ng c騨g ph秈 b総 chc ch� t竎 c馻 b鎛 ph竔 ", 2, "Giao d辌h/yes", "Kh玭g giao d辌h/no")
	else
		Talk(1,"","Chng m玭 c� l謓h: trang b� ch� 頲 b竛 cho ng m玭.")
	end
end;

function yes()
Sale(76)
end;

function no()
end;
