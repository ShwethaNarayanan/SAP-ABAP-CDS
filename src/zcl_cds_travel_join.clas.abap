CLASS zcl_cds_travel_join DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_cds_travel_join IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    SELECT FROM zcds_view_enty_travel_join
           FIELDS *
           INTO TABLE @DATA(lt_travel).

    IF sy-subrc = 0.
      out->write( lt_travel ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.
