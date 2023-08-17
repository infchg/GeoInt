
## YAML proposal contribution to the ICAO, WTO, IATA's advances on Alignment, Cooperation, Efficiency.

This proposed improvement relates to PASSENGER DATA. Electronic data concerning passengers’ identity (API) or travel reservations (PNR) which is used by public authorities for border control.

### Add Modern Format/Tools compatible with traditional ones

Compared to traditional handling of PNR records (EDifact, XML.. or this Worldspan PNR net fare data:)

			<AccountingRemark TypeInGds="NetFare/VC/CAR" ProviderCode="1P">
			    <RemarkData>NetAmount123/CarCode12/ 1001002IATAnumber</RemarkData>
			 </AccountingRemark>

This use of YAML allows improved performance and fast processing by re-using modern yaml tools:

	AccountingRemark:
	  '@TypeInGds': NetFare/VC/CAR
	  '@ProviderCode': 1P
	  RemarkData: NetAmount123/CarCode12/ 1001002IATAnumber

Hence, locating data not only via JQuery but also enhanced searches using JmesPath and YQuery. 

### Enhanced processing of PNR Credit Card data

Another improvements on Credit card authorization inside PNR, from traditional (related to published complaints on uncensored card number found after a filled FOIA request). 

Locating /UniversalRecord /AirReservation /CreditCardAuth @Amount @AuthCode ... in Yaml vs Xml:

        <CreditCardAuth Number="************1111" Amount="USD981.80" AuthCode="1234" AuthResultCode="approved"/>
 
The yaml bi-directional format processing shown here (C.J. ) achieves faster crawling of PNR records:

	CreditCardAuth:
	  '@Number': '************1111'
	  '@Amount': USD981.80
	  '@AuthCode': '1234'
	  '@AuthResultCode': approved

Allowing processing by the latest yq tools used in modern Apps & Kubernetes, Aws, Gcp, Azure,...

~~~bash
xq . PNR.xml --yaml-output | yq -r '.CreditCardAuth."@Number"' #% extract number
	************1111
~~~


![](https://miro.medium.com/v2/resize:fit:700/1*L-0XyS2_dkJhX43lG2oNzw.png)


### References

This document listed last ( InfChg/GeoInt for Safe & Security of Personnel & Users )

- CBP  [https://www.cbp.gov/site-policy-notices/foia](https://www.cbp.gov/site-policy-notices/foia) let travelers access to his or her PNR held by DHS  under the Freedom of Information Act (FOIA).  Individuals submit a FOIA request to CBP  
- https://support.travelport.com/webhelp/Smartpoint1G1V/Content/PNR/PNR_ActionBar/Viewing_Recent_PNRs.htm 
- https://www.pass-consulting.com/en/industries/travel/pnr-management/ 
- updated US-EU PNR Agreements 2011, and EU & US CFR § 122.49d regulations https://www.law.cornell.edu/cfr/text/19/122.49d  and  passengerdata@iata.org
- https://support.travelport.com/webhelp/uapi/Content/Booking/UniversalRecord/Importing_PNRs.htm
- yq images from https://betterprogramming.pub/my-yq-cheatsheet-34f2b672ee58
- C.J.,InfChg, Propose modern improvements (yaml) to Retrieve PNRs from multi-GDS hub Amadeus, Sabre, Travelport, Galileo (1G), Apollo (1V), Worldspan,  ACH , RCH, @ Github.com/InfChg 2020

