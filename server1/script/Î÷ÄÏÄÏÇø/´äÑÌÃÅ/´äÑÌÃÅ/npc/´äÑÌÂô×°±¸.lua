--翠烟门 卖装备的弟子对话
-- Update: Dan_Deng(2003-08-21) 加入卖道具只卖给本帮

function main(sel)
	Uworld36 = GetByte(GetTask(36),2)
	if (GetFaction() == "cuiyan") or (Uworld36 == 127) then
		Say("Mu鑞 xem c竎 t� mu閕 t� tay d謙 v秈 kh玭g? B猲 ngo礽 kh玭g mua 頲 u.", 2, "Giao d辌h/yes", "Kh玭g giao d辌h/no")
	else
		Talk(1,"","M玭 ch� c� l謓h, trang b� c馻 b鎛 m玭 ch� b竛 cho T� mu閕 ng m玭.")
	end
end;

function yes()
Sale(67)
end;

function no()
end;
