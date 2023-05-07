CLASS zcl_kl_two_fer DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .

    METHODS two_fer
      IMPORTING
                !input        TYPE string OPTIONAL
      RETURNING VALUE(result) TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_KL_TWO_FER IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
  ENDMETHOD.


  METHOD two_fer.
    result = COND string(  WHEN input ='' THEN |One for you, one for me.|
                              WHEN input <> '' THEN  |One for { input }, one for me.| ) .
  ENDMETHOD.
ENDCLASS.
