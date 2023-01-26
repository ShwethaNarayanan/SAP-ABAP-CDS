CLASS zcl_cds_travel_assoc_joins DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_cds_travel_assoc_joins IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

* Inner Join if the association is accessed in the from clause like in the CDS entity.
* Alias name must when the associations are accessed in the FROM clause.

    SELECT FROM ZCDS_VIEW_TRAVEL_assoc_tomany\_book as book
           FIELDS *
           INTO TABLE @DATA(lt_travel1).
    IF sy-subrc = 0.
*      out->write( lt_travel1 ).
    ENDIF.

* Accessing Association in the FIELDS - LEFT OUTER JOIN

    SELECT FROM ZCDS_VIEW_TRAVEL_assoc_tomany
           FIELDS travel_id, agency_id, \_book-booking_id,\_book-carrier_id
           INTO TABLE @DATA(lt_travel2).
    IF sy-subrc = 0.
*     out->write( lt_travel2 ).
    ENDIF.

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
                                        and carrier_id = 'AA' ]-FLIGHT_PRICE
           INTO TABLE @DATA(lt_travel3).
    IF sy-subrc = 0.
      out->write( lt_travel3 ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
