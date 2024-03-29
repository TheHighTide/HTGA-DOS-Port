REM $DYNAMIC

DECLARE SUB TDLETTERTRANSLATE (LETTER$)
DECLARE SUB DISPLAYERROR (ERRORID!)
DECLARE SUB DISPLAYLOGO ()
DECLARE SUB PLAYCHIME ()

RANDOMIZE TIMER

DIM LANGUAGEVERSION AS STRING
DIM APPLICATIONVERSION AS STRING

LANGUAGEVERSION = "7.1"       ' Version of the QBASIC language
APPLICATIONVERSION = "0.0.5"  ' Version of the app

DIM JOKES(1) AS STRING
DIM ANSWERS(1) AS STRING
DIM ALPHABET(1) AS STRING
DIM GENERATEDLETTERS(0) AS STRING
DIM JOINEDSTRING AS STRING

ISINAPP = 1 ' This needs to be 1 for the main loop to work!
ISINLOOP = 0 ' This needs to be 1 for the command loops to work!

PRINT "Loading HTGA..."

i = 0
OPEN "JOKES.TXT" FOR INPUT AS #1
DO WHILE NOT EOF(1)
    REDIM PRESERVE JOKES(i + 1) AS STRING
    REDIM PRESERVE ANSWERS(i + 1) AS STRING
    LINE INPUT #1, JOKES(i)
    LINE INPUT #1, ANSWERS(i)
    i = i + 1
LOOP
CLOSE #1

i = 0
OPEN "ALPHABET.TXT" FOR INPUT AS #1
DO WHILE NOT EOF(1)
    REDIM PRESERVE ALPHABET(i + 1) AS STRING
    LINE INPUT #1, ALPHABET(i)
    i = i + 1
LOOP
CLOSE #1

CLS
DISPLAYLOGO
PLAYCHIME
INPUT "Press enter to continue to the app!", USERINPUT$

PRINT "Welcome to the HTGA for DOS!"
PRINT "Type 'help' for a list of commands."

