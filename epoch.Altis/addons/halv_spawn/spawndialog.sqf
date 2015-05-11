if(isServer)exitWith{};
_rspawnw = getMarkerPos "respawn_west";
HALV_Center = getMarkerPos "center";
// Makes the script start when player is ingame
waitUntil {!isNull (findDisplay 46)};
waitUntil {!dialog};

//exit if player is not near a spawn
if(player distance _rspawnw > 25)exitWith{Halv_moveMap = nil;Halv_fill_spawn = nil;Halv_near_cityname = nil;Halv_spawn_player = nil;Halv_spawns = nil;HALV_Center = nil;HALV_senddeftele = nil;diag_log "Spawn Menu Aborted...";};

_diagTiackTime = diag_tickTime;
diag_log format["Loading Spawn Menu ... %1",_diagTiackTime];

#include "spawn_locations.sqf";

Halv_near_cityname = {
	_nearestCity = nearestLocations [_this, ["NameCityCapital","NameCity","NameVillage","NameLocal"],1000];
	_textCity = "Wilderness";
	if (count _nearestCity > 0) then {
		{if !(toLower(text _x) in ["military"])exitWith{_textCity = text _x};}count _nearestCity;
	};
	_textCity
};

if(_spawnNearJammer)then{
	_jamvar = player getVariable ["HALV_JammerPos",[]];
	if !(_jamvar isEqualTo []) then{
		_name = _jamvar call Halv_near_cityname;
		Halv_spawns pushBack [_jamvar,6,format["%1 (Near Jammer)",_name]];
	};
};

if(_spawnNearGroup)then{
	_leader = leader(group player);
	if (count units(group player) > 1 && _leader != player) then{
		_grouppos = getPos _leader;
		_name = _grouppos call Halv_near_cityname;
		Halv_spawns pushBack [_grouppos,6,format["%1 (Near Group)",_name]];
	};
};

if(_adddefaultspawns)then{
	{
		_pos = _x select 1;
		Halv_spawns pushBack [_pos];
	}forEach HALV_senddeftele;
};

Halv_moveMap = {
	disableSerialization;
	private ["_ctrl","_leader","_plot","_grid","_spawn","_text","_zoom"];
	_index = _this;
	_lb = (findDisplay 7777) displayCtrl 7776;
	_lb lbSetPictureColor [_index, [1, 1, 1, 1]];
	_value = _lb lbValue _index;
	_zoom = 1;
	_spawn = HALV_Center;
	if !(_value in [9999,9998]) then {
		_spawn = (Halv_spawns select _value)select 0;
		_zoom = .15;
	};
	_ctrl = (findDisplay 7777) displayCtrl 7775;
	ctrlMapAnimClear _ctrl;
	_ctrl ctrlMapAnimAdd [1,_zoom,_spawn];
	ctrlMapAnimCommit _ctrl;
};

Halv_spawn_player = {
	disableSerialization;
	private ["_spawn","_cityname","_val"];
	#include "spawn_settings.sqf";
	_index = _this;
	_lb = (findDisplay 7777) displayCtrl 7776;
	_value = _lb lbValue _index;
	if(_value == 9999)exitWith{};
	if(_value == 9998)then{
		_spawn = (Halv_spawns call BIS_fnc_selectRandom) select 0;
		_val= 0 ;
		_cityname = _spawn call Halv_near_cityname;
	}else{
		_spawn = (Halv_spawns select _value)select 0;
		_val = if(count (Halv_spawns select _value) > 1)then{(Halv_spawns select _value)select 1}else{0};
		_cityname = if(count (Halv_spawns select _value) > 2)then{(Halv_spawns select _value)select 2}else{_spawn call Halv_near_cityname};
	};
	_pUID = getPlayerUID player;
	if(_val == 5)exitWith{systemChat "Cant spawn here, you have a body nearby the position ..."};
	if(_val == 1 && !(_pUID in _level1UIDs))exitWith{systemChat "You need to be a registered user to spawn here ..."};
	if(_val == 2 && !(_pUID in _level2UIDs))exitWith{systemChat "You need to be a donor to spawn here ..."};
	closeDialog 0;
	if(count (_Weapons2add select 0) > 0)then{
		_weap = (_Weapons2add select 0) call BIS_fnc_selectRandom;
		_ammo = [] + getArray (configFile >> "cfgWeapons" >> _weap >> "magazines");
		if (count _ammo > 0) then {
			_ammoamount = round(random((_Weapons2add select 2)-(_Weapons2add select 1)))+(_Weapons2add select 1);
			for "_i" from 1 to _ammoamount do {
				_rnd = _ammo call BIS_fnc_selectRandom;
				player addMagazine _rnd;
			};
		};
		player addWeapon _weap;
		player selectWeapon _weap;
		reload player;
	};
	_items = (_toolWeapons select 0);
	if(count _items > 0)then{
		_amount = round(random((_toolWeapons select 2)-(_toolWeapons select 1)))+(_toolWeapons select 1);
		for "_i" from 1 to _amount do {
			_rnd = _items call BIS_fnc_selectRandom;
			_items = _items - [_rnd];
			player addWeapon _rnd;
		};
	};
	_items = (_ItemClass2add select 0);
	if(count _items > 0)then{
		_amount = round(random((_ItemClass2add select 2)-(_ItemClass2add select 1)))+(_ItemClass2add select 1);
		for "_i" from 1 to _amount do {
			_rnd = _items call BIS_fnc_selectRandom;
			_items = _items - [_rnd];
			player addItem _rnd;
		};
	};
	_items = (_MagazineClass2add select 0);
	if(count _items > 0)then{
		_amount = round(random((_MagazineClass2add select 2)-(_MagazineClass2add select 1)))+(_MagazineClass2add select 1);
		for "_i" from 1 to _amount do {
			_rnd = _items call BIS_fnc_selectRandom;
			_items = _items - [_rnd];
			player addMagazine _rnd;
		};
	};
	_spawn set [2,0];
	_position = [_spawn,0,_area,10,0,2000,0] call BIS_fnc_findSafePos;
	if(_halo)then{
		_position set [2,_jumpheight];
		[player,_jumpheight] spawn BIS_fnc_halo;
		player setPosATL _position;
		titleText [format["HALO Spawned near %1\nGood Luck %2",_cityname,name player],"PLAIN DOWN"];
		[]spawn{
			sleep 4;
			titleText ["Scroll and press mouse wheel to open chute ...","PLAIN DOWN"];
			systemChat "Scroll and press mouse wheel to open chute ...";
			waitUntil{sleep 1;(getPosATL player) select 2 < 3};
			player allowdammage false;
			waitUntil{sleep 1;(getPosATL player) select 2 < 1 && (speed player) > -1 && (speed player) < 1};
			player allowdammage true;
		};
	}else{
		player setPos _position;
		titleText[format["Spawned near %1\nGood Luck %2",_cityname,name player],"PLAIN DOWN"];
	};
	if(_script != "")then{execVM _script;};
	Halv_moveMap = nil;Halv_fill_spawn = nil;Halv_near_cityname = nil;Halv_spawn_player = nil;Halv_spawns = nil;HALV_Center = nil;HALV_senddeftele = nil;
};

