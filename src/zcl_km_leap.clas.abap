CLASS zcl_km_leap DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  METHODS leap
      IMPORTING
        year          TYPE i
      RETURNING
        VALUE(result) TYPE abap_bool.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_KM_LEAP IMPLEMENTATION.


  METHOD leap.
   result = cond abap_bool(
     when year mod 400 = 0 then abap_true
     when year mod 100 = 0 then abap_false
     when year mod 4 = 0 then abap_true
     else abap_false
   ).

  ENDMETHOD.
ENDCLASS.
