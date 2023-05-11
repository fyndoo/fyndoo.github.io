Changelog FDA Standard Zone version from 2022.4 to 2023.1:

Changed columntype:
* sz_businessrules.referenceid from varchar(16) to varchar(128)
* sz_businessrules_parameters.referenceid from varchar(16) to varchar(128)
* sz_businessrules_parameters.businessrulereferenceid from varchar(16) to varchar(128)
* sz_processstatuschange.referenceid from int4 to varchar(128)
* sz_processstatuschange.userreferenceid from int8 to varchar(128)
* sz_user.referenceid from int8 to varchar(128)

Added columns to table sz_facilitiy:
* tenantformattedreferenceid	
* externalreferenceid	
* parenttenantformattedreferenceid
* parentexternalreferenceid

Added columns to table sz_financinggoal:
* description

Added columns to table sz_process:
* latestexecutiondate
* processtype
* mainadministrator