Halv_fill_spawn = {
	disableSerialization;
	#include "spawn_settings.sqf";
	_lb = (findDisplay 7777) displayCtrl 7776;
	lbClear _lb;
	_pUID = getPlayerUID player;
	_nr = 0;
	_bodies = [];
	{if ((!isNull _x) && {(_x getVariable["bodyUID","0"]) == _pUID}) then {_bodies pushBack (getPosATL _x);};}forEach allDead;
	{
		_pos = _x select 0;
		_lvl = if(count _x > 1)then{_x select 1}else{0};
		_name = if(count _x > 2)then{_x select 2}else{_pos call Halv_near_cityname};
		_fi = _forEachIndex;
		_index = _lb lbAdd _name;
		_lb lbSetValue [_index,_nr];
		_lb lbSetTooltip [_index, "Double Click To Spawn"];
		{
			if(_x distance _pos < _bodyCheckDist)exitWith{
				_lvl = 5;
				_let = count (Halv_spawns select _fi);
				if(_let > 2)then{
					Halv_spawns set [_fi,[_pos,_lvl,_name]];
				}else{
					Halv_spawns set [_fi,[_pos,_lvl]];
				};
			};
		}forEach _bodies;
		switch (_lvl) do{
			case 1:{
				if(_pUID in _level1UIDs)then{
					_lb lbSetColor [_index,[0,1,0,.8]];
					_lb lbSetTooltip [_index, "Double Click For Registered Spawn"];
				}else{
					_lb lbSetColor [_index,[1,0,0,.8]];
					_lb lbSetPicture [_index,"\A3\ui_f\data\gui\Rsc\RscDisplayMultiplayer\sessions_locked_ca.paa"];
					_lb lbSetPictureColor [_index, [1, 1, 1, 1]];
					_lb lbSetTooltip [_index, "Registered / Donors only spawn"];
				};
			};
			case 2:{
				if(_pUID in _level2UIDs)then{
					_lb lbSetColor [_index,[0,1,0,.8]];
					_lb lbSetTooltip [_index, "Double Click For Donor Spawn"];
				}else{
					_lb lbSetColor [_index,[1,0,0,.8]];
					_lb lbSetPicture [_index,"\A3\ui_f\data\gui\Rsc\RscDisplayMultiplayer\sessions_locked_ca.paa"];
					_lb lbSetPictureColor [_index, [1, 1, 1, 1]];
					_lb lbSetTooltip [_index, "Donors only spawn"];
				};
			};
/*make a 3rd lvl perhaps?*/
			case 5:{
				_lb lbSetColor [_index,[1,0,0,.8]];
				_lb lbSetPicture [_index,"\A3\ui_f\data\gui\Rsc\RscDisplayMultiplayer\sessions_locked_ca.paa"];
				_lb lbSetPictureColor [_index, [1, 1, 1, 1]];
				_lb lbSetTooltip [_index, "Locked, Body Nearby ..."];
			};
			case 6:{
				_lb lbSetColor [_index,[0,0.5,1,.7]];//Blue
				_lb lbSetTooltip [_index, "Double Click, to Spawn Near Jammer"];
			};
			case 7:{
				_lb lbSetColor [_index,[0,0.5,1,.7]];//Blue
				_lb lbSetTooltip [_index, "Double Click, to Spawn Near Group Leader."];
			};
		};
		_nr = _nr + 1;
	}forEach Halv_spawns;
	lbSort _lb;

	_index = _lb lbAdd "";
	_lb lbSetValue [_index,9999];
	_index = _lb lbAdd "Random";
	_lb lbSetColor [_index,[0,0.5,1,.7]];//Blue
	_lb lbSetValue [_index,9998];
	_lb lbSetTooltip [_index, "Double Click For Random Spawn"];

	_ctrl = (findDisplay 7777) displayCtrl 7775;
	_ctrl ctrlMapAnimAdd [1,5,HALV_Center];
	ctrlMapAnimCommit _ctrl;
};

diag_log format["Spawn Menu Loaded ... %1 - %2",diag_tickTime,diag_tickTime - _diagTiackTime];
