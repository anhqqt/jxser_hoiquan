Include("\\script\\activitysys\\config\\41\\variables.lua")
tbConfig = {}
tbConfig[1] = --一个细节
{
	nId = 1,
	szMessageType = "ServerStart",
	szName = "Add npc when server start",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:InitAddNpc",	{nil} },
	},
}
tbConfig[2] = --一个细节
{
	nId = 2,
	szMessageType = "ClickNpc",
	szName = "click npc named dazhushuai",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {"Чi Ch� So竔"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"N閜 Huy Hi謚",3} },
		{"AddDialogOpt",	{"Nh薾 danh hi謚 е Nh蕋 Ch� So竔",4} },
		{"AddDialogOpt",	{"Nh薾 ph莕 thng е Nh蕋 Ch� So竔",5} },
		{"AddDialogOpt",	{"K輈h ho箃 t輓h n╪g е Nh蕋 Ch� So竔",6} },
		{"AddDialogOpt",	{"Ki觤 tra 甶觤 t輈h l騳 danh hi謚",7} },
		{"AddDialogOpt",	{"N﹏g c蕄 Huy Hi謚",16} },
	},
}
tbConfig[3] = --一个细节
{
	nId = 3,
	szMessageType = "CreateDialog",
	szName = "handin medal total",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {"Xin ch祇",0},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckTaskDaily",	{TSK_DAILY_MEDAL,MAX_DAILY_HANDIN_MEDAL,"H玬 nay ngi  giao n閜 qu� nhi襲 r錳, i ng祔 mai quai l筰 nh�","<"} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Giao n閜 Huy Hi謚 c蕄 1",24} },
		{"AddDialogOpt",	{"Giao n閜 Huy Hi謚 c蕄 2",25} },
		{"AddDialogOpt",	{"Giao n閜 Huy Hi謚 c蕄 3",26} },
	},
}
tbConfig[4] = --一个细节
{
	nId = 4,
	szMessageType = "nil",
	szName = "get title named diyizhushuai",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckTaskDaily",	{TSK_DAILY_GET_TITLE,1,"Ngi  nh薾 danh hi謚 n祔 r錳","<"} },
		{"lib:CheckTimeAndWeekDay",	{1000,2400,"4","T� 10:00 n 24:00 th� 5 h祅g tu莕 m韎 c� th� nh薾"} },
	},
	tbActition = 
	{
		{"ThisActivity:GetTitle_1",	{nil} },
	},
}
tbConfig[5] = --一个细节
{
	nId = 5,
	szMessageType = "nil",
	szName = "get diyizhushuai award",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckTaskDaily",	{TSK_DAILY_EXP_AWARD,1,"H玬 nay ngi  nh薾 ph莕 thng n祔, i ng祔 mai quay l筰 nh�","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:GetZhuShuaiAward_1",	{nil} },
	},
}
tbConfig[6] = --一个细节
{
	nId = 6,
	szMessageType = "CreateDialog",
	szName = "active diyizhushuai",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {"Xin ch祇",0},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckTaskDaily",	{TSK_DAILY_ACTIVE,MAX_DAILY_ACTIVE,"H玬 nay s� l莕 k輈h ho箃 c馻 c竎 h�  s� dung h誸, i ng祔 mai quay l筰 nh�","<"} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"K輈h ho箃 Vt 秈 nh薾 hi謚 qu� nh﹏ 2 kinh nghi謒",8} },
		{"AddDialogOpt",	{"K輈h ho箃 Vi猰 д nh薾 hi謚 qu� nh﹏ 2 kinh nghi謒",9} },
		{"AddDialogOpt",	{"K輈h ho箃 T鑞g Kim nh薾 hi謚 qu� nh﹏ 2 甶觤 t輈h l騳",10} },
	},
}
tbConfig[7] = --一个细节
{
	nId = 7,
	szMessageType = "nil",
	szName = "query mark",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:QueryMark_1",	{nil} },
	},
}
tbConfig[8] = --一个细节
{
	nId = 8,
	szMessageType = "nil",
	szName = "active chuangguan",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckTaskDaily",	{TSK_DAILY_ACTIVE,MAX_DAILY_ACTIVE,"H玬 nay s� l莕 k輈h ho箃 c馻 c竎 h�  s� dung h誸, i ng祔 mai quay l筰 nh�","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:ActiveFunction_1",	{NUM_CHUANGGUAN} },
	},
}
tbConfig[9] = --一个细节
{
	nId = 9,
	szMessageType = "nil",
	szName = "active YDBZ",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckTaskDaily",	{TSK_DAILY_ACTIVE,MAX_DAILY_ACTIVE,"H玬 nay s� l莕 k輈h ho箃 c馻 c竎 h�  s� dung h誸, i ng祔 mai quay l筰 nh�","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:ActiveFunction_1",	{NUM_YDBZ} },
	},
}
tbConfig[10] = --一个细节
{
	nId = 10,
	szMessageType = "nil",
	szName = "active songjin",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckTaskDaily",	{TSK_DAILY_ACTIVE,MAX_DAILY_ACTIVE,"H玬 nay s� l莕 k輈h ho箃 c馻 c竎 h�  s� dung h誸, i ng祔 mai quay l筰 nh�","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:ActiveFunction_1",	{NUM_SONGJIN} },
	},
}
tbConfig[11] = --一个细节
{
	nId = 11,
	szMessageType = "FinishSongJin",
	szName = "songjin mark >= 3000",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"nomsg",">="} },
		{"PlayerFunLib:CheckTask",	{"751",3000,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MEDAL_1,10,EVENT_LOG_TITLE,"TongKim3000NhanHuyHieu"} },
	},
}
tbConfig[12] = --一个细节
{
	nId = 12,
	szMessageType = "FinishSongJin",
	szName = "songjin mark < 3000 and >= 1000",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"nomsg",">="} },
		{"PlayerFunLib:CheckTask",	{"751",3000,"","<"} },
		{"PlayerFunLib:CheckTask",	{"751",1000,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MEDAL_1,5,EVENT_LOG_TITLE,"TongKim1000NhanHuyHieu"} },
	},
}
tbConfig[13] = --一个细节
{
	nId = 13,
	szMessageType = "Chuanguan",
	szName = "chuangguan 17",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {"17"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"nomsg",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MEDAL_1,5,EVENT_LOG_TITLE,"VuotAi17NhanHuyHieu"} },
	},
}
tbConfig[14] = --一个细节
{
	nId = 14,
	szMessageType = "Chuanguan",
	szName = "chuangguan 28",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"nomsg",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MEDAL_1,5,EVENT_LOG_TITLE,"VuotAi28NhanHuyHieu"} },
	},
}
tbConfig[15] = --一个细节
{
	nId = 15,
	szMessageType = "YDBZguoguan",
	szName = "YDBZ 6",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {6},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"nomsg",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MEDAL_1,10,EVENT_LOG_TITLE,"VuotAiViemDe6NhanHuyHieu"} },
	},
}
tbConfig[16] = --一个细节
{
	nId = 16,
	szMessageType = "CreateDialog",
	szName = "level up medal",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {"Xin ch祇",0},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"N﹏g c蕄 l猲 Huy Hi謚 c蕄 2",17} },
		{"AddDialogOpt",	{"N﹏g c蕄 l猲 Huy Hi謚 c蕄 3",18} },
	},
}
tbConfig[17] = --一个细节
{
	nId = 17,
	szMessageType = "nil",
	szName = "compse medal 1",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:toUpdatecompose",	{1} },
	},
}
tbConfig[18] = --一个细节
{
	nId = 18,
	szMessageType = "nil",
	szName = "compse medal 2",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:toUpdatecompose",	{2} },
	},
}
tbConfig[19] = --一个细节
{
	nId = 19,
	szMessageType = "ClickNpc",
	szName = "click npc name lingfan",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {"H祅g rong"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Mua Th筩h Kim",20} },
	},
}
tbConfig[20] = --一个细节
{
	nId = 20,
	szMessageType = "CreateCompose",
	szName = "compose shijin",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {"Th筩h Kim",1,1,1,0.02,0,50},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"AddOneMaterial",	{"Ng﹏ lng",{nJxb=1},10000} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_SHIJIN,1,EVENT_LOG_TITLE,"buy_shijin"} },
	},
}
tbConfig[21] = --一个细节
{
	nId = 21,
	szMessageType = "ClickNpc",
	szName = "click npc named caifengshi",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {"Th� May"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Nh薾 ph莕 thng tr鵦 tuy課",22} },
	},
}
tbConfig[22] = --一个细节
{
	nId = 22,
	szMessageType = "nil",
	szName = "get award by online",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{90,"default",">="} },
		{"ThisActivity:CheckTaskDaily",	{TSK_DAILY_LOGIN_MEDAL,MAX_DAILY_LOGIN_MEDAL,"H玬 nay ngi kh玭g th� nh薾 n鱝, ng祔 mai h穣 quay l筰.","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"ThisActivity:GetOnLineAward",	{nil} },
	},
}
tbConfig[23] = --一个细节
{
	nId = 23,
	szMessageType = "OnLogin",
	szName = "player login",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:PlayerOnLogin",	{nil} },
	},
}
tbConfig[24] = --一个细节
{
	nId = 24,
	szMessageType = "nil",
	szName = "hand in medal 1",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:tocompose",	{1} },
	},
}
tbConfig[25] = --一个细节
{
	nId = 25,
	szMessageType = "nil",
	szName = "hand in medal 2",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:tocompose",	{2} },
	},
}
tbConfig[26] = --一个细节
{
	nId = 26,
	szMessageType = "nil",
	szName = "hand in medal 3",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:tocompose",	{3} },
	},
}
tbConfig[27] = --一个细节
{
	nId = 27,
	szMessageType = "nil",
	szName = "hand in medal 3",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:tocompose",	{3} },
	},
}
tbConfig[28] = --一个细节
{
	nId = 28,
	szMessageType = "SignUpSongJin",
	szName = "sign up songjin",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {3},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:PlayerSignUp",	{NUM_SONGJIN} },
	},
}
tbConfig[29] = --一个细节
{
	nId = 29,
	szMessageType = "SignUpYDBZ",
	szName = "sign up ydbz",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:PlayerSignUp",	{NUM_YDBZ} },
	},
}
tbConfig[30] = --一个细节
{
	nId = 30,
	szMessageType = "SignUpChuangguan",
	szName = "sign up chuanggguan",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {2},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:PlayerSignUp",	{NUM_CHUANGGUAN} },
	},
}
