@AbapCatalog.sqlViewName: 'ZDDL_SQLV_APORT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View with SQL view'
define view ZCDS_VIEW_AIRPORT_00 ( Airport_ID, Airport_Name, City, Country ) as
        select from /dmo/airport {
            key airport_id,
            name,          
            city ,         
            country       
        };
