--西南北区 峨嵋派 卖装备的弟子对话
-- Update: Dan_Deng(2003-08-21) 加入卖道具只卖给本帮

function main(sel)
	Uworld36 = GetByte(GetTask(36),1)
	if (GetFaction() == "emei") or (Uworld36 == 127) then
		Say("Qu莕 竜 gi祔 n鉵 n祔 l� do c竎 t� mu閕 c馻 b鎛 m玭 l祄 ra. R蕋 th輈h h頿 cho t� mu閕 Nga Mi ph竔", 2, "Giao d辌h/yes", "Kh玭g giao d辌h/no")
	else
		Talk(1,"","Chng m玭 c� l謓h: trang b� m玭 ph竔 ch� b竛 cho t� mu閕 ng m玭!")
	end
end;

function yes()
Sale(52)
end;

function no()
end;
