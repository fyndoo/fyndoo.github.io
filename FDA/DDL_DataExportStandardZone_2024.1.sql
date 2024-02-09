-- sz_facilityreference definition

-- Drop table

-- DROP TABLE sz_facilityreference;

CREATE TABLE sz_facilityreference (
	facilityreferenceid varchar(128) NOT NULL,
	CONSTRAINT "PK_szfacilityreferenceid" PRIMARY KEY (facilityreferenceid)
);


-- sz_financials definition

-- Drop table

-- DROP TABLE sz_financials;

CREATE TABLE sz_financials (
	financialsid varchar(128) NOT NULL,
	CONSTRAINT "PK_financialsid" PRIMARY KEY (financialsid)
);


-- sz_metadata definition

-- Drop table

-- DROP TABLE sz_metadata;

CREATE TABLE sz_metadata (
	"key" varchar(128) NOT NULL,
	value varchar(128) NULL,
	description varchar(128) NULL,
	"type" varchar(128) NULL,
	CONSTRAINT "PK_metadata_key" PRIMARY KEY (key)
);


-- sz_user definition

-- Drop table

-- DROP TABLE sz_user;

CREATE TABLE sz_user (
	referenceid varchar(128) NOT NULL,
	username varchar(128) NOT NULL,
	active bool NOT NULL,
	CONSTRAINT "PK_userreferenceid" PRIMARY KEY (referenceid)
);


-- sz_annualaccounts definition

-- Drop table

-- DROP TABLE sz_annualaccounts;

CREATE TABLE sz_annualaccounts (
	annualaccountsid varchar(128) NOT NULL,
	financialsid varchar(128) NOT NULL,
	documenttype varchar(128) NULL,
	CONSTRAINT "PK_sz_annualaccounts" PRIMARY KEY (annualaccountsid),
	CONSTRAINT "FK_sz_financials1" FOREIGN KEY (financialsid) REFERENCES sz_financials(financialsid) ON DELETE CASCADE
);


-- sz_annualaccountsdetails definition

-- Drop table

-- DROP TABLE sz_annualaccountsdetails;

CREATE TABLE sz_annualaccountsdetails (
	annualaccountsid varchar(128) NOT NULL,
	columnenddate date NOT NULL,
	"CashAndEquivalents" float8 NULL,
	"CurrentLiabilities" float8 NULL,
	ebitda float8 NULL,
	"FinancialExpenses" float8 NULL,
	"FinancialFixedAssets" float8 NULL,
	"IntangibleFixedAssets" float8 NULL,
	"Inventories" float8 NULL,
	"MaterialFixedAssets" float8 NULL,
	"MinorityInterests" float8 NULL,
	"NetSales" float8 NULL,
	"NetWorth" float8 NULL,
	"NonCurrentLiabilities" float8 NULL,
	"OperatingIncome" float8 NULL,
	"OtherShortTermDebt" float8 NULL,
	"OverdraftCurrentAccount" float8 NULL,
	"ProfitAfterTax" float8 NULL,
	"Provisions" float8 NULL,
	"Receivables" float8 NULL,
	"SubordinatedDebts" float8 NULL,
	"TotalAssets" float8 NULL,
	"TotalNumberOfEmployees" float8 NULL,
	"TradePayablesTotal" float8 NULL,
	dscr float8 NULL,
	"ValCheck" float8 NULL,
	"QuickRatio" float8 NULL,
	"CurrentRatio" float8 NULL,
	"SolvencyRatio" float8 NULL,
	"InterestCoverageRatio" float8 NULL,
	"ChangeInInventories" float8 NULL,
	"DepreciationOfAssets" float8 NULL,
	"ShareResultMinorityInterest" float8 NULL,
	"CurrentAssets" float8 NULL,
	CONSTRAINT "PK_sz_annualaccountsdetails" PRIMARY KEY (annualaccountsid, columnenddate),
	CONSTRAINT "FK_annualaccounts_details" FOREIGN KEY (annualaccountsid) REFERENCES sz_annualaccounts(annualaccountsid) ON DELETE CASCADE
);


-- sz_counterparty_financials definition

-- Drop table

