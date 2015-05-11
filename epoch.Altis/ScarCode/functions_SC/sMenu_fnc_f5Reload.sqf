/*
	Author: IT07
	Description: Reloads content of given control if defined in function

	Params:
	_this select 0: STRING - Has to match a case in switch
	_this select 1: STRING - Text to display on output field
*/

switch(_this select 0) do
{
	case "STATS":
	{
		_maxPlayers = [["maxPlayers"],[]] call SC_fnc_getCfgSetting;
		_mode = time; // Use serverTime for live use
		_hours = _mode / 3600;
		_minutes = (_hours - floor _hours);
		_input = format["PLAYERS %1/%2 \nUPTIME %3h%4m", playersNumber west + playersNumber east + playersNumber independent + playersNumber civilian, _maxPlayers select 0, floor(_hours), floor(_minutes * 60)];
		[297, 1006, _input, 0, [false,[]]] call SC_fnc_handleCtrlText;
		[297, 1007, _this select 1, 0, [false,[]]] call SC_fnc_handleCtrlText;
	};

	default { }; // Do nothing if no correct STRING is given
};