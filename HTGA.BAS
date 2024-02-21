REM $DYNAMIC

DECLARE SUB TDLETTERTRANSLATE (LETTER$)
DECLARE SUB DISPLAYERROR (ERRORID!)
DECLARE SUB DISPLAYLOGO ()
DECLARE SUB PLAYCHIME ()

RANDOMIZE TIMER

DIM LANGUAGEVERSION AS STRING
DIM APPLICATIONVERSION AS STRING

LANGUAGEVERSION = "7.1"       ' Version of the QBASIC language
APPLICATIONVERSION = "0.0.4"  ' Version of the app

DIM JOKES(1) AS STRING
DIM ANSWERS(1) AS STRING
DIM ALPHABET(1) AS STRING
DIM GENERATEDLETTERS(0) AS STRING
DIM JOINEDSTRING AS STRING
ISINAPP = 1 ' This needs to be 1 for the main loop to work!

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
        PRINT "ÕÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¸"
        PRINT "³             HTGA COMMANDS LIST             ³"
        PRINT "ÆÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍµ"
        PRINT "³ HELP - Display command list                ³"
        PRINT "³ EXIT - Close the application               ³"
        PRINT "³ QUIT - Close the application               ³"
        PRINT "³ JOKE - Generate a cringe joke              ³"
        PRINT "³ LETTERMESS - Generate a bunch of letters   ³"
        PRINT "³ VERSION - Display app version info         ³"
        PRINT "³ 3DLETTER - Translate 2D letters to 3D      ³"
        PRINT "³ CLEARSCREEN - Clear the console screen     ³"
        PRINT "ÔÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¾"
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
    PRINT "Û±  Û± ÛÛÛÛÛ± ÛÛÛÛÛ± ÛÛÛÛÛ±"
    PRINT "Û±  Û±   Û±   Û±     Û±  Û±"
    PRINT "ÛÛÛÛÛ±   Û±   Û± ÛÛ± ÛÛÛÛÛ±"
    PRINT "Û±  Û±   Û±   Û±  Û± Û±  Û±"
    PRINT "Û±  Û±   Û±   ÛÛÛÛÛ± Û±  Û±"
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
        PRINT "ÛÛÛÛÛ±"
        PRINT "Û±  Û±"
        PRINT "ÛÛÛÛÛ±"
        PRINT "Û±  Û±"
        PRINT "Û±  Û±"
    ELSEIF UCASE$(LETTER$) = "B" THEN
        PRINT "ÛÛÛÛ±"
        PRINT "Û±  Û±"
        PRINT "ÛÛÛÛ±"
        PRINT "Û±  Û±"
        PRINT "ÛÛÛÛ±"
    ELSEIF UCASE$(LETTER$) = "C" THEN
        PRINT "ÛÛÛÛÛ±"
        PRINT "Û±"
        PRINT "Û±"
        PRINT "Û±"
        PRINT "ÛÛÛÛÛ±"
    ELSEIF UCASE$(LETTER$) = "D" THEN
        PRINT "ÛÛÛÛ±"
        PRINT "Û±  Û±"
        PRINT "Û±  Û±"
        PRINT "Û±  Û±"
        PRINT "ÛÛÛÛ±"
    ELSEIF UCASE$(LETTER$) = "E" THEN
        PRINT "ÛÛÛÛÛ±"
        PRINT "Û±"
        PRINT "ÛÛÛÛ±"
        PRINT "Û±"
        PRINT "ÛÛÛÛÛ±"
    ELSEIF UCASE$(LETTER$) = "F" THEN
        PRINT "ÛÛÛÛÛ±"
        PRINT "Û±"
        PRINT "ÛÛÛÛ±"
        PRINT "Û±"
        PRINT "Û±"
    ELSEIF UCASE$(LETTER$) = "G" THEN
        PRINT "ÛÛÛÛÛ±"
        PRINT "Û±"
        PRINT "Û± ÛÛ±"
        PRINT "Û±  Û±"
        PRINT "ÛÛÛÛÛ±"
    ELSEIF UCASE$(LETTER$) = "H" THEN
        PRINT "Û±  Û±"
        PRINT "Û±  Û±"
        PRINT "ÛÛÛÛÛ±"
        PRINT "Û±  Û±"
        PRINT "Û±  Û±"
    ELSEIF UCASE$(LETTER$) = "I" THEN
        PRINT "ÛÛÛÛÛ±"
        PRINT "  Û±"
        PRINT "  Û±"
        PRINT "  Û±"
        PRINT "ÛÛÛÛÛ±"
    ELSEIF UCASE$(LETTER$) = "J" THEN
        PRINT "ÛÛÛÛÛ±"
        PRINT "   Û±"
        PRINT "   Û±"
        PRINT "Û± Û±"
        PRINT "ÛÛÛÛ±"
    ELSEIF UCASE$(LETTER$) = "K" THEN
        PRINT "Û±  Û±"
        PRINT "Û± Û±"
        PRINT "ÛÛÛ±"
        PRINT "Û± Û±"
        PRINT "Û±  Û±"
    ELSEIF UCASE$(LETTER$) = "L" THEN
        PRINT "Û±"
        PRINT "Û±"
        PRINT "Û±"
        PRINT "Û±"
        PRINT "ÛÛÛÛÛ±"
    ELSEIF UCASE$(LETTER$) = "M" THEN
        PRINT " ÛÛÛ±"
        PRINT "Û±Û±Û±"
        PRINT "Û±Û±Û±"
        PRINT "Û±  Û±"
        PRINT "Û±  Û±"
    ELSEIF UCASE$(LETTER$) = "N" THEN
        PRINT "Û±  Û±"
        PRINT "ÛÛ± Û±"
        PRINT "Û±Û±Û±"
        PRINT "Û± ÛÛ±"
        PRINT "Û±  Û±"
    ELSEIF UCASE$(LETTER$) = "O" THEN
        PRINT " ÛÛÛ±"
        PRINT "Û±  Û±"
        PRINT "Û±  Û±"
        PRINT "Û±  Û±"
        PRINT " ÛÛÛ±"
    ELSEIF UCASE$(LETTER$) = "P" THEN
        PRINT "ÛÛÛÛ±"
        PRINT "Û±  Û±"
        PRINT "ÛÛÛÛ±"
        PRINT "Û±"
        PRINT "Û±"
    ELSEIF UCASE$(LETTER$) = "Q" THEN
        PRINT " ÛÛ±"
        PRINT "Û± Û±"
        PRINT "Û± Û±"
        PRINT "Û± Û±"
        PRINT " ÛÛ±Û±"
    ELSEIF UCASE$(LETTER$) = "R" THEN
        PRINT "ÛÛÛÛ±"
        PRINT "Û±  Û±"
        PRINT "ÛÛÛÛ±"
        PRINT "Û±  Û±"
        PRINT "Û±  Û±"
    ELSEIF UCASE$(LETTER$) = "S" THEN
        PRINT " ÛÛÛÛ±"
        PRINT "Û±"
        PRINT " ÛÛÛ±"
        PRINT "    Û±"
        PRINT "ÛÛÛÛ±"
    ELSEIF UCASE$(LETTER$) = "T" THEN
        PRINT "ÛÛÛÛÛ±"
        PRINT "  Û±"
        PRINT "  Û±"
        PRINT "  Û±"
        PRINT "  Û±"
    ELSEIF UCASE$(LETTER$) = "U" THEN
        PRINT ""
        PRINT "Û±  Û±"
        PRINT "Û±  Û±"
        PRINT "Û±  Û±"
        PRINT " ÛÛÛ±"
    ELSEIF UCASE$(LETTER$) = "V" THEN
        PRINT "Û±  Û±"
        PRINT "Û±  Û±"
        PRINT " Û±Û±"
        PRINT " Û±Û±"
        PRINT "  Û±"
    ELSEIF UCASE$(LETTER$) = "W" THEN
        PRINT "Û±  Û±"
        PRINT "Û±  Û±"
        PRINT "Û±Û±Û±"
        PRINT "Û±Û±Û±"
        PRINT " ÛÛÛ±"
    ELSEIF UCASE$(LETTER$) = "X" THEN
        PRINT "Û±  Û±"
        PRINT "Û±  Û±"
        PRINT " ÛÛÛ±"
        PRINT "Û±  Û±"
        PRINT "Û±  Û±"
    ELSEIF UCASE$(LETTER$) = "Y" THEN
        PRINT "Û±  Û±"
        PRINT "Û±  Û±"
        PRINT " Û±Û±"
        PRINT "  Û±"
        PRINT "  Û±"
    ELSEIF UCASE$(LETTER$) = "Z" THEN
        PRINT "ÛÛÛÛÛ±"
        PRINT "   Û±"
        PRINT "  Û±"
        PRINT " Û±"
        PRINT "ÛÛÛÛÛ±"
    ELSE
        DISPLAYERROR (3)
    END IF
END SUB

