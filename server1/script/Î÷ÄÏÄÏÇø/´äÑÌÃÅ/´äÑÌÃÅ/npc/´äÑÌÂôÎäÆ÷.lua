--翠烟门 卖兵器的弟子对话
Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

function main(sel)
	Uworld36 = GetByte(GetTask(36),2)
	if (GetFaction() == "cuiyan") or (Uworld36 == 127) or (GetLastFactionNumber() == 5) then
		local nNpcIndex = GetLastDiagNpc();
		local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))

		local szNpcName = GetNpcName(nNpcIndex)
		if NpcName2Replace then
			szNpcName = NpcName2Replace(szNpcName)
		end

		local tbDailog = DailogClass:new(szNpcName)
		tbDailog.szTitleMsg = "<npc>C玭g phu c馻 b鎛 m玭 quan tr鋘g l� bi課 ho� kh玭 lng, kh玭g nh� nh鱪g v� c玭g t﹎ thng kh竎."
		tbDailog:AddOptEntry("Giao d辌h", yes)
		tbDailog:AddOptEntry("Kh玭g giao d辌h", no)
		G_TASK:OnMessage("Th髖 Y猲", tbDailog, "DialogWithNpc")
		tbDailog:Show()
	else
		Talk(1,"","M玭 ch� c� l謓h, binh kh� c馻 b鎛 m玭 ch� d祅h cho t� mu閕 ng m玭.")
	end
end;

function yes()
Sale(66)
end;

function no()
end;
