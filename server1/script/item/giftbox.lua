--礼品盒
--2007-04-04
--by 小浪多多

TB_GIFT = {
	--物品名 概率				物品ID
	100000, -- 总概率
	{0.25,		{"Thi誸 La H竛",	6,1,23,0,0,0}},
	{0.25,		{"Ph骳 Duy猲 L� (Чi) ",	6,1,124,0,0,0}},
	{0.0002,	{"An Bang 襫 Ho祅g Th筩h Ng鋍 B閕",	0,166}},
	{0.0002,	{"An Bang B╪g Tinh Th筩h H筺g Li猲",	0,164}},
	{0.0002,	{"An Bang C骳 Hoa Th筩h Ch� ho祅",	0,165}},
	{0.0002,	{"An Bang K� Huy誸 Th筩h Gi韎 Ch� ",	0,167}},
	{0.0002,	{"мnh Qu鑓 Thanh Sa Trng Sam",	0,159}},
	{0.0002,	{"мnh Qu鑓 � Sa Ph竧 Qu竛",	0,160}},
	{0.0002,	{"мnh Qu鑓 X輈h Quy猲 Nhuy詎 Ngoa",	0,161}},
	{0.0003,	{"мnh Qu鑓 T� Щng H� uy觧",	0,162}},
	{0.0003,	{"мnh Qu鑓 Ng﹏ T祄 Y猽 i",	0,163}},
	{0.2,			{"Чi b� th莕 產n",	6,1,1398,0,0,0	}},
	{0.01,		{"Th藀 to祅 i b� th莕 產n",	6,1,1399,0,0,0}},
	{0.288,		{"Ti猲 Th秓 L� ",6,1,71,0,0,0}},
}
function main(sel)
	if CalcFreeItemCellCount() < 12 then
		Say("H祅h trang i hi謕 nhi襲 qu�, c� kh� n╪g s� nh薾 頲 trang b� chi誱 nhi襲 �. H穣 c蕋 b韙 v藅 ph萴  m b秓 c� 12 � tr鑞g r錳 h穣 m�.",0);
		return 1;
	end
	local prob = TB_GIFT[1];
	local sum = 0;
	local num = random(1,prob);
	--print(num.."\t"..getn(TB_GIFT).."\t")
	for i = 2,getn(TB_GIFT) do
		local odds = TB_GIFT[i][1];
		local item = TB_GIFT[i][2];
		sum = sum + odds * prob;
		if num < sum then
			--print(item[1]);
			award_item(item);
			break;
		end
	end
end

function award_item(item)
	if getn(item) == 3 then
		--AddGoldItem(item[2], item[3]);
		Say("Rng  qu� c� ! b猲 trong kh玭g c遪 l筰 g� ! .",0);
	elseif getn(item) == 7 then
		AddItem(item[2], item[3], item[4], item[5], item[6], item[7]);
	end
	WriteLog(format("[chuanguanGiftBox]\t date:%s \t Account:%s \t Name:%s \t GetItem:%s \t",GetLocalDate("%Y-%m-%d %H:%M:%S"),GetAccount(),GetName(),item[1]));
end