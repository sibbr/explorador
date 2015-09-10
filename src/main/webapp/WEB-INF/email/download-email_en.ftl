<!DOCTYPE html>
<html>
	<body>
		<style type="text/css">
		a { text-decoration: none; }
		a:hover { text-decoration: underline; }
		a:visited { color: #00A81B; }
		</style>
		<div style="color: #22241e; font-family: 'Lucida Grande', Arial, Sans-Serif; font-size: 14px; line-height: 1.5em; padding: 18px 36px">
			<p>The data you requested via the <a href="http://gbif.sibbr.gov.br/explorador" style="color: #a82400;">SiBBr explorer</a> on ${requestTimestampText} is now available for download:</p>
			<a href="${dwcaLink}" style="background: #D9ECE0 top right no-repeat;border: 1px solid #a8a7a5; border-radius: 5px; color: #15c; display: block; height: 48px; font-size: 15px; line-height: 48px; margin: auto; padding: 0 5px 0 5px; text-decoration: none; width: 140px">Download data</a></p>
			<p>We will keep this data package on our servers for <b>one week</b>. To revisit your query, <a href="${requestURL}" style="color: #15c;">↓click here↓</a>.</p>
			<p>The data is packaged as a <strong>Darwin Core archive</strong>, which is a standardized zip file containing the data as a tab-delimited text and the metadata as xml.</p>
			<p>Legally, there are almost no restrictions in how you can use these data (recorded in the <em><a href="http://rs.tdwg.org/dwc/terms/index.htm#dcterms:rights" style="color: #15c;">rights</a></em> field of every record). We do request, however, that you follow the <a href="http://www.sibbr.gov.br/termos" style="color: #15c;">SiBBr data usage terms</a>, which includes giving credit where credit is due. A suggested citation for the current dataset is:</p>
			<div style="background: #D9ECE0 top right no-repeat;border: 1px solid #a8a7a5; border-radius: 5px; color: #15c; display: block; width: 80%; font-size: 15px; line-height: 20px; margin: auto; padding: 0 0 0 10px;">
				<p><code>${institutionCodeList}. <a href="http://gbif.sibbr.gov.br/explorador" style="color: #a82400;">http://gbif.sibbr.gov.br/explorador</a> (accessed on ${requestTimestamp?date?iso_utc})</code></p>
			</div>
			<p>For the citation of more specific datasets (e.g. non-aggregated dataset, single specimen), see the <a href="http://www.sibbr.gov.br/termos" style="color: #a82400;">SiBBr data usage terms</a>.</p>
			<p><b>The SiBBr team thanks you for your participation.</b></p>
			<p><small>SiBBr does not warrant the quality, accuracy, or completeness of any of the Data downloaded and/or retrieved from any of its servers. Such Data are provided on an "AS IS" basis without warranty or condition of any nature. SiBBr disclaims all other warranties, expressed or implied, including but not limited to implied warranties of merchantability and fitness for a particular purpose.</small></p>
			<p><small>Furthermore, in no event shall SiBBr or any of their officers, employees or agents be liable for any damages whatsoever in respect of any claim, action, demand or proceeding of any kind arising out or related to your use, inability to use or performance of the Data retrieved.</small></p>
		</div>
	</body>
</html>