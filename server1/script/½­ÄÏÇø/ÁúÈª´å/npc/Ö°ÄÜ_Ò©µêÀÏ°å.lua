-- 龙泉村 职能NPC 药店老板（五毒10级任务）
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")

function main()
	UTask_wu = GetTask(10)
	if ((UTask_wu == 10*256+10) and (HaveItem("10 bao t輓 th筩h") == 0)) then 		--任务中
		Say("Ch� t玦 y dc li謚 g� c騨g c�, c� b謓h th� kh醝 b謓h, kh玭g b謓h kh醗 ngi, b竛 thu鑓 ng gi� kh玭g l鮝 g箃, ng礽 mua m閠 輙 ch�?", 3, "C� b竛T輓 th筩h kh玭g v藋?/L10_buy", "Giao d辌h/yes", "Kh玭g giao d辌h/no")
	else
		Say("Ch� t玦 y dc li謚 g� c騨g c�, c� b謓h th� kh醝 b謓h, kh玭g b謓h kh醗 ngi, b竛 thu鑓 ng gi� kh玭g l鮝 g箃, ng礽 mua m閠 輙 ch�?", 3, "Giao d辌h/yes","Ta n nh薾 nhi謒 v� S� nh藀/yboss", "Kh玭g giao d辌h/no")
	end
end;

function L10_buy()
	Talk(1,"L10_buy_sele","с u l� c dc c�! Ngi mua m閠 l骳 nhi襲 nh� v藋  l祄 g�?")
end;

function L10_buy_sele()
	Say("Nh璶g m� n誹 ngi c� th� tr� th猰 ta ch髏 nh th�...heyhey, 1000 lng th玦!",2,"Mua/L10_buy_yes","Sao gi鑞g cp qu� v藋!/L10_buy_no")
end;

function L10_buy_yes()
	if (GetCash() >= 1000) then
		Pay(1000)
		AddEventItem(220)
		AddNote("Mua 頲 10 bao T輓 th筩h.")
		Msg2Player("Mua 頲 10 bao T輓 th筩h.")
	end
end;

function L10_buy_no()
	Talk(1,"","Mu鑞 mua th� b竛! H鮩!...ai m� bi誸 頲 mi mua nhi襲 nh� v藋  l祄 g� ")
end;

function yes()
	Sale(30);  			--弹出交易框
end;

function no()
end;
