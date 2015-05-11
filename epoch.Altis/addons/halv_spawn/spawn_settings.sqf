/*
	spawn dialog misc settings
	By Halv
*/

//UID's for lvl 1 spawn's
_level1UIDs = ["0","0","0"];
//UID's for lvl 2 spawn's
_level2UIDs = ["0","0","0"];
//this is to allow any lvl 2 to spawn on lvl 1, comment out to seperate the two
_level1UIDs = _level1UIDs + _level2UIDs;

//Spawn area radius
_area = 1250;

//halo jump true/false
_halo = false;		//<<==== NOTE THAT DEFAULT ANTIHACK WILL SOMETIMES TELEPORT A PLAYER BACK UP IN THE AIR WITH NO CHUTE!!! ====
_jumpheight = 1250;

//this is the distance (in meters) it will check for the players dead bodys, set to -1 to disable
_bodyCheckDist = 1;

//execVM script (like credits) on spawn? "pathto\script\filename.sqf" or "" to disable
_script = "";

_Weapons2add = [
//a random weapon is picked from this array
["ruger_pistol_epoch","1911_pistol_epoch","hgun_P07_F","hgun_Pistol_heavy_01_F","hgun_Pistol_heavy_02_F","hgun_Rook40_F"],
//how many magazines min
2,
//how many magazines max
4
];

_toolWeapons = [
//random tools are picked from this array
["EpochRadio0","ItemCompass","ItemWatch","Binocular","ItemGPS"],
//how many tools min
1,
//how many tools max
3
];

_ItemClass2add = [
//random items are picked from this array
["ItemSodaRbull","meatballs_epoch","FirstAidKit","WhiskeyNoodle","ItemSodaOrangeSherbet","sweetcorn_epoch","scam_epoch","HeatPack","ColdPack","Heal_EPOCH","FAK"],
//how many items min
1,
//how many items max
3
];

_MagazineClass2add = [
//random magazines are picked from this array
["Chemlight_green","Chemlight_red","Chemlight_yellow","Chemlight_blue","EnergyPack","SmokeShellOrange","SmokeShellBlue","SmokeShellPurple","SmokeShellYellow","SmokeShellGreen","SmokeShellRed","SmokeShell"],
//how many magazines min
1,
//how many magazines max
3
];
