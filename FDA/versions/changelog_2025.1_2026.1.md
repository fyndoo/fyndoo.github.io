Changelog FDA Standard Zone version from 2025.1 to 2026.1:

Tables
* removed table sz_facilityreference (is replaced by sz_facility_periodicstatement)
* Added table sz_facility_periodicstatement
* Added table sz_financialstate_agreementlevel
* Added table sz_periodicstatement_agreementlevel
* Added table sz_agreement_periodicstatement
* Added table sz_collateral_object_monumentregistration
* Added table sz_funder
* Added table sz_fundingaccount
* Added table sz_fundingaccount_periodicstatement

Columns
* Added column prepaidAmountInCurrentYear in table sz_financialstate
* Removed column sz_statuschangedefinition in table sz_statuschangedefinition
  Primairy key now is PRIMARY KEY (fromreferenceid, toreferenceid)
* Renamed column country in table sz_counterparty to countryofaddress
* Added columns in table sz_counterparty:
  * countrycodeofaddress 
  * gender 
	* islatestapprovedversion
	* preferredname 
	* dateofbankruptcy 
	* dateofdeath 
	* province 
* Removed column sequenceid in table sz_collateral_object
* Added columns in table sz_collateral_object
  * energylabelafterrenovation
  * monumenttype
  * province
* Removed column borrowerfee in table sz_facility
* Added columns in table sz_facility:
  * blockingamount
  * blockingamountmotivation
* Added columns in table sz_collateral_object_rental:
  * collateralreferenceid
    and changed relation between sz_collateral_object_rental and sz_collateral_object 
    (agreementreferenceid removed and collateralreferenceid added to foreignkey)
* Added columns in table sz_collateral_object_taxation:
  * collateralreferenceid
    and changed relation between sz_collateral_object_rental and sz_collateral_object
      (agreementreferenceid removed and collateralreferenceid added to foreignkey)
* Added column DebtToEBITDA to table sz_slidetails 
* Added column DebtToEBITDA to table sz_annualaccountsdetails 

* Removed 'agreementreferenceid' from PK_sz_collateral_object
* Removed UK_sz_collateral_object (is now the same as PK_sz_collateral_object)
* All currency fields are now numeric(19, 2) this was (11, 2)