--两湖区 南岳镇 路人谷之兰对话

function main(sel)

	if ( GetTask(1256) == 1 ) then
		 SetTaskTemp(111,GetTaskTemp(111)+1)

		 if ( GetTaskTemp(111) > 3 ) then
		 	Talk(1,"","Nghe n鉯 c� m閠 v� s� th竔 kh玭g bi誸 t� mi誹 n祇 n, ph竝 l鵦 v� bi猲 ngi 甶 h醝 th� xem sao.")
		 	SetTask(1256, 2);
		 	return
		 else
		 	Talk(1,"","H誸 r錳, h誸 th藅 r錳, ng l� ra ta c� th� g� cho m閠 v� anh h飊g h祇 ki謙 v鮝 m韎 v祇 tr蕁 n祔 �. Kh玭g ng� anh ta b� c╪ b謓h d辌h cp m蕋 m筺g, ng ti誧 qu� 甶. H�......ta kh玭g r� u 畊玦 th� n祇 n鱝 ngi th� 甶 h醝 ngi kh竎 xem sao.")
		 	return
		 end
		 return
	elseif ( GetTask(1256) == 2 ) then
		Talk(1,"","Nghe n鉯 c� m閠 v� s� th竔 kh玭g bi誸 t� mi誹 n祇 n, ph竝 l鵦 v� bi猲 ngi 甶 h醝 th� xem sao.")
		return
	end

i = random(0,1)

if (i == 0) then
Say("чc C� phu nh﹏ th藅 c� ph骳, tng c玭g l� m閠 i anh h飊g,th藅 khi課 ta ngng m� ",0)
return
end;

if (i == 1) then
Say("Quan tr鋘g nh蕋 c馻 m閠 i con g竔 ch輓h l� kh玭g n猲 g� nh莔 ngi. Sau n祔 ta c騨g ph秈 l蕐 m閠 Чi hi謕 c� t譶h c秏 d辵 d祅g",0)
end;

end;

