FDA Standard Zone version 2022.3:

* Foreignkey constraint 'sz_counterparty'
  * Removed FK on 'externalreferenceid' 
  * Add FK on 'referenceid' 

* Changes in table 'sz_annualaccountsdetails'
  * rename 'documentid' to 'annualaccountsid'

* Changes in table 'sz_annualaccounts'
  * rename 'documentid' to 'annualaccountsid'
  * rename 'counterpartyreferenceid' to 'financialsid'
  
* added extra table 'sz_financials'
  * Column 'financialsid' is used as many-to-many relation
  
* added extra table 'sz_annualaccounts_counterpart'
  * Table is used to connect data from Fyndoo Lending to Fyndoo Financials
  * Column 'counterpartyreferenceid' is primarykey
  * Column 'financialsid' is the reference to data in Fyndoo Financials
  * Column 'financialsid' can be empty, when no data is available for the counterparty in Fyndoo Financials
  * Column 'financialsid' has no unique constraint, so multiple counterpartyreferenceid can be linked to the same financialsid





	