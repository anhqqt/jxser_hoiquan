--五毒教 卖装备的弟子对话
-- Update: Dan_Deng(2003-08-21) 加入卖道具只卖给本帮

function main(sel)
	Uworld37 = GetByte(GetTask(37),2)
	if (GetFaction() == "wudu") or (Uworld37 == 127) then
		Say("Ch髇g ta ng qu� quan tr鋘g v� nh鱪g th� n祔. Trang b� t鑙 thng nh蕋 ch輓h l� s� 鴑g ph� linh ho箃.", 2, "Giao d辌h/yes", "Kh玭g giao d辌h/no")
	else
		Talk(1,"","Gi竜 ch� c� l謓h: trang b� c馻 m玭 ph竔 kh玭g 頲 b竛 cho ngi ngo礽")
	end
end;

function yes()
	Sale(79)
end;

function no()
end;
