--两湖区 南岳镇 驿站车夫对话  世界任务
-- Update: Dan_Deng(2003-09-16)暂时屏蔽任务（以后重写重开放）

CurStation = 11;
Include("\\script\\global\\station.lua")
--Include("\\script\\global\\skills_table.lua")

function main(sel)
--	check_update()					-- 技能更新、门派加标识（2004-05-31）
--	UTask_world15 = GetTask(15)
--	if (UTask_world15 < 255) then	
--		Say("车夫：唉，现在的生意越来越难做了，原本还有不少富商大爷去神农架那儿游玩，可是最近不知从哪儿窜出一群黑叶猴，沿路打劫客人，搞得我生意大受影响，如果有人能赶走这些黑叶猴就好了。你帮我赶走十只猴子，就可以免费在我这里使用一次车马。您要坐车吗？", 2, "帮忙/yes", "不帮忙/no")
--		SetTask(15, 1)
--	else
		Say("L祄 ngh� Xa phu th藅 l� kh� c鵦, c� l骳 n ch竜 tr緉g c騨g kh玭g c� m� ╪!", 4, "Nh鱪g n琲  甶 qua/WayPointFun", "Nh鱪g th祅h th�  甶 qua/StationFun", "Quay l筰 a 甶觤 c� /TownPortalFun", "Kh玭g c莕 u/OnCancel");
--	end
end;

function yes()
	Task0013 = GetTaskTemp(13);
	if (Task0013 < 10) then			--没有杀到十只黑叶猴
		Say("L祄 ngh� Xa phu th藅 l� kh� c鵦, c� l骳 n ch竜 tr緉g c騨g kh玭g c� m� ╪!", 4, "Nh鱪g n琲  甶 qua/WayPointFun", "Nh鱪g th祅h th�  甶 qua/StationFun", "Quay l筰 a 甶觤 c� /TownPortalFun", "Kh玭g c莕 u/OnCancel");
	else
		SetTaskTemp(13, 0)
		Say("C秏 琻 ngi  b総 d飉 ta H綾 Di謕 H莡! Ta a ngi 甶 mi詎 ph�!", 4, "Nh鱪g n琲  甶 qua/WayPointFun", "Nh鱪g th祅h th�  甶 qua/StationFun", "Quay l筰 a 甶觤 c� /TownPortalFun", "Kh玭g c莕 u/OnCancel")
	end
end;

function  OnCancel()
	Say("Kh玭g ti襫 kh玭g th� ng錳 xe!",0)
end;
