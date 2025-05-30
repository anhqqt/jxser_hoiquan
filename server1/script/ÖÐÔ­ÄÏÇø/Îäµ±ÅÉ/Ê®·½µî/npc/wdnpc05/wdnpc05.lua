--description: 武当派徐岱岳　武当30级任务
--author: yuanlan	
--date: 2003/5/14
--Dan_Deng(2003-07-22), 加入门派任务的等级要求
-- Update: Dan_Deng(2003-08-17)

Include("\\script\\global\\skills_table.lua")
Include("\\script\\global\\timerhead.lua")
Include("\\script\\global\\repute_head.lua")

function main()
	UTask_wd = GetTask(5)
	Uworld50 = GetTask(50)
--	Uworld31 = GetByte(GetTask(31),1)
	if (GetSeries() == 4) and (GetFaction() == "wudang") then
		if (UTask_wd == 30*256) and (GetLevel() >= 30) then
			for i = 1,GetItemCount(133) do DelItem(133) end
			Talk(2, "L30_get", "Ngi � V� ng h鋍 v� c騨g 頲 nhi襲 ng祔 r錳, ta mu鑞 th� v� c玭g c馻 ngi, xem ngi c� ti課 b� ch璦.", "Phng ph竝 c� th� l� ta mu鑞 ngi trong m閠 th阨 gian nh蕋 nh, h穣 n Ph鬰 Ng璾 s琻 l蕐 5 c﹜ H鋋 Mi th秓, n誹 qu� th阨 gian quy nh ho芻 s� lng kh玭g  th� coi nh� ngi th蕋 b筰.")
--		为计时器错误打补丁，变量值为35、学会了纯阳心法(156)、武当剑法(151)的也可以接30级任务（已取消）
--		elseif  (UTask_wd == 35) and (HaveMagic(156) >= 0) and (HaveMagic(151) >= 0) and (GetLevel() >= 30) then
--			for i = 1,GetItemCount(133) do DelItem(133) end
--			Talk(2, "L30_get", "徐岱岳：你想再度尝试画眉草的考验，很好。", "在规定时间里，到伏牛山上采回五株画眉草，如果超过规定时间或者采的数目不够，都算失败。")
		elseif (UTask_wd == 30*256+20) then
			Say("Ngi  l蕐 5 c﹜ H鋋 Mi th秓 ch璦?",2,"Х h竔  hoa/L30_finish_yes","V蒼 ch璦 /L30_finish_no")
		elseif (UTask_wd == 30*256+50) then 						--计时已到
			L30_fail()
		elseif (UTask_wd > 30*256) and (UTask_wd < 40*256) then					--已经接到30级任务，尚未完成
			L30_finish_no()
--			Talk(1,"","徐岱岳：你要在<color=Red>二十四个时辰<color>里去<color=Red>伏牛山<color>采回<color=Red>五株画眉草<color>，已经只剩"..GetRestCTime(2).."了，你要抓紧啊！")
		else					--已经完成30级任务，尚未出师（缺省对话）
			Talk(1,"","V� c玭g b鎛 ph竔 r蕋 ch� tr鋘g vi謈 tu luy謓 n閕 c玭g, di chuy觧 linh ho箃, nh璶g kh玭g xem th蕄 n閕 c玭g thu莕 khi誸, c騨g ph竧 huy trong  kh玭g 輙 uy l鵦 ch﹏ ch輓h.")
		end
--	elseif (Uworld50 < 10) and (GetLevel() >= 50) and (GetReputeLevel(GetRepute()) >= 4) then		-- 点醒徐中原任务，启动
		--		Talk(3,"Uworld50_get","徐岱岳：中原，不是为父有所成见，那白莹莹心如蛇蝎，阴险毒辣，绝非良偶。","徐中原：爹，你没有和莹莹见过面，光凭江湖传言就这样把人家给量死了，其实莹莹她真的是出淤泥而不染的好姑娘，绝非人们口中所说的那样。","玩家：徐前辈，您且别心急，徐少侠让我来劝劝吧。")
	elseif (Uworld50 == 30) then
		Talk(2,"","Y猽 n� B筩h Doanh Doanh d飊g l阨 阯g m藅  l鮝 g箃 ngi r錳 !"," B﹜ gi� ta c騨g ch� b竛 t輓 b竛 nghi, kh玭g ho祅 to祅 tin tng c� ta. N誹 c� 蕐 ng l� ch﹏ th藅, ch髇g ta n猲 cho c� ta c� h閕 m韎 頲")
	elseif (Uworld50 == 50) then		-- 奖励2，任务完成
		Talk(1,"U50_Prise2","H�! Ta  s韒 n鉯 t猲 y猽 n� n祔 kh玭g ph秈 ngi t鑤 qu� nhi猲 nh� v藋!Kh玭g bi誸 c秏 琻 ngi th� n祇. Л頲! в ta ch� ngi 2 chi猽 tuy謙 ki誱 nh�!")
	elseif (UTask_wd >= 70*256) then							--已经出师
		Talk(1,"","B秓 ki誱 phong t飊g ma l� xu蕋 mai hoa hng t� kh� h祅 lai mu鑞 tr� th祅h cao th�  m� h玦 h琻 ng� kh竎 th藅 nhi襲.")
	else
		Talk(1,"","Чo h鋍 v�, c� t� ch蕋 t鑤 nh璶g kh玭g c莕 c� luy謓 t藀 c騨g kh玭g th� tr� th祅h cao th�.")
	end
end;

