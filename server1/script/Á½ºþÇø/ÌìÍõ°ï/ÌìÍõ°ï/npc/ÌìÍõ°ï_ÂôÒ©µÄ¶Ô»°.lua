--两湖区 天王帮 卖药的帮众对话
-- Update: Dan_Deng(2003-08-21) 加入卖道具只卖给本帮

function main(sel)
	Uworld38 = GetByte(GetTask(38),1)
	if (GetFaction() == "tianwang") or (Uworld38 == 127) then
		Say("C竎 dc l蕺u n祔 l� s鑞g � tr猲 o t� sinh t� l韓, c莔 m竨 dng kh� c鵦 k� h鱱 hi謚", 2, "Giao d辌h/yes", "Kh玭g giao d辌h/no")
	else
		Talk(1,"","Bang ch� c� l謓h: Dc ph萴 c馻 b鎛 bang ch� b竛 cho huynh  ng m玭")
	end
end;

function yes()
Sale(59);  			
end;

function no()
end;






