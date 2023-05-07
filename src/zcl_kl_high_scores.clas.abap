CLASS zcl_kl_high_scores DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
    TYPES integertab TYPE STANDARD TABLE OF i WITH EMPTY KEY.
    METHODS constructor
      IMPORTING
        scores TYPE integertab.

    METHODS list_scores
      RETURNING
        VALUE(result) TYPE integertab.

    METHODS latest
      RETURNING
        VALUE(result) TYPE i.

    METHODS personalbest
      RETURNING
        VALUE(result) TYPE i.

    METHODS personaltopthree
      RETURNING
        VALUE(result) TYPE integertab.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA scores_list TYPE integertab.

ENDCLASS.



CLASS ZCL_KL_HIGH_SCORES IMPLEMENTATION.


  METHOD constructor.
    me->scores_list = scores.
  ENDMETHOD.


  METHOD if_oo_adt_classrun~main.
  ENDMETHOD.


  METHOD latest.
    " add solution here
    DATA(l_line) = lines( me->scores_list ).
    result =  me->scores_list[ l_line  ].

  ENDMETHOD.


  METHOD list_scores.
    " add solution here
    result =  me->scores_list.
  ENDMETHOD.


  METHOD personalbest.
    " add solution here
    result = me->scores_list[ 1 ].
    DATA(ind) = 1 .

    LOOP AT me->scores_list INTO DATA(l_score).
      ind =  COND i( WHEN l_score > result THEN sy-tabix ELSE ind  ) .
      result = COND i( WHEN l_score > result THEN l_score ELSE result  ) .
    ENDLOOP.

    DELETE  me->scores_list[] INDEX ind  .

  ENDMETHOD.


  METHOD personaltopthree.

    " add solution here
    DATA(p1) = me->personalbest(  ).

    IF line_exists( me->scores_list[ 1 ] ).
      DATA(p2) = me->personalbest(  ).
    ELSE.
      result = VALUE integertab( ( p1 )  ).
      RETURN.
    ENDIF.

    IF line_exists( me->scores_list[ 1 ] ).
      DATA(p3) = me->personalbest(  ).
      result = VALUE integertab( ( p1 ) ( p2 ) ( p3 ) ).
    ELSE.
      result = VALUE integertab( ( p1 ) ( p2 ) ).
      RETURN.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