-- DROP TABLE sz_counterparty_financials;

CREATE TABLE sz_counterparty_financials (
	counterpartyreferenceid varchar(128) NOT NULL,
	financialsid varchar(128) NULL,
	CONSTRAINT "PK_sz_annualaccounts_cp" PRIMARY KEY (counterpartyreferenceid),
	CONSTRAINT "FK_sz_annualaccounts_cp1" FOREIGN KEY (financialsid) REFERENCES sz_financials(financialsid) ON DELETE CASCADE
);


-- sz_periodicstatement definition

-- Drop table

-- DROP TABLE sz_periodicstatement;

CREATE TABLE sz_periodicstatement (
	facilityreferenceid varchar(128) NOT NULL,
	reportreference varchar(255) NOT NULL,
	reportcreationdate date NULL,
	periodtype varchar(255) NOT NULL,
	periodstartdate date NOT NULL,
	periodenddate date NOT NULL,
	balanceatstart numeric(11, 2) NULL,
	balanceatend numeric(11, 2) NULL,
	totalinterestpaid numeric(11, 2) NULL,
	totalinterestchargepaid numeric(11, 2) NULL,
	totalfeespaid numeric(11, 2) NULL,
	totalothercostspaid numeric(11, 2) NULL,
	totaldebit numeric(11, 2) NULL,
	totalcredit numeric(11, 2) NULL,
	CONSTRAINT "PK_sz_periodicstatement" PRIMARY KEY (facilityreferenceid, periodtype, periodenddate),
	CONSTRAINT "FK_sz_facilityreference" FOREIGN KEY (facilityreferenceid) REFERENCES sz_facilityreference(facilityreferenceid) ON DELETE CASCADE
);


-- sz_process definition

-- Drop table

-- DROP TABLE sz_process;

CREATE TABLE sz_process (
	processnumber int8 NOT NULL,
	processname varchar(255) NULL,
	whitelabel varchar(255) NULL,
	contractnumber int8 NULL,
	externalreferencecontract varchar(255) NULL,
	externalreferencerequest varchar(255) NULL,
	processstatus int4 NULL,
	startdatetime timestamp NULL,
	enddatetime timestamp NULL,
	durationtimehours numeric(11, 2) NULL,
	currentstatus varchar(255) NULL,
	loanpassingdate date NULL,
	latestexecutiondate date NULL,
	numberofstatuschanges int4 NULL,
	firsttimeright int4 NULL,
	currency varchar(10) NULL,
	teamcode varchar(255) NULL,
	channel varchar(255) NULL,
	processtype varchar(255) NULL,
	mainadministrator varchar(128) NULL,
	currentstatuscode varchar(255) NULL,
	CONSTRAINT "PK_processnumber" PRIMARY KEY (processnumber),
	CONSTRAINT "FK_mainadministrator_user" FOREIGN KEY (mainadministrator) REFERENCES sz_user(referenceid) ON DELETE CASCADE
);


-- sz_processevents definition

-- Drop table

-- DROP TABLE sz_processevents;

CREATE TABLE sz_processevents (
	processnumber int8 NOT NULL,
	conditionalofferdate timestamp NULL,
	conditionalofferdate_hours numeric(11, 2) NULL,
	bindingofferdate timestamp NULL,
	bindingofferdate_hours numeric(11, 2) NULL,
	processedfinancialfiguresauto bool NULL,
	offersent bool NULL,
	finishedsuccessful bool NULL,
	finishedsuccessfuldate timestamp NULL,
	CONSTRAINT "PK_sz_processevents" PRIMARY KEY (processnumber),
	CONSTRAINT "FK_sz_processevents_process" FOREIGN KEY (processnumber) REFERENCES sz_process(processnumber)
);


-- sz_processstatuschange definition

-- Drop table

-- DROP TABLE sz_processstatuschange;

