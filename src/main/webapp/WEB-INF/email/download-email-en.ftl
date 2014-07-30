<!DOCTYPE html>
<html>
<body>
	<style type="text/css">
	a { text-decoration: none; }
	a:hover { text-decoration: underline; }
	a:visited { color: #6a0d00; }
	</style>
	<div style="color: #22241e; font-family: 'Lucida Grande', Arial, Sans-Serif; font-size: 14px; line-height: 1.5em; padding: 18px 36px">
		<p>The data you requested via the <a href="http://www.sibbr.gov.br/portal-biodiversidade" style="color: #a82400;">SiBBr explorer</a> on ${requestTimestampText} are now available for download:</p>
		<a href="${dwcaLink}" style="background: #e7e7e7 url('http://buriti.lncc.br/portal-biodiversidade/common/images/button-dwca.png') top right no-repeat; ; border: 1px solid #a8a7a5; border-radius: 5px; color: #a82400; display: block; height: 48px; font-size: 15px; line-height: 48px; margin: auto; padding: 0 63px 0 15px; text-decoration: none; width: 240px">Download data</a></p>
		<p>We will keep this data package on our servers for one week. To revisit your query, <a href="${requestURL}" style="color: #a82400;">click here</a>.</p>
		<p>The data are packaged as a <strong>Darwin Core archive</strong>, which is a standardized zip file containing the data as a tab-delimited text and the metadata as xml.</p>
		<p>Legally, there are almost no restrictions in how you can use these data (recorded in the <em><a href="http://rs.tdwg.org/dwc/terms/index.htm#dcterms:rights" style="color: #a82400;">rights</a></em> field of every record), as most SiBBr participants have dedicated their data to the <a href="http://creativecommons.org/publicdomain/zero/1.0/" style="color: #a82400;">public domain licence (CC0)</a>. We do request, however, that you follow the <a href="http://www.sibbr.gov.br/termos" style="color: #a82400;">SiBBr data usage terms</a>, which includes giving credit where credit is due. A suggested citation for the current dataset is:</p>
		<p><code>${institutionCodeList}. <a href="http://www.sibbr.gov.br/portal-biodiversidade" style="color: #a82400;">http://www.sibbr.gov.br/portal-biodiversidade</a> (accessed on ${requestTimestamp?date?iso_utc})</code></p>
		<p>For the citation of more specific datasets (e.g. non-aggregated dataset, single specimen), see the <a href="http://www.sibbr.gov.br/termos" style="color: #a82400;">SiBBr data usage terms</a>.</p>
		<p>Thanks,</p>
		<p>The <a href="http://www.SiBBr.net/about/people" style="color: #a82400;">SiBBr team</a></p>
		<img src="http://buriti.lncc.br/portal-biodiversidade/common/images/SiBBr-logo-60.png" alt="SiBBr logo">
		<p><small>SiBBr does not warrant the quality, accuracy, or completeness of any of the Data downloaded and/or retrieved from any of its servers. Such Data are provided on an "AS IS" basis without warranty or condition of any nature. SiBBr disclaims all other warranties, expressed or implied, including but not limited to implied warranties of merchantability and fitness for a particular purpose.</small></p>
<p><small>Furthermore, in no event shall SiBBr or any of their officers, employees or agents be liable for any damages whatsoever in respect of any claim, action, demand or proceeding of any kind arising out or related to your use, inability to use or performance of the Data retrieved.</small></p>
	</div>
</body>
</html>