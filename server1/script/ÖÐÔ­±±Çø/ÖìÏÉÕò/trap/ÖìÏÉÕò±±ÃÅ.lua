--中原北区 朱仙镇北门 战斗状态切换Trap
--TrapId：66

function main(sel)

if ( GetFightState() == 0 ) then	-- 玩家处于非战斗状态，即在城内
	SetPos(1697, 3097)		-- 设置走出Trap点，目的点在城外	
	SetFightState(1)		-- 转换为战斗状态
else			       		-- 玩家处于战斗状态，即在城外
	SetPos(1695, 3099)		-- 设置走出Trap点，目的点在城内	
	SetFightState(0)		-- 转换为非战斗状态
end;
	AddStation(15)			-- 记录角色曾经到过朱仙镇
end;

 