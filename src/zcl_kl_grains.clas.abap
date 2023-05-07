CLASS zcl_kl_grains DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES type_result TYPE p LENGTH 16 DECIMALS 0.
    METHODS square
      IMPORTING
        input         TYPE i
      RETURNING
        VALUE(result) TYPE type_result
      RAISING
        cx_parameter_invalid.
    METHODS total
      RETURNING
        VALUE(result) TYPE type_result
      RAISING
        cx_parameter_invalid.
    METHODS singal_multiple
      IMPORTING
        input         TYPE type_result
      RETURNING
        VALUE(result) TYPE type_result
      RAISING
        cx_parameter_invalid.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_KL_GRAINS IMPLEMENTATION.


  METHOD singal_multiple.
    result = 2 * input .
  ENDMETHOD.


  METHOD square.
    " add solution here
    IF input >= 1 AND input <= 64.
      DATA(i) = 1.
      result = 1.
      WHILE i < input.
        result = me->singal_multiple( input = result ).
        i = i + 1.
      ENDWHILE.
    ELSE.
      RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDIF.
  ENDMETHOD.


  METHOD total.
    " add solution here
    DATA(i) = 1.
    WHILE i <= 64 .
      result = result + me->square( i ).
      i = i + 1.
    ENDWHILE.
  ENDMETHOD.
ENDCLASS.