CREATE TABLE sz_processstatuschange (
	referenceid varchar(128) NOT NULL,
	code varchar(255) NULL,
	"name" varchar(255) NULL,
	status_startdatetime timestamp NULL,
	status_enddatetime timestamp NULL,
	processnumber int8 NOT NULL,
	processstatusgroupname varchar(255) NULL,
	userreferenceid varchar(128) NULL,
	workingdaysinstatus float8 NULL,
	CONSTRAINT "PK_processstatuschange_refid" PRIMARY KEY (referenceid),
	CONSTRAINT "FK_processstatuschange_process" FOREIGN KEY (processnumber) REFERENCES sz_process(processnumber),
	CONSTRAINT "FK_processstatuschange_user" FOREIGN KEY (userreferenceid) REFERENCES sz_user(referenceid) ON DELETE CASCADE
);


-- sz_sli definition

-- Drop table

-- DROP TABLE sz_sli;

CREATE TABLE sz_sli (
	sliid varchar(128) NOT NULL,
	financialsid varchar(128) NOT NULL,
	processnumber int8 NOT NULL,
	documenttype varchar(128) NULL,
	CONSTRAINT "PK_sz_sli" PRIMARY KEY (sliid),
	CONSTRAINT "FK_sz_financials1" FOREIGN KEY (financialsid) REFERENCES sz_financials(financialsid) ON DELETE CASCADE,
	CONSTRAINT "FK_sz_sli_proces" FOREIGN KEY (processnumber) REFERENCES sz_process(processnumber)
);


-- sz_slidetails definition

-- Drop table

-- DROP TABLE sz_slidetails;

CREATE TABLE sz_slidetails (
	sliid varchar(128) NOT NULL,
	columnenddate date NOT NULL,
	"CashAndEquivalents" float8 NULL,
	"CurrentLiabilities" float8 NULL,
	ebitda float8 NULL,
	"FinancialExpenses" float8 NULL,
	"FinancialFixedAssets" float8 NULL,
	"IntangibleFixedAssets" float8 NULL,
	"Inventories" float8 NULL,
	"MaterialFixedAssets" float8 NULL,
	"MinorityInterests" float8 NULL,
	"NetSales" float8 NULL,
	"NetWorth" float8 NULL,
	"NonCurrentLiabilities" float8 NULL,
	"OperatingIncome" float8 NULL,
	"OtherShortTermDebt" float8 NULL,
	"OverdraftCurrentAccount" float8 NULL,
	"ProfitAfterTax" float8 NULL,
	"Provisions" float8 NULL,
	"Receivables" float8 NULL,
	"SubordinatedDebts" float8 NULL,
	"TotalAssets" float8 NULL,
	"TotalNumberOfEmployees" float8 NULL,
	"TradePayablesTotal" float8 NULL,
	dscr float8 NULL,
	"ValCheck" float8 NULL,
	"QuickRatio" float8 NULL,
	"CurrentRatio" float8 NULL,
	"SolvencyRatio" float8 NULL,
	"InterestCoverageRatio" float8 NULL,
	"ChangeInInventories" float8 NULL,
	"DepreciationOfAssets" float8 NULL,
	"ShareResultMinorityInterest" float8 NULL,
	"CurrentAssets" float8 NULL,
	CONSTRAINT "PK_sz_slidetails" PRIMARY KEY (sliid, columnenddate),
	CONSTRAINT "FK_sli_details" FOREIGN KEY (sliid) REFERENCES sz_sli(sliid) ON DELETE CASCADE
);


-- sz_approval definition

-- Drop table

-- DROP TABLE sz_approval;

CREATE TABLE sz_approval (
	referenceid varchar(255) NOT NULL,
	processnumber int8 NOT NULL,
	approvaldate timestamp NULL,
	"name" varchar(255) NULL,
	resultdescription varchar(800) NULL,
	resultcode varchar(20) NULL,
	CONSTRAINT "PK_sz_approval" PRIMARY KEY (referenceid),
	CONSTRAINT "FK_sz_approval_proces" FOREIGN KEY (processnumber) REFERENCES sz_process(processnumber)
);


-- sz_businessrules definition

-- Drop table

-- DROP TABLE sz_businessrules;

