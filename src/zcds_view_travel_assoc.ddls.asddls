@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View Entity - Join and where clause'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
-- association - join on demand
-- adhoc association : when the fields are called in the view
-- exposed association : when the structure is just defined and no fields are called

define view entity ZCDS_VIEW_TRAVEL_assoc
  as select from /dmo/flight     as flight
    association[1..1] to /dmo/connection as _con 
            on  flight.carrier_id    = _con.carrier_id
            and flight.connection_id = _con.connection_id
{
  key carrier_id,
  key connection_id,
  key flight_date,
      currency_code,
      plane_type_id,
      seats_max,
      _con   
} 
