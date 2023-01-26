CLASS zcl_cds_travel_assoc_curr_conv DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    DATA: currency TYPE c LENGTH 5 VALUE ' CAD'.
    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_cds_travel_assoc_curr_conv IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

* Accessing Association in the FIELDS - specifying cardinality, filter condition
* and JOIN condition. Same conditions should be passed for each field

    SELECT FROM ZCDS_VIEW_TRAVEL_assoc_tomany
           FIELDS travel_id,
                  agency_id,
                  \_book[ (1) INNER where FLIGHT_PRICE > 500
                                      and carrier_id = 'AA' ]-booking_id,
                  \_book[ (1) INNER where FLIGHT_PRICE > 500
                                       and carrier_id = 'AA' ]-carrier_id,
                  \_book[ (1) INNER where FLIGHT_PRICE > 500
                                        and carrier_id = 'AA' ]-FLIGHT_PRICE,
                  currency_conversion( amount = \_book-flight_price,
                                       source_currency = \_book-currency_code,
                                       target_currency =   @currency  ,
                                       exchange_rate_date = @sy-datum ) as converted_amt,
*                      on_error = @sql_currency_conversion=>c_on_error-set_to_null ) as converted_amt,
                  @currency AS converted_currency
           INTO TABLE @DATA(lt_travel).
    IF sy-subrc = 0.
      out->write( lt_travel ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
