if racegame_tbMission then
	return 
end

Include("\\script\\missions\\racegame\\base\\head.lua")
Include("\\script\\missions\\racegame\\lib.lua")
Include("\\script\\lib\\mem.lua")
Include("\\script\\event\\jiefang_jieri\\200804\\taskctrl.lua")
Include("\\script\\lib\\gb_taskfuncs.lua")
racegame_tbMission = new(tbMission)

racegame_tbMission.nMissionId	= 53
racegame_tbMission.tbTimer		=  { {91, 18*10}}
racegame_tbMission.nLatencyTime	= 60*14     -- 等待时间14分钟

racegame_tbMission.nMapId		= 863     -- 地图Id

racegame_tbMission.tbNpcList = 
{
	[1] = {szName = "g ch� 阯g 畊a", nNpcId = 228, szScriptPath = "\\script\\missions\\racegame\\npcsaichanglaoban.lua"},
	[2] = {szName = "Чo c� h� tr�", nNpcId = 1288,szScriptPath = "\\script\\missions\\racegame\\npctoolitem.lua"},
}

racegame_tbMission.tbItemList = 
{
	{szName="Gia T鑓 ho祅", tbProp={6, 1, 978, 1, 0, 0} },
	{szName="L玦 T鑓 ho祅", tbProp={6, 1, 990, 1, 0, 0} },
	{szName="Huy襫 Thi猲 H穖 T躰h", tbProp={6, 1, 982, 1, 0, 0} },
	{szName="B╪g Phong H穖 T躰h", tbProp={6, 1, 984, 1, 0, 0} },
	{szName="Huy詎 Hu﹏ H穖 T躰h", tbProp={6, 1, 981, 1, 0, 0} },
	{szName="Sng Gi竛g H穖 T躰h", tbProp={6, 1, 983, 1, 0, 0} },
	{szName="B╪g Sng Hi謚 gi竎 ", tbProp={6, 1, 979, 1, 0, 0} },
	{szName="B筼 L玦 Hi謚 gi竎", tbProp={6, 1, 980, 1, 0, 0}},
	{szName="чn мa ph� ", tbProp={6, 1, 987, 1, 0, 0} },
}



racegame_tbMission.G_TSK_NAME			= "racegame"
racegame_tbMission.ReadyMissionState	= 1
racegame_tbMission.MissionState			= 2




racegame_tbMission.tbSignUpPos = {1592+4,3264+8}
racegame_tbMission.tbMissionV =
{
	MISSION_STATE	= 1,
	SECOND_COUNTER	= 2,
	RANK_COUNTER	= 3,	
}

racegame_tbMission.tbMissionS =
{
	
}





function racegame_tbMission:OnInit()
	SetMissionV(self.tbMissionV.MISSION_STATE, 1)

	gb_SetTask(self.G_TSK_NAME, self.MissionState, 1)
	self:AddGoalNpc()
end



function racegame_tbMission:OnPlayerJoin()
	ForbitSkill(1);
	SetMoveSpeed(5);
	jiefang_0804_ResetTask()
	SetTask(jiefang_0804_TSK_AwardState, 0)
	--设置与帮会有关的变量，不允许在竞技场战改变某个帮会阵营的操作
	SetTaskTemp(200,1);
	--设置战斗状态
--		SetFightState(1);
	--玩家退出时，保存RV并，在下次等入时用RV(城市重生点，非退出点)
	SetLogoutRV(1);
	
	--禁止光环
	ForbitAura(1)
	SetFightState(1);
	--无死亡惩罚
	SetPunish(0);
	--关闭组队功能
	SetCreateTeam(0);
	--打开PK开关 

	--设置仇杀
	ForbidEnmity( 1 )
	--开始应该都不能PK
	SetPKFlag(1)
	--禁止交易;
	DisabledStall(1);
	ForbitTrade(0);
	
	ForbidChangePK(1);
	SetCurCamp(4);	--设置临时阵营
	DisabledUseTownP(1);	--禁止使用回程；
	
	local nTimerCount = GetMissionV(self.tbMissionV.SECOND_COUNTER)
	local szMsg	= format("Cu閏 畊a b総 u, th阨 gian c遪 l筰 l� <color=yellow>%d<color> gi﹜.", self.nLatencyTime - nTimerCount)
	Msg2Player(szMsg)
	return 1
end

