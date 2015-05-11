///////////////////////////////////////////////////////
///////  ARMA 3 SERVERMENU SCRIPT BY IT07  ////////////
///////  VERSION: 03879_PATCH5  ///////////////////////
///////  SUPPORT: it07@scarcode.com  //////////////////
///////////////////////////////////////////////////////

SC_fnc_ctrLbAdd = compileFinal preprocessFileLineNumbers "ScarCode\functions_SC\sMenu_fnc_ctrLbAdd.sqf";
SC_fnc_getContent = compileFinal preprocessFileLineNumbers "ScarCode\functions_SC\sMenu_fnc_getContent.sqf";
SC_fnc_handleCtrlText = compileFinal preprocessFileLineNumbers "ScarCode\functions_SC\sMenu_fnc_handleCtrlText.sqf";
SC_fnc_getCfgSetting = compileFinal preprocessFileLineNumbers "ScarCode\functions_SC\sMenu_fnc_getCfgSetting.sqf";
SC_fnc_f5Reload = compileFinal preprocessFileLineNumbers "ScarCode\functions_SC\sMenu_fnc_f5Reload.sqf";
SC_fnc_sMenuOpen = compileFinal preprocessFileLineNumbers "ScarCode\functions_SC\sMenu_fnc_sMenuOpen.sqf";

_settings = [["keyToOpenMenu","menuCategories","serverIPandPort","serverLocation","maxPlayers","restartInterval","serverMods","serverAllowedMods","serverMap","serverAH","serverManagedBy","serverHostLogo","serverSquadLogo","serverMission","serverGameType","useScrollAction"]] call SC_fnc_getCfgSetting;

_evHandlerCheck = uiNamespace getVariable "SC_sMenuEH";
	if not (isNil "_evHandlerCheck") then
	{
		(findDisplay 46) displayRemoveEventHandler ["KeyDown", _evHandlerCheck];
		uiNamespace setVariable ["SC_sMenuEH", nil];
	};

_f5EventHandler = uiNamespace getVariable "SC_sMenuF5";
	if not (isNil "_f5EventHandler") then
	{
		(findDisplay 297) displayRemoveEventHandler ["KeyDown", _f5EventHandler];
		uiNamespace setVariable ["SC_sMenuF5", nil];
	};

waitUntil { sleep 0.1; isNull(findDisplay 46); (isNil "_evHandlerCheck"); (speed player > 0.1) };

if (typeName (_settings select 0) == "SCALAR") then
{
	_sMenuEH = (findDisplay 46) displayAddEventHandler ["KeyDown", "if(_this select 1 == "+str (_settings select 0)+" and !dialog) then { "+str _settings+" call SC_fnc_sMenuOpen };false;"];
	uiNamespace setVariable ["SC_sMenuEH", _sMenuEH];
};

if (typeName (_settings select 15) == "SCALAR") then
{
	_sMenuAddAction = player addaction["<t color='#D13B3B'>{SC}</t> Server Info Menu", { _this select 3 call SC_fnc_sMenuOpen }, _settings,-1,false,true,"", ""];
};