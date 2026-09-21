Changelog FDA Standard Zone version from 2026.1 to 2026.2:

# Work in progress (only avaible on UAT)

# Since release Data Analytics 2026.15

### Tables added:
* Added table sz_constructionaccount_declaration
* Added table sz_financingsubgoal

### Columns Added
* Added extra fields in table sz_counterparty
    - firstname
    - initials
    - surnameprefix
    - surname
    - nationality
    - maritalstatus
    - divorceddate
    - telephoneprivate
    - telephonemobile
    - telephonework
    - emailaddress
    - identificationtype
    - identificationnumber
    - identificationexpirydate
* Added extra fields in table sz_collateral_object
    - leaseholdiseverlasting
    - canonannualamount
    - percentageforrent
* Added extra fields in table sz_counterpartyrating
  - referencedate
* Added extra fields in table sz_facility
  - firstmonthlypayment
  - netrentalincomedebtyield

# Since release Data Analytics 2026.16

### Tables added:
* Added table sz_periodicstatement_futureobligationdepot

### Columns Added/Changed
* Change in table sz_periodicstatement
  - Added column totalclosingfee
  - Delete column totalothercostspaid

* Change in sz_periodicstatement_agreementlevel
  - Added column totalclosingfee
  - Delete column totalothercostspaid