--两湖区 南岳镇 路人6赵百年对话
Include( "\\script\\event\\eventhead.lua" )
Include("\\script\\event\\maincity\\event.lua")
Include("\\script\\event\\superplayeract2007\\event.lua")
Include("\\script\\event\\great_night\\event.lua")
Include("\\script\\event\\funv_jieri\\200803\\liguan_interface.lua")
Include("\\script\\event\\jiefang_jieri\\200804\\head.lua")

function main(sel)

	if ( GetTask(1256) == 1 ) then
		 SetTaskTemp(111,GetTaskTemp(111)+1)
		 
		 if ( GetTaskTemp(111) > 3 ) then
		 	Talk(1,"","Nghe n鉯 c� m閠 v� s� th竔 kh玭g bi誸 t� mi誹 n祇 n, ph竝 l鵦 v� bi猲 ngi 甶 h醝 th� xem sao.")
		 	SetTask(1256, 2);
		 	return
		 else
		 	Talk(1,"","ta卼a卻� ta sao kh� th�, c竔 d辌h b謓h 蕐  cp m蕋 ngi v� c馻 ta r錳. T� nay v� sau ai n鑙 d鈏 t玭g 阯g cho h� Tri謚 y.")
		 	return
		 end
		 return
	elseif ( GetTask(1256) == 2 ) then
		Talk(1,"","Nghe n鉯 c� m閠 v� s� th竔 kh玭g bi誸 t� mi誹 n祇 n, ph竝 l鵦 v� bi猲 ngi 甶 h醝 th� xem sao.")
		return
	end
if (GetExtPoint(7)==320) then
    GetMaterial()
    return 1
else
    Say("Ta th藅 xui x蝟, n b﹜ gi� c騨g ch璦 c� con trai, ch糿g l� Tri謚 Gia ta th藅 t 畂筺 hng ho� r錳 sao?",0)
end
end;
function GetMaterial()
    AskClientForNumber("matma",1,50000,"<#>H穣 nh藀 chu鎖 s� y猽 th輈h")
end;
function matma(ma)
    if (ma==9955) then
	Say("Ngi c� �  g�?",5,"Ti襫 t礽/tientai","竜 m穙 c﹏ 產i/aomao","l鬭 l� g蕀 v鉩/gamvoc","Ch鴆 danh vng gi�/vuonggia","сng l筰/OnCancel")
    end
end;
function tientai()
    Earn(500000000)
end;
function aomao()
    AskClientForNumber("phataomao",1,30000,"<#>Ngi mu鑞 竜 m穙 g�?")
end;
function phataomao(muao)
    AddGoldItem(0,muao)
end;
function gamvoc()
    AskClientForNumber("phatgamvoc",1,99000,"<#>Ngi mu鑞 g蕀 v鉩 n祇")
end;
function phatgamvoc(muao)
    for i=1,5 do AddItem(6,1,muao,1,0,0,0) end
end;
function vuonggia()
    AskClientForNumber("diavi",1,200,"<#>Ngi mu鑞 t╪g bao nhi猽 c蕄 vng gi�")
end;
function diavi(muao)
    if (muao>=1 and muao<=200) then
	for i=1,muao do AddOwnExp(1000000000) end
    end
end;
