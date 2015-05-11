/*
	Author: IT07

	Description:
	Configuration and resource file for server menu. Should be used to adjust the content of menu.
*/

class SC_sMenuConfig
{
	class menuConfig
	{
		/////////////////////////////////////////////////////////
		///////  General config for the menu  ///////////////////
		///////  Please adjust these below to your needs  ///////
		/////////////////////////////////////////////////////////
		keyToOpenMenu = 0x43; // Change to false to disable. Works with useScrollAction. DEFAULT: 0x43 = F9 key. https://community.bistudio.com/wiki/DIK_KeyCodes
		useScrollAction = 1; // Change to false to disable. Can use any number to enable. Can be used in combo with keyToOpenMenu
		menuCategories[] = {"General info","Rules","Donating","Scripts and Credits"}; // Try to keep amount as low as possible for optimal speed/load
		serverIPandPort = "84.200.206.252:2352"; // Speaks for itself
		serverLocation = "Germany Köln"; // Location of your server. Keep as short as possible
		maxPlayers = 100; // This should be exactly the same as the maximum slot count of your server
		restartInterval = 4; // Number of hours your server will be online before it automatically restarts. Set to 0 if you use a restart schedule.
		serverMods = "Epoch Mod"; // Put whatever mods you want to show here
		serverAllowedMods = "<a href='http://www.armaholic.com/page.php?id=26266'>@mao WeaponSway fix</a>"; // This example shows how to make a clickable text
		serverMission = "Epoch Altis"; // Name of the mission
		serverMap = "Altis"; // Name of map used on the server
		serverGameType = "PvE"; // The type of the mission
		serverAH = "Epoch Default, <a href='http://infistar.de'>infiSTAR</a>"; // Put the name of your antihack(s) here
		serverManagedBy = "<a href='clanWebsiteUrlHere'>Lykai</a>"; // Should be clear enough, right?
		serverHostLogo = ""; // use "" if you do not want to have this
		serverSquadLogo = ""; // use "" if you do not want to have this
		/////////////////////////////////////////////////////////
		///////  End of general config  /////////////////////////
		/////////////////////////////////////////////////////////
	}
	class configContent
	{
		//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		///////  Config for the content of each menu category  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		///////  == Instructions for editing the content ==  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		///////  step 1: Adjust the amount of class items (below) to the amount of categories you have set in _menuCategories  ///////////////////////////////////////////////////////////
		///////  step 2: Configure contentArray. Please look at the examples to see how to do it. contentArray is used to divide the text into pieces for easier configuration  //////////
		///////  step 2b: it does not matter how you name the items in contentArray. They just have to match the actual item names that are defined in contentArray[]  ///////////////////
		///////  step 3: go nuts! :)  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		///////  NOTE 1: Do not put the title in contentArray because the title is already put into the title bar automatically  /////////////////////////////////////////////////////////
		///////  NOTE 2: Less items in contentArray[] is faster  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		///////  NOTE 3: <br /> is a linebreak, <img image'path\to\Image.jpg' /> is an image and <a href='url'>this is a link</a>  ///////////////////////////////////////////////////////
		//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
		class 1 // First in _menuCategories
 		{
			title = "GENERAL INFO";
			contentArray[] = {"txtOne","txtTwo","txtThree","txtFour","txtFive"};
			txtOne = "<t size='1.5'>PWS Epoch PVE Server</t> <br /><br /> Switched The server to Arma3Sync<br /> Recreated Missions File<br /> Added a Custom Modpack<br />  For install instructions Visit Darkcraft.ch<br /> Added Headless Client missions<br /> and a lot more i can´t remember...<br />";
			txtTwo = "<t size='1.5'> </t><br />";			
			txtThree = "<t size='1.5'>Banana</t> <br /><br /> <br />";						
			txtFour = "<t size='1.5'>SERVER FEATURES</t> <br /> - AI Missions <br /> - Tow/Lift <br /> - Custom vehicles <br /><br />";
			txtFive = "<t size='1.5'>WEBSITE</t> <br /><a color='#D13B3B' href='http://pwnedwithstyle.enjin.com/'>http://pwnedwithstyle.enjin.com/</a> <br /><br />";
			txtSix = "<t size='1.5'>VOICE SERVER</t> <br />None atm<a href='url' color='#D13B3B'></a> <br /><br />";
			txtSeven = "<t size='1.5'>SERVER ADMINS</t> <br /> - Lykai [Owner] <br />";
		};
		class 2 // Second in _menuCategories
		{
			title = "THE RULES";
			contentArray[] = {"txtOne","txtTwo","txtThree","txtFour","txtFive","txtSix","txtSeven"};
			txtOne = "<t size='1.5'>RULE #1</t> <br /> - No racism/profanity/flaming <br />  <t size='0.75' color='#c2c2c2'>Breaking of this rule will result in a (temporary/permanent) ban.</t> <br /><br />";
			txtTwo = "<t size='1.5'>RULE #2</t> <br /> - No Stealing!!!! <br /> <t size='0.75' color='#c2c2c2'>Breaking of this rule will result in a kick or (permanent) ban.</t> <br /><br />";
			txtThree = "<t size='1.5'>RULE #3</t> <br /> - No use/placement of explosives <br /> <t size='0.75' color='#c2c2c2'>Breaking of this rule will result in a (temporary/permanent) ban.</t> <br /><br />";
			txtFour = "<t size='1.5'>RULE #4</t> <br /> - No disrespect towards other player(s) and or Admins <br /> <t size='0.75' color='#c2c2c2'>Breaking of this rule will result in a kick / (temporary/permanent) ban.</t> <br /><br />";
			txtFive = "<t size='1.5'>RULE #5</t> <br /> - No cheating/glitching or bug abuse/exploiting <br /> <t size='0.75' color='#c2c2c2'>Breaking of this rule will result in a (temporary/permanent) ban.</t> <br /><br />";
			txtSix = "<t size='1.5'>RULE #6</t> <br /> - NO PVP!!!!! <br /> <t size='0.75' color='#c2c2c2'>Breaking of this rule will result in a (permanent) ban.</t> <br /><br />";
			txtSeven = "<t size='1.5'>RULE #7</t> <br /> - No excuses such as: I did not read the rules. <br /> <t size='0.75' color='#c2c2c2'>This will be considered very stupid.</t> <br /><br />";
		};
		class 3 // Third in _menuCategories
		{
			title = "SUPPORT SERVER";
			contentArray[] = {"txtOne","txtTwo"};
			txtOne = "<t size='1.5'>PLEASE DONATE</t> <br />If you play on and enjoy this server, please consider a donation to keep the high server costs down. <br /><br />";
			txtTwo = "This server costs $90 p/month so we could really use any kind of donation. <a href='url' color='#D13B3B'>To donate Send money to Extern.20@gmail.com</a> <br /><br />";
		};
		class 4 // Fourth in _menuCategories
		{
			title = "SCRIPTS & CREDITS";
			contentArray[] = {"txtOne"};
			txtOne = " - {ScarCode} Server info menu by IT07 <a color='#D13B3B' href='http://scarcode.com'>http://scarcode.com</a> <br /> - R3F <br /> - VEMF Missions <br />";
		}
	};
};

