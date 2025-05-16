Changelog FDA Standard Zone version from 2024.3 to 2025.1:

* Added table sz_financialstate 
* Added table sz_counterparty_fiscal_info

* Added columns to table sz_workflowprocessdefinition
  * beginstatus

* Changed columns of table sz_periodicstatement
  * reportcreationdate from date to timestamp

* Added columns to table sz_process
  * tenantformattedreferenceid

* Added columns to table sz_processstatuschange
  * fromreferenceid
  * toreferenceid
  * REMOVED: statuschangereferenceid
  
* Added columns to table sz_counterparty
  * street
  * housenumber
  * housenumberaddition
  * city
  * country
  * tenantformattedreferenceid

* Added columns to table sz_agreement
  * tenantformattedreferenceid

* Added columns to table sz_facility
  * mutationtype