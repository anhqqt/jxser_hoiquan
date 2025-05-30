-- 功能：紫色装备系统 - 紫色装备及黄金装备铸造

Include( "\\script\\item\\compound\\compound_header.lua" );
Include( "\\script\\item\\compound\\atlas.lua" );
function onFoundry()
	Say( "N誹 i hi謕 mu鑞 c� m閠 m鉵  v鮝 � th� 甧m y  nguy猲 li謚 t韎 y. Ta s� c luy謓 m閠 v藅 ph萴 ngi th輈h nh蕋!", 4, "B総 u ch� t筼/onFoundryItem", "Li猲 quan ch� t筼/onAbout", "T譵 hi觰 m秐h Ho祅g Kim./onQueryPiece","в ta suy ngh� k� l筰 xem/onCancel");
end

-- 开始铸造
function onFoundryItem()
	if( isCompoundableToday() == 1 ) then
		FoundryItem();
	else
		Say( "L穙 phu h玬 nay m謙 r錳, mai tr竛g s� gh� c luy謓 trang b� nha!", 1, "Л頲! V藋 ta 甶 trc y!/onCancel" );
	end
end

function onQueryPiece()
	QueryPiece()
end
-- 关于铸造
function onAbout()
	Talk( 3, "onAbout2", "S� d鬾g c竎 nguy猲 li謚 c bi謙 nh� kho竛g th筩h c� thu閏 t輓h, Huy襫 Tinh Kho竛g Th筩h, Trang b� Huy襫 Tinh,  ph� Ho祅g Kim c� th� ch� t筼 頲 Trang b� Huy襫 Tinh ho芻 trang b� Ho祅g Kim. c luy謓 trang b� 頲 ph﹏ ra: tinh luy謓, ch� t筼, n﹏g c蕄, kh秏 n筸 v�  ph� 5 b� ph薾 n祔. N誹 c� 頲 c竎 th� nguy猲 li謚 n祔 th� c� th� n ch� ta nh� c luy謓.", "<color=yellow>Huy襫 Tinh Kho竛g Th筩h<color>: L� m閠 lo筰 kho竛g th筩h c bi謙, th� nguy猲 li謚 d飊g  n﹏g c蕄, ch� t筼, kh秏 n筸,  n﹏g cao ch蕋 lng thu閏 t輓h trong qu� tr譶h c luy謓 ho芻 t輓h th祅h c玭g cao. C� t蕋 c� 10 c蕄 , ng c蕄 kho竛g c祅g cao th� hi謚 qu� cho ra c祅g l韓.", "<color=yellow>Kho竛g th筩h c� thu閏 t輓h<color>: Ta 甧m kho竛g c� thu閏 t輓h n﹏g c蕄 tng 鴑g l猲 trang b� m祏 xanh c� thu閏 t輓h s� c� c� h閕 nh薾 頲 thu閏 t輓h c馻 kho竛g th筩h . N誹 s� d鬾g kho竛g mang thu閏 t輓h 萵 th� ng� h祅h thu閏 t輓h c馻 trang b� m祏 xanh ph秈 gi鑞g v韎 thu閏 t輓h 萵 c馻 kho竛g. Kho竛g th筩h c� thu閏 t輓h c� t韎 10 c蕄 , ng c蕄 c祅g cao khi kh秏 n筸 cho ra 甶觤 thu閏 t輓h c祅g cao." );
end

function onAbout2()
	Talk( 2, "", "<color=yellow>Trang b� Huy襫 Tinh<color>: D飊g 1 trang b� m祏 xanh ho芻 m祏 tr緉g k誸 h頿 v韎 Huy襫 Tinh Kho竛g Th筩h ch� t筼 s� c� c� h閕 nh薾 頲 1 Trang b� Huy襫 Tinh t� 1~5 l莕 c� h閕 kh秏 n筸. C竎 h祅g thu閏 t輓h kh竎 c馻 trang b� s� gi鑞g v韎 nguy猲 li謚 trang b� 頲 s� d鬾g.", "<color=yellow>у ph� Ho祅g Kim<color>: M鏸 m閠 b� trang b� Ho祅g Kim u c� nh鱪g  ph� Ho祅g Kim tng 鴑g, theo nh鱪g g� ghi l筰 tr猲  ph� Ho祅g Kim c� 頲 b筺 s� t譵 頲 c竎 m鉵 c遪 l筰 k誸 h頿 ch髇g th祅h b� trang b� Ho祅g Kim." );
end

-- 取消
function onCancel()
end