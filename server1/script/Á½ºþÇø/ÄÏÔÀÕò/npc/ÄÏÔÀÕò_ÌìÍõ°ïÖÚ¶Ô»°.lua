--两湖区 南岳镇 天王帮众对话

function main(sel)
Talk(3, "select", "Bang ch� Dng Anh v� ngh� cao cng, gan d� h琻 ngi, kh玭g k衜 g� tu mi nam t�!", "B鎛 m玭 quy lu藅 uy nghi猰, ngi ng th� m筺h! Kh玭g ai trong thi猲 h� d竚 coi khinh!", "B鎛 bang v鮝 ch鑞g Kim v鮝 kh竛g T鑞g! Huynh  u xu蕋 th﹏ l� d﹏ ngh蘯, phi猽 b箃 giang h� l� v� k� sinh nhai! Ai l祄 vua b鋘 ta ch� c莕 quan t﹎")
end;

function select()
Say("C� mu鑞 gia nh藀 b鎛 gi竜 kh玭g?", 2, "Gia nh藀. /yes", "Kh玭g gia nh藀/no");
end;


function yes()
if (GetSeries() ~= 0) then								--如果玩家不属于金系
	Say("е t� b鎛 bang to祅 l� anh h飊g xu蕋 ch髇g. K衜 c鈏 nh� ngi kh玭g x鴑g ng v祇 b鎛 bang!", 0)
else
	if (GetFaction() ~= "") then							--如果玩家已经属于金系的某一门派
		Say("Ch璦 gia nh藀 m玭 ph竔 kh竎 m韎 c� th� gia nh藀 b鎛 bang", 0)
	else	
		if (GetLevel() >= 10) then						--等级达到十级
			if ( GetSex() == 1 ) then 					--如果玩家性别为女
				Say("Thi猲 Vng bang luy謓 t藀 c鵦 kh�, y誹 畊鑙 nh� c� nng kh玭g th輈h h頿 u!", 0)
			else								-- 玩家性别为男
    				SetFaction("tianwang")       				--玩家加入天王帮
    				--NewWorld(59, 1425, 3472)				--把玩家传送到门派入口
				--SetFightState(1)					--玩家转换成战斗状态	
    				--SetRevPos(21)		  				--设置重生点
    				--SetTask(3, 10)
    				Say("Hoan Ngh猲h b筺 gia nh藀 Thi猲 Vng bang! ",0)  
			end
		else
			Say("C╪ b秐 c馻 ngi c遪 k衜 l緈! H穣 甶 luy謓 t藀 th猰, bao gi� n c蕄 10 l筰 n t譵 ta!", 0)	
		end
	end
end;			
end;


