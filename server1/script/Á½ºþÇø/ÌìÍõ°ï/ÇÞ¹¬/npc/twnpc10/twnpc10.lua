--description: 天王帮寝宫 杨瑛　天王出师任务、重返门派任务
--author: yuanlan	
--date: 2003/4/28
--Dan_Deng(2003-07-22), 加入门派任务的等级要求
--Dan_Deng(2003-07-24), 加入重返门派任务
-- Update: Dan_Deng(2003-08-16)
-- Update: Dan_Deng(2003-09-21)重新设计重返门派与镇派绝学相关
-- Update：Dan_Deng(2003-10-27)为重返师门任务加入取消任务功能，以及与新门派对应

Include("\\script\\global\\skills_table.lua")
Include([[\script\event\teachersday06_v\prize_qingyika.lua]]);
Include("\\script\\task\\lv120skill\\head.lua")
Include("\\script\\misc\\daiyitoushi\\toushi_function.lua")	-- 带艺投师

Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")


function main()
	if (vt06_isactive() ~= 0) then
		Say("T譵 ta c� vi謈 g�?", 2, "Mu鑞 th豱h gi竜 i s�!/oldentence", "M鮪g l�  S�, t筰 h�  t譵  揟h�  S瓟 v� 揟h� Cao у�./vt06_prizeenter");
		return
	end;
	
	local nNpcIndex = GetLastDiagNpc();
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<npc>G莕 y ta c� r蕋 nhi襲 vi謈 gi秈 quy誸, ngi n y c� vi謈 g�."
	G_TASK:OnMessage("Thi猲 Vng", tbDailog, "DialogWithNpc")
	if (GetLevel() >= 120 and GetTask(LV120_SKILL_STATE) ~= 19 and GetLastFactionNumber() == 1) then
		tbDailog:AddOptEntry("H鋍 k� n╪g c蕄 120.", lvl120skill_learn)
	end
	tbDailog:AddOptEntry("Mu鑞 th豱h gi竜 vi謈 kh竎", oldentence)
	tbDailog:Show() 
	
end

function oldentence()
--	if (check_skill() == 0) then
--		return
--	end

	UTask_tw = GetTask(3);
	local nFactID = GetLastFactionNumber();

	if (UTask_tw == 70*256) and (GetFaction() == "tianwang") then			-- 回师错误修正
		SetFaction("")
		Say("H� th鑞g ph竧 hi謓 sai s鉻,  k辮 th阨 h錳 phuc!",0)
		return
	elseif (UTask_tw == 70*256) and (GetTask(7) >= 5*256) and (GetTask(7) < 10*256) then		-- 以前接过入门任务的
		SetTask(7,0)
		Say("H� th鑞g ph竧 hi謓 sai s鉻,  k辮 th阨 h錳 phuc!",0)
		return
	elseif (UTask_tw == 80*256) and (GetCamp() == 4) then			-- 回师错误修正
		SetTask(3,70*256)
		Say("H� th鑞g ph竧 hi謓 sai s鉻,  k辮 th阨 h錳 phuc!",0)
		return
	elseif (UTask_tw == 80*256 and nFactID == 1 and GetCamp() == 3 and GetFaction() == "M韎 nh藀 giang h� ") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("tianwang");
			Say("H� th鑞g ph竧 hi謓 sai s鉻,  k辮 th阨 h錳 phuc!",0)
			return
		end
	elseif (UTask_tw == 70*256 and nFactID == 1 and GetCamp() ~= 4 and GetFaction() == "M韎 nh藀 giang h� ") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("");
			SetCurCamp(GetCamp());
			Say("H� th鑞g ph竧 hi謓 sai s鉻,  k辮 th阨 h錳 phuc!",0)
			return
		end
	end
	local tbDes = {"Цi ngh� u s�/#daiyitoushi_main(1)", "Mu鑞 th豱h gi竜 vi謈 kh竎/common_talk"};
	
	Say("G莕 y ta c� r蕋 nhi襲 vi謈 gi秈 quy誸, ngi n y c� vi謈 g�.", getn(tbDes), tbDes);
end

