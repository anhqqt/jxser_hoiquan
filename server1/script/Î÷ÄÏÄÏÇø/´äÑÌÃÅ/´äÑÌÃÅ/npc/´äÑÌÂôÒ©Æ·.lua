--翠烟门 卖药的弟子对话
-- Update: Dan_Deng(2003-08-21) 加入卖道具只卖给本帮

function main(sel)
	Uworld36 = GetByte(GetTask(36),2)
	if (GetFaction() == "cuiyan") or (Uworld36 == 127) then
		Say("Trang b� c祅g nhi襲 dc li謚 qu� th� c祅g c� 輈h", 2, "Giao d辌h/yes", "Kh玭g giao d辌h/no")
	else
		Talk(1,"","M玭 ch� c� l謓h, Dc li謚 c馻 b鎛 m玭 ch� d祅h cho t� mu閕 ng m玭.")
	end
end;

function yes()
Sale(68)
end;

function no()
end;
