--两湖区 南岳镇 酒店老板对话

function main(sel)

	if ( GetTask(1256) == 1 ) then
		 SetTaskTemp(111,GetTaskTemp(111)+1)
		 if ( GetTaskTemp(111) > 3 ) then
		 	Talk(1,"","Nghe n鉯 c� m閠 v� s� th竔 kh玭g bi誸 t� mi誹 n祇 n, ph竝 l鵦 v� bi猲 ngi 甶 h醝 th� xem sao.")
		 	SetTask(1256, 2);
		 else
		 	Talk(1,"","V� kh竎h quan n祔 xin d鮪g bc, qu竛 nh� ch髇g ta kh玭g d竚 m� c鯽 n鱝. G莕 y th� tr蕁 n祔 nhi襲 ngi ch誸 m閠 c竎h k� l�, ch� ch髇g ta y c騨g ch誸 m蕐 ngi kh竎h qua 阯g. Hi謓 t筰 quan ph� 產ng 甶襲 tra, ti觰 nh﹏ y r蕋 s� ch鑞 quan trng n猲 kh玭g th� m� c鯽 ti誴 ng礽 頲 xin ng礽 b� qua cho.")		 	
		 end
		 return
	elseif ( GetTask(1256) == 2 ) then
		Talk(1,"","Nghe n鉯 c� m閠 v� s� th竔 kh玭g bi誸 t� mi誹 n祇 n, ph竝 l鵦 v� bi猲 ngi 甶 h醝 th� xem sao.")
		return
	end

Say("Sau khi чc C� Чi Hi謕 c馻 Ho祅h S琻 l祄 V� L﹎ Minh Ch�, nam Nh筩 Tr蕁 nh� c馻 ch髇g ta c騨g n竜 nhi謙 h糿 l猲; c竎 hi謕 kh竎h ki誱 hi謕 n y r蕋 nhi襲, l祄 ╪ bu玭 b竛 c馻 qu竛 ru nh� n祔 c騨g t h琻 trc",0);

end;

