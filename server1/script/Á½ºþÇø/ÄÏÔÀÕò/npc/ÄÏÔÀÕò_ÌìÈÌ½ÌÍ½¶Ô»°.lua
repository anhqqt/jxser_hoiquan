--两湖区 南岳镇 天忍教徒对话

function main(sel)
Talk(2, "select", "Gi竜 ch� c馻 b鎛 gi竜 l� Ho祅 Nhan H飊g Li謙. Danh ch蕁 thi猲 h�! Ho祅g  Kim qu鑓 c騨g ph秈 nhng 3 ph莕", "Cao th� c馻 b鎛 gi竜 nhi襲 v� s�! Nh﹏ t礽 ng鋋 h� t祅g long")
end;

function select()
Say("C� mu鑞 gia nh藀 b鎛 gi竜 kh玭g?", 2, "Gia nh藀. /yes", "Kh玭g gia nh藀/no");
end;


function yes()
if (GetSeries() ~= 3) then								--如果玩家不属于火系
	Say("Ngi kh玭g thu閏 h� H醓, kh玭g th� gia nh藀 b鎛 gi竜!", 0)
else
	if (GetFaction() ~= "") then							--如果玩家已经属于火系的某一门派
		Say("Ch璦 gia nh藀 m玭 ph竔 kh竎 m韎 c� th� gia nh藀 b鎛 gi竜", 0)
	else
		if (GetLevel() >= 10) then						--等级达到十级
			SetFaction("tianren")      					--玩家加入天忍教
			--NewWorld(45, x, y)						--把玩家传送到门派入口
			--SetFightState(1)						--玩家转换成战斗状态
			--SetRevPos(ID)	 						--设置重生点
			--SetTask(4, 10)
			Say("Hoan Ngh猲h b筺 gia nh藀 Thi猲 Nh蒼 gi竜! ",0)  
		else
			Say("е t� b鎛 gi竜 to祅 l� anh h飊g xu蕋 ch髇g. K衜 c鈏 nh� ngi kh玭g x鴑g ng v祇 b鎛 gi竜!", 0)
		end		
	end	
end
end;	

function no()
end;