CREATE TABLE sz_businessrules (
	referenceid varchar(128) NOT NULL,
	processnumber int8 NOT NULL,
	fiatreferenceid varchar(255) NOT NULL,
	description varchar(1000) NULL,
	initial_result varchar(255) NULL,
	final_result varchar(255) NULL,
	overruled int4 NULL,
	overrule_motivation varchar(4000) NULL,
	rejection_reason varchar(1000) NULL,
	referenceid_sequence varchar(16) NULL,
	CONSTRAINT "PK_sz_businessrules" PRIMARY KEY (referenceid, processnumber, fiatreferenceid),
	CONSTRAINT "FK_sz_approval" FOREIGN KEY (fiatreferenceid) REFERENCES sz_approval(referenceid),
	CONSTRAINT "FK_sz_businessrules_process" FOREIGN KEY (processnumber) REFERENCES sz_process(processnumber)
);


-- sz_businessrules_parameters definition

-- Drop table

-- DROP TABLE sz_businessrules_parameters;

CREATE TABLE sz_businessrules_parameters (
	referenceid varchar(128) NOT NULL,
	businessrulereferenceid varchar(128) NOT NULL,
	processnumber int8 NOT NULL,
	fiatreferenceid varchar(255) NOT NULL,
	parametername varchar(255) NULL,
	numericvalue numeric(19, 5) NULL,
	alfanumericvalue varchar(255) NULL,
	booleanvalue int4 NULL,
	datevalue timestamp NULL,
	businessrulereferenceid_sequence varchar(16) NULL,
	CONSTRAINT "PK_sz_businessrules_parameters" PRIMARY KEY (referenceid, businessrulereferenceid),
	CONSTRAINT "FK_sz_businessrules_parameters" FOREIGN KEY (businessrulereferenceid,processnumber,fiatreferenceid) REFERENCES sz_businessrules(referenceid,processnumber,fiatreferenceid)
);


-- sz_contactperson definition

-- Drop table

-- DROP TABLE sz_contactperson;

CREATE TABLE sz_contactperson (
	referenceid varchar(128) NOT NULL,
	processnumber int8 NOT NULL,
	organisationname varchar(255) NULL,
	emailaddress varchar(255) NULL,
	telephone varchar(255) NULL,
	"type" varchar(255) NULL,
	CONSTRAINT "PK_contactpersonreferenceid" PRIMARY KEY (referenceid),
	CONSTRAINT "FK_process_contactperson" FOREIGN KEY (processnumber) REFERENCES sz_process(processnumber) ON DELETE CASCADE
);


-- sz_counterparty definition

-- Drop table

-- DROP TABLE sz_counterparty;

CREATE TABLE sz_counterparty (
	referenceid varchar(128) NOT NULL,
	processnumber int8 NOT NULL,
	legalentity bool NOT NULL,
	datelastchanged date NOT NULL,
	address varchar(255) NULL,
	postalcode varchar(10) NULL,
	isholding bool NULL,
	counterpartysegmentcode varchar(255) NULL,
	counterpartycategorycode varchar(255) NULL,
	foundationdate date NULL,
	organisationname varchar(255) NULL,
	numberofemployees int4 NULL,
	cocnumber varchar(20) NULL,
	legalform varchar(100) NULL,
	countrycode varchar(25) NULL,
	annualincome numeric(11, 2) NULL,
	employmentstatus varchar(20) NULL,
	sectorcodestandard varchar(100) NULL,
	sectorcodecustom varchar(100) NULL,
	externalreferenceid varchar(128) NULL,
	CONSTRAINT "PK_sz_counterparty" PRIMARY KEY (referenceid, processnumber),
	CONSTRAINT "FK_sz_annualaccounts_cp2" FOREIGN KEY (referenceid) REFERENCES sz_counterparty_financials(counterpartyreferenceid) ON DELETE CASCADE
);


-- sz_counterpartyrating definition

-- Drop table

-- DROP TABLE sz_counterpartyrating;

CREATE TABLE sz_counterpartyrating (
	referenceid varchar(128) NOT NULL,
	processnumber int8 NOT NULL,
	counterpartyreferenceid varchar(128) NOT NULL,
	"RatingType" varchar(255) NULL,
	"RatingValue" varchar(255) NULL,
	pd float8 NULL,
	CONSTRAINT "PK_sz_counterpartyrating" PRIMARY KEY (referenceid, processnumber),
	CONSTRAINT "FK_cprating_counterparty" FOREIGN KEY (counterpartyreferenceid,processnumber) REFERENCES sz_counterparty(referenceid,processnumber) ON DELETE CASCADE
);


