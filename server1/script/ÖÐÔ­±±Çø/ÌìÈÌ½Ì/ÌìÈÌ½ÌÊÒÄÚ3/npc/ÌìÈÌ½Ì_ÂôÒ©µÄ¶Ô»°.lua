--中原北区 天忍教 卖药的弟子对话
-- Update: Dan_Deng(2003-08-21) 加入卖道具只卖给本帮

function main(sel)
	Uworld30 = GetByte(GetTask(30),1)
	if (GetFaction() == "tianren") or (Uworld30 == 127) then
		Say("Y thu藅 c馻 Чi Kim ch髇g ta kh玭g thua k衜 g� nh� T鑞g, danh y, h秓 dc u kh玭g thi誹� ", 2, "Giao d辌h/yes", "Kh玭g giao d辌h/no")
	else
		Talk(1,"","Gi竜 ch� c� l謓h, thu鑓 c馻 b鎛 gi竜 ch� b竛 cho c竎  t� trung th祅h.")
	end
end;

function yes()
Sale(62)
end;

function no()
end;
