-------------------------------------------------------------------------
-- FileName		:	newtask_head.lua
-- Author		:	lailigao
-- CreateTime	:	2004-12-27 21:42:55
--	Desc		：	新任务系统基础定义
--					命名规范：nt_xxx (newtask)
-------------------------------------------------------------------------

--Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\task_award_extend.lua")		--任务中奖励的扩展脚本

-- Describ图片描述
DescLink_NieShiChen = "<#><link=image[147,167]:\\spr\\npcres\\enemy\\enemy154\\enemy154_pst.spr>Nhi誴 Th� Tr莕:<link>";
TSKID_KILLTASKID =		1082;	-- 接受的哪个任务
TSKID_KILLERDATE =		1192;	--接任务时的日期
TSKID_KILLERMAXCOUNT =	1193;	--每天杀人次数
TSKID_KILLTASKID_SPE =	1793;	-- 是否接受高级杀手任务	-- 收费版不用
TSKID_KILLERDATE_SPE =	1794;	--接高级杀手任务时的日期和次数	-- 收费版不用

KILLER_MAXCOUNT		= 8;	--每天杀人上限8人


-- 正中邪阵营定义
NT_Camp_Zheng 	= 0
NT_Camp_Zhong 	= 1
NT_Camp_Xie 	= 2
----------------公共类型定义 end -------------------

----------------公共基本函数 start-------------------
-- 设置任务状态
function nt_setTask(nTaskID, nTaskValue)
	SetTask(nTaskID, nTaskValue)
	SyncTaskValue(nTaskID) -- 同步到客户端
end

-- 获取任务状态
function nt_getTask(nTaskID)
	return GetTask(nTaskID)
end

-- 获取玩家的正、中、邪阵营
-- 0 - 正 1 - 中，2 - 邪
function nt_getCamp()
	local lastFaction = GetLastFactionNumber();
	if (lastFaction == 0) or (lastFaction == 4) or (lastFaction == 6) or (lastFaction == 8) then
		return NT_Camp_Zheng; -- 正派
	elseif  (lastFaction == 1) or (lastFaction == 2) or (lastFaction == 5) or (lastFaction == 9) then
		return NT_Camp_Zhong; --中立
	elseif  (lastFaction == 3) or (lastFaction == 7) then
		return NT_Camp_Xie; --邪派
	end
end
----------------公共基本函数 start-------------------
function AddGoldItem(index)
	if (index == 184) then
		AddItem(0,9,2,1,0,0,0)
	elseif (index == 178) then
		AddItem(0,7,14,1,0,0,0)
	elseif (index == 181) then
		AddItem(0,3,2,1,0,0,0)
	elseif (index == 182) then
		AddItem(0,6,2,1,0,0,0)
	elseif (index == 183) then
		AddItem(0,8,2,1,0,0,0)
	elseif (index == 179) then
		AddItem(0,2,29,1,0,0,0)
	elseif (index == 180) then
		AddItem(0,4,2,1,0,0,0)
	elseif (index == 185) then
		AddItem(0,5,4,1,0,0,0)
	elseif (index == 177) then
		AddItem(0,3,1,1,0,0,0)
	elseif (index == 168) then
	elseif (index == 169) then
	elseif (index == 170) then
	elseif (index == 171) then
	elseif (index == 172) then
	elseif (index == 173) then
	elseif (index == 174) then
	elseif (index == 175) then
	elseif (index == 176) then

	end
end;