/*
	Author: IT07

	Description:
	Handle given text and put into given control

	Params:
	SYNTAX: [targetDisplay, targetControl, text, mode, [boolean,[backgroundColor]]] spawn/call SC_fnc_handleCtrlText;
	_this select 0: idd - targetDisplay
	_this select 1: idc - targetControl
	_this select 2: var - contains the content
	_this select 3: number - 0 = ctrlSetText and 1 = ctrlSetStructuredText
	_this select 4 select 0: boolean (OPTIONAL) - use true to give targetControl a background
	_this select 4 select 1: [r,g,b,a] (OPTIONAL) - will be ctrlSetBackgroundColor
	_this select 5: boolean (OPTIONAL) - true if the size needs to be adjusted to ctrlTextHeight
*/

disableSerialization; // Needed for controls/displays
_control = (findDisplay (_this select 0)) displayCtrl (_this select 1); // Define the targetControl with findDisplay targetDisplay
switch (_this select 3) do // Switch the given number for selecting setText or SetStrText
{
	case 0: // ctrlSetText
	{
		_control ctrlSetText (_this select 2); // Set text to _control with given text
	};
	case 1: // ctrlSetStructuredText
	{
		_control ctrlSetStructuredText parseText (_this select 2); // Set text to _control with given text
	};
};

if(count _this > 4) then
{
	if (_this select 4 select 0) then
	{
		_control ctrlSetBackgroundColor (_this select 4 select 1); // Set the background to targetControl if requested
	};
};

if (count _this > 5) then
{
	if(_this select 5) then
	{
		_ctrlPosition = ctrlPosition _control;
		_h = ctrlTextHeight _control;
		_control ctrlSetPosition [_ctrlPosition select 0, _ctrlPosition select 1, _ctrlPosition select 2, _h];
		_control ctrlCommit 0;
	};
};