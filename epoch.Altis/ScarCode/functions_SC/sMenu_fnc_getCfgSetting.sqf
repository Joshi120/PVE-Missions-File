/*
	Author: IT07

	Description:
	Gets config value from given name if exists and automatically detects what type given entry is.

	Params:
	_this select 0: ARRAY - list of config names to get value for
	_this select 1: ARRAY - additional arguments for output to ctrlText
	_this select 1 select 0: IDC - idc of control that should get var output
	_this select 1 select 1: STRING - text to send with _result
*/

private["_cfg","_value","_result"];
_result = [];
{
	_cfg = (missionConfigFile >> "SC_sMenuConfig" >> "menuConfig" >> _x);
	switch(true) do
	{
		case (isNumber _cfg): {_value = getNumber _cfg};
		case (isText _cfg): {_value = getText _cfg};
		case (isArray _cfg): {_value = getArray _cfg};
		default {_value = nil};
	};
	_result = _result + [_value];
} forEach (_this select 0);

if(isNil "_result") exitWith { };

if(count _this > 1) then
{
	if(typeName (_this select 1 select 0) == "SCALAR") then
	{
		[297, _this select 1 select 0, (_this select 1 select 1) + (_result select 0), 0] call SC_fnc_handleCtrlText;
	};
};
_result