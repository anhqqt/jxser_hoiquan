--西南北区 峨嵋派 卖兵器的弟子对话
-- Update: Dan_Deng(2003-08-21) 加入卖道具只卖给本帮

function main(sel)
	Uworld36 = GetByte(GetTask(36),1)
	if (GetFaction() == "emei") or (Uworld36 == 127) then
		Say(" t� b鎛 ph竔 u l� n� nhi m襪 y誹, v� th� 產 s� c竎 lo筰 binh 產o u nh� nh祅g linh ho箃", 2, "Giao d辌h/yes", "Kh玭g giao d辌h/no")
	else
		Talk(1,"","Chng m玭 c� l謓h: binh kh� m玭 ph竔 ch� b竛 cho t� mu閕 ng m玭!")
	end
end;

function yes()
Sale(51)
end;

function no()
end;
