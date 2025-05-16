Changelog FDA Standard Zone version from 2024.2 to 2024.3:

* Added table sz_statuschangedefinition 
* Added table sz_workflowprocessdefinition 
* Added table sz_workflowstatusdefinition
 
* Added columns to table sz_processstatuschange
  * statuschangereferenceid (with a reference to table sz_statuschangedefinition)
  * statusgroupname (rename of processstatusgroupname)

* Added columns to table sz_process:
  * currentstatusgroupname
  * referenceid

* Added columns to table sz_processevents:
  * readyforfiling
  * readyforfilingdate

* Added columns to table sz_collateral
  * amortizationfrequency 
  * firstreductiondatestrategy
  * amortizationtype
  * numberofperiods
  * firstreductiondate 

* Added columns to table sz_collateral_object
  * colllateraltype 
  * colllateraltypecode 
  * colllateraltypecategory 

* Added columns to table sz_collateral_object_taxation
  * valuercompany 
  * valuername 

* change sz_calcmodel_customerbaseddetails.stringvalue from varchar(128) to varchar(255)
* change sz_calcmodel_processbaseddetails.stringvalue from varchar(128) to varchar(255)