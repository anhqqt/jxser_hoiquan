-- 大牢牢头.lua　（洗点任务）
-- By Dan_Deng(2003-11-12)

Include("\\script\\global\\timerhead.lua")
Include("\\Script\\Global\\FuYuan.lua")
Include("\\script\\nationalwar\\head.lua")

function main(sel)
	local Uworld96 = GetTask(96)
	local PK_value = GetPK();
	if (Uworld96 == 1) then			-- 探监的
		Say("Th╩ xong ch璦 v藋? Mau 甶 甶! ",2,"C秏 琻 v� i ca n祔, ta 甶 y /visit_leave","Xin i ca th� th� cho ch髏 ! Ta s� 甶 ngay th玦 /no")
--	elseif (Uworld96 == 0) then		-- 出错了
--		Talk(1,"","牢头：喂！你是怎么混进天牢重地来的？有什么话去找GM解释吧！")
	elseif (PK_value <= 0) then		-- 洗清了PK的
		Talk(2,"PKclear","Mau thu x誴 h祅h l� 甶!  Ngi c� th� ra kh醝 y r錳! "," t� 產i ca, v藋 ta 甶 y! ")
	else									-- 洗PK的
		-- 天子系统：大赦天下
		local absolve_time = NW_GetTask(NW_TASKNO_ABSOLVE)
		local current_time = GetCurServerTime()
		if (absolve_time ~= 0 and current_time < absolve_time + SECONDS_ONEHOUR) then
			Say("Thi猲 t� nh﹏ t�, i x� thi猲 h�. Ngi sau n祔 ng ph筸 t閕 n鱝 nha.",
				2,
				"Tr� v� nh�/nw_absolve",
				"Ta mu鑞 � l筰 t�/Cancel")
		else
			local n_timerid = GetTimerId();
			if (n_timerid ~= 9) then
				SetTask(96,100 + PK_value);
				SetTimer(12 * CTime * FramePerSec, 9)
				return
			end
			Say("Чi ng鬰 thi猲 lao, kh玭g 頲 t飝 � 甶 l筰! ",3,"H醝 th阨 gian /ask_timer","N閜 ti襫  t筰 ngo筰/pay_money","D�! D�! N誹 v藋 ta s� tr� v祇 trong  /no")
		end
	end
end

-- 天子系统：大赦天下
function nw_absolve()
	SetPK(0)
	leave_prison()
end

function ask_timer()
	if (GetCash() >= 1000) then		-- 有500两银子才让问
		Pay(1000)
		Talk(2,"","V� i ca n祔. Зy l� 1000 lng b筩 xin c莔  u鑞g tr�. Ta ch� l� mu鑞 h醝 th� b﹜ gi� l� m蕐 gi� th玦. ","Lao u: T閕  nghi謙 s骳, ng ki誱 chuy謓 n鱝 "..GetRestCTime(9).."Mau 甶 v� trong  甶 ")
	else
		Talk(2,"","V� i ca n祔! Ta ch� mu鑞 h醝 b﹜ gi� l� m蕐 gi� th玦! ","H醝 g� m� h醝! Mu鑞 ╪ n h�! C遪 kh玭g mau quay v� ch� ng錳! ")
	end
end

function pay_money()
	PK_PayMoney = GetPK() * GetPK() * 10000
	Talk(1,"pay_money2","Lao u i ca, � y "..PK_PayMoney.."C� ch髏 ng﹏ lng, xem nh� 輙 l遪g th祅h. Ch� l� v� ta � trong n祔  sinh tr鋘g b謓h kh玭g th� kh竛g c� 頲 n鱝. Xin i ca h穣 khai ﹏ cho ra ngo礽 t譵 i phu. ")
end

function pay_money2()
	Say("Xem ngi r竎h ri v藋,sao l筰 c� nhi襲 ti襫 v藋 th�! ",2,"t ti襫 v祇 tay h緉 /pay_yes","Ti誴 t鬰 th豱h c莡 /pay_no")
end

function pay_yes()
	PK_PayMoney = GetPK() * GetPK() * 10000
	if (GetCash() >= PK_PayMoney) then
		Pay(PK_PayMoney)
		Msg2Player("Lao u cho ph衟 甶 t譵 i phu. B筺 c� th� r阨 kh醝 i lao r錳. ")
		Talk(1,"leave_prison","Lu藅 ph竝 v� t譶h, nh﹏ h鱱 t譶h!  B謓h ngi n苙g nh� v藋 n猲 甶 t譵 th莥 thu鑓 ch鱝!  Nh� r籲g ngi ch� ra ngo礽 ch鱝 b謓h th玦, th﹏ ph薾 t� t閕 ch璦 r鯽 s筩h ng t竔 ph筸 n鱝! ")
	else
		pay_no()
	end
end

function pay_no()
	Talk(1,"","Qu� i!  C髏 ngay!  Kh玭g ta qu蕋 cho 1 roi b﹜ gi�! ")
end

function PKclear()
	Msg2Player("Sau m閠 h錳 xem x衪 th� ngi b� 畊鎖 ra kh醝 nh� lao ")
	leave_prison()
end

function leave_prison()
	StopTimer()
	if (GetTask(94) == 9) then		-- 身上错误地保存了坐牢计时器，不做其它处理直接清掉
		SetTask(94,0)
		SetTask(95,0)
	elseif (GetTask(94) > 0) then		-- 恢复身上原有的计时器
		Msg2Player("Tr猲 m譶h ngi v蒼 c遪 mang nhi謒 v�! H穣 l藀 t鴆 甶 l祄 nhi謒 v� 甶 ")
		SetTimer(GetTask(95),GetTask(94))
		SetTask(94,0)
		SetTask(95,0)
	end
	FuYuan_Resume();
	leave2()
end

function visit_leave()
	leave2()
end

function leave2()
	SetTask(96,0)
	leave_pos = GetTask(93)
	DisabledTeam(0);
	if (leave_pos == 1) then		-- 临安
		NewWorld(176,1473,3245)
	else								-- 汴京
		NewWorld(37,1781,3044)
	end
--	NewWorld(57,1592,3195)		-- 扔到衡山大厅
end

function no()
end
