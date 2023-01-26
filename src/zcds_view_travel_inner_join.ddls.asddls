@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View Entity - Join and where clause'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
-- Two ways of INNER JOIN
-- 1. Access an association in the select instead of the field's list. 
-- 2. using [ inner ] while accessing an association
-- Additional conditions can specified in []
-- inner and addtional conditions can be specified using WHERE keyword
-- inner and conditions will have to be repeated for each field we are accessing

define view entity ZCDS_VIEW_TRAVEL_INNER_JOIN
  as select from ZCDS_VIEW_TRAVEL_ASSOC_TOMANY._book as book
  association[1] to /dmo/customer as _customer 
    on $projection.customer_id = _customer.customer_id 
// ( or) on book.customer_id = _customer.customer_id
{
   key travel_id,
   key booking_id,
       customer_id,
       _customer[ 1:inner where customer_id = '000706' ].first_name,
       _customer[ 1:inner where customer_id = '000706' ].last_name,
       booking_date,
       @Semantics.amount.currencyCode: 'CURRENCY_CODE'
       flight_price,
       currency_code          
} 
