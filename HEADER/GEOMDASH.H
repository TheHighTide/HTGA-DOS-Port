#include <iostream.h>
#include <stdio.h>
#include <conio.h>

int GetLevelDetails(int levelId){
	const char* levelName[] = {"Stereo Madness", "Back on Track", "Polargeist", "Dry Out", "Base After Base"};
	const char* levelCreator[] = {"RobTop Games", "RobTop Games", "RobTop Games", "RobTop Games", "RobTop Games"};
	const double levelLength[] = {1.26, 1.22, 1.25, 1.24, 1.35};

	if(levelId >= 0 && levelId - 1 < sizeof(levelName) / sizeof(levelName[0])){
		printf("Level Name: %s\n", levelName[levelId - 1]);
		printf("Level Creator: %s\n", levelCreator[levelId - 1]);
		printf("Level Length: %.2f\n", levelLength[levelId - 1]);
	}
	else{
		DisplayErrorMsg(2); // Display the error message if it fails
	}
	return 0;
}