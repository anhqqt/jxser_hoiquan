--新年采禄
--2008.1.21
--小浪多多

Include( "\\script\\task\\system\\task_string.lua" );
NewYear2008_cailu = {}
NewYear2008_cailu.tbdate = 
{
	nstart = 80202,
	nend = 80302,
	ndate = { 
		nstart = 80205,
		nend = 80211,
		common =
		{
			{2,3},
			{10,11},
			{14,15},
			{22,23},
		}
	},
	nweek = {
		common = {
			{10,11},
			{22,23}
		},
		Satweek = 
		{
			{2,3},
			{10,11},
			{14,15},
			{22,23},
		},
		Sunweek =
		{
			{10,11},
			{14,15},
			{22,23},
		},
	}
}
NewYear2008_cailu.ntaskday = 1877
NewYear2008_cailu.ntask = 1874
NewYear2008_cailu.ntaskcount=1873
NewYear2008_cailu.ntasksum = 20
NewYear2008_cailu.LIMIT_LEVEL = 50
NewYear2008_cailu.handcash = 9999
NewYear2008_cailu.mareial = 
{
	{G=6,D=1,P=1657,szname="Ph骳"},
	{G=6,D=1,P=1658,szname="L閏"},
	{G=6,D=1,P=1659,szname="Th�"},
}
NewYear2008_cailu.randomitem = 
{
	ntotialprop = 100,
	nitem =
	{
		{G=6,D=1,P=123,szname="Ph骳 Duy猲 L� (Trung) ",prop=75},
		{G=6,D=1,P=124,szname="Ph骳 Duy猲 L� (Чi) ",prop=20},
		{G=6,D=1,P=71,szname="Ti猲 Th秓 L� ",prop=5},		
	}
}
NewYear2008_cailu.randomnexp = 
{
	ntotialprop = 100,
	nexp = 
	{
		{nexp = 500000,prop=35},
		{nexp = 1000000,prop=30},
		{nexp = 1500000,prop=25},
		{nexp = 2000000,prop=10},
	}
	
}
function main()
	local nsign = NewYear2008_cailu:checkdate()
	if nsign == 2 then
		Say("Ho箃 ng h竔 l閏 u xu﹏  k誸 th骳, 產 t� c竎 v� i hi謕  tham d�.",0) 	
		return
	end
	local arytalk = {"Ho箃 ng h竔 l閏 u xu﹏  b総 u, trong th阨 gian ch� nh, Ngi ch琲 n trc c﹜ o, c﹜ mai � th蕋 i th祅h th�, t﹏ th� th玭 th祅h t﹎ c莡 nguy謓, s� nh薾 頲 nh鱪g ph莕 thng n╩ m韎. Ngo礽 ra, c竎 v� i hi謕 c騨g c� th� treo th猰 li詎 t誸 v韎 ba ch� Ph骳 - L閏 - Th� s� nh薾 頲 nh鱪g ph莕 thng b蕋 ng�."}
	arytalk[getn(arytalk)+1] = "Ta mu鑞 treo li詎 Ph骳 - L閏 - Th�  n t誸./#NewYear2008_cailu:onhandwish(1)"
	if nsign == 1 then
		arytalk[getn(arytalk)+1] = "Ta n th祅h t﹎ c莡 nguy謓./#NewYear2008_cailu:ongivewish(1)"
	end
	arytalk[getn(arytalk)+1] = "Ta ch� mu鑞 d筼 ch琲/#NewYear2008_cailu:onCancel(1)"
	CreateTaskSay(arytalk)
end

function NewYear2008_cailu:onhandwish()
	if self:checkdate() == 2 then
		Say("Ho箃 ng h竔 l閏 u xu﹏  k誸 th骳, 產 t� c竎 v� i hi謕  tham d�.",0) 
		return	
	end
	
	if self:check_level() == 0 or self:check_pay() == 0 then
		Say("Xin l鏸, ng c蕄 c竎 h� kh玭g , xin luy謓 t藀 th猰 ng th阨 n筽 th� r錳 m韎 quay l筰 nh薾 thng.",0)
		return
	end
	if CalcFreeItemCellCount() < 1 then
		Say("Kh玭g  ch� tr鑞g, h穣 s緋 x誴 l筰 h祅h trang.",0)
		return
	end
	local ndate = tonumber(GetLocalDate("%y%m%d"))
	if GetTask(self.ntaskday) ~= ndate then
		SetTask(self.ntaskday,ndate)
		SetTask(self.ntaskcount,0)
	end
	if GetTask(self.ntaskcount) >= self.ntasksum then
		Say("B筺  treo li詎 h琻 20 b� r錳, c﹜ kh玭g c遪 ch� cho b筺 treo n鱝 r錳, xin h穣 gi祅h c� h閕 cho ngi ch琲 kh竎.  t�  tham gia ho箃 ng.",0)
		return
	end
	for ni,nitem in self.mareial do
		if CalcEquiproomItemCount(nitem.G,nitem.D,nitem.P,-1) < 1 then
			Say("Li詎 Ph骳 - L閏 - Th� kh玭g , xin h穣 thu th藀 th猰 r錳 m韎 treo li詎.",0)
			return
		end
	end
	if GetCash() < self.handcash then
			Say("Ti襫 trong ngi kh玭g  xin ng treo li詎.",0)
			return		
	end
	for ni,nitem in self.mareial do
		ConsumeEquiproomItem(1,nitem.G,nitem.D,nitem.P,-1)
	end
	SetTask(self.ntaskcount,(GetTask(self.ntaskcount)+1) )
	Pay(self.handcash)
	self:award()
