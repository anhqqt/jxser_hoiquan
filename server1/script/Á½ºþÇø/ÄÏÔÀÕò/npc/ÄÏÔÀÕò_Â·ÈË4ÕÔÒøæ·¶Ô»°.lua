--两湖区 南岳镇 路人4赵银娣对话

function main(sel)

	if ( GetTask(1256) == 1 ) then
		 SetTaskTemp(111,GetTaskTemp(111)+1)

		 if ( GetTaskTemp(111) > 3 ) then
		 	Talk(1,"","Nghe n鉯 c� m閠 v� s� th竔 kh玭g bi誸 t� mi誹 n祇 n, ph竝 l鵦 v� bi猲 ngi 甶 h醝 th� xem sao.")
		 	SetTask(1256, 2);
		 else
			 Talk(1,"","Huhuhu,huhu卪� 琲, m� m蕋 r錳, trong tr蕁 b﹜ gi� c祅g ng祔 c祅g nhi襲 ngi ch誸 nh璶g kh玭g bi誸 nguy猲 do. g tr阨 琲! Tr� m� l筰 cho ta 甶, tr� m� cho ta.")	 	
		 end
		 return
	elseif ( GetTask(1256) == 2 ) then
		Talk(1,"","Nghe n鉯 c� m閠 v� s� th竔 kh玭g bi誸 t� mi誹 n祇 n, ph竝 l鵦 v� bi猲 ngi 甶 h醝 th� xem sao.")
		return
	end

i = random(0,1)

if (i == 0) then
Say("Ta mu鑞 甶 h鋍 kinh th�, nh璶g cha ta kh玭g cho, n鉯 con g竔 甶 h鋍 kh玭g th� ra ti課 c� c玭g danh, ch� l� l穘g ph� ti襫. ",0)
return
end;

if (i == 1) then
Say("Cha ta c� nh ta, n鉯 ta l� k� ti猽 ti襫, ngay c� l骳 c� m� ta c騨g nh. N誹 nh� ta c� b秐 l躰h nh� huynh, cha ta s� kh玭g c遪 nh ta n鱝",0)
end;

end;

