#include <conio.h>
#include <iostream.h>

int DisplayErrorMsg(int errorId){
	if(errorId == 1){
		textcolor(RED); // Set the text color to red
		cprintf("That command is invalid!");
		cout << "\n";
		textcolor(WHITE); // Set the text color to white
	}
	if(errorId == 2){
		textcolor(RED);
		cprintf("That value is invalid!");
		cout << "\n";
		textcolor(WHITE);
	}
	return 0;
}