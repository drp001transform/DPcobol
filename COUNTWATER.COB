
      ******************************************************************
      * Author: DEREK PALMER
      * Date: 24th JULY 2019
      * Purpose: TO SOLVE TRAPPED RAIN WATER PROBLEM IN COBOL
      * Tectonics: cobc
      *****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. COUNTWATER IS INITIAL PROGRAM.
       DATA DIVISION.
       FILE SECTION.

       WORKING-STORAGE SECTION.

       01  ELEVATION-MAP.
           03  ELEVATION-COLUMN        PIC 99 OCCURS 100.
           03  MAX-WALL-HEIGHT         PIC 99 VALUE 0.
           03  FINAL-NON-ZERO-COLUMN   PIC 99 VALUE 0.
       01  CONTROL-FIELDS.
           03  STRING-PTR              PIC 9(4) COMP VALUE 1.
           03  POTENTIAL-WATER         PIC 9(4) COMP.
           03  COLUMN-NO               PIC 9(4) COMP.
           03  ROW-LEVEL               PIC S9(4) COMP.
           03  WALL-INDICATOR          PIC X.
               88 NO-WALL-YET          VALUE " ".
               88 LEFTHAND-WALL-HAS-BEEN-FOUND  
                                       VALUE "L".

       LINKAGE SECTION.
       01  ELEVATION-MAP-INPUT         PIC X(120).
       01  TOTAL-WATER                 PIC 9(4) COMP.

       PROCEDURE DIVISION USING        ELEVATION-MAP-INPUT
                                       TOTAL-WATER.
       MAIN-PROCEDURE.
      *********
      * First step is to unpack the comma delimited values into an array
      ********* 
           MOVE 0 TO TOTAL-WATER.
>          PERFORM VARYING COLUMN-NO FROM 1 BY 1 UNTIL COLUMN-NO > 99
> >            UNSTRING ELEVATION-MAP-INPUT
                   DELIMITED BY ',' INTO ELEVATION-COLUMN(COLUMN-NO)
> >                WITH POINTER STRING-PTR
               IF ELEVATION-COLUMN(COLUMN-NO) > MAX-WALL-HEIGHT THEN
                  MOVE ELEVATION-COLUMN(COLUMN-NO) TO MAX-WALL-HEIGHT
               END-IF
               IF ELEVATION-COLUMN(COLUMN-NO) > 0 THEN
                  MOVE COLUMN-NO TO FINAL-NON-ZERO-COLUMN
               END-IF 
> >        END-PERFORM.

      *********
      * Count WATER BY EVALUATING EACH ROW OF THE IMPLIED ELEVATION
      * MAP, WORKING FROM HIGHEST POINT DOWN. 
      ********* 
           PERFORM COUNT-WATER-IN-ROW
                   VARYING ROW-LEVEL FROM MAX-WALL-HEIGHT BY -1 UNTIL
                       ROW-LEVEL < 0.
           DISPLAY "Total water = ".
           DISPLAY TOTAL-WATER.
           EXIT PROGRAM.

       COUNT-WATER-IN-ROW.
           MOVE 0 TO POTENTIAL-WATER.
           MOVE " " TO WALL-INDICATOR.
           PERFORM VARYING COLUMN-NO FROM 1 BY 1 
                   UNTIL COLUMN-NO > FINAL-NON-ZERO-COLUMN
               IF ELEVATION-COLUMN(COLUMN-NO) >=
                   ROW-LEVEL THEN
                       PERFORM PROCESS-WALL-BLOCK
                   ELSE
                       PERFORM PROCESS-NON-WALL-BLOCK
           END-PERFORM.

       PROCESS-WALL-BLOCK.
      *********
      *  THIS BLOCK MAY CLOSE A VALLEY & THERE WILL BE SOME POTENTIAL
      *  WATER TO TOTAL UP, OR IT MAY BE THE START OF A VALLEY IN WHICH 
      *  CASE POTENTIAL WATER IS ZERO SO NO HARM TO ADD IT EITHER WAY.
      *  IT COULD ALSO CLOSE A VALLEY AND START A NEW ONE.
      *********
           ADD POTENTIAL-WATER TO TOTAL-WATER.
           MOVE 0 TO POTENTIAL-WATER.
           MOVE "L" TO WALL-INDICATOR.

       PROCESS-NON-WALL-BLOCK.
           IF LEFTHAND-WALL-HAS-BEEN-FOUND THEN
               ADD 1 TO POTENTIAL-WATER.

       END PROGRAM COUNTWATER.