function common_talk()
	local UTask_tw = GetTask(3);
	if (GetTask(39) == 10) and (GetBit(GetTask(40),3) == 0) then				-- 世界任务：武林向背
		Talk(1,"","Tri襲 nh nh� T鑞g ngu xu萵, kh玭g i tr阨 chung v韎 Dng gia ta. N╩ x璦 S� Vng c飊g cha ta th� quy誸 di謙 T鑞g. Dng Anh tuy b蕋 t礽, nh璶g c騨g quy誸 th鵦 hi謓 ch� l韓!")
		Uworld40 = SetBit(GetTask(40),3,1)
		SetTask(40,Uworld40)
	elseif (GetSeries() == 0) and (GetFaction() == "tianwang") then
		if (UTask_tw == 60*256+40) and (HaveItem(96) == 1) then					--拿到天王遗书
			Talk(3, "L60_prise", "Thu閏 h� kh玭g d竚 khinh s� m謓h,  l蕐 頲 'Thi猲 Vng Di Th�', xin Bang ch� xem qua! ", "T鑤 qu�! L蕐 頲 'Thi猲 Vng Di Th�' kh玭g nh鱪g b秓 to祅 頲 b鎛 bang m� c遪 c� th� ng╪ ch苙 頲 tai ng tr猲 ch鑞 v� l﹎! Ngil祄 r蕋 t鑤! T� h玬 nay tr� 甶, ngic� th� t� do h祅h t萿 giang h�!", "Ch骳 m鮪g b筺 th祅h ngh� xu蕋 s�! B筺 頲 phong l� K譶h Thi猲 Nguy猲 So竔, t� nay v� sau c� th� t� do h祅h t萿 giang h�! Hy v鋘g b筺 s� ph竧 huy n╪g l鵦, ph竧 tri觧 ti襫 !")
		elseif (UTask_tw == 60*256) and (GetLevel() >= 50) then
			Talk(3, "L60_get", "Nh� n╩ x璦, S� Vng kh雐 binh t筰 чng ёnh H�, Nam kh竛g Tri謚 T鑞g, B綾 ch鑞g Kim binh. Sau khi S� Vng b╪g h�, ngh躠 qu﹏ c遪 l筰 ti課 c� cha ta Чi Th竛h Thi猲 Vng l祄 l穘h o. Ngh躠 qu﹏ ph竧 tri觧 m筺h m�, tri襲 nh ho秐g s� c� qu﹏ n t譵 di謙. Trong tr薾 huy誸 chi課 cha ta kh玭g may b� b鋘 ph秐 b閕 b竛 ng,  hy sinh t筰 Thanh Loa Фo", "Sau khi cha ta qua i, ta l蕐 頲 竜 b祇, ki誱 b竨 v� m閠 b� binh th� gi蕌 t筰 <color=Red>Thanh Loa Фo<color>. T猲 cu鑞 binh th�  l� <color=Red>'Thi猲 Vng Di Th�'<color>, b猲 trong kh玭g ch� ghi l筰 phng ph竝 b� tr薾 c馻 cha ta, m� c遪 ghi ch� chi ti誸 a th� chi課 lc c馻 чng ёnh H�, v� th� y 頲 xem nh� l� b� k輕 c馻 b鎛 bang. ", "Th� nh璶g g莕 y kh玭g bi誸 b� ai  cung c蕄 th玭g tin ra ngo礽, cu鑞 s竎h n祔 b� qu﹏ Kim d� ra, ch髇g  c� b鋘 s竧 th� n l蕐 c緋 cu鑞 s竎h n祔. ")
		elseif (UTask_tw == 80*256) or (UTask_tw == 80) then						-- 重返后的自由出入
			Say("Th� n祇! Mu鑞 h祅h t萿 giang h� m閠 phen �?",2,"V﹏g, xin Bang ch� ﹏ chu萵. /goff_yes","Kh玭g, ta t� th蕐 c玭g phut藀 luy謓 v蒼 ch璦 . /no")
		elseif (UTask_tw > 60*256) and (UTask_tw < 70*256) then		--已经接到出师任务，尚未完成
			Talk(1,"","<color=Red>'Thi猲 Vng Di th�'<color> 頲 gi蕌 trong m閠 <color=Red>B秓 rng <color>, B秓 rng 頲 gi蕌 � <color=Red>ph輆 b綾 Thanh Loa o<color>, trc ti猲 c莕 ph秈 t譵 頲 <color=Red>Ch譨 kh鉧  m� B秓 rng<color>.")
		else
			Talk(1,"","Kim qu鑓 c� � mu鑞 ng玭g cu錸g l藅  v� l﹎ Trung Nguy猲 ta, n誹 nh� huynh  ch髇g ta kh玭g ng t﹎, l祄 sao c� th� ch鑞g 頲 qu﹏ th�?")
		end
