/*
	custom spawn init.sqf
	by Halv
*/

//==== Set script path if needed =====\\
_scriptpath = "addons\halv_spawn\";
//if _deletedefaultteleporters is true, it deletes all default teleporter objects and replaces them with new ones forcing players to select spawn from the dialog
//if you want to use the default teleporters instead, set this to false ... however the default teleporters will always have the default teleport scroll action attached
_deletedefaultteleporters = true;
//new teleporter object
_newteleClass = "Land_InfoStand_V2_F";
//set object texture (full path), also accepts colour defs like "#(argb,8,8,3)color(0.123,1,0.3,0.3)", "" for nothing/default
_objecttexture = "addons\halv_spawn\HAND.jpg";
//sides to set object texture to
_objecttexturesides = [1];
/*
[
["Transport_C_EPOCH",[23600.5,18009,0.233421],"",[13326.5,14515.2,0.16426]],
["Transport_W_EPOCH",[23585.4,18000.7,0.233424],"",[6192.46,16834,0.00154114]],
["Transport_E_EPOCH",[23615.5,18000.9,0.233423],"",[18451.9,14278.1,0.00143814]]
]
*/
//==== Dont Touch anything below this point =====\\
if(isServer)then{
	_respawnwest = getmarkerpos "respawn_west";
	_HALV_deftele = getArray(configFile >> "CfgEpoch" >> worldname >> "telePos");
	_teleobjs = [];
	{_teleobjs pushBack (_x select 0);}forEach _HALV_deftele;
	diag_log format["[halv_spawn] waiting for default teleporters to be build in %1 @ (%2) %3",worldName,mapGridPosition _respawnwest,_respawnwest];
	waitUntil {sleep 1;(count(nearestObjects [_respawnwest, _teleobjs, 30]) == (count _teleobjs))};
	_objects = nearestObjects [_respawnwest, _teleobjs, 30];
	_teleobjs = [];
	{
		if(_deletedefaultteleporters)then{
			_pos = getPos _x;
			_pos = [_pos select 0,_pos select 1,1];
			_dir = getDir _x;
			deleteVehicle _x;
			_obj = createVehicle [_newteleClass,_pos,[], 0, "CAN_COLLIDE"];
			switch(typeOf _x)do{
				case "Transport_E_EPOCH":{_obj setDir (_dir + 90);};
				case "Transport_W_EPOCH":{_obj setDir (_dir - 90);};
				default{_obj setDir _dir;};
			};
			_obj setPosATL _pos;
			if(_objecttexture != "")then{{_obj setObjectTextureGlobal [_x,_objecttexture];}forEach _objecttexturesides;};
			_teleobjs pushBack [_obj,(_HALV_deftele select _forEachIndex)select 3];
		}else{
			_teleobjs pushBack [_x,(_HALV_deftele select _forEachIndex)select 3];
		};
	}forEach _objects;
	HALV_senddeftele = _teleobjs;
	publicVariable "HALV_senddeftele";
	diag_log format["[halv_spawn] default teleporters replaced with '%1' %2",_newteleClass,_teleobjs];
};

if(hasInterface)then{
	_center = getmarkerpos "center";
	diag_log format["[halv_spawn] waiting for new teleports to be build in %1 ...",worldName];
	waitUntil{!isNil "HALV_senddeftele"};//iconjoin_ca
	{(_x select 0) addAction ["<img size='1.5'image='\a3\Ui_f\data\IGUI\Cfg\Actions\ico_cpt_start_on_ca.paa'/> <t color='#0096ff'>Select</t><t > </t><t color='#00CC00'>Spawn</t>",(_scriptpath+"opendialog.sqf"), (_x select 0), -9, true, true, "", "_this distance _target < 5"];}forEach HALV_senddeftele;
	diag_log format["[halv_spawn] addAction added to %1",HALV_senddeftele];
	waitUntil{!isNil "Epoch_my_GroupUID"};
	{
		if((_x getVariable ["BUILD_OWNER", "-1"]) in [getPlayerUID player, Epoch_my_GroupUID])exitWith{
			_pos = getPos _x;
			player setVariable ["HALV_JammerPos",_pos];
			diag_log format["[halv_spawn] found a player jammer @ %1",_pos];
		};
	} forEach nearestObjects [_center, ["PlotPole_EPOCH"], 15000];
	execVM (_scriptpath+"spawndialog.sqf");
};
