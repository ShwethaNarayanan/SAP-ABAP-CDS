CLASS zcl_cds_travel_join_param DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_cds_travel_join_param IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    SELECT FROM ZCDS_enty_TRAVEL_JOIN_param( P_CARRIER_ID = 'AA' )
           FIELDS *
           INTO TABLE @DATA(lt_travel).

    IF sy-subrc = 0.
      out->write( lt_travel ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.