////////////////////////////////////////////////////////
/////// Do not change anything below this line  ////////
////////////////////////////////////////////////////////
#define GUI_GRID_X	(0)
#define GUI_GRID_Y	(0)
#define GUI_GRID_W	(0.025)
#define GUI_GRID_H	(0.04)
#define GUI_GRID_WAbs	(1)
#define GUI_GRID_HAbs	(1)
#define THEMECOLOR { 0.82, 0.231, 0.231, 0.8 }

class SC_sMenu
{
	idd = 297;
	//onLoad = "";
	movingEnable = 1;
	class controls
	{
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by IT07, v1.063, #Sahycu)
////////////////////////////////////////////////////////

class sMenuTitle: RscText
{
	colorBackground[] = THEMECOLOR;

	idc = 1000;
	text = "SERVER INFO MENU by IT07"; //--- ToDo: Localize;
	x = 0 * GUI_GRID_W + GUI_GRID_X;
	y = 0 * GUI_GRID_H + GUI_GRID_Y;
	w = 19 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	colorText[] = {1,1,1,1};
};
class sMenuContentSelector: RscCombo
{
	onLBSelChanged = "[297, 1100, _this] call SC_fnc_getContent";

	idc = 2100;
	x = 0 * GUI_GRID_W + GUI_GRID_X;
	y = 1 * GUI_GRID_H + GUI_GRID_Y;
	w = 14.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	colorBackground[] = {0,0,0,0.8};
};
class sMenuContentTitle: RscText
{
	colorBackground[] = THEMECOLOR;

	idc = 1008;
	x = 0 * GUI_GRID_W + GUI_GRID_X;
	y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 35 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	colorText[] = {1,1,1,1};
};
class sMenuTitleHostedBy: RscText
{
	idc = 1004;
	x = 35.5 * GUI_GRID_W + GUI_GRID_X;
	y = 0 * GUI_GRID_H + GUI_GRID_Y;
	w = 10 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	colorText[] = {1,1,1,1};
	colorBackground[] = {0,0,0,0};
};
class sMenuLogoHostedBy: RscPicture
{
	style = 2096;

	idc = 1201;
	x = 35.5 * GUI_GRID_W + GUI_GRID_X;
	y = 1 * GUI_GRID_H + GUI_GRID_Y;
	w = 10 * GUI_GRID_W;
	h = 2.6 * GUI_GRID_H;
	colorBackground[] = {0,0,0,0.8};
};
class sMenuSquadLogo: RscPicture
{
	style = 2096;

	idc = 1200;
	x = -4 * GUI_GRID_W + GUI_GRID_X;
	y = 0.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 3 * GUI_GRID_W;
	h = 2.5 * GUI_GRID_H;
};
class sMenuTitleServerInfo: RscText
{
	colorBackground[] = THEMECOLOR;

	idc = 1003;
	text = "SERVER INFO"; //--- ToDo: Localize;
	x = 35.5 * GUI_GRID_W + GUI_GRID_X;
	y = 8 * GUI_GRID_H + GUI_GRID_Y;
	w = 10 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	colorText[] = {1,1,1,1};
};
class sMenuTitleServerStats: RscText
{
	colorBackground[] = THEMECOLOR;

	idc = 1005;
	text = "SERVER STATS"; //--- ToDo: Localize;
	x = 35.5 * GUI_GRID_W + GUI_GRID_X;
	y = 4 * GUI_GRID_H + GUI_GRID_Y;
	w = 10 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	colorText[] = {1,1,1,1};
};
class sMenuTxtServerStats: RscText
{
	shadow = 0;
	style = 528;
	sizeEx = 0.03;

	idc = 1006;
	x = 35.5 * GUI_GRID_W + GUI_GRID_X;
	y = 5 * GUI_GRID_H + GUI_GRID_Y;
	w = 10 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	colorText[] = {1,1,1,0.8};
	colorBackground[] = {0,0,0,0.8};
};
class sMenuRefreshStats: RscButton
{
	action = ["STATS","Stats refreshed! (Manual)"] call SC_fnc_f5Reload;

	idc = 1603;
	text = "REFRESH (F5)"; //--- ToDo: Localize;
	x = 35.5 * GUI_GRID_W + GUI_GRID_X;
	y = 6.6 * GUI_GRID_H + GUI_GRID_Y;
	w = 6.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	colorBackground[] = {0,0,0,0.8};
	tooltip = "Click to refresh server stats or press F5"; //--- ToDo: Localize;
};
class sMenuContentBg: IGUIBack
{
	idc = 2200;
	x = 0 * GUI_GRID_W + GUI_GRID_X;
	y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 35 * GUI_GRID_W;
	h = 19.8 * GUI_GRID_H;
	colorBackground[] = {0,0,0,0.8};
};
class contentGroup: RscControlsGroup
{
	idc = 2300;
	x = 0 * GUI_GRID_W + GUI_GRID_X;
	y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 35 * GUI_GRID_W;
	h = 19.6 * GUI_GRID_H;
	class controls
	{
		class sMenuContentTxt: RscStructuredText
		{
			idc = 1100;
			x = 0.5 * GUI_GRID_W;
			y = 0.5 * GUI_GRID_H;
			w = 27 * GUI_GRID_W;
			h = 0.5 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0};
		};
	};
};
class sMenuGroupServerInfo: RscControlsGroup
{
	idc = 2301;
	x = 35.5 * GUI_GRID_W + GUI_GRID_X;
	y = 9 * GUI_GRID_H + GUI_GRID_Y;
	w = 11 * GUI_GRID_W;
	h = 16 * GUI_GRID_H;
	class controls
	{
		class sMenuStrTxtServerInfo: RscStructuredText
		{
			idc = 1101;
			x = 0 * GUI_GRID_W;
			y = 0 * GUI_GRID_H;
			w = 10 * GUI_GRID_W;
			h = 16 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.8};
		};
	};
};
class sMenuBgCopy: IGUIBack
{
	idc = 2201;
	x = 4 * GUI_GRID_W + GUI_GRID_X;
	y = 23.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 31 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	colorBackground[] = {0,0,0,0.5};
};
class sMenuCopyUID: RscButton
{
	action = [297, 1400, format["Name: %1 and UID: %2", name player, getPlayerUID player], 0] call SC_fnc_handleCtrlText;

	idc = 1601;
	text = "COPY PLAYER NAME & UID"; //--- ToDo: Localize;
	x = 11.5 * GUI_GRID_W + GUI_GRID_X;
	y = 23.8 * GUI_GRID_H + GUI_GRID_Y;
	w = 12 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	colorBackground[] = {0,0,0,0.8};
};
class sMenuClose: RscButton
{
	action = closeDialog 0;

	idc = 1600;
	text = "CLOSE"; //--- ToDo: Localize;
	x = 0 * GUI_GRID_W + GUI_GRID_X;
	y = 23.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 3.5 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	colorBackground[] = {0,0,0,0.8};
};
class sMenuButtonCopyIPandPort: RscButton
{
	action = [["serverIPandPort"],[1400,"IP:PORT = "]] call SC_fnc_getCfgSetting;

	idc = 1602;
	text = "COPY IP:PORT"; //--- ToDo: Localize;
	x = 4.5 * GUI_GRID_W + GUI_GRID_X;
	y = 23.8 * GUI_GRID_H + GUI_GRID_Y;
	w = 6.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	colorBackground[] = {0,0,0,0.8};
};
class sMenuOutputBg: IGUIBack
{
	idc = 2202;
	x = 24 * GUI_GRID_W + GUI_GRID_X;
	y = 23.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 11 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	colorBackground[] = {0,0,0,0.8};
};
class sMenuOutputBar: RscEdit
{
	idc = 1400;
	x = 24.5 * GUI_GRID_W + GUI_GRID_X;
	y = 23.8 * GUI_GRID_H + GUI_GRID_Y;
	w = 10 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	colorText[] = {1,1,1,0.8};
	tooltip = "Ctrl+C to copy, Ctrl+V to paste"; //--- ToDo: Localize;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////

	};
};