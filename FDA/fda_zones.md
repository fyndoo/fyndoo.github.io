## FDA uses different zones
Below a description of the different zones.

### Landing zone ingestion 
 
Characteristics: 
* for internal usage (e.g. to fill standard zone)
* a variety of data with high velocity satisfying both batch and stream use cases. 
* preserve the source data in its native format (no transformations) 
* clone of original data to prevent timing and performance issues
`

### Standard zone 

Characteristics:
*	A formatted standardized zone (the configuration in Fyndoo is different for each customer, 
    but all data and configuration is modelled in one 'standard Fyndoo data model')
*	can be used for external usage or can as intermediary staging standard for the report zone
*	It is accompanied by standardization related transformations 
*	Data quality checks are performed (e.g. unique key constraints in data model).
*   Every white label has its own database schema

The documentation of the versioned CSV export of the standard zone can be found [here](overview_versions.md)
       
### Report / consumption zone

Characteristics:
*	A consumption zone is the ultimate user facing zone 
*	Use case driven end data products with required transformations
*	Obfuscation of sensitive data. 
*	Examples 
    *	CSV export of standardZone versioned
    *	Excel export of pipeline report
    *	Excel export of Assets under management
    *	Dashboards in superset