--	elseif (GetTask(7) == 5*256+10) then		-- 转派至少林派
--		Say("杨瑛：叛帮者要废去本帮全部武功，你真的要背弃本门投入少林派？",2,"不错，我意已决/defection_yes","不，我还是不改投少林了/defection_no")
	elseif (GetSeries() == 0) and (GetCamp() == 4) and (GetLevel() >= 60) and (UTask_tw == 70*256) and (GetTask(7) < 5*256) then		-- 重返师门任务
		Talk(1,"return_select","T鑤 l緈! H祅h t萿 giang h� nh� gi髉  nh鱪g ngi kh鑞 kh�!")
	elseif (GetCamp() == 4) and ((UTask_tw == 70*256+10) or (UTask_tw == 70*256+20)) then
		Say("Ngi  chu萵 b�  5 v筺 lng ch璦?",2,"Х chu萵 b� xong/return_complete","V蒼 ch璦 chu萵 b� xong/no")
	elseif (UTask_tw >= 70*256) and (GetFaction() ~= "tianwang") then		--已经出师
		Talk(1,"","Sau khi r阨 kh醝 Thi猲 Vng Bang, m鋓 ngi v蒼 nh� anh em ru閠 th辴!")
	else
		Talk(1,"","Thi猲 Vng Bang ng gi鱝 m鑙 th� T鑞g Kim v蒼 ng v鱪g, th薽 ch� v蒼 ph竧 tri觧 m筺h m�, u do huynh  trong Bang 畂祅 k誸 m閠 l遪g")
	end
end

---------------------- 技能调整相关 ------------------------
function check_skill()
	x = 0
	skillID = 38					-- 盘古九式
	i = HaveMagic(skillID)
	if (i >= 0) then
		x = x + 1
		DelMagic(skillID)
		AddMagicPoint(i)
	end
	if (x > 0) then		-- 若有技能发生变化，则踢下线，否则返回继续流程
		Say("Vi s� l莕 n祔 b� quan suy ngh� m蕐 ng祔, s竛g ch� ra 頲 chi猽 th鴆 m韎, b﹜ gi� truy襫 l筰 cho ngi. H鋍 xong nh� ph秈 t辬h dng m閠 th阨 gian  kh醝 l祄 t鎛 thng kinh m筩h.",1," t� s� ph� /KickOutSelf")
		return 0
	else
		return 1
	end
end

---------------------- 重返任务 ----------------------
function goff_yes()
	Talk(1,"","T鑤 l緈! H祅h t萿 giang h� nh� gi髉  nh鱪g ngi kh鑞 kh�!")
	SetTask(3,70*256)
	AddNote("R阨 kh醝 Thi猲 Vng bang, ti誴 t鬰 h祅h t萿 giang h�. ")
	Msg2Player("Ban  r阨 kh醝 Thi猲 Vng bang, ti誴 t鬰 h祅h t萿 giang h�. ")
	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)
end

function defection_yes()
-- 刷掉技能
	n = 0
	i=29; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 斩龙诀
	i=23; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 天王枪法
	i=24; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 天王刀法
	i=26; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 天王锤法
	i=30; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 回风落雁
	i=31; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 行云诀
	i=32; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 无心斩
	i=33; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 静心诀
	i=34; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 惊雷斩
	i=35; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 阳关三叠
	i=36; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 天王战意
	i=37; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 泼风斩
	i=38; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 盘古九式（已取消技能）
	i=40; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 断魂剌
	i=41; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 血战八方
	i=42; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 金钟罩
	AddMagicPoint(n)
