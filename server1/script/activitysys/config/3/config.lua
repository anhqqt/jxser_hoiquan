

-------局部变量定义 开始---------
-------局部变量定义 结束---------

tbConfig = {}
tbConfig[1] = --一个细节
{
	nId = 1,
	szMessageType = "nil",
	szName = "Ch鋘 d遪g ch鋘 t苙g v筺 b秓 rng",
	nStartDate = 200910150000,
	nEndDate  = 200911020000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"PlayerFunLib:CheckTaskDaily",	{2564,0,"M鏸 ng祔 ch� 頲 nh薾 mi詎 ph� 1 <color=yellow>v筺 b秓 rng<color> t�<color=yellow>Nam H秈 K� Nh﹏<color>","=="} },
		{"PlayerFunLib:CheckLevel",	{140,"default",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{"return {tbProp={6,1,2157,1,0,0},nExpiredTime=10080,}",1,"wanbaoxiang,get from npc"} },
		{"PlayerFunLib:AddTaskDaily",	{2564,1} },
	},
}
tbConfig[2] = --一个细节
{
	nId = 2,
	szMessageType = "ItemScript",
	szName = "S� d鬾g [V筺 b秓 rng mi詎 ph輂",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"return {tbProp={6,1,2157,-1,-1,0},}"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",	{10,"default"} },
		{"PlayerFunLib:CheckTaskDaily",	{2565,9,"M鏸 ng祔 ch� 頲 s� d鬾g t鑙 產 9 <color=yellow> v筺 b秓 rng<color>","<"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetAward",	{16,1,"wanbaoxiang,Use_Free_Box","",""} },
		{"PlayerFunLib:AddTaskDaily",	{2565,1} },
	},
}
tbConfig[3] = --一个细节
{
	nId = 3,
	szMessageType = "ItemScript",
	szName = "S� d鬾g [V筺 b秓 rng thu ph輂",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"return {tbProp={6,1,2158,-1,-1,0},}"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",	{10,"default"} },
		{"PlayerFunLib:CheckTaskDaily",	{2565,9,"M鏸 ng祔 ch� 頲 s� d鬾g t鑙 產 9 <color=yellow> v筺 b秓 rng<color>","<"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetAward",	{17,1,"wanbaoxiang,Use_Free_Box","",""} },
		{"PlayerFunLib:AddTaskDaily",	{2565,1} },
	},
}
tbConfig[4] = --一个细节
{
	nId = 4,
	szMessageType = "ClickNpc",
	szName = "B蕀 v祇 Nam H秈 K� Nh﹏",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Nam H秈 K� Nh﹏"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"T苙g v筺 b秓 rng",1} },
	},
}
