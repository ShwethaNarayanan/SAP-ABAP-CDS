CLASS zcl_cds_travel_assoc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_cds_travel_assoc IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    SELECT FROM ZCDS_VIEW_TRAVEL_assoc
           FIELDS carrier_id,
                  connection_id,
                  flight_date,
                  currency_code,
                  plane_type_id,
                  seats_max,
                  \_con-airport_from_id,
                  \_con-airport_to_id
           INTO TABLE @DATA(lt_travel).
    IF sy-subrc = 0.
      out->write( lt_travel ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