-- 刷完技能后继续转门派流程
	SetTask(7,5*256+20)
	SetTask(3,75*256)				-- 为原门派作个标记
	SetRank(79)						-- 头衔降为镇帮元帅
	if (GetRepute() < 200) then
		Msg2Player("V� h祅h vi b蕋 trung v韎 m玭 ph竔, danh v鋘g c馻 b筺 gi秏 xu鑞g "..GetRepute().."甶觤!")
		AddRepute(-1 * GetRepute())
	else
		Msg2Player("V� h祅h vi b蕋 trung v韎 m玭 ph竔, danh v鋘g c馻 b筺 gi秏 xu鑞g 200 甶觤! ")
		AddRepute(-200)
	end
	AddNote("Dng Anh ph� b� v� c玭g Thi猲 Vng bang c馻 b筺, 畂箃 l筰 ch鴆 K譶h Thi猲 Nguy猲 So竔 d錸g th阨 c玭g b� cho thi猲 h� b筺  ra kh醝 Thi猲 Vng Bang. B﹜ gi� ngi c� th� gia nh藀 Thi誹 L﹎ ph竔. ")
	Msg2Player("Dng Anh ph� b� v� c玭g Thi猲 Vng bang c馻 b筺, 畂箃 l筰 ch鴆 K譶h Thi猲 Nguy猲 So竔 d錸g th阨 c玭g b� cho thi猲 h� b筺  ra kh醝 Thi猲 Vng Bang. B﹜ gi� ngi c� th� gia nh藀 Thi誹 L﹎ ph竔. ")
	Talk(1,"KickOutSelf","Th藅 ng ti誧! Ta ph秈 thu h錳 l筰 v� c玭g  d箉 ngi! H駓 b� danh x璶g K譶h Thi猲 Nguy猲 So竔 c馻 ngi")
end

function defection_no()
	SetTask(7,1*256)				-- 为企图叛师作个标记，以备将来不时之需
	AddNote("B筺 t� b� � nh gia nh藀 Thi誹 L﹎ ph竔. ")
	Msg2Player("B筺 t� b� � nh gia nh藀 Thi誹 L﹎ ph竔. ")
end

function return_select()
	Say("ng v藋! S鴆 m閠 con ngi ch� c� h筺, ph秈 畂祅 k誸 c飊g m鋓 ngi th� m韎 n猲 chuy謓. B鎛 bang v蒼 c遪 tuy謙 k� tr蕁 ph竔 'Kim Chung Tr竜', ch� truy襫 cho nh鱪g  t� trung th祅h. Th� n祇,c� mu鑞 quay l筰 b鎛 bang kh玭g?",2,"V﹏g, ta mu鑞 tr� l筰 Thi猲 Vng bang /return_yes","Kh玭g, ta ch� bu閠 mi謓g n鉯 v藋 th玦. /return_no")
end;

function return_yes()
	Talk(2,"","R蕋 t鑤! Trc m総 qu﹏ ta 產ng giao chi課 v韎 qu﹏ T鑞g, qu﹏ ph� kh玭g , ngi n閜 50000 lng th� c� th� tr� l筰 b鎛 bang h鋍 Kim Chung Tr竜","V﹏g! Xin   t� chu萵 b� m閠 ch髏. ")
	SetTask(3,70*256+20)
	AddNote("H� tr� 50000 lng qu﹏ ph� cho Thi猲 Vng bang c� th� quay l筰 m玭 ph竔. ")
	Msg2Player("H� tr� 50000 lng qu﹏ ph� cho Thi猲 Vng bang c� th� quay l筰 m玭 ph竔. ")
end;

function return_no()
	Talk(1,"","Ta ch� l� nh﹏ ti謓 gh� th╩ ng m玭 th玦!")
end;