function racegame_tbMission:OnLeave()
	self:DelItem()

	ForbitSkill(0);
	SetMoveSpeed(-1);
	
	--关闭禁止光环
	ForbitAura(0)
	--关闭设置与帮会有关的变量，不允许在竞技场战改变某个帮会阵营的操作
	SetTaskTemp(200,0);
	--设置战斗状态
	SetFightState(0);
	--玩家退出时，保存RV并，在下次等入时用RV(城市重生点，非退出点)
	--SetLogoutRV(0);
	--死亡惩罚
	SetPunish(1);
	--开启组队功能
	SetCreateTeam(0);
	--打开PK开关 
	
	--设置仇杀
	ForbidEnmity( 0 )
	--开始应该都不能PK
	SetPKFlag(0)
	--关闭禁止交易;
	DisabledStall(0);
	ForbitTrade(0);
	
	local nCamp = GetCamp();
	SetCurCamp(nCamp);
	
	ForbidChangePK(0);
	DisabledUseTownP(0);	--关闭禁止使用回程；
end

function racegame_tbMission:OnClose()
	gb_SetTask(self.G_TSK_NAME, self.MissionState, 0)
	Msg2MSAll(self.nMissionId, "Th阨 gian 畊a  h誸, cu閏 畊a k誸 th骳.")
	self:ClearGoalNpc()
	self:ClearItemNpc()
	local nPlayerCount	= GetMSPlayerCount(self.nMissionId, 0)
	local tbPlayer = {}
	if (nPlayerCount <= 0) then
		return
	end;
	local idx, pidx = 0, 0;
	for i = 1, nPlayerCount do
		idx, pidx = GetNextPlayer(self.nMissionId, idx, 0);
		if (pidx > 0) then
			tinsert(tbPlayer, pidx)
		end;
		
		if (idx == 0) then
			break;
		end;
	end
	
	for i = 1, getn(tbPlayer) do
		doFunByPlayer(tbPlayer[i], jiefang_0804_ResetTask)
		local nPlayerMapId = doFunByPlayer(tbPlayer[i], GetTask, jiefang_0804_TSK_MapId)
		if nPlayerMapId == 0 then
			nPlayerMapId = 524
		end
		doFunByPlayer(tbPlayer[i], NewWorld, nPlayerMapId, self.tbSignUpPos[1], self.tbSignUpPos[2])
	end
	
end

function racegame_tbMission:AddGoalNpc()
	local nX, nY = 1568*32, 2507*32
	racegame_CallNpc(self.tbNpcList[1], self.nMapId, nX, nY)
end

function racegame_tbMission:ClearGoalNpc()

	ClearMapNpcWithName(self.nMapId, self.tbNpcList[1].szName);
end

function racegame_tbMission:ClearItemNpc()

	ClearMapNpcWithName(self.nMapId, self.tbNpcList[2].szName);
end

function racegame_tbMission:AddItemNpc()

	local tbPosList = getndata("\\settings\\battles\\maps\\river\\outside.txt", 400)
	for i = 1, getn(tbPosList) do
		racegame_CallNpc(self.tbNpcList[2], self.nMapId, tbPosList[i][1], tbPosList[i][2])
	end
end

function racegame_tbMission:OnTimer()
	local nTimerCount = GetMissionV(self.tbMissionV.SECOND_COUNTER)
	nTimerCount = nTimerCount + 10
	local szMsg	= format("Th阨 gian c遪 l筰 l� <color=yellow>%d<color> gi﹜.", self.nLatencyTime - nTimerCount)
	
	if mod(nTimerCount, 100) == 10 then
		self:AddItemNpc()
		
	end
	
	if mod(nTimerCount, 100) == 20 then
		self:ClearItemNpc()
	end
	if mod(nTimerCount, 60) == 0 or nTimerCount == self.nLatencyTime - 10 then
		Msg2MSAll(self.nMissionId, szMsg)
	end
	if nTimerCount >= self.nLatencyTime then
		self:CloseGame()
		return 
	end
	
	SetMissionV(self.tbMissionV.SECOND_COUNTER, nTimerCount)
end

function racegame_tbMission:DelItem()
	for i= 1, getn(self.tbItemList) do
		local tbProp = self.tbItemList[i].tbProp
		local nItemCount = CalcItemCount(-1,tbProp[1],tbProp[2],tbProp[3],-1)
		ConsumeItem(-1,nItemCount,tbProp[1],tbProp[2],tbProp[3],-1)	
	end
	
end