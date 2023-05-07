CLASS zcl_kl_kindergarten_garden DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .

    METHODS constructor.

    METHODS plants
      IMPORTING
        diagram        TYPE string
        student        TYPE string
      RETURNING
        VALUE(results) TYPE string_table.


  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA students TYPE string_table.

    METHODS get_student_index
      IMPORTING student    TYPE string
      RETURNING
                VALUE(idx) TYPE i.
    METHODS convert_to_plant
      IMPORTING charac        TYPE C
      RETURNING VALUE(result) TYPE string.

ENDCLASS.



CLASS ZCL_KL_KINDERGARTEN_GARDEN IMPLEMENTATION.


  METHOD constructor.

    students = VALUE #( ( |Alice| )  ( |Bob| )  ( |Charlie| )  ( |David| )
                        ( |Eve| )  ( |Fred| )  ( |Ginny| )  ( |Harriet| )
                        ( |Ileana| )  ( |Joseph| )  ( |Kincaid| )  ( |Larry| ) ).

  ENDMETHOD.


  METHOD convert_to_plant.
    result = SWITCH string( charac WHEN 'V' THEN 'violets'
                            WHEN 'G' THEN 'grass'
                            WHEN 'C' THEN 'clover'
                            WHEN 'R' THEN 'radishes').
  ENDMETHOD.


  METHOD get_student_index.
    idx = line_index( students[ table_line = student ] ) - 1.
  ENDMETHOD.


  METHOD if_oo_adt_classrun~main.
   out->write( plants( diagram = 'VVCCGG\nVVCCGG' student = 'Charlie' ) ).
  ENDMETHOD.


  METHOD plants.
    "  Data lt_diagram TYPE string_table.
    DATA lr_split    TYPE REF TO string.
    DATA firstdiagram(80) TYPE C.
    SPLIT diagram AT '\n' INTO TABLE DATA(lt_diagram).

    IF sy-subrc = 0.
      DATA(postition) = get_student_index( student ) * 2.
      DATA(postition2) = postition + 1.

      LOOP AT lt_diagram REFERENCE INTO lr_split.
        firstdiagram = lr_split->*.
        APPEND convert_to_plant( charac = firstdiagram+postition(1) ) TO results.
        APPEND convert_to_plant( charac = firstdiagram+postition2(1) ) TO results.
      ENDLOOP.

    ENDIF.


  ENDMETHOD.
ENDCLASS.