DO WHILE ISINAPP = 1
    INPUT "HTGA: ", USERINPUT$
    IF UCASE$(USERINPUT$) = "HELP" THEN
        PRINT "嬪様様様様様様様様様様様様様様様様様様様様様様様様様邑"
        PRINT "�                 HTGA COMMANDS LIST                 �"
        PRINT "突様様様様様様様様様様様様様様様様様様様様様様様様様裕"
        PRINT "� HELP - Display command list                        �"
        PRINT "� EXIT - Close the application                       �"
        PRINT "� QUIT - Close the application                       �"
        PRINT "� JOKE - Generate a cringe joke                      �"
        PRINT "� LETTERMESS - Generate a bunch of letters           �"
        PRINT "� VERSION - Display app version info                 �"
        PRINT "� 3DLETTER - Translate 2D letters to 3D              �"
        PRINT "� CLEARSCREEN - Clear the console screen             �"
        PRINT "� TEST - Make sure the console understands you       �"
        PRINT "� DICE - Roll multiple different types of dice       �"
        PRINT "� RAINBOW - Display a cool rainbow                   �"
        PRINT "塒様様様様様様様様様様様様様様様様様様様様様様様様様余"
    ELSEIF UCASE$(USERINPUT$) = "EXIT" OR UCASE$(USERINPUT$) = "QUIT" THEN
        ISINAPP = 0 ' Set ISINAPP to zero in order to exit the program
    ELSEIF UCASE$(USERINPUT$) = "JOKE" THEN
        PRINT "Generating..."
        RANDOMNUMBER = INT(RND * UBOUND(JOKES))
        PRINT "Joke: "; JOKES(RANDOMNUMBER)
        SLEEP 2
        PRINT "Answer: "; ANSWERS(RANDOMNUMBER)
    ELSEIF UCASE$(USERINPUT$) = "VERSION" THEN ' Version command
        PRINT "Application Version: "; APPLICATIONVERSION$
        PRINT "Language Version: "; LANGUAGEVERSION$
    ELSEIF UCASE$(USERINPUT$) = "CLEARSCREEN" THEN
        CLS ' Clear the console screen
    ELSEIF UCASE$(USERINPUT$) = "LETTERMESS" THEN
        ISINSUBMENU = 1
        DO WHILE ISINSUBMENU = 1
            PRINT "Welcome to the lettermess command menu!"
            INPUT "Number of Letters (MAX = 1000): ", NUMBERINPUT
            IF NUMBERINPUT >= 0 AND NUMBERINPUT <= 1000 THEN
                ISINSUBMENU = 0
                PRINT "Generating..."
            ELSE
                DISPLAYERROR (3)' Display the invalid value error messages
            END IF
        LOOP

        REDIM GENERATEDLETTERS(0) AS STRING
        JOINEDSTRING = ""
        FOR i = 0 TO NUMBERINPUT
            REDIM PRESERVE GENERATEDLETTERS(i + 1) AS STRING
            RANDOMNUMBER = INT(RND * UBOUND(ALPHABET))
            GENERATEDLETTERS(i) = ALPHABET(RANDOMNUMBER)
        NEXT i
        FOR i = LBOUND(GENERATEDLETTERS) TO UBOUND(GENERATEDLETTERS)
            JOINEDSTRING = JOINEDSTRING$ + "" + GENERATEDLETTERS(i)
        NEXT i
        PRINT JOINEDSTRING
    ELSEIF UCASE$(USERINPUT$) = "3DLETTER" THEN
        INPUT "Letter: ", USERINPUT$
        TDLETTERTRANSLATE (USERINPUT$)
    ELSEIF UCASE$(USERINPUT$) = "TEST" THEN
        PRINT "Check check 1 2 3"
    ELSEIF UCASE$(USERINPUT$) = "LOGO" THEN
        DISPLAYLOGO ' Display the HTGA logo
    ELSEIF UCASE$(USERINPUT$) = "CHIME" THEN
        PLAYCHIME ' Play the HTGA theme chime
        SLEEP 2 ' Delay the execution for 2 seconds
    ELSEIF UCASE$(USERINPUT$) = "DICE" THEN
        PRINT "Dice Command"
        PRINT "Available dice modes are: 4, 6, 8, 12, 20"
        ISINLOOP = 1
        NUMBERINPUT = 0
        DO WHILE ISINLOOP = 1
            INPUT "Dice Mode: ", USERINPUT$
            IF UCASE$(USERINPUT$) = "4" THEN
                NUMBERINPUT = 4 ' Sets the dice for the user to roll as 4
            ELSEIF UCASE$(USERINPUT$) = "6" THEN
                NUMBERINPUT = 6 ' Sets the dice for the user to roll as 6
            ELSEIF UCASE$(USERINPUT$) = "8" THEN
                NUMBERINPUT = 8 ' Sets the dice for the user to roll as 8
            ELSEIF UCASE$(USERINPUT$) = "12" THEN
                NUMBERINPUT = 12 ' Sets the dice for the user to roll as 12
            ELSEIF UCASE$(USERINPUT$) = "20" THEN
                NUMBERINPUT = 20 ' Sets the dice for the user to roll as 20
            ELSE
                DISPLAYERROR (3)
            END IF

            IF NOT NUMBERINPUT = 0 THEN
                ISINLOOP = 0 ' Exit the command loop
            END IF
        LOOP

        RANDOMNUMBER = INT(RND * NUMBERINPUT) + 1
        PRINT "You Rolled: "; RANDOMNUMBER
    ELSEIF UCASE$(USERINPUT$) = "RAINBOW" THEN
        COLOR 4, 0 ' Set text color to red
        PRINT "========================================="
        COLOR 6, 0 ' Set text color to yellow
        PRINT "========================================="
        COLOR 2, 0 ' Set text color to green
        PRINT "========================================="
        COLOR 1, 0 ' Set text color to blue
        PRINT "========================================="
        COLOR 5, 0 ' Set text color to purple
        PRINT "========================================="
        COLOR 7, 0 ' Set text color to white
        PRINT "The rainbow is missing colors because DOS is limited..."
    ELSE
        DISPLAYERROR (0) ' Display the invalid command message
    END IF
