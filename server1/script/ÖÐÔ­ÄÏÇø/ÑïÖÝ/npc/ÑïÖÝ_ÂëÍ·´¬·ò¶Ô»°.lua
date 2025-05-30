--中原南区 扬州府 码头船夫对话
--suyu
--200306015

CurWharf = 6;
Include("\\script\\global\\station.lua")
Include("\\script\\missions\\autohang\\function.lua")
Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
---------------------------------------------------------------
function main(sel)
	local nNpcIndex = GetLastDiagNpc();
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))

	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end

	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<#><npc>Dng Ch﹗ ch髇g ta c� m閠 con su鑙, nhi襲 s玭g, nhi襲 c莡, nhi襲 thuy襫. Nh鱪g ngi gi祏 c� th� s� n thuy襫 甶 du ngo筺 Dng Ch﹗, d鵤 v祇 c竎 thuy襫 phu c馻 ch髇g ta"
	tbDailog:AddOptEntry("Ng錳 thuy襫", WharfFun)
	tbDailog:AddOptEntry("Kh玭g ng錳", OnCancel)
	if GetLevel() >= 50 then
		tbDailog:AddOptEntry(" Уo Hoa Фo (2) [ "..AEXP_TICKET.." lng]", go_thd)
	end
	G_TASK:OnMessage("Nguy謙 Ca Фo", tbDailog, "DialogWithNpc")
	if check_showdialog_condition() then
		tbDailog:AddOptEntry("Лa ta n Nguy謙 Ca Фo", goto_yuegedao)
	end
	tbDailog:Show()
end;

function check_showdialog_condition()
	local tbFactStepList = {
		[5] = 6,
		[2] = 7,
		[4] = 7,
		[3] = 5,
		[6] = 9,
		[7] = 9,
		[0] = 6,
		[8] = 5,
		[1] = 4,
		[9] = 5,
	}
	local nFact = GetLastFactionNumber()
	if nFact == nil or nFact < 0 or nFact > 9 then
		return
	end
	local nFactStep = mod(GetTask(2885), 100)
	if nFactStep >= tbFactStepList[nFact] then
		return 1
	end
	return
end

function goto_yuegedao()
	if CalcItemCount(3, 6, 1, 2908, -1) <= 0 then
		Msg2Player("Ta kh玭g c� Nguy謙 Ca L謓h")
		return
	end
	NewWorld(968, 1436, 3179)
end
---------------------------------------------------------------
function  OnCancel()

   Say("Kh玭g c� ti襫 ng錳 thuy襫 th� ngi 甶 b� v藋! ",0)

end;

---------------------------------------------------------------
function go_thd()
	nRet = aexp_gotothd(236);
	-- if (nRet == 1) then
	--	Msg2Player("船夫：最近去桃花岛的人可真多。好吧，你坐好喽！")
	if (nRet == -1) then
		Talk(1,"","Ph� 甶 thuy襫 n Уo Hoa Фo "..AEXP_TICKET.."Lng, ngi c�  kh玭g? ")
	end
end
---------------------------------------------------------------
