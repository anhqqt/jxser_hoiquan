--两湖区 南岳镇 唐门弟子对话

function main(sel)
Talk(4, "select", "Л阯g m玭 h飊g c� Xuy猲 Th鬰, 竚 kh� v� h醓 kh�  l鮪g danh thi猲 h�. ", "Ngi trong giang h� nghe n Л阯g m玭 th秠 u bi課 s綾,  th蕐 s� l頸 h筰 c馻 b鎛 m玭", "C竔 g� l� 'V� l﹎ ch輓h o, d﹏ t閏 i ngh躠'? To祅 l� b鋘 l竜 to衪. B鎛 m玭 kh玭g 璦 b鋘 ch輓h o, c騨g ch糿g k誸 giao v韎 t� o. ", "Mu鑞 gia nh藀 b鎛 m玭 kh玭g ph秈 l� chuy謓 n gi秐!")
end;


function select()
Say("C� mu鑞 gia nh藀 b鎛 ph竔 kh玭g?", 2, "Gia nh藀. /yes", "Kh玭g gia nh藀/no");
end;


function yes()
if (GetSeries() ~= 1) then								--如果玩家不属于木系
	Say("Ngi kh玭g thu閏 h� M閏, kh玭g th� gia nh藀 b鎛 m玭!", 0)
else
	if (GetFaction() ~= "") then							--如果玩家已经属于木系的某一门派
		Say("Ch璦 gia nh藀 m玭 ph竔 kh竎 m韎 c� th� gia nh藀 b鎛 m玭", 0)
	else
		if (GetLevel() >= 10) then						--等级达到十级
			SetFaction("tangmen")      					--玩家加入唐门
			NewWorld(25, 3972, 5247)					--把玩家传送到门派入口
			SetFightState(1)						--玩家转换成战斗状态
			SetRevPos(15)	 						--设置重生点
			SetTask(2, 10)
			Say("Hoan Ngh猲h b筺 gia nh藀 Л阯g M玭!",0)  
		else
			Say("C╪ b秐 c馻 ngi c遪 k衜 l緈! H穣 甶 luy謓 t藀 th猰, bao gi� n c蕄 10 l筰 n t譵 ta!", 0)			
		end		
	end		
end
end;	

function no()
end;

