//Made by Wuest3nFuchs
waitUntil {!isNull player};
playSound "siren";
sleep 1;
    titleText ["Radioactive Zone ! Achtung Strahlung!", "PLAIN DOWN", 3]; titleFadeOut 4;
sleep 5;
playSound "siren";
sleep 5;
    titleText ["Cherno[byl] Zone", "PLAIN DOWN", 3]; titleFadeOut 4;
sleep 5;
playSound "siren";
    titleText ["and now you die :D", "PLAIN DOWN", 3];
sleep 10;
player setDamage 1;