LOOP

CLS
DISPLAYLOGO
PLAYCHIME
SLEEP 2
INPUT "Press enter to return to DOS...", USERINPUT$

REM $STATIC
SUB DISPLAYERROR (ERRORID)
    COLOR 4, 0
    IF ERRORID = 0 THEN
        PRINT "The command you entered is invalid!"
    ELSEIF ERRORID = 1 THEN
        PRINT "The value you entered isn't a string!"
    ELSEIF ERRORID = 2 THEN
        PRINT "The value you entered isn't a number!"
    ELSEIF ERRORID = 3 THEN
        PRINT "The value you entered is invalid!"
    ELSEIF ERRORID = 4 THEN
        PRINT "The option you entered is invalid!"
    ELSE
        PRINT "The ERRORID entered in the code is not a valid ID!"
    END IF
    COLOR 7, 0
END SUB

SUB DISPLAYLOGO
    PRINT "霸  霸 栩栩霸 栩栩霸 栩栩霸"
    PRINT "霸  霸   霸   霸     霸  霸"
    PRINT "栩栩霸   霸   霸 栩� 栩栩霸"
    PRINT "霸  霸   霸   霸  霸 霸  霸"
    PRINT "霸  霸   霸   栩栩霸 霸  霸"
END SUB

SUB PLAYCHIME
    SOUND 523, 9.1
    SOUND 698, 9.1
    SOUND 659, 9.1
    SOUND 587, 9.1
    SOUND 698, 18.2
    SLEEP 1
END SUB

