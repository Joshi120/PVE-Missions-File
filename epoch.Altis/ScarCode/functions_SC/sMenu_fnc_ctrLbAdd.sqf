/*
	Author: IT07

	Description:
	Put given array in ListBox or ComboBox

	Params:
	_this select 0: idd - target display
	_this select 1: idc - of listBox/comboBox
	_this select 2: array - this will be used to fill the lb or cb
*/

disableSerialization;
_control = (findDisplay (_this select 0)) displayCtrl (_this select 1);
lnbClear _control; // Clear the lb first to prevent list duplicates when called again
{
	_control lbAdd _x;
} forEach (_this select 2);
_control lbSetCurSel 0;