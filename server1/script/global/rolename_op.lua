ROLENAMEQUERY_FREE		= 0		-- 该角色名未被使用
ROLENAMEQUERY_INVALID	= 1		-- 该角色名非法
ROLENAMEQUERY_USED		= 2		-- 该角色名已被使用
                                -- 
ROLENAMECHANGE_SUCCESS	= 0		-- 更名成功
ROLENAMECHANGE_FAILURE	= 1		-- 更名失败
ROLENAMECHANGE_INVALID	= 2		-- 该角色名非法
ROLENAMECHANGE_USED		= 3		-- 该角色名已被使用
ROLENAMECHANGE_ONLINE	= 4		-- 该角色在线

function QueryNameResult(newname, result)
	local msg = "<color=red>" .. newname .. "<color>"
	if (result == ROLENAMEQUERY_FREE) then
		msg = msg .. "T猲 nh﹏ v藅 n祔 ch璦 b� s� d鬾g"
	elseif (result == ROLENAMEQUERY_USED) then
		msg = msg .. "T猲 nh﹏ v藅 n祔  c� ngi s� d鬾g"
	else
		msg = msg .. "T猲 nh﹏ v藅 n祔 v� hi謚, kh玭g th� s� d鬾g"
	end
	Talk(1, "", msg)
end

function ChangeNameResult(newname, result)
	local msg = "<color=red>" .. newname .. "<color>"
	if (result == ROLENAMECHANGE_FAILURE) then
		msg = msg .. "T猲 nh﹏ v藅 n祔 kh玭g th� s� d鬾g"
	elseif (result == ROLENAMECHANGE_USED or result == ROLENAMECHANGE_ONLINE) then
		msg = msg .. "T猲 nh﹏ v藅 n祔  c� ngi s� d鬾g"
	else
		msg = msg .. "T猲 nh﹏ v藅 n祔 v� hi謚, kh玭g th� s� d鬾g"
	end
	Talk(1, "", msg)
end
