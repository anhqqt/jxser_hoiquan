-- 战役系统
-- Fanghao_Wu 2004-12-6

function TaskShedule()
	-- 设置方案名称
	TaskName( "襄阳战役 (宋金) 18:50" );
	TaskInterval( 1440 );
	TaskTime( 18, 50 );
	TaskCountLimit( 0 );
	-- 输出启动消息
	OutputMsg( "BATTLE[XiangYang] 18:50 startup..." );
end

function TaskContent()
--	Battle_StartNewRound( 1, 1 );	-- GM指令，启动低级新战局
--	Battle_StartNewRound( 1, 2 );	-- GM指令，启动中级新战局
	Battle_StartNewRound( 1, 3 );	-- GM指令，启动高级新战局
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
