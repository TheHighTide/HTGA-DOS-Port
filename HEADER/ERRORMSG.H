#include <conio.h>
#include <iostream.h>

int DisplayErrorMsg(int errorId){
	if(errorId == 1){
		textcolor(RED); // Set the text color to red
		cprintf("That command is invalid!");
		cout << "\n";
		textcolor(WHITE); // Set the text color to white
	}
	return 0;
}