-- 漠北草原 职能 铁匠
-- By: li_xin(2005-01-18)
--update:zhaowenyi(2005-02-20)增加紫色及黄金装备铸造

Include("\\script\\global\\紫色及黄金装备铸造.lua")
function main(sel)
	--Say("� tr╩ d苖 g莕 y ai kh玭g bi誸 n i danh ta, t� 產o, ki誱, c玭, thng, k輈h, mi t竚 m鉵 v� kh� ta u c� , kh竎h quan mu鑞 mua m鉵 n祇? C遪 mu鑞 ch� t筼 Trang b� Huy襫 Tinh hay trang b� Ho祅g Kim u ph秈 n t譵 ta, nh蕋 nh gi� c� ph秈 ch╪g!", 3, "Giao d辌h/yes", "ch� t筼/onFoundry", "Nh﹏ ti謓 gh� qua th玦/no")
	Say("� tr╩ d苖 g莕 y ai kh玭g bi誸 n i danh ta, t� 產o, ki誱, c玭, thng, k輈h, mi t竚 m鉵 v� kh� ta u c� , kh竎h quan mu鑞 mua m鉵 n祇? C遪 mu鑞 ch� t筼 Trang b� Huy襫 Tinh hay trang b� Ho祅g Kim u ph秈 n t譵 ta, nh蕋 nh gi� c� ph秈 ch╪g!", 
			2, 
			"Giao d辌h/yes", 
--			"ch� t筼/onFoundry", 
			"Nh﹏ ti謓 gh� qua th玦/no")
end;

function yes()
	Sale(13);  				
end;

function no()
end;
