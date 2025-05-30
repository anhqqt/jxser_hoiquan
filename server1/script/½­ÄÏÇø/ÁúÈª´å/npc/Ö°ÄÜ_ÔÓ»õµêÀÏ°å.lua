--龙泉村 职能 杂货店老板
--龙泉村新手任务：后爹好不好、阳春白雪羹
-- By: Dan_Deng(2003-09-03)
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\global\\itemhead.lua")
Include("\\script\\global\\global_zahuodian.lua");


function main(sel)
	UTask_world18 = GetTask(18)
	if (UTask_world18 == 0) then 		--“后爹好不好”任务启动
		Talk(4,"W18_get","莥! Th藅 l� kh玭g may m緉!","g l筰 g苝 ph秈 chuy謓 phi襫 ph鴆 n鱝 �?","N鉯 th藅 x蕌 h�! N╩ r錳 ta ci m閠 ngi v�! C� ta l� ngi t竔 gi�, d蒼 theo m閠 a con. 莥! Ta th藅 kh玭g hi觰 l� a b� n� mu鑞 g�. Nh璶g bi誸 l� n� r蕋 gh衪 ta ","C� l� t筰 v� 玭g qu� m芻 c秏 th玦! C� h醝 th糿g ngay a b� xem n� mu鑞 g� c� t鑤 h琻 kh玭g ")
	elseif (UTask_world18 == 6) then		-- “后爹好不好”任务完成
		Talk(1,"W18_prise","Ta  h醝 qua a nh�  r錳! N� tuy謙 i kh玭g h� gh衪 玭g u! g c� y猲 t﹎ 甶!")
	elseif (GetTask(20) == 5) and (HaveItem(231) == 0) then		-- “阳春白雪羹”任务进行中并且没有此道具
		if (UTask_world18 == 10) then			-- 已完成“后爹好不好”任务
			Talk(1,"","Dng Xu﹏ Linh Chi? Lo筰 linh chi n祔 hi謓 nay r蕋 輙 th蕐. Nh璶g m� � y ta v蒼 c遪 m閠 輙. Ngi gi髉 cho ta m閠 chuy謓 n祔 th� ta s� t苙g h誸 s� Linh Chi  cho ngi ")
			AddEventItem(231)
			AddNote("Л頲 玭g ch� t筽 h鉧 t苙g cho Dng Xu﹏ Linh Chi")
			Msg2Player("Л頲 玭g ch� t筽 h鉧 t苙g cho Dng Xu﹏ Linh Chi")
		else
			local buttons = store_sel_village_extend();
			tinsert(buttons, 1, "Mua Dng Xu﹏ Linh Chi/W20_buy");
			Say("Dng Xu﹏ Linh Chi? Lo筰 linh chi n祔 hi謓 nay r蕋 輙 th蕐. Nh璶g m� � y ta v蒼 c遪 m閠 輙. Ch� c莕 c� 500 l筺g b筩",getn(buttons),buttons);
		end
	else
		local buttons = store_sel_village_extend();
		Say("Ta trc y v鑞 l� m閠 thng nh﹏, k誸 giao r蕋 nhi襲 b籲g h鱱. Sau  x秠 ra i lo筺, n u c騨g th蕐 chi課 tranh. N猲 ta nh an nh n琲 n祔 v藋",getn(buttons),buttons)
	end
end;

function W18_get()
	local buttons = store_sel_village_extend();
	tinsert(buttons, 1, "Th玦 v藋  ta gi髉 玭g h醝 cho/W18_get_yes");
	Say("Nh璶g m祬.Nh璶g m� ta v蒼 l� ngi th蕋 b筰! C� m閠 a tr� th玦 m� c騨g kh玭g th� l蕐 l遪g 頲 n� ",getn(buttons),buttons)
end

function W18_get_yes()
	SetTask(18,3)
	Talk(1,"","V藋 th� t鑤 qu�! Ta s� � y i tin vui c馻 ngi nh�!")
	AddNote("Nh薾 nhi謒 v�: gi髉 玭g ch� 甶 h醝 t﹎ � c馻 Kh鎛g Hi觰")
	Msg2Player("Nh薾 nhi謒 v�: gi髉 玭g ch� 甶 h醝 t﹎ � c馻 Kh鎛g Hi觰")
end

function W18_prise()
	Talk(1,"","V藋 th� t鑤 qu�! Ta th藅 c秏 r蕋 c秏 琻 ngi!� y c� ch髏 l遪g th祅h! Mong ngi nh薾 cho")
	SetTask(18,10)
	AddNote("N鉯 l筰 suy ngh� c馻 Kh鎛g Hi觰 v韎 玭g ch� t筽 h鉧, ho祅 th祅h nhi謒 v�.")
	Msg2Player("N鉯 l筰 suy ngh� c馻 Kh鎛g Hi觰 v韎 玭g ch� t筽 h鉧, ho祅 th祅h nhi謒 v�.")
	p1,p2,p3,p4,p5,p6 = RndItemProp(6,10)
	if(GetSex() == 0) then
		AddItem(0, 2, 6, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
		Msg2Player("Л頲 m閠 竜 v秈 th�.")
	else
		AddItem(0, 2, 13, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
		Msg2Player("Л頲 m閠 B竎h 謙 qu莕.")
	end
	AddRepute(5)
	Msg2Player("Danh v鋘g c馻 b筺 t╪g th猰 5 甶觤")
end

function W20_buy()
	if (GetCash() >= 500) then
		Pay(500)
		AddEventItem(231)
		AddNote("Mua 頲 Dng Xu﹏ Linh Chi.")
		Msg2Player("Mua 頲 Dng Xu﹏ Linh Chi.")
		Talk(2,"","Th� Linh Chi n祔 th藅 l� qu� ","M閠 ph莕 ti襫 th� m閠 ph莕 h祅g. Ngi kh玭g thi謙 th遡 u!")
	else
		Talk(1,"","B竛 th藅 l� m綾! Ta u c� nhi襲 ti襫 nh� v藋")
	end
end

function yes()
	Sale(29)
end;

function no()
end;
