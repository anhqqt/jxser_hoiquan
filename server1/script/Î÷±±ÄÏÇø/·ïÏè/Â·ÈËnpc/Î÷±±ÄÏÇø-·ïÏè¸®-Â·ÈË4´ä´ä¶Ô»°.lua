--西北南区 凤翔府 路人4翠翠对话
Include("\\script\\event\\funv_jieri\\200803\\shenmixianhua.lua")--08妇女节活动，08.4.1后可删除
function main(sel)
	local ndate = tonumber(GetLocalDate("%y%m%d%H"))
	if ndate >= 8030800 and ndate <= 8033124 then
		funv_jieri_shenmi:xianhua()	---08妇女节活动，08.4.1后可删除
	else
		Say("Tay c馻 ch� T� X秓 th藅 kh衞 l衞, bi誸 c総 nh鱪g c竔 hoa gi蕐 p nh� v藋. Sau n祔 l韓 l猲 em c騨g h鋍 c総 gi蕐.", 0)
	end
end;