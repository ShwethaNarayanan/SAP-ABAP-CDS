@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View Entity - Join and where clause'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
-- TO ONE : join will not happen if 2nd table fields are not used (if N:1 relation)
/* TO MANY : default if the tables have 1:N relation */

define view entity ZCDS_VIEW_TRAVEL_LEFTJOIN_CAR
  as select from /dmo/flight     as flight
    left outer to one  join   /dmo/connection as con on  flight.carrier_id    = con.carrier_id
                                        and flight.connection_id = con.connection_id
{
  key flight.carrier_id,
  key flight.connection_id,
      flight.currency_code,
      flight.plane_type_id,
      flight.seats_max,
      con.airport_from_id,
      con.airport_to_id,
      50 as capacity
} where flight.carrier_id = 'AA'