-- sz_otherproperties definition

-- Drop table

-- DROP TABLE sz_otherproperties;

CREATE TABLE sz_otherproperties (
	processnumber int8 NOT NULL,
	additionalrentalincome numeric(11, 2) NULL,
	CONSTRAINT "PK_sz_otherproperties" PRIMARY KEY (processnumber),
	CONSTRAINT "FK_sz_otherproperties_process" FOREIGN KEY (processnumber) REFERENCES sz_process(processnumber)
);


-- sz_agreement definition

-- Drop table

-- DROP TABLE sz_agreement;

CREATE TABLE sz_agreement (
	referenceid varchar(128) NOT NULL,
	processnumber int8 NOT NULL,
	whitelabel varchar(255) NOT NULL,
	mainborrowerreferenceid varchar(128) NULL,
	startdate date NOT NULL,
	enddate date NULL,
	reviewdate date NULL,
	agreementperfect bool NULL,
	datelastchanged timestamp NULL,
	externalreferenceid varchar(128) NULL,
	CONSTRAINT "PK_sz_agreement" PRIMARY KEY (referenceid, processnumber),
	CONSTRAINT "FK_agreement_counterparty" FOREIGN KEY (mainborrowerreferenceid,processnumber) REFERENCES sz_counterparty(referenceid,processnumber) ON DELETE CASCADE,
	CONSTRAINT "FK_agreement_process" FOREIGN KEY (processnumber) REFERENCES sz_process(processnumber) ON DELETE CASCADE
);


-- sz_collateral definition

-- Drop table

-- DROP TABLE sz_collateral;

CREATE TABLE sz_collateral (
	referenceid varchar(128) NOT NULL,
	collateraltype varchar(255) NULL,
	agreementreferenceid varchar(128) NOT NULL,
	processnumber int8 NOT NULL,
	definitioncode varchar(255) NULL,
	description varchar(255) NULL,
	valuationdate date NULL,
	valuationcurrency varchar(10) NULL,
	valuationamount numeric(11, 2) NULL,
	externalreferenceid varchar(128) NULL,
	CONSTRAINT "PK_sz_collateral" PRIMARY KEY (referenceid, agreementreferenceid, processnumber),
	CONSTRAINT "FK_collateral_agreement" FOREIGN KEY (agreementreferenceid,processnumber) REFERENCES sz_agreement(referenceid,processnumber) ON DELETE CASCADE
);


-- sz_collateral_object definition

-- Drop table

-- DROP TABLE sz_collateral_object;

CREATE TABLE sz_collateral_object (
	referenceid varchar(128) NOT NULL,
	collateralreferenceid varchar(128) NULL,
	agreementreferenceid varchar(128) NOT NULL,
	processnumber int8 NOT NULL,
	postalcode varchar(255) NULL,
	place varchar(255) NULL,
	marketvalue numeric(11, 2) NULL,
	purchasevalue numeric(11, 2) NULL,
	executionvalue numeric(11, 2) NULL,
	energylabel varchar(25) NULL,
	sequenceid int4 NULL,
	externalreferenceid varchar(128) NULL,
	propertyspecifications varchar(255) NULL,
	insurance varchar(255) NULL,
	constructionyear int4 NULL,
	leasehold int4 NULL,
	leaseholdenddate date NULL,
	propertysurface numeric(11, 2) NULL,
	officespacesurface numeric(11, 2) NULL,
	street varchar(255) NULL,
	country varchar(255) NULL,
	"rank" int4 NULL,
	prioramount numeric(11, 2) NULL,
	CONSTRAINT "PK_sz_collateral_object" PRIMARY KEY (referenceid, agreementreferenceid, processnumber),
	CONSTRAINT "FK_collateral_object" FOREIGN KEY (collateralreferenceid,agreementreferenceid,processnumber) REFERENCES sz_collateral(referenceid,agreementreferenceid,processnumber) ON DELETE CASCADE
);


-- sz_collateral_object_rental definition

-- Drop table

