--中原南区 襄阳府 路人3小邓子对话


Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\activitysys\\answer.lua")

function main()
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end

	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<#><npc>Ti觰 ng t�: Ta  ╪ ch竜 v韎 khoai h琻 m閠 tu莕 r錳. Gi� m� ╪ 頲 m閠 b鱝 c琺 no n� nh�?"
	
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog)
	--弹出对话框
	tbDailog:Show()
end

