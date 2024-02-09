Changelog FDA Standard Zone version from 2023.2 to 2024.1:

* Added table sz_sli 

* Added table sz_slidetails (only documents which are *not* marked as deleted)

* Changed default value of table sz_annualaccountsdetails.columnenddate to NULL

* Added column sz_periodicstatement.totaldebit
* Added column sz_periodicstatement.totalcredit
* Added column sz_process.currentstatuscode
* Added column sz_facilitydiscounttypecomment

Note: 
* SLI = statement after loan issueing, in Dutch 'Balans na kredietverlening'

* Also for sz_annaualaccountsdetails only documents which are *not* marked as deleted are exported. This extra filter is added in februari 2024 for all exports