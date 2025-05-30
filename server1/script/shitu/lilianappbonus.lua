Include ("\\script\\shitu\\shitu_head.lua")

if(not MEM_HEAD) then
	Include ("\\script\\lib\\mem.lua")
end

if(not KBONUS_HEAD) then
	Include ("\\script\\class\\kbonus.lua")
end

LilianAppExpBonus = inherit(KBonus,{
	[CONST_LLITEM_JOINPARTY] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={10000},[CONST_ITEM_NAME]="kinh nghi謒 <name> 甶觤"},--"拜入一个门派",
	[CONST_LLITEM_YESOUTASK] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={50000},[CONST_ITEM_NAME]="kinh nghi謒 <name> 甶觤"},--"连续成功完成10次以上野叟任务",
	[CONST_LLITEM_ZHENGPAI20] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={20000},[CONST_ITEM_NAME]="kinh nghi謒 <name> 甶觤"},--"完成正派20级主线任务",
	[CONST_LLITEM_ZHONGLI20] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={20000},[CONST_ITEM_NAME]="kinh nghi謒 <name> 甶觤"},--"完成中立20级主线任务",
	[CONST_LLITEM_XIEPAI20] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={20000},[CONST_ITEM_NAME]="kinh nghi謒 <name> 甶觤"},--"完成邪派20级主线任务",
	[CONST_LLITEM_ZHENGPAI30] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={50000},[CONST_ITEM_NAME]="kinh nghi謒 <name> 甶觤"},--"完成正派30级主线任务",
	[CONST_LLITEM_ZHONGLI30] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={50000},[CONST_ITEM_NAME]="kinh nghi謒 <name> 甶觤"},--"完成中立30级主线任务",
	[CONST_LLITEM_XIEPAI30] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={50000},[CONST_ITEM_NAME]="kinh nghi謒 <name> 甶觤"},--"完成邪派30级主线任务",
	[CONST_LLITEM_ZHENGPAI40] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={100000},[CONST_ITEM_NAME]="kinh nghi謒 <name> 甶觤"},--"完成正派40级主线任务",
	[CONST_LLITEM_ZHONGLI40] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={100000},[CONST_ITEM_NAME]="kinh nghi謒 <name> 甶觤"},--"完成中立40级主线任务",
	[CONST_LLITEM_XIEPAI40] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={100000},[CONST_ITEM_NAME]="kinh nghi謒 <name> 甶觤"},--"完成邪派40级主线任务",
	[CONST_LLITEM_ZHENGPAI50] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={200000},[CONST_ITEM_NAME]="kinh nghi謒 <name> 甶觤"},--"完成正派50级主线任务",
	[CONST_LLITEM_ZHONGLI50] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={200000},[CONST_ITEM_NAME]="kinh nghi謒 <name> 甶觤"},--"完成中立50级主线任务",
	[CONST_LLITEM_XIEPAI50] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={200000},[CONST_ITEM_NAME]="kinh nghi謒 <name> 甶觤"},--"完成邪派50级主线任务",
	[CONST_LLITEM_ZHENGPAI60] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={500000},[CONST_ITEM_NAME]="kinh nghi謒 <name> 甶觤"},--"完成正派60级主线任务",
	[CONST_LLITEM_ZHONGLI60] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={500000},[CONST_ITEM_NAME]="kinh nghi謒 <name> 甶觤"},--"完成中立60级主线任务",
	[CONST_LLITEM_XIEPAI60] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={500000},[CONST_ITEM_NAME]="kinh nghi謒 <name> 甶觤"},--"完成邪派60级主线任务",
	[CONST_LLITEM_SONGJIN] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={500000},[CONST_ITEM_NAME]="kinh nghi謒 <name> 甶觤"},--"获得1000分以上宋金积分",
	[CONST_LLITEM_GETSKILL60] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={500000},[CONST_ITEM_NAME]="kinh nghi謒 <name> 甶觤"},--"习得本门60级武功",
	[CONST_LLITEM_LEVEL65] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={800000},[CONST_ITEM_NAME]="kinh nghi謒 <name> 甶觤"},--"等级提升至65级以上",
	[CONST_LLITEM_LEVEL70] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={1000000},[CONST_ITEM_NAME]="kinh nghi謒 <name> 甶觤"},--"等级提升至70级以上",
	[CONST_LLITEM_LEVEL75] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={1500000},[CONST_ITEM_NAME]="kinh nghi謒 <name> 甶觤"},--"等级提升至75级以上",
	[CONST_LLITEM_LEVEL76] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={1600000},[CONST_ITEM_NAME]="kinh nghi謒 <name> 甶觤"},--"等级提升至76级以上",
	[CONST_LLITEM_LEVEL77] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={1700000},[CONST_ITEM_NAME]="kinh nghi謒 <name> 甶觤"},--"等级提升至77级以上",
	[CONST_LLITEM_LEVEL78] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={1800000},[CONST_ITEM_NAME]="kinh nghi謒 <name> 甶觤"},--"等级提升至78级以上",
	[CONST_LLITEM_LEVEL79] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={1900000},[CONST_ITEM_NAME]="kinh nghi謒 <name> 甶觤"},--"等级提升至79级以上",
	[CONST_LLITEM_LEVEL80] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={2000000},[CONST_ITEM_NAME]="kinh nghi謒 <name> 甶觤"},--"等级提升至80级以上",
	[CONST_LLITEM_SKILL10UP5] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={10000},[CONST_ITEM_NAME]="kinh nghi謒 <name> 甶觤"},--"本门10级武功提升到5级以上",
	[CONST_LLITEM_SKILL10UP15] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={20000},[CONST_ITEM_NAME]="kinh nghi謒 <name> 甶觤"},--"本门10级武功提升到15级以上",
	[CONST_LLITEM_GETSKILL30] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={30000},[CONST_ITEM_NAME]="kinh nghi謒 <name> 甶觤"},--"习得本门30级武功",
	[CONST_LLITEM_GETSKILL40] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={100000},[CONST_ITEM_NAME]="kinh nghi謒 <name> 甶觤"},--"习得本门40级武功",
	[CONST_LLITEM_GETSKILL50] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={200000},[CONST_ITEM_NAME]="kinh nghi謒 <name> 甶觤"},--"习得本门50级武功",
	[CONST_LLITEM_SKILL60UP3] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={800000},[CONST_ITEM_NAME]="kinh nghi謒 <name> 甶觤"},--"60级武功3级以上"
	[CONST_LLITEM_JOINTONG] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={500000},[CONST_ITEM_NAME]="kinh nghi謒 <name> 甶觤"},--"加入到一个帮派",
	[CONST_LLITEM_SHENGWANG] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={800000},[CONST_ITEM_NAME]="kinh nghi謒 <name> 甶觤"},--"获得200点以上的声望",
	[CONST_LLITEM_SHANHESHEJI] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={800000},[CONST_ITEM_NAME]="kinh nghi謒 <name> 甶觤"}--"获得500个以上的山河社稷图残片",
})

function PayApprenticeBonus(appIdx,bonusIdx)
	LilianAppExpBonus:payBonus(appIdx,bonusIdx)
	-- 黄金徒弟，再获得额外的奖励(50%)
	if (callPlayerFunction(appIdx, GetTask, TKID_GOLD_APPRENTICE) > 0) then
		callPlayerFunction(appIdx, Msg2Player, "B筺  s� d鬾g Ho祅g Kim S�  thi誴, nh薾 頲 50% ph莕 thng. kinh nghi謒")
		LilianAppExpBonus:payBonusEx(appIdx,bonusIdx, 0.5)
	end
end