end

function NewYear2008_cailu:ongivewish()
	
	local ndate = tonumber(GetLocalDate("%y%m%d%H"))
	if self:checkdate() == 0 then
		Say("Ho箃 ng h竔 l閏 c莡 may  k誸 th骳, 產 t� c竎 v� i hi謕  tham gia ho箃 ng.",0) 
		return
	end
	
	if self:check_level() == 0 or self:check_pay() == 0 then
		Say("Xin l鏸, ng c蕄 c竎 h� kh玭g , xin luy謓 t藀 th猰 ng th阨 n筽 th� r錳 m韎 quay l筰 nh薾 thng.",0)
		return
	end
	
	local ntaskdate = GetTask(self.ntask)
	if ntaskdate == ndate then
		Say("B筺  nh薾 頲 l阨 ch骳 u xu﹏, l莕 sau h穣 quay l筰 nh�.",0) 
		return
	end
	SetTask(self.ntask,ndate)
	self:award()
end

function NewYear2008_cailu:award()
	local ntotialprop = self.randomitem.ntotialprop * 100
	local np = random(1,ntotialprop)
	local nsum = 0
	local szstrsay = ""
	for ni,nitem in self.randomitem.nitem do
		nsum = nsum + (nitem.prop) * (self.randomitem.ntotialprop)
		if nsum >= np then
			AddItem(nitem.G,nitem.D,nitem.P,1,0,0)
			local szstr = format("Ch骳 m鮪g b筺  nh薾 頲 1 c竔 <color=yellow>%s<color>",nitem.szname)
			szstrsay = szstr
			Msg2Player(szstr)
			self:sdl_writelog("H竔 l閏 u xu﹏",szstr)
			break
		end
	end

	ntotialprop = self.randomnexp.ntotialprop * 100
	np = random(1,ntotialprop)
	nsum = 0
	for ni,nitem in self.randomnexp.nexp do
		nsum = nsum + (nitem.prop) * (self.randomnexp.ntotialprop)
		if nsum >= np then
			AddOwnExp(nitem.nexp)
			local szstr = format("Ch骳 m鮪g b筺 nh薾 頲 <color=yellow>%s<color> kinh nghi謒",nitem.nexp)
			szstrsay = format("%s\n%s",szstrsay,szstr)
			Msg2Player(szstr)			
			self:sdl_writelog("H竔 l閏 u xu﹏",szstr)
			break
		end
	end
	Say(szstrsay,0)
end

function NewYear2008_cailu:sdl_writelog(sztitle,szevent)	--记录,sztitle=事件名,szevent=事件内容
	WriteLog(format("[%s]\t Date:%s\t Account:%s\t Name:%s\t %s",sztitle,GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),szevent));
end

function NewYear2008_cailu:onCancel()
end

function NewYear2008_cailu:check_level()		--判断等级
	if GetLevel() < self.LIMIT_LEVEL then
		return 0
	end 
	return 1
end

function NewYear2008_cailu:check_pay()		--判断充值用户
	if GetExtPoint(0) <= 0 then
		return 0
	end 
	return 1
end

function NewYear2008_cailu:checkdate()
	local ndate = tonumber(GetLocalDate("%y%m%d"))
	local nhour = tonumber(GetLocalDate("%H"))
	local nweek = tonumber(GetLocalDate("%w"))
	if ndate < NewYear2008_cailu.tbdate.nstart or ndate > NewYear2008_cailu.tbdate.nend then
		return 2
	end
	local tbspdate =  NewYear2008_cailu.tbdate.ndate
	if ndate >= tbspdate.nstart and ndate <= tbspdate.nend then
		for ni,nitem in tbspdate.common do
			if nhour == nitem[1] then
					return 1
			end
		end
	else
		local tbdate
		if nweek == 6 then
			tbdate = NewYear2008_cailu.tbdate.nweek.Satweek
		elseif nweek == 0 then
			tbdate = NewYear2008_cailu.tbdate.nweek.Sunweek
		else
			tbdate = NewYear2008_cailu.tbdate.nweek.common
		end 
		for ni,nitem in tbdate do
			if nhour == nitem[1] then
					return 1
			end		
		end
	end
	return 0
end