-- DROP TABLE sz_collateral_object_rental;

CREATE TABLE sz_collateral_object_rental (
	referenceid varchar(128) NOT NULL,
	collateral_objectreferenceid varchar(128) NOT NULL,
	agreementreferenceid varchar(128) NOT NULL,
	processnumber int8 NOT NULL,
	regulatedproperty int4 NULL,
	pointscoreforregulatedrent numeric(9, 5) NULL,
	admissiblemonthlyrent numeric(11, 2) NULL,
	coldrentpermonth numeric(11, 2) NULL,
	marketbasedrent numeric(11, 2) NULL,
	totalrentpermonth numeric(11, 2) NULL,
	totalrentperyear numeric(11, 2) NULL,
	sequenceid int4 NULL,
	CONSTRAINT "PK_sz_collateral_object_rental" PRIMARY KEY (referenceid, processnumber),
	CONSTRAINT "FK_collateral_object_rental" FOREIGN KEY (collateral_objectreferenceid,agreementreferenceid,processnumber) REFERENCES sz_collateral_object(referenceid,agreementreferenceid,processnumber) ON DELETE CASCADE
);


-- sz_collateral_object_taxation definition

-- Drop table

-- DROP TABLE sz_collateral_object_taxation;

CREATE TABLE sz_collateral_object_taxation (
	referenceid varchar(128) NOT NULL,
	collateral_objectreferenceid varchar(128) NOT NULL,
	agreementreferenceid varchar(128) NOT NULL,
	processnumber int8 NOT NULL,
	valuationdate date NULL,
	valuationmethod varchar(255) NULL,
	valuationvaluetype varchar(255) NULL,
	valuationvalue numeric(11, 2) NULL,
	marketvaluecurrentstate numeric(11, 2) NULL,
	correctionpercentage float8 NULL,
	sequenceid int4 NULL,
	CONSTRAINT "PK_sz_collateral_object_val" PRIMARY KEY (referenceid),
	CONSTRAINT "FK_collateral_object_taxation" FOREIGN KEY (collateral_objectreferenceid,agreementreferenceid,processnumber) REFERENCES sz_collateral_object(referenceid,agreementreferenceid,processnumber) ON DELETE CASCADE
);


-- sz_facility definition

-- Drop table

-- DROP TABLE sz_facility;

CREATE TABLE sz_facility (
	referenceid varchar(128) NOT NULL,
	mainfacilityreferenceid varchar(128) NULL,
	agreementreferenceid varchar(128) NOT NULL,
	processnumber int8 NOT NULL,
	productname varchar(255) NULL,
	productdefinitioncode varchar(255) NULL,
	repaymenttype varchar(255) NULL,
	agreedlimitamount numeric(11, 2) NULL,
	agreedlimitcurrency varchar(10) NULL,
	limitamount numeric(11, 2) NULL,
	limitcurrency varchar(10) NULL,
	facilitystartdate date NULL,
	facilityduration int4 NULL,
	facilityenddate date NULL,
	facilityaccountnumber varchar(255) NULL,
	fixedrateperiod float8 NULL,
	floor float8 NULL,
	indicativebaserate float8 NULL,
	indicativeinterestmargin float8 NULL,
	liquidityspread float8 NULL,
	offerbaserate float8 NULL,
	offerinterestmargin float8 NULL,
	offerinterestcorrection float8 NULL,
	loantovalue float8 NULL,
	annualinterestrate float8 NULL,
	annualannuity float8 NULL,
	redemptionatstartmonth float8 NULL,
	annualrentalincomesurplus float8 NULL,
	interestcoveragerationarrow float8 NULL,
	interestcoverageratiobroad float8 NULL,
	debtservicecoverageratio float8 NULL,
	reversionmargininterestrate float8 NULL,
	borrowerfee float8 NULL,
	interestreferencedate date NULL,
	interestproductstartdate date NULL,
	firstinterestpaymentdate date NULL,
	interestproductenddate date NULL,
	firstrepaymentdate date NULL,
	repaymentfrequency varchar(255) NULL,
	discountrate float8 NULL,
	discounttype varchar(20) NULL,
	nominalratebeforediscount float8 NULL,
	interestratename varchar(128) NULL,
	interestratecode varchar(128) NULL,
	interesttype varchar(128) NULL,
	tenantformattedreferenceid varchar(128) NULL,
	externalreferenceid varchar(128) NULL,
	parenttenantformattedreferenceid varchar(128) NULL,
	parentexternalreferenceid varchar(128) NULL,
	discounttypecomment varchar(255) NULL,
	CONSTRAINT "PK_sz_facility" PRIMARY KEY (referenceid, processnumber),
	CONSTRAINT "FK_facility_agreement" FOREIGN KEY (agreementreferenceid,processnumber) REFERENCES sz_agreement(referenceid,processnumber) ON DELETE CASCADE,
	CONSTRAINT "FK_sz_facilityreference2" FOREIGN KEY (referenceid) REFERENCES sz_facilityreference(facilityreferenceid) ON DELETE CASCADE
);


