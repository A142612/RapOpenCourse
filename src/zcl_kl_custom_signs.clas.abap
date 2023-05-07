CLASS zcl_kl_custom_signs DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
    "! Build a sign that includes both of the parameters.
    METHODS build_sign IMPORTING occasion      TYPE string
                                 name          TYPE string
                       RETURNING VALUE(result) TYPE string.

    "! Build a birthday sign that conditionally formats the return string.
    METHODS build_birthday_sign IMPORTING age           TYPE i
                                RETURNING VALUE(result) TYPE string.

    "! Build a graduation sign that includes multiple lines
    METHODS graduation_for IMPORTING name          TYPE string
                                     year          TYPE i
                           RETURNING VALUE(result) TYPE string.

    "! Determine cost based on each character of sign parameter that builds
    "! the template string that includes the currency parameter.
    METHODS cost_of IMPORTING sign          TYPE string
                              currency      TYPE string
                    RETURNING VALUE(result) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_KL_CUSTOM_SIGNS IMPLEMENTATION.


  METHOD build_birthday_sign.
    "Implement solution here
    result = cond string( when age >= 50 then |Happy Birthday! What a mature fellow you are.|
                          else |Happy Birthday! What a young fellow you are.| ).

  ENDMETHOD.


    METHOD build_sign.
    "Implement solution here
     result = |Happy { occasion  } { name }!|.
  ENDMETHOD.


  METHOD cost_of.
    data cost type p LENGTH 16 DECIMALS 2.
    "Implement solution here
    data(length) = strlen( sign ).
    cost = 20 + length * 2.
    result = |Your sign costs { cost } { currency }.|.

  ENDMETHOD.


  METHOD graduation_for.
    "Implement solution here
    result = |Congratulations { name }!\nClass of { year }|.
  ENDMETHOD.


  METHOD if_oo_adt_classrun~main.
  ENDMETHOD.
ENDCLASS.
