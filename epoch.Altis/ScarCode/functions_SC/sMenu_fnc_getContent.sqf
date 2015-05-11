/*
	Author: IT07

	Description:
	This fnc is spawned by OnLBselChanged. It takes index given and gets content from config

	Params:
	_this select 0: idd - target display
	_this select 1: idc - target control
	_this select 2 select 0: idc of control that spawned this function
	_this select 2 select 1: number - index of
*/

disableSerialization;
_index = format["%1", (_this select 2 select 1) + 1]; // +1 to make the config easier to understand
_title = getText (missionConfigFile >> "SC_sMenuConfig" >> "configContent" >> _index >> "title");
_titleControl = (findDisplay (_this select 0)) displayCtrl 1008; // Define the control of the contentTitleBar
_titleControl ctrlSetText _title;

_contentControl = (findDisplay (_this select 0)) displayCtrl (_this select 1);
_contentElements = getArray (missionConfigFile >> "SC_sMenuConfig" >> "configContent" >> _index >> "contentArray");
_sMenuContent = ""; // Security and prevent loading different content
{
	_content = getText (missionConfigFile >> "SC_sMenuConfig" >> "configContent" >> _index >> _x);
	_sMenuContent = _sMenuContent + _content;
	_contentControl ctrlSetStructuredText parseText _sMenuContent;
	_ctrlPosition = ctrlPosition _contentControl;
	_contentControl ctrlSetPosition [_ctrlPosition select 0, _ctrlPosition select 1, _ctrlPosition select 2, ctrlTextHeight _contentControl];
	_contentControl ctrlCommit 0;
} forEach _contentElements;