Changelog FDA Standard Zone version from 2022.1 to 2022.1.2:

Data export StandardZone version 2022.1.1
  * Added externalreference to sz_counterparty
  * Added externalreference to sz_agreement
  * Added externalreference to sz_collateral
  * Added externalreference to sz_collateral_object

Data export StandardZone version 2022.1.2
  * Changed unique key constaints of sz_annualaccountsdetails to a primary key constraint 

Note: 
Since 02-05-2023 all ‘old’ data exports (2022.x) will use this ‘referenceid_old’ and   ‘businessrulereferenceid_old’. This is a ID with the property (varchar16) and is filled with ‘row_number()’, because all referenceid are filled with a UUID and the old ids are also converted to an UUID.
All ‘new’ data exports (>= 2023.x) will use referenceid (UUID). This is a ID with the property (varchar128)