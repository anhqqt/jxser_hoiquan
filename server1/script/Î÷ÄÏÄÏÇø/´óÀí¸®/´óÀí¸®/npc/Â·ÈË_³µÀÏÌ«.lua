-- 大理　路人　车老太
-- by：Dan_Deng(2003-09-16)
Include("\\script\\event\\funv_jieri\\200803\\shenmixianhua.lua")--08妇女节活动，08.4.1后可删除
function main()
	local ndate = tonumber(GetLocalDate("%y%m%d%H"))
	if ndate >= 8030800 and ndate <= 8033124 then
		funv_jieri_shenmi:xianhua()	---08妇女节活动，08.4.1后可删除
	else	
		Talk(1,"","Ta n╩ nay  h琻 80 tu鎖 r錳, m総 m� tai y誹, r╪g c� c騨g r鬾g c� r錳, ╪ u鑞g kh玭g d� d祅g n鱝.")
	end
end;
