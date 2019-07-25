      ******************************************************************
      * Author: DEREK PALMER
      * Date: 24th JULY 2019
      * Purpose: TO PROVIDE A TEST HARNESS FOR TRAPPED RAIN WATER
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. DPTESTHARNESSv3.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.

       01  TEST-NUMBER1                PIC X(120) VALUE
                                       "0,1,0,2,1,0,1,3,2,1,2,1".
       01  EXPECTED-RESULT1            PIC 9(4) COMP VALUE 6.

       01  TEST-NUMBER2                PIC X(120) VALUE
                                       "0,1,0,2,1,0,1,0,1,3,2,1,2,1".
       01  EXPECTED-RESULT2            PIC 9(4) COMP VALUE 9.

       01  TEST-NUMBER3                PIC X(120) VALUE
                                       "0,1,0,2,1,0,0,1,0,1,3,2,1,2,1".
       01  EXPECTED-RESULT3            PIC 9(4) COMP VALUE 11.

       01  TEST-NUMBER4                PIC X(120) VALUE
                                       "0,1,0,2,1,0,1,3,2,1,2,1,2".
       01  EXPECTED-RESULT4            PIC 9(4) COMP VALUE 7.

       01  TEST-NUMBER5                PIC X(120) VALUE
                                       "1,0,1,0,2,1,0,1,3,2,1,2,1".
       01  EXPECTED-RESULT5            PIC 9(4) COMP VALUE 7.
       
       01  TEST-NUMBER6                PIC X(120) VALUE
                                       "0".
       01  EXPECTED-RESULT6            PIC 9(4) COMP VALUE 0.

       01  TEST-RESULT                 PIC 9(4) COMP.




       PROCEDURE DIVISION.
       MAIN-PROCEDURE.


           CALL  "COUNTWATER" USING    TEST-NUMBER1
                                       TEST-RESULT.
           DISPLAY "TEST1".
           DISPLAY EXPECTED-RESULT1.
           IF EXPECTED-RESULT1 = TEST-RESULT THEN
               DISPLAY "PASS"
              ELSE
               DISPLAY "FAIL".

           CALL  "COUNTWATER" USING    TEST-NUMBER2
                                       TEST-RESULT.
           DISPLAY "TEST2".
           DISPLAY EXPECTED-RESULT2.
           IF EXPECTED-RESULT2 = TEST-RESULT THEN
               DISPLAY "PASS"
              ELSE
               DISPLAY "FAIL".

           CALL  "COUNTWATER" USING    TEST-NUMBER3
                                       TEST-RESULT.
           DISPLAY "TEST3".
           DISPLAY EXPECTED-RESULT3.
           IF EXPECTED-RESULT3 = TEST-RESULT THEN
               DISPLAY "PASS"
              ELSE
               DISPLAY "FAIL".
           CALL  "COUNTWATER" USING    TEST-NUMBER4
                                       TEST-RESULT.
           DISPLAY "TEST4".
           DISPLAY EXPECTED-RESULT4.
           IF EXPECTED-RESULT5 = TEST-RESULT THEN
               DISPLAY "PASS"
              ELSE
               DISPLAY "FAIL".

           CALL  "COUNTWATER" USING    TEST-NUMBER5
                                       TEST-RESULT.
           DISPLAY "TEST5".
           DISPLAY EXPECTED-RESULT5.
           IF EXPECTED-RESULT5 = TEST-RESULT THEN
               DISPLAY "PASS"
              ELSE
               DISPLAY "FAIL".

           CALL  "COUNTWATER" USING    TEST-NUMBER6
                                       TEST-RESULT.
           DISPLAY "TEST6".
           DISPLAY EXPECTED-RESULT6.
           IF EXPECTED-RESULT6 = TEST-RESULT THEN
               DISPLAY "PASS"
              ELSE
               DISPLAY "FAIL".             

       END PROGRAM DPTESTHARNESSv3.