function return_complete()
	if(GetCash() >= 50000) then								-- 有50000两
		Talk(1,"","R蕋 t鑤! Hoan ngh猲h ngi tr� l筰 Thi猲 Vng Bang, ta phong ngi l� K譶h Thi猲 Nguy猲 So竔. ")
		Pay(50000)
		SetTask(3, 80*256)
		SetFaction("tianwang")
		SetCamp(3)
		SetCurCamp(3)
		SetRank(69)
--		if (HaveMagic(36) == -1) then
--			AddMagic(32)
--			AddMagic(41)
--			AddMagic(324)
--			AddMagic(36)
		add_tw(70)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
		Msg2Player("B筺 h鋍 頲 tuy謙 k� tr蕁 ph竔 c馻 Thi猲 Vng bang: Thi猲 Vng Chi課 �, V� C玭g V� T﹎ Tr秏, Huy誸 Chi課 B竧 phng, Th鮝 Long Quy誸. ")
--		end
		AddNote("Х quay tr� l筰 Thi猲 Vng bang. ")
		Msg2Faction(GetName().."  tr� l筰 Thi猲 Vng bang, 頲 phong l� K譶h Thi猲 Nguy猲 So竔")
	else
		Talk(2,"","H�?H譶h nh� v蒼 ch璦 ?","Xin l鏸! в ta ki觤 tra l筰.")
	end
end;

---------------------- 出师任务 ----------------------
function L60_get()
	Say("<color=Red>'Thi猲 Vng Di th�'<color> tuy謙 i kh玭g th�  r琲 v祇 tay ngi Kim. Ngi h穣 l藀 t鴆 n <color=Red>Thanh Loa o<color>, l蕐 <color=Red>'Thi猲 Vng Di th�'<color> v� y! C� l祄 頲 kh玭g?", 2, "Thu閏 h� t薾 l鵦 thi h祅h /L60_get_yes", "E r籲g kh� c� th� nh薾 nhi謒 v� /no")
end;

function L60_get_yes()
	Talk(1,"","<color=Red>'Thi猲 Vng Di th�'<color> 頲 gi蕌 trong m閠 <color=Red>B秓 rng <color>, B秓 rng 頲 gi蕌 � <color=Red>ph輆 b綾 Thanh Loa o<color>, trc ti猲 c莕 ph秈 t譵 頲 <color=Red>Ch譨 kh鉧  m� B秓 rng<color>. Ngi h穣 l藀 t鴆 甶 thuy襫 n <color=Red>Thanh Loa o<color>. Nh� pah� h誸 s鴆 c萵 th薾!")
	SetTask(3, 60*256+20)
	AddNote("T筰 T萴 cung Thi猲 Vng bang (223, 196) g苝 Dng Anh, ti誴 nh薾 nhi謒 v� 甶 Thanh Loa o thu h錳 Thi猲 Vng Di Th�. ")
	Msg2Player("T筰 T萴 cung Thi猲 Vng bang (223, 196) g苝 Dng Anh, ti誴 nh薾 nhi謒 v� 甶 Thanh Loa o thu h錳 Thi猲 Vng Di Th�. ")
end;

function L60_prise()
DelItem(96)
Msg2Player("Ch骳 m鮪g b筺  xu蕋 s� th祅h c玭g, b筺 頲 phong l� Tr蕁 Bang Nguy猲 So竔! Danh v鋘g t╪g th猰 120 甶觤! ")
--AddGlobalCountNews(GetName().."艺成出师，告别同门师弟开始闯荡江湖。", 1)
Msg2SubWorld("Thi猲 Vng"..GetName().."Xu蕋 s� th祅h c玭g, c竜 bi謙 Dng bang ch� v� c竎 ng m玭 huynh , ti誴 t鬰 h祅h t萿 giang h�. ")
AddRepute(120)
SetRank(79)
SetTask(3, 70*256)
SetFaction("")
SetCamp(4)			   				--玩家退出天王帮
SetCurCamp(4)
AddNote("Quay l筰 T萴 cung Thi猲 Vng Bang, a Thi猲 Vng Di Th� cho Bang ch� Dng Anh, ho祅 th祅h nhi謒 v� xu蕋 s�. Th╪g ch鴆 K譶h Thi猲 Nguy猲 So竔.. ")
end;

function no()
end
