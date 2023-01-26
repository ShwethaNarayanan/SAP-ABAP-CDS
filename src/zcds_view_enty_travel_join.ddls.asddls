@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View Entity - Join and where clause'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZCDS_VIEW_ENTY_TRAVEL_JOIN
  as select from /dmo/flight     as flight
    inner join   /dmo/connection as con on  flight.carrier_id    = con.carrier_id
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
