CLASS zcl_cds_travel_assoc_tomany DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_cds_travel_assoc_tomany IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    SELECT FROM ZCDS_VIEW_TRAVEL_assoc_tomany
           FIELDS travel_id,
                  agency_id,
                  begin_date,
                  end_date,
                  \_book-customer_id
           INTO TABLE @DATA(lt_travel).
    IF sy-subrc = 0.
      out->write( lt_travel ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
