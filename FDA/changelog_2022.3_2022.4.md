Changelog FDA Standard Zone version from 2022.3 to 2022.4:

* Changes in table 'sz_facility'
  * Added column 'offerinterestcorrection'

* Added table 'sz_businessrules_parameters'

* Added table 'sz_approval'
  
* Changes in table 'sz_processevents'
  * Added column finishedsuccessful
  * Added column finishedsuccessfuldate

Note: 
Since 02-05-2023 all ‘old’ data exports (2022.x) will use this ‘referenceid_old’ and   ‘businessrulereferenceid_old’. This is a ID with the property (varchar16) and is filled with ‘row_number()’, because all referenceid are filled with a UUID and the old ids are also converted to an UUID.
All ‘new’ data exports (>= 2023.x) will use referenceid (UUID). This is a ID with the property (varchar128)