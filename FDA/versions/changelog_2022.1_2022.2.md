Changelog FDA Standard Zone version from 2022.1 to 2022.2:
-
* Removed all columns with the name 'modified' and 'created' in the following tables:
  * sz_agreement
  * sz_businessrules
  * sz_collateral
  * sz_collateral_object
  * sz_collateral_object_rental
  * sz_contactperson
  * sz_counterparty
  * sz_counterpartyrating
  * sz_facility
  * sz_financinggoal
  * sz_otherproperties
  * sz_processevents
  * sz_relation
  * sz_user

* Fees the table 'sz_fee' is split in two tables
  * sz_fee_agreement
  * sz_fee_facility

* Changes in table 'sz_annualaccounts'
  * column 'documenttype' added

* Changes in table 'sz_annualaccountsdetails'
  * rename 'SubordinatedDebt' to 'SubordinatedDebts'
  * column 'ChangeInInventories' added
  * column 'DepreciationOfAssets' added
  * column 'ShareResultMinorityInterest' added
  * column 'CurrentAssets' added

* Changes in table 'sz_collateral_object'
  * column 'propertyspecifications' added
  * column 'insurance' added
  * column 'constructionyear' added
  * column 'leasehold' added
  * column 'leaseholdenddate' added
  * column 'propertysurface' added
  * column 'officespacesurface' added
  * column 'street' added
  * column 'country' added
  * column 'rank' added
  * column 'prioramount' added

* Changes in table 'sz_facility'  
  * column 'interestratename' added
  * column 'interestratecode' added
  * column 'interesttype' added
  
* added extra table 'sz_collateral_object_rental'


Note: 
Since 02-05-2023 all ‘old’ data exports (2022.x) will use this ‘referenceid_old’ and   ‘businessrulereferenceid_old’. This is a ID with the property (varchar16) and is filled with ‘row_number()’, because all referenceid are filled with a UUID and the old ids are also converted to an UUID.
All ‘new’ data exports (>= 2023.x) will use referenceid (UUID). This is a ID with the property (varchar128)

	