-- sz_fee_agreement definition

-- Drop table

-- DROP TABLE sz_fee_agreement;

CREATE TABLE sz_fee_agreement (
	referenceid varchar(128) NOT NULL,
	processnumber int8 NOT NULL,
	agreementreferenceid varchar(128) NOT NULL,
	"name" varchar(255) NULL,
	startdate date NULL,
	fiatamountofthefee float8 NULL,
	offeramountofthefee float8 NULL,
	fiatpercentageofthefee float8 NULL,
	offerpercentageofthefee float8 NULL,
	frequency varchar(255) NULL,
	daycountconvention varchar(255) NULL,
	CONSTRAINT "PK_sz_fee_agreement" PRIMARY KEY (referenceid, processnumber),
	CONSTRAINT "FK_fee_agreement" FOREIGN KEY (agreementreferenceid,processnumber) REFERENCES sz_agreement(referenceid,processnumber) ON DELETE CASCADE
);


-- sz_fee_facility definition

-- Drop table

-- DROP TABLE sz_fee_facility;

CREATE TABLE sz_fee_facility (
	referenceid varchar(128) NOT NULL,
	processnumber int8 NOT NULL,
	facilityreferenceid varchar(128) NOT NULL,
	"name" varchar(255) NULL,
	startdate date NULL,
	fiatamountofthefee float8 NULL,
	offeramountofthefee float8 NULL,
	fiatpercentageofthefee float8 NULL,
	offerpercentageofthefee float8 NULL,
	frequency varchar(255) NULL,
	daycountconvention varchar(255) NULL,
	CONSTRAINT "PK_sz_fee_facility" PRIMARY KEY (referenceid, processnumber),
	CONSTRAINT "FK_fee_facility" FOREIGN KEY (facilityreferenceid,processnumber) REFERENCES sz_facility(referenceid,processnumber) ON DELETE CASCADE
);


-- sz_financinggoal definition

-- Drop table

-- DROP TABLE sz_financinggoal;

CREATE TABLE sz_financinggoal (
	referenceid varchar(128) NOT NULL,
	agreementreferenceid varchar(128) NOT NULL,
	processnumber int8 NOT NULL,
	definitioncode varchar(255) NULL,
	description varchar(255) NULL,
	CONSTRAINT "PK_sz_financinggoal" PRIMARY KEY (referenceid, processnumber),
	CONSTRAINT "FK_financinggoal_agreement" FOREIGN KEY (agreementreferenceid,processnumber) REFERENCES sz_agreement(referenceid,processnumber) ON DELETE CASCADE
);


-- sz_relation definition

-- Drop table

-- DROP TABLE sz_relation;

CREATE TABLE sz_relation (
	agreementreferenceid varchar(128) NULL,
	processnumber int8 NOT NULL,
	counterpartyreferenceid varchar(128) NOT NULL,
	borrowerrelationtype varchar(128) NULL,
	referenceid varchar(128) NOT NULL,
	CONSTRAINT "PK_sz_relation" PRIMARY KEY (referenceid, processnumber),
	CONSTRAINT "FK_relation_agreement" FOREIGN KEY (agreementreferenceid,processnumber) REFERENCES sz_agreement(referenceid,processnumber) ON DELETE CASCADE
);