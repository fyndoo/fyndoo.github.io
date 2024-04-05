Changelog FDA Standard Zone version from 2024.1 to 2024.2:

* Added table sz_calcmodel_processbased 
  - This are all models which are related to a proces 
  - All models except models which are annualaccounts related, this info is available in other tables (e.g. sz_annnualaccounts)
  - only documents which are *not* marked as deleted)
* Added table sz_calcmodel_processbaseddetails 

* Added table sz_calcmodel_customerbased 
  - This are all models which are related to a customer 
  - All models except models which are annualaccounts related, this info is available in other tables (e.g. sz_annnualaccounts)
  - only documents which are *not* marked as deleted)
* Added table sz_calcmodel_customerbaseddetails 

* Added column sz_annualaccountsdetails.currency
* Added column sz_annualaccountsdetails.TotalEquityAndLiabilities
* Added column sz_annualaccountsdetails.STPartOfLTDebts

* Added column sz_slidetails.currency
* Added column sz_slidetails.TotalEquityAndLiabilities
* Added column sz_slidetails.STPartOfLTDebts


