Include( "\\script\\missions\\leaguematch\\head.lua" )


function OnDeath( Launcher )
	local org_player = PlayerIndex
	local org_name = GetName() --死者名字
	PlayerIndex = NpcIdx2PIdx( Launcher )
	Msg2Player("B筺  nh b筰 i phng<color=yellow>"..org_name.."<color>")
	PlayerIndex = org_player
	
	DelMSPlayer(WLLS_MSID_COMBAT, 0)	--强制该玩家离开Mission
	SetLogoutRV(0);
	NewWorld(wlls_get_mapid(1), WLLS_MAPPOS_SIGN[1], WLLS_MAPPOS_SIGN[2])	--将尸体拖到报名场=.=
	if (GetTask(WLLS_TASKID_ORGCAMP) > 0) then
		Msg2Player("<color=yellow>Ch� �!!!<color> чi ng� chi課 u c馻 b筺 ch璦 k誸 th骳, b筺 ph秈 tr� l筰 n琲 b竜 danh i. Trong th阨 gian n祔 b筺 b� t m筺g ho芻 r阨 kh醝 h閕 trng thi u s� kh玭g nh薾 頲 ph莕 thng.")
	end
end
