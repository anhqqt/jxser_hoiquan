--昆仑派 卖兵器的弟子对话
-- Update: Dan_Deng(2003-08-21) 加入卖道具只卖给本帮

function main(sel)
	Uworld31 = GetByte(GetTask(31),2)
	if (GetFaction() == "kunlun") or (Uworld31 == 127) then
		Say("е t� c馻 b鎛 ph竔 ch� tr鋘g tu luy謓 o ph竝 b颽 ch�, i v韎 binh 產o, v� c玭g th� kh玭g 頲 tinh th玭g l緈", 2, "Giao d辌h/yes", "Kh玭g giao d辌h/no")
	else
		Talk(1,"","Chng m玭 c� l謓h: binh kh� ch� 頲 b竛 cho ng m玭.")
	end
end;

function yes()
	Sale(75)
end;

function no()
end;
