


if(hasInterface)then{
		[] ExecVM "ScarCode\sMenuInit.sqf";
		execVM "semClient.sqf";
};




	[] execVM "addons\messages\init.sqf";
	execVM "R3F_LOG\init.sqf";
	[] execVM "addons\halv_spawn\init.sqf";
	[] execVM "HC\Init.sqf";

	


#include "A3EAI_Client\A3EAI_initclient.sqf";

//////////////////////////////////////////////////////////////////////////
//cmEARPLUGS CODE START

call compile preProcessFileLineNumbers "cmEarplugs\config.sqf";

//cmEARPLUGS CODE END
//////////////////////////////////////////////////////////////////////////