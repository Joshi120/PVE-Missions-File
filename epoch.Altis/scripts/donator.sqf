//Made by Wuest3nFuchs 
// Dome Protection with Alarm
if ((getPlayerUID player) in ["76561198004388126","76561197988500689"]) then {
titleText ["Welcome to a Donatorbase", "PLAIN DOWN", 3]; titleFadeOut 4;
}
else{
// Everyone Else
titleText ["YOU HAVE 30 SEK TO LEAVE [ADMINS ONLY]", "PLAIN DOWN",3]; titleFadeOut 4;
sleep 10;
playSound "siren";
sleep 2;
    titleText ["You're going to enter on the Donator's base, go away!", "PLAIN DOWN", 3]; titleFadeOut 4;
sleep 5;
	titleText ["If you do not walk over in 20 seconds ,get infected and weapons gone!", "PLAIN DOWN", 3]; titleFadeOut 4;
sleep 20;
	
sleep 1;
	titleText ["Well Bye Then o/", "PLAIN DOWN", 3]; titleFadeOut 4;
sleep 1;
player setDamage 1;
sleep 1;
};