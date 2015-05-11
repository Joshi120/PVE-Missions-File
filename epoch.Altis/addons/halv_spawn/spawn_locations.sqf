/*
	spawn dialog location settings
	By Halv
*/

//allow spawn near players jammer? only one is registered, so no point in multiple jammers
_spawnNearJammer = true;

//not sure if this will work ...
_spawnNearGroup = true;

//adds the default spawns locations
//NOTE: Epoch group system is broken, so i allow spawn by all players in a group for now
//at a later point i will change that back to leader only
_adddefaultspawns = true;

Halv_spawns = switch(toLower worldName)do{
//altis spawns
	case "altis":{
		[	
/*
		[
			[20548.4,8888.25],
			2,
			"My custom spawn name for panagia"
		],	// 'Panagia' donor lvl 2 required to spawn here
		[
			[20548.4,8888.25]
		],	//minimal array for 'Panagia', name is found by the script and no donor / lvl requirements to spawn here
*/
			[[20548.4,8888.25]],	// 'Panagia'" //donor
			[[20788.2,6733.91]],	// 'Selakano'
			[[20241.1,11659.6]],	// 'Chalkeia' //reg
			[[16786.2,12619.4]],	// 'Pyrgos'
			[[18111.2,15242.3]],	// 'Charkia'
			[[21358.5,16361]],	// 'Kalochori'" //donor
			[[23211.4,19957.7]],	// 'Ioannina'
			[[25696.9,21348.6]],	// 'Sofia' //donor
			[[26990.8,23202.2]],	// 'Molos'
			[[16278.7,17267.4]],	// 'Telos' //reg
			[[14039.2,18730.9]],	// 'Athira'
			[[14602.8,20791.3]],	// 'Frini'
			[[9436.79,20304.4]],	// 'Abdera'
			[[4559.19,21406.7]],	// 'Oreokastro' //donor
			[[4040.33,17281.3]],	// 'Agios Konstantinos'
			[[9275.09,15899.8]],	// 'Agios Dionysios' //reg
			[[12477.4,14316.7]],	// 'Neochori'
			[[3529.11,13054.8]],	// 'Kavala'
			[[9045.54,11960.8]],	// 'Zaros'
			[[9259.52,8062.07]]	//'Sfaka' //reg

		]
	};
//stratis spawns
	case "stratis":{
		[
			[[1949.69,5522.03]],
			[[3024.14,5973.37]],
			[[3725.39,7114.48]],
			[[5008.42,5907.77]],
			[[6429.73,5395.64]],
			[[5356.9,3792.62]],
			[[4362.02,3831.27]],
			[[3292.59,2934.25]],
			[[2778.96,1746.92]],
			[[2625.43,608.782]],
			[[2424.63,1142.45]],
			[[2120.67,1920.52]],
			[[2005.55,2702.73]],
			[[1922.96,3569.01]],
			[[1983.26,4178.85]]
		]
	};
	case "chernarus":
	{
		[
//these are old a2 positions taken directly from ebays essv2 (thanks ebay) 
//... Richie says they will work, so ill leave them here for now ...
			//Chernarus
			[[4932,1989]],		//"Balota",
			[[12048,8352]],		//"Berezino",
			[[6901,2509]],		//"Chernogorsk",
			[[10294,2191]],		//"Elektrozavodsk",
			[[2236,1923]],		//"Kamenka",
			[[12071,3591]],		//"Kamyshovo",
			[[3608,2152]],		//"Komarovo",
			[[7952,3205]],		//"Prigorodky",
			[[9153,3901]],		//"Pusta",
			[[13510,5249]],		//"Solnichny",
			// Above are defaults
			[[7068,11221],1],	//"Devil's Castle",
			[[9711,8962],1],	//"Gorka",
			[[5939,10195],2],	//"Grishino",
			[[8421,6643],2],	//"Guglovo",
			[[8812,11642],2],	//"Gvozdno",
			[[5301,8548],2],	//"Kabanino",
			[[11053,12361],2],	//"Krasnostav",
			[[13407,4175],2],	//"Krutoy",
			[[2718,10094],1],	//"Lopatino",
			[[4984,12492],2],	//"Petrovka",
			[[4582,6457],2],	//"Pogorevka",
			[[3626,8976],2],	//"Vybor",
			[[6587,6026],2],	//"Vyshnoye",
			[[2692,5284],1],	//"Zelenogorsk",
			// still viable?
			[[1607,7804,0],2,"Bandit Base"],	//"Bandit Base",
			[[12944,12767,0],2,"Hero Hideout"]//"Hero Hideout",
		]
	};
/* //create new world spawns, use lower case letters only or it will not be detected (only [x,y] needed)
	case "myworldname":{
		[
			[[0,0],2],//locked for everyone but lvl 2
			[[0,0]]
		]
	};
*/
	default{[]};
};
