

Include("\\script\\global\\recoin_goldenequip.lua")
Include("\\script\\global\\equipenchase_help.lua") 
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua") 
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\global\\紫色及黄金装备铸造.lua")
Include("\\script\\global\\shenmi_chapman.lua");	--修装备功能



Include("\\script\\activitysys\\npcdailog.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")



--------固定对话 城市--------
function tiejiang_city(...)
	
	local nNpcIndex = GetLastDiagNpc();
	--local szNpcName = GetNpcName(nNpcIndex);
	--if NpcName2Replace then szNpcName = NpcName2Replace(szNpcName) end
	local szNpcName = "Th� r蘮 trong th祅h"
	local tbDailog = DailogClass:new(szNpcName);
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex);
	
	EventSys:GetType("AddNpcOption"):OnEvent(szNpcName, tbDailog, nNpcIndex)
	
	local aryParam = arg;
	
	if (getn(aryParam) == 0) then
		tbDailog.szTitleMsg = TIEJIANG_DIALOG
	else
		for i = 1, getn(aryParam) do
			if (i == 1) then
				tbDailog.szTitleMsg = TIEJIANG_DIALOG
			else
				local _,_, szOpt, szFun = strfind(aryParam[i], "([^/]+)/([^/]+)")
				local fn = getglobal(szFun)
				if fn then
					tbDailog:AddOptEntry(szOpt, fn);	
				end
			end;
		end;
	end;
	
	
	tbDailog.szTitleMsg = gsub(tbDailog.szTitleMsg, "<dec>", "")
	
	
	tbDailog:AddOptEntry("Giao d辌h", yes);
	--tbDailog:AddOptEntry("C鯽 h祅g tinh l鵦", energy_sale);
	tbDailog:AddOptEntry("Giao d辌h", yes);
	
	--tbDailog:AddOptEntry("V藅 ph萴 c", onFoundry);
	
	tbDailog:AddOptEntry("V藅 ph萴 kh秏 n筸", jewel_yes);
	tbDailog:AddOptEntry("X� l� <trang b�  b� h醤g>", deal_brokenequip);
	tbDailog:AddOptEntry("Ta n nh薾 nhi謒 v� S� nh藀", education_tiejiang);	
	--tbDailog:AddOptEntry("Nh﹏ ti謓 gh� qua th玦", no, {});
	tbDailog:Show()
end;
--------固定对话 新手村------
function tiejiang_village(...)
	local aryParam = arg;
	local aryDescribe = {
		--szDialog,		--铁匠的说话，在各城市铁匠处
		"Giao d辌h/yes",
		
		--Change request 04/06/2011, ng ch� t筼 trang b� b筩h kim - Modified by DinhHQ - 20110605
		--"V藅 ph萴 c/onFoundry",
		
		"Ta n nh薾 nhi謒 v� S� nh藀/tboss",
		"Nh﹏ ti謓 gh� qua th玦/no",
	};
	
	if (getn(aryParam) == 0) then
		tinsert(aryDescribe, 1, TIEJIANG_DIALOG)
	else
		for i = 1, getn(aryParam) do
			if (i == 1) then
				tinsert(aryDescribe, 1, aryParam[i]);
			else
				tinsert(aryDescribe, 2, aryParam[i]);
			end;
		end;
	end;
	CreateTaskSay(aryDescribe);
end;

--------镶嵌--------
function jewel_yes()
	CreateTaskSay({"<dec><npc>Th駓 tinh kh秏 n筸 li猲 quan n s� c﹏ b籲g ng� h祅h, phng ph竝 chuy觧 linh kh� tuy謙 nhi猲 kh玭g th� d飊g s鴆 ngi 頲, kh玭g h糿 nh� i hi謕 hi v鋘g th祅h v藅 ph萴 tuy謙 th� nh﹏ gian, m� v� kh�  ph� v� v鵦 ngo礽 k� tr﹏ ch� gi髉 chuy觧 i ng c蕄 c馻 trang b�. C竎 h� mu鑞 kh秏 n筸 trang b� n祔 kh玭g?", "B総 u kh秏 n筸/jewel_yes1", "Li猲 quan kh秏 n筸/help", "в ta suy ngh� k� l筰 xem/no"});
end

function jewel_yes1()
	EnchaseItem()
end

-------No--------
function no()
end;

------精力-------
function energy_sale()
	CreateStores();
	AddShop2Stores(174, "C鯽 h祅g tinh l鵦", 15, 100, "fBuyCallBack(%d,%d)");
	AddShop2Stores(179,"Ho箃 ng c鯽 h祅g ", 1, 100, "fBuyCallBack(%d,%d)"); 
	AddShop2Stores(93,"Ph骳 duy猲 c鯽 h祅g ", 2, 100, "fBuyCallBack(%d,%d)"); 
	AddShop2Stores(98,"T鑞g kim c鯽 h祅g ", 4, 100, "fBuyCallBack(%d,%d)"); 
	AddShop2Stores(146,"Vinh d� c鯽 h祅g ", 11, 100, "fBuyCallBack(%d,%d)"); 
	AddShop2Stores(173,"Uy v鋘g c鯽 h祅g ", 13, 100, "fBuyCallBack(%d,%d)"); 
	OpenStores();
end

function fBuyCallBack(nItemIdx, nPrice)
	local nCount = 1
	local itemgenre, itemdetail, itemParticular = GetItemProp(nItemIdx)
	if itemgenre == 6 and itemdetail == 1 and itemParticular == 2317 then
		-- 试炼帖
		AddStatData("jlxiaohao_shiliantiegoumai", nCount)
	elseif itemgenre == 6 and itemdetail == 1 and itemParticular == 2355 then
		-- 玄天锦囊
		AddStatData("jlxiaohao_xuantiangoumai", nCount)
	elseif itemgenre == 6 and itemdetail == 1 and itemParticular == 2369 then
		-- 青驹令
		AddStatData("jlxiaohao_qingjulinggoumai", nCount)
	elseif itemgenre == 6 and itemdetail == 1 and itemParticular == 2353 then
		-- 云鹿令
		AddStatData("jlxiaohao_yunlulinggoumai", nCount)
	elseif itemgenre == 6 and itemdetail == 1 and itemParticular == 2352 then
		-- 苍狼令
		AddStatData("jlsxiaohao_canglanglinggoumai", nCount)
	elseif itemgenre == 6 and itemdetail == 1 and itemParticular == 2351 then
		-- 玄猿令
		AddStatData("jlxiaohao_xuanyuanlinggoumai", nCount)
	elseif itemgenre == 6 and itemdetail == 1 and itemParticular == 2350 then
		-- 紫蟒令
		AddStatData("jlxiaohao_zimanglinggoumai", nCount)
	elseif itemgenre == 6 and itemdetail == 1 and itemParticular == 2744 then
		-- 如意钥匙
		AddStatData("jlxiaohao_ruyiyaoshigoumai", nCount)
	elseif itemgenre == 6 and itemdetail == 1 and itemParticular == 1617 then
		-- 炎帝令
		AddStatData("jlxiaohao_yandilinggoumai", nCount)
	end											
	return 1
end
