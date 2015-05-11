/*
	Author: IT07

	Description:
	Opens and loads content for server menu

	Params: None
*/

if (!dialog and isNull(findDisplay 297)) then
{
	createDialog "SC_sMenu";

	disableSerialization; // Needed when handling controls
	_dsp = 297;

	[_dsp, 2100, _this select 1] call SC_fnc_ctrLbAdd; // Load menuCategories into comboBox

	_interval = _this select 5; // Put interval into var because needed
	if (_interval == 0) then
	{
		_interval = "None";
	};

	_input = format["%11MANAGED BY%13<br />%12%1%13<br />-------<br />%11IP:PORT%13<br />%12%2%13<br />-------<br />%11LOCATION%13<br />%12%3%13<br />-------<br />%11RESTART INTERVAL%13<br />%12%4 (hours)%13<br />-------<br />%11MISSION:%13<br />%12%5%13<br />-------<br />%11MODS%13<br />%12%6%13<br />-------<br />%11ALLOWED MODS%13<br />%12%7%13<br />-------<br />%11MAP%13<br />%12%8%13<br />-------<br />%11ANTIHACK%13<br />%12%9%13<br />-------<br />%11GAMETYPE%13<br />%12%10%13<br />-------", _this select 10, _this select 2, _this select 3, _interval, _this select 13, _this select 6, _this select 7, _this select 8, _this select 9, _this select 14, "<t size='0.85' color='#D13B3B'>", "<t size='0.75'>", "</t>"];
	[_dsp, 1101, _input, 1, [false,[]], true] call SC_fnc_handleCtrlText;

	_mode = time; // Use serverTime for live use
	_hours = _mode / 3600;
	_minutes = (_hours - floor _hours);
	_input = format["PLAYERS %1/%2 \nUPTIME %3h%4m", playersNumber west + playersNumber east + playersNumber independent + playersNumber civilian, _this select 4, floor(_hours), floor(_minutes * 60)];
	[_dsp, 1006, _input, 0] call SC_fnc_handleCtrlText;

	// Add host image if enabled
	if !(_this select 11 == "") then
	{
		[_dsp, 1201, _this select 11, 0] call SC_fnc_handleCtrlText;
		[_dsp, 1004, "SERVER HOSTED BY", 0, [true,[0.82,0.231,0.231,0.8]]] call SC_fnc_handleCtrlText;
	};

	// Add squad logo if enabled
	if !(_this select 12 == "") then
	{
		[_dsp, 1200, _this select 12, 0] call SC_fnc_handleCtrlText;
	};

	if (isNil "_f5EventHandler") then
	{
		_sMenuF5 = (findDisplay 297) displayAddEventHandler ["KeyDown", "if(_this select 1 == 0x3F) then { ['STATS'] call SC_fnc_f5Reload };false;"];
		uiNamespace setVariable ["SC_sMenuF5", _sMenuF5];
	};
};