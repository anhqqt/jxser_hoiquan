

-------局部变量定义 开始---------
-------局部变量定义 结束---------

tbConfig = {}
tbConfig[1] = --一个细节
{
	nId = 1,
	szMessageType = "nil",
	szName = "Ph莕 thng sau khi chuy觧 sinh t n c蕄 160 l� phi猲 v�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTransLifeCount",	{3,"Ch� c� th� � c蕄 190 ti課 h祅h tr飊g sinh l莕 3, ng th阨 t n c蕄 160 m韎 c� th� nh薾 頲 ph莕 thng n祔","=="} },
		{"PlayerFunLib:CheckLevel",	{160,"Ch� c� th� � c蕄 190 ti課 h祅h tr飊g sinh l莕 3, ng th阨 t n c蕄 160 m韎 c� th� nh薾 頲 ph莕 thng n祔","=="} },
		{"PlayerFunLib:CheckTaskBit",	{"2582",1,1,"Ch� c� th� � c蕄 190 ti課 h祅h tr飊g sinh l莕 3, ng th阨 t n c蕄 160 m韎 c� th� nh薾 頲 ph莕 thng n祔"} },
		{"PlayerFunLib:CheckTaskBit",	{"2582",2,0,"Чi hi謕  nh薾 ph莕 thng n祔 r錳."} },
		{"PlayerFunLib:CheckFreeBagCellWH",	{2,3,1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,10,7,5,5,0},nExpiredTime=259200,},1,"3rdTransAward"} },
		{"PlayerFunLib:SetTaskBit",	{"2582",2,1} },
	},
}
tbConfig[2] = --一个细节
{
	nId = 2,
	szMessageType = "ClickNpc",
	szName = "Ph莕 thng sau khi chuy觧 sinh t n c蕄 160 l� phi猲 v�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"B綾 u L穙 Nh﹏"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Ph莕 thng sau khi chuy觧 sinh t n c蕄 160 l� phi猲 v�",1} },
	},
}
