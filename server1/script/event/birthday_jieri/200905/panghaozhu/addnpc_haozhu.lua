-- ====================== 文件信息 ======================

-- 剑侠情缘网络版越南版 - 刷新胖豪猪
-- 文件名　：addnpc_haozhu.lua
-- 创建者　：子非魚
-- 创建时间：2009-05-31 09:31:39

-- ======================================================

Include("\\script\\missions\\basemission\\lib.lua");
Include("\\script\\lib\\file.lua");

local tbBD0905_haozhu_pos = {
	{nMapID = 1, szMapName = "Phng Tng Ph� ", szPosPath = "\\settings\\maps\\city_out\\1.txt"},
	{nMapID = 11, szMapName = "Th祅h Й Ph� ", szPosPath = "\\settings\\maps\\city_out\\11.txt"},
	{nMapID = 37, szMapName = "Bi謓 Kinh Ph� ", szPosPath = "\\settings\\maps\\city_out\\37.txt"},
	{nMapID = 78, szMapName = "Tng Dng Ph� ", szPosPath = "\\settings\\maps\\city_out\\78.txt"},
	{nMapID = 80, szMapName = "Dng Ch﹗ Ph� ", szPosPath = "\\settings\\maps\\city_out\\80.txt"},
	{nMapID = 162, szMapName = "Чi L�", szPosPath = "\\settings\\maps\\city_out\\162.txt"},
	{nMapID = 176, szMapName = "L﹎ An Ph� ", szPosPath = "\\settings\\maps\\city_out\\176.txt"},
	{nMapID = 174, szMapName = "Long Tuy襫 th玭", szPosPath = "\\settings\\maps\\village_out\\174.txt"},
	{nMapID = 121, szMapName = "Long M玭 tr蕁", szPosPath = "\\settings\\maps\\village_out\\121.txt"},
	{nMapID = 153, szMapName = "Th筩h C� tr蕁", szPosPath = "\\settings\\maps\\village_out\\153.txt"},
	{nMapID = 101, szMapName = "Чo Hng th玭", szPosPath = "\\settings\\maps\\village_out\\101.txt"},
	{nMapID = 99, szMapName = "V躰h L筩 tr蕁", szPosPath = "\\settings\\maps\\village_out\\99.txt"},
	{nMapID = 100, szMapName = "Chu Ti猲 tr蕁", szPosPath = "\\settings\\maps\\village_out\\100.txt"},
	{nMapID = 20, szMapName = "Giang T﹏ Th玭", szPosPath = "\\settings\\maps\\village_out\\20.txt"},
	{nMapID = 53, szMapName = "Ba L╪g huy謓", szPosPath = "\\settings\\maps\\village_out\\53.txt"},
}

-- 参数：刷新地图ID，刷新个数
function birthday0905_addnpc_haozhu(n_count)
	local n_mapid = 0;
	local n_worldidx = SubWorldID2Idx(n_mapid);
	
	if (n_count > 0) then
		
		local tbNpc = {nNpcId = 1431, nLevel = 30, szName = "Nh輒 b衞 ph�", nIsboss = 1,
						szDeathScript = "\\script\\event\\birthday_jieri\\200905\\panghaozhu\\haozhu_death.lua",
						szScriptPath = "\\script\\event\\birthday_jieri\\200905\\panghaozhu\\haozhu_death.lua"};
		
		for i = 1, getn(%tbBD0905_haozhu_pos) do
			
			local n_mapid = %tbBD0905_haozhu_pos[i].nMapID;
			local n_worldidx = SubWorldID2Idx(n_mapid);
			if (n_worldidx >= 0) then
				ClearMapNpcWithName(n_mapid, "Nh輒 b衞 ph�");
			
				for k = 1, n_count do
					local nPosX, nPosY = GetRandomAData(%tbBD0905_haozhu_pos[i].szPosPath);
					WriteLog(date().."	"..n_mapid..","..nPosX..","..nPosY);
					basemission_CallNpc(tbNpc, n_mapid, (nPosX * 32 + (32-k*2)), (nPosY * 32 + (k*2-32)) );
				end
			end
			
		end
	else
		print("birthday0905_addnpc_haozhu Error! Fail Param!!")
	end
		
end

