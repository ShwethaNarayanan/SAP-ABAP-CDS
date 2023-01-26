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
-- Annotations: to change text

define view entity ZCDS_VIEW_TRAVEL_ASSOC_TOMANY
  as select from /dmo/travel as travel
  association [1..*] to /dmo/booking as _book 
  on travel.travel_id = _book.travel_id
  with default filter _book.flight_price > 600
{
    @EndUserText.label: 'Travel ID'
    @EndUserText.quickInfo: 'Travel ID'
  key travel_id,
    @EndUserText.label: 'Agency ID'
    @EndUserText.quickInfo: 'Agency ID'  
      agency_id,
      customer_id,
      begin_date,
      end_date,
//      _book.booking_date,
      _book
}
