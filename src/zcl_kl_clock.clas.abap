CLASS zcl_kl_clock DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .

    METHODS constructor
      IMPORTING
        !hours   TYPE i
        !minutes TYPE i DEFAULT 0.
    METHODS get
      RETURNING
        VALUE(result) TYPE string.
    METHODS add
      IMPORTING
        !minutes TYPE i.
    METHODS sub
      IMPORTING
        !minutes TYPE i.

  PROTECTED SECTION.
  PRIVATE SECTION.

    DATA: mv_time(10) TYPE c.

    METHODS convert_to_time
      IMPORTING i_input         TYPE i
      RETURNING VALUE(r_output) TYPE string.



ENDCLASS.



CLASS ZCL_KL_CLOCK IMPLEMENTATION.


  METHOD add.
* add solution here

    DATA(l_minutes) = minutes mod 1440.
    DATA(hours)     = l_minutes DIV 60.
    DATA(minutes_n) = l_minutes MOD 60.

    SPLIT mv_time AT ':' INTO DATA(cur_hour) DATA(cur_minute).

    DATA(cur_hour_i) = CONV i( cur_hour ).
    DATA(cur_minute_i) = CONV i( cur_minute ).

    cur_hour_i =  COND i( WHEN cur_minute_i + minutes_n < 60 THEN  cur_hour_i + hours
                           ELSE   cur_hour_i + hours + 1  ).

    cur_hour_i =  COND i( when cur_hour_i >= 24 then cur_hour_i - 24
                         else cur_hour_i ).
    cur_minute_i = COND i( WHEN cur_minute_i + minutes_n < 60 THEN cur_minute_i + minutes_n
                           ELSE  cur_minute_i + minutes_n - 60  ).

    DATA(total_minutes) =  cur_hour_i * 60 + cur_minute_i.
    mv_time = convert_to_time(  EXPORTING i_input = total_minutes ).

  ENDMETHOD.


  METHOD constructor.
* add solution here
    DATA(l_hours) = hours MOD 24.
    DATA(l_minutes) = minutes mod 1440.
    DATA(total_minutes) =  l_hours * 60 + l_minutes.

    total_minutes = COND i( when total_minutes >= 1440 then total_minutes  - 1440
                         else total_minutes ).

    mv_time = convert_to_time(  EXPORTING i_input = total_minutes ).

  ENDMETHOD.


  METHOD convert_to_time.

    DATA(hours)     = i_input DIV 60.
    DATA(minutes_n) = i_input MOD 60.

     r_output = cond #( when hours >= 10 and minutes_n >= 10 then |{ hours WIDTH = 2 }:{ minutes_n WIDTH = 2 }|
                       when hours >= 10 and minutes_n < 10 then |{ hours WIDTH = 2 }:0{ minutes_n WIDTH = 1 }|
                       when hours < 10 and minutes_n < 10 then |0{ hours WIDTH = 1 }:0{ minutes_n WIDTH = 1 }|
                       when hours < 10 and minutes_n >= 10 then |0{ hours WIDTH = 1 }:{ minutes_n WIDTH = 2 }| ).

  ENDMETHOD.


  METHOD get.
* add solution here
    result =  mv_time.
  ENDMETHOD.


  METHOD if_oo_adt_classrun~main.
  ENDMETHOD.


  METHOD sub.
* add solution here
    data(l_minutes) = minutes MOD 1440.
    DATA(hours)     = l_minutes DIV 60.
    DATA(minutes_n) = l_minutes MOD 60.

    SPLIT mv_time AT ':' INTO DATA(cur_hour) DATA(cur_minute).

    DATA(cur_hour_i) = CONV i( cur_hour ).
    DATA(cur_minute_i) = CONV i( cur_minute ).

    cur_hour_i =  COND i( WHEN cur_hour_i >= hours and cur_minute_i >= minutes_n  THEN  cur_hour_i - hours
                          WHEN cur_hour_i >= hours and cur_minute_i < minutes_n  THEN cur_hour_i - hours - 1
                          WHEN cur_hour_i < hours and cur_minute_i >= minutes_n  THEN  cur_hour_i + 24 - hours
                          WHEN cur_hour_i < hours and cur_minute_i < minutes_n  THEN cur_hour_i + 23 - hours - 1      ).

    cur_minute_i = COND i( WHEN cur_minute_i >= minutes_n  THEN cur_minute_i - minutes_n
                           ELSE  60 + cur_minute_i - minutes_n  ).

    DATA(total_minutes) =  cur_hour_i * 60 + cur_minute_i.
    mv_time = convert_to_time(  EXPORTING i_input = total_minutes ).
  ENDMETHOD.
ENDCLASS.
