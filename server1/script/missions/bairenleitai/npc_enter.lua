-- ====================== 文件信息 ======================

-- 剑侠情缘网络版大陆版 - 
-- 文件名　：npc_enter.lua
-- 创建者　：子非魚
-- 创建时间：2011-05-03 16:50:24

-- ======================================================
Include("\\script\\activitysys\\npcdailog.lua")
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\lib\\log.lua")

function bairen_dialog()
	
	local tbOpt = {};
	tinsert(tbOpt, {"Ta mu鑞 v祇 L玦 Уi Ho祅g Th祅h T�", onEnterHunbredArena});
	tinsert(tbOpt, {"V� L玦 Уi Ho祅g Th祅h T�", onHelpHunbredArena})
	tinsert(tbOpt, {"K誸 th骳 i tho筰", oncancel})
	CreateNewSayEx("<npc>L玦 Уi Ho祅g Th祅h T� l�  cho nh鱪g cao th� tr猲 giang h� c� m閠 c� h閕 vang danh c馻 m譶h trong thi猲 h�. N猽 nh� l祄 L玦 Ch� li猲 ti誴 nh b筰 nh鱪g ngi khi猽 chi課, s� vang danh thi猲 h�, th薽 ch� c� th� tr鵦 ti誴 甀 v祇 Ho祅g Th祅h, v� nc m� b竜 n 琻.", tbOpt)
end

function onEnterHunbredArena()
	
	DynamicExecuteByPlayer(PlayerIndex, "\\script\\missions\\bairenleitai\\hundred_arena.lua", "HundredArena:NpcEnter")	
	tbLog:PlayerActionLog("TinhNangKey","BaoDanhBachNhanLoiDai")
end

function onHelpHunbredArena()
	local tbOpt = {};
	tinsert(tbOpt, {"Ta mu鑞 v祇 L玦 Уi Ho祅g Th祅h T�", onEnterHunbredArena});
	tinsert(tbOpt, {"K誸 th骳 i tho筰", oncancel});
	
	CreateNewSayEx("<npc>L玦 Уi Ho祅g Th祅h T� {{s� 頲 m� m鏸 ng祔 v祇 l骳 12:00 n 0:00 s� k誸 th骳 }}. <enter> L玦 Уi Ho祅g Th祅h T� t筸 th阨 thi誸 k� 5 l玦 i, trong  {{L玦 Уi 1 }} l� L玦 Уi Ch�, ch� c� gi祅h th緉g l頸 � L玦 Уi n祔 m韎 c� th� 頲 nh﹏ s� v� l﹎ c玭g nh薾."
		.."M鏸 l莕 l猲 i l� {{3 ph髏 }}, n誹 nh� trong kho秐g th阨 gian n祔 hai b猲 b蕋 ph﹏ th緉g b筰, l骳  {{s� l蕐 ngi ch辵 s竧 thng 輙 h琻 }} l祄 l玦 ch�, v� ti誴 nh薾 khi猽 chi課 ti誴 t鬰 c馻 c竎 cao th� kh竎."
		.."N誹 kh玭g c� cao th� n祇 d竚 khi猽 chi課 v韎 L玦 Ch�, Ho祅g th祅h T� s� ph竔 ra cao th� c馻 th藀 i m玭 ph竔 l猲 i khi猽 chi課, L玦 Ch� c莕 ph秈 trong v遪g {{ 3 ph髏 }} no b筰, n誹 kh玭g s� b� t輓h l� b筰 tr薾"
		.."<enter>Ch� �: c莕 ph秈 s� d鬾g khinh c玭g nh秠 l猲 l玦 i t� v�.",
		tbOpt);
end
