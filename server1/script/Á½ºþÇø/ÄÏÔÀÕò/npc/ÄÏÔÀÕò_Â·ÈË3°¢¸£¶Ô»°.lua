--两湖区 南岳镇 路人3阿福对话

function main(sel)

	if ( GetTask(1256) == 1) then
	
		 SetTaskTemp(111,GetTaskTemp(111)+1)

		 if ( GetTaskTemp(111) > 3 ) then
		 	Talk(1,"","Nghe n鉯 c� m閠 v� s� th竔 kh玭g bi誸 t� mi誹 n祇 n, ph竝 l鵦 v� bi猲 ngi 甶 h醝 th� xem sao.")
		 	SetTask(1256, 2);
		 else
			 Talk(1,"","Ngi n th藅 ng l骳. Ch髇g ta mau 甶 t譵 c╪ nguy猲 c馻 d辌h b謓h n祔 甶! 襫 B� B� kh玭g xong r錳, l祄 ngi ta lo l緉g qu�.")	 	
		 end
		 return
	elseif ( GetTask(1256) == 2) then
		Talk(1,"","Nghe n鉯 c� m閠 v� s� th竔 kh玭g bi誸 t� mi誹 n祇 n, ph竝 l鵦 v� bi猲 ngi 甶 h醝 th� xem sao.")
		return
	end

Say("Ta mu鑞 l猲 Ho祅h S琻 h鋍 v�, mu鑞 l祄 ngi nh� чc C� Чi Hi謕, di謙 tr� cng b筼, gi髉  k� y誹, thay tr阨 h祅h o, uy phong l蒻 li謙!",0)

end;

