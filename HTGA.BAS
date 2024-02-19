' $DYNAMIC

DECLARE SUB DISPLAYERROR (ERRORID!)
DECLARE SUB DISPLAYLOGO ()
DECLARE SUB PLAYCHIME ()

RANDOMIZE TIMER

DIM JOKES(1) AS STRING
DIM ANSWERS(1) AS STRING
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

CLS
DISPLAYLOGO
PLAYCHIME
INPUT "Press enter to continue to the app!", USERINPUT$

PRINT "Welcome to the HTGA for DOS!"
PRINT "Type 'help' for a list of commands."

DO WHILE ISINAPP = 1
    INPUT "HTGA: ", USERINPUT$
    IF UCASE$(USERINPUT$) = "HELP" THEN
        PRINT "ีออออออออออออออออออออออออออออออออออธ"
        PRINT "ณ        HTGA COMMANDS LIST        ณ"
        PRINT "ฦออออออออออออออออออออออออออออออออออต"
        PRINT "ณ HELP - Display command list      ณ"
        PRINT "ณ EXIT - Close the application     ณ"
        PRINT "ณ QUIT - Close the application     ณ"
        PRINT "ณ JOKE - Generate a cringe joke    ณ"
        PRINT "ิออออออออออออออออออออออออออออออออออพ"
    ELSEIF UCASE$(USERINPUT$) = "EXIT" OR UCASE$(USERINPUT$) = "QUIT" THEN
        ISINAPP = 0 ' Set ISINAPP to zero in order to exit the program
    ELSEIF UCASE$(USERINPUT$) = "JOKE" THEN
        PRINT "Generating..."
        RANDOMNUMBER = INT(RND * UBOUND(JOKES))
        PRINT "Joke: "; JOKES(RANDOMNUMBER)
        PRINT "Answer: "; ANSWERS(RANDOMNUMBER)
    ELSE
        DISPLAYERROR (0)
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
    PRINT "Ûฑ  Ûฑ ÛÛÛÛÛฑ ÛÛÛÛÛฑ ÛÛÛÛÛฑ"
    PRINT "Ûฑ  Ûฑ   Ûฑ   Ûฑ     Ûฑ  Ûฑ"
    PRINT "ÛÛÛÛÛฑ   Ûฑ   Ûฑ ÛÛฑ ÛÛÛÛÛฑ"
    PRINT "Ûฑ  Ûฑ   Ûฑ   Ûฑ  Ûฑ Ûฑ  Ûฑ"
    PRINT "Ûฑ  Ûฑ   Ûฑ   ÛÛÛÛÛฑ Ûฑ  Ûฑ"
END SUB

SUB PLAYCHIME
    SOUND 523, 9.1
    SOUND 698, 9.1
    SOUND 659, 9.1
    SOUND 587, 9.1
    SOUND 698, 18.2
    SLEEP 1
END SUB