SUB TDLETTERTRANSLATE (LETTER$)
    IF UCASE$(LETTER$) = "A" THEN
        PRINT "栩栩霸"
        PRINT "霸  霸"
        PRINT "栩栩霸"
        PRINT "霸  霸"
        PRINT "霸  霸"
    ELSEIF UCASE$(LETTER$) = "B" THEN
        PRINT "栩栩�"
        PRINT "霸  霸"
        PRINT "栩栩�"
        PRINT "霸  霸"
        PRINT "栩栩�"
    ELSEIF UCASE$(LETTER$) = "C" THEN
        PRINT "栩栩霸"
        PRINT "霸"
        PRINT "霸"
        PRINT "霸"
        PRINT "栩栩霸"
    ELSEIF UCASE$(LETTER$) = "D" THEN
        PRINT "栩栩�"
        PRINT "霸  霸"
        PRINT "霸  霸"
        PRINT "霸  霸"
        PRINT "栩栩�"
    ELSEIF UCASE$(LETTER$) = "E" THEN
        PRINT "栩栩霸"
        PRINT "霸"
        PRINT "栩栩�"
        PRINT "霸"
        PRINT "栩栩霸"
    ELSEIF UCASE$(LETTER$) = "F" THEN
        PRINT "栩栩霸"
        PRINT "霸"
        PRINT "栩栩�"
        PRINT "霸"
        PRINT "霸"
    ELSEIF UCASE$(LETTER$) = "G" THEN
        PRINT "栩栩霸"
        PRINT "霸"
        PRINT "霸 栩�"
        PRINT "霸  霸"
        PRINT "栩栩霸"
    ELSEIF UCASE$(LETTER$) = "H" THEN
        PRINT "霸  霸"
        PRINT "霸  霸"
        PRINT "栩栩霸"
        PRINT "霸  霸"
        PRINT "霸  霸"
    ELSEIF UCASE$(LETTER$) = "I" THEN
        PRINT "栩栩霸"
        PRINT "  霸"
        PRINT "  霸"
        PRINT "  霸"
        PRINT "栩栩霸"
    ELSEIF UCASE$(LETTER$) = "J" THEN
        PRINT "栩栩霸"
        PRINT "   霸"
        PRINT "   霸"
        PRINT "霸 霸"
        PRINT "栩栩�"
    ELSEIF UCASE$(LETTER$) = "K" THEN
        PRINT "霸  霸"
        PRINT "霸 霸"
        PRINT "栩霸"
        PRINT "霸 霸"
        PRINT "霸  霸"
    ELSEIF UCASE$(LETTER$) = "L" THEN
        PRINT "霸"
        PRINT "霸"
        PRINT "霸"
        PRINT "霸"
        PRINT "栩栩霸"
    ELSEIF UCASE$(LETTER$) = "M" THEN
        PRINT " 栩霸"
        PRINT "霸霸霸"
        PRINT "霸霸霸"
        PRINT "霸  霸"
        PRINT "霸  霸"
    ELSEIF UCASE$(LETTER$) = "N" THEN
        PRINT "霸  霸"
        PRINT "栩� 霸"
        PRINT "霸霸霸"
        PRINT "霸 栩�"
        PRINT "霸  霸"
    ELSEIF UCASE$(LETTER$) = "O" THEN
        PRINT " 栩霸"
        PRINT "霸  霸"
        PRINT "霸  霸"
        PRINT "霸  霸"
        PRINT " 栩霸"
    ELSEIF UCASE$(LETTER$) = "P" THEN
        PRINT "栩栩�"
        PRINT "霸  霸"
        PRINT "栩栩�"
        PRINT "霸"
        PRINT "霸"
    ELSEIF UCASE$(LETTER$) = "Q" THEN
        PRINT " 栩�"
        PRINT "霸 霸"
        PRINT "霸 霸"
        PRINT "霸 霸"
        PRINT " 栩越�"
    ELSEIF UCASE$(LETTER$) = "R" THEN
        PRINT "栩栩�"
        PRINT "霸  霸"
        PRINT "栩栩�"
        PRINT "霸  霸"
        PRINT "霸  霸"
    ELSEIF UCASE$(LETTER$) = "S" THEN
        PRINT " 栩栩�"
        PRINT "霸"
        PRINT " 栩霸"
        PRINT "    霸"
        PRINT "栩栩�"
    ELSEIF UCASE$(LETTER$) = "T" THEN
        PRINT "栩栩霸"
        PRINT "  霸"
        PRINT "  霸"
        PRINT "  霸"
        PRINT "  霸"
    ELSEIF UCASE$(LETTER$) = "U" THEN
        PRINT ""
        PRINT "霸  霸"
        PRINT "霸  霸"
        PRINT "霸  霸"
        PRINT " 栩霸"
    ELSEIF UCASE$(LETTER$) = "V" THEN
        PRINT "霸  霸"
        PRINT "霸  霸"
        PRINT " 霸霸"
        PRINT " 霸霸"
        PRINT "  霸"
    ELSEIF UCASE$(LETTER$) = "W" THEN
        PRINT "霸  霸"
        PRINT "霸  霸"
        PRINT "霸霸霸"
        PRINT "霸霸霸"
        PRINT " 栩霸"
    ELSEIF UCASE$(LETTER$) = "X" THEN
        PRINT "霸  霸"
        PRINT "霸  霸"
        PRINT " 栩霸"
        PRINT "霸  霸"
        PRINT "霸  霸"
    ELSEIF UCASE$(LETTER$) = "Y" THEN
        PRINT "霸  霸"
        PRINT "霸  霸"
        PRINT " 霸霸"
        PRINT "  霸"
        PRINT "  霸"
    ELSEIF UCASE$(LETTER$) = "Z" THEN
        PRINT "栩栩霸"
        PRINT "   霸"
        PRINT "  霸"
        PRINT " 霸"
        PRINT "栩栩霸"
    ELSE
        DISPLAYERROR (3)
    END IF
END SUB

