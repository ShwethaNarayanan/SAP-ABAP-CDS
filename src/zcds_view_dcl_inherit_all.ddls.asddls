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


define view entity ZCDS_VIEW_DCL_INHERIT_ALL
  as select from ZCDS_VIEW_TRAVEL_ASSOC_TOMANY
{
  key travel_id,
      agency_id,
      customer_id,
      begin_date,
      end_date,
//      _book.booking_date,
      _book
}
