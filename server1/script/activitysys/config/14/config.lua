

-------局部变量定义 开始---------
-------局部变量定义 结束---------

tbConfig = {}
tbConfig[1] = --一个细节
{
	nId = 1,
	szMessageType = "NpcOnDeath",
	szName = "BigBoss t� vong",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckName",	{"чc C� Thi猲 Phong"} },
	},
	tbActition = 
	{
		{"BigBoss:BigBossDeath",	{nil} },
	},
}
tbConfig[2] = --一个细节
{
	nId = 2,
	szMessageType = "nil",
	szName = "Ph莕 thng to祅 server c馻 [чc C� Thi猲 Phong]",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"lib:CheckTimeAndWeekDay",	{2000,2100,"0,1,2,3,4,5,6","Hi謓 t筰 kh玭g ph秈 l� th阨 gian l躰h thng"} },
		{"PlayerFunLib:CheckLevel",	{90,format("C蕄 %d tr� l猲 m韎 c� th� nh薾 thng!",90),">="} },
	},
	tbActition = 
	{
		{"dostring",	{"Include([[\\script\\missions\\boss\\bigboss.lua]]); BigBoss:BigBossGlobalReward()"} },
	},
}
tbConfig[3] = --一个细节
{
	nId = 3,
	szMessageType = "ClickNpc",
	szName = "B蕀 v祇 L� Quan",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"L� Quan"},
	tbCondition = 
	{
		{"NpcFunLib:IsInCity",	{nil} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Ph莕 thng to祅 server c馻 [чc C� Thi猲 Phong]",2} },
	},
}
