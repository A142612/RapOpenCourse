CLASS zcl_kl_scrabble_score DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .

    METHODS constructor.

    METHODS score
      IMPORTING
        input         TYPE string OPTIONAL
      RETURNING
        VALUE(result) TYPE i.

  PROTECTED SECTION.

    TYPES: BEGIN OF ty_lettervalue,
             letter(1) TYPE c,
             value     TYPE i,
           END OF ty_lettervalue.
    TYPES: ty_lettervalue_t TYPE STANDARD TABLE OF ty_lettervalue WITH KEY letter.
    DATA: mt_lettervalue TYPE ty_lettervalue_t.

  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_KL_SCRABBLE_SCORE IMPLEMENTATION.


  METHOD constructor.

    mt_lettervalue = VALUE  ty_lettervalue_t( ( letter = 'A' value = 1  ) ( letter = 'E' value = 1  ) ( letter = 'I' value = 1  )
    ( letter = 'O' value = 1  ) ( letter = 'U' value = 1  ) ( letter = 'L' value = 1  ) ( letter = 'N' value = 1  ) ( letter = 'R' value = 1  )
      ( letter = 'S' value = 1  ) ( letter = 'T' value = 1  ) ( letter = 'D' value = 2  ) ( letter = 'G' value = 2  ) ( letter = 'B' value = 3  )
    ( letter = 'C' value = 3  ) ( letter = 'M' value = 3  ) ( letter = 'P' value = 3  ) ( letter = 'F' value = 4  ) ( letter = 'H' value = 4  )
    ( letter = 'V' value = 4  ) ( letter = 'W' value = 4  ) ( letter = 'Y' value = 4  ) ( letter = 'K' value = 5  ) ( letter = 'J' value = 8  )
    ( letter = 'X' value = 8  ) ( letter = 'Q' value = 10  ) ( letter = 'Z' value = 10  ) ).

  ENDMETHOD.


  METHOD if_oo_adt_classrun~main.
  ENDMETHOD.


  METHOD score.
    TYPES: BEGIN OF ty_letter,
             letter(1) TYPE c,
           END OF ty_letter,
           ty_letter_t TYPE STANDARD TABLE OF  ty_letter WITH EMPTY KEY.
    " data j type i.
    DATA(input_length) = strlen( input ).

    DATA(lt_input) = VALUE ty_letter_t( FOR j = 0 THEN j + 1 UNTIL j > input_length - 1 ( letter = to_upper( input+j(1) ) ) ).
    result = REDUCE i( INIT x = 0 FOR wa IN lt_input NEXT x = x +   mt_lettervalue[ letter = wa-letter ]-value ).
  ENDMETHOD.
ENDCLASS.