function L30_get()
	Say("Ngi c� t� tin nh薾 nhi謒 v� l莕 n祔 kh玭g?", 2, "Kh玭g th祅h v蕁 !/L30_get_yes", "е t� n╪g l鵦 k衜 c鈏, e kh� ho祅 th祅h nhi謒 v� n祔/L30_get_no")
end;

function L30_get_yes()
	i = GetTimerId()
	if (i > 0) and (i ~= 2) then		-- 另有计时器在运行中，并且不是此任务
		Talk(1,"","Ngi 產ng mang nhi謒 v� c蕄 b竎h nh� th�, m� c遪 ch箉 lung tung �?")
		return
	end
	Talk(1,"","Hay l緈! B﹜ gi� b総 u t輓h th阨 gian, n閕 trong <color=Red>72 gi�<color> l猲 <color=Red>Ph鬰 Ng璾 s琻<color> h竔 v� <color=Red>5 c﹜ H鋋 Mi th秓<color>, 甶 甶!")
	StopTimer()
	SetTimer(72 * CTime * FramePerSec, 2)										--开启计时器:72个时辰 * 时辰长 * 帧数
	SetTask(5, 30*256+20)
	AddNote("G苝 T� Чi Nh筩 ti誴 nh薾 nhi謒 v�, n閕 trong 72 gi� n Ph鬰 Ng璾 s琻 ng h竔 v� 5 c﹜ H鋋 mi th秓.")
	Msg2Player("G苝 T� Чi Nh筩 ti誴 nh薾 nhi謒 v�, n閕 trong 72 gi� n Ph鬰 Ng璾 s琻 ng h竔 v� 5 c﹜ H鋋 mi th秓.")
end;

function L30_get_no()
	Talk(1,"","Ta s� c� g緉g h誸 m鴆!")
end;

function L30_finish_yes()
	if (GetItemCount(133) >= 5) then 
		L30_prise() 
	else
		Talk(1,"L30_finish_no","Ngi v蒼 ch璦 l蕐  5 c﹜!")
	end
end;

function L30_finish_no()
	if (GetRestSec(2) > 0) then
		Talk(1,"","Ngi hi謓 ch� c遪 th阨 h筺 l� "..GetRestCTime(2).."th玦, mau tranh th� th阨 gian 甶!")
	else
		i = GetTimerId()
		if (i == 2) or (i == 0) then
			StopTimer()
		end
		L30_fail()
	end
end;

function L30_prise()
	for i = 1,GetItemCount(133) do DelItem(133) end
	if (GetTimerId() == 2) then			-- 正在任务计时中
		StopTimer()					--结束计时
	end
	Talk(1,"","Xem ra v� c玭g c馻 ngi qua nhi猲 ti課 b� r蕋 mau! Th藅 ng m鮪g! ")
	SetRank(10)
	SetTask(5, 40*256)
--	AddMagic(164)
--	AddMagic(158)
	add_wd(40)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	Msg2Player("Ch骳 m鮪g b筺! B筺 頲 phong l� Tu莕 S琻 Чo Nh﹏! H鋍 頲 v� c玭g V� ng ph竔 l� B竧 C藀 Nhi Ph鬰, Ki誱 Phi Kinh Thi猲.")
	AddNote("Trong th阨 gian quy nh quay v� Th藀 Phng 謓, a 5 c﹜ H鋋 mi th秓 cho T� Чi Nh筩, ho祅 th祅h nhi謒 v� H鋋 mi th秓, th╪g l祄 Tu莕 S琻 Чo Nh﹏.")
end;

function L30_fail()
	for i = 1,GetItemCount(133) do DelItem(133) end
	SetTask(5, 30*256)
	AddNote("Vt qu� th阨 gian quy nh, nhi謒 v� H鋋 mi th秓  th蕋 b筰.")
	Msg2Player("Vt qu� th阨 gian quy nh, nhi謒 v� H鋋 mi th秓  th蕋 b筰.")
	Talk(1,"","Th阨 gian  h誸! Ngi khi課 ta qu� th蕋 v鋘g! B譶h thng c� ph秈 ngi li t藀 luy謓 kh玭g? Nh蕋 nh ph秈 si猲g n╪g luy謓 t藀 m韎 th祅h!Khi n祇 chu萵 b� t鑤 r錳,th� c� th� n t譵 ta.")
end;

function Uworld50_get()
	SetTask(50,10)
	Msg2Player("Ti誴 nh薾 nhi謒 v�: Th鴆 t豱h T� Trung Nguy猲 kh玭g n猲 m� mu閕 v� y猽 n� B筩h Doanh Doanh.")
	AddNote("Ti誴 nh薾 nhi謒 v�: Th鴆 t豱h T� Trung Nguy猲 kh玭g n猲 m� mu閕 v� y猽 n� B筩h Doanh Doanh.")
end

function U50_Prise2()
	SetTask(50,255)
	AddProp(1)
	AddEng(1)
	Task88_4 = GetByte(GetTask(88),4) + 1
	if (Task88_4 > 255) then Task88_4 = 255 end
	Task88 = SetByte(GetTask(88),4,Task88_4)
	SetTask(88,Task88)			-- 记录任务得内功点总数

	Msg2Player("Nh� s� ch� 甶觤 c馻 T� Чi Nh筩, n閕 l鵦 c馻 b筺  th╪g l猲 1 甶觤. Nhi謒 v� th鴆 t豱h T� Trung Nguy猲  ho祅 th祅h.")
	AddNote("Ho祅 th祅h nhi謒 v� th鴆 t豱h T� Trung Nguy猲.")
end

function no()
end
