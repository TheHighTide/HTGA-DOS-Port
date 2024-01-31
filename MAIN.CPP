#include <stdio.h>
#include <string.h>
#include <iostream.h>
#include <conio.h>
#include <dos.h>
#include <stdlib.h>

#include "header/errormsg.h" // Responsible for displaying error messages
#include "header/geomdash.h" // Responsible for GD level data and other variables

int UserCommandInput(char* targetCommand, char* sentCommand){
	return strcmp(sentCommand, targetCommand) == 0;
}

int main(){
	char userInput[100]; // The main variable for User Input
	int isApplicationRunning = 1; // Only used by the main loopS

	char* applicationVersion = "0.0.1";
	char* cppVersion = "cpp2";
	const char* commandList[] = {"help", "version", "level", "exit"};

	// This is where the code starts
	clrscr();

	while(isApplicationRunning == 1){
		printf("HTGA DOS: ");
		scanf(" %[^\n]", userInput);

		if(UserCommandInput("help", userInput)){
			printf("Heres a list of commands:\n");
			for(int i = 0; i < sizeof(commandList) / sizeof(commandList[0]); i++){
				printf("%s\n", commandList[i]);
			}
		}
		else if(UserCommandInput("version", userInput)){
			printf("Current Language Version: %s\n", cppVersion);
			printf("Application Version: %s\n", applicationVersion);
		}
		else if(UserCommandInput("level", userInput)){
			printf("Please enter the \"Level ID\" of the target level (main only)\n");
			printf("Level ID: ");
			scanf(" %[^\n]", userInput);
			GetLevelDetails(atoi(userInput)); // Get the converted chars level ID
		}
		else if(UserCommandInput("exit", userInput)){
			printf("Thanks for using the HTGA!\n");
			break;
		}
		else{
			DisplayErrorMsg(1); // Display the invalid command error message
		}
	}

	return 0;
}