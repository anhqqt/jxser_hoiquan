--丐帮 卖装备的弟子对话

function main(sel)
	Uworld30 = GetByte(GetTask(30),2)
	if (GetFaction() == "gaibang") or (Uworld30 == 127) then
		Say("Th﹏ l�  t� C竔 Bang, c莕 ph秈 gian kh� r蘮 luy謓  b秓 v� ch輓h ngh躠", 2, "Giao d辌h/yes", "Kh玭g giao d辌h/no")
	else
		Talk(1,"","Bang ch� c� l謓h: trang b� c馻 b鎛 m玭 kh玭g 頲 b竛 cho ngi ngo礽")
	end
end;

function yes()
Sale(73)
end;

function no()
end;
