<!DOCTYPE html>
<html>
<body>
	<style type="text/css">
	a { text-decoration: none; }
	a:hover { text-decoration: underline; }
	a:visited { color: #6a0d00; }
	</style>
	<div style="color: #22241e; font-family: 'Lucida Grande', Arial, Sans-Serif; font-size: 14px; line-height: 1.5em; padding: 18px 36px">
		<p>Los datos que ha solicitado a través de la <a href="http://www.sibbr.gov.br/explorador" style="color: #a82400;">explorador SiBBr </a> on ${requestTimestampText}están ahora disponibles para su descarga:</p>
		<a href="${dwcaLink}" style="background: #e7e7e7 url('http://buriti.lncc.br/explorador/common/images/button-dwca.png') top right no-repeat; ; border: 1px solid #a8a7a5; border-radius: 5px; color: #a82400; display: block; height: 48px; font-size: 15px; line-height: 48px; margin: auto; padding: 0 63px 0 15px; text-decoration: none; width: 240px">Download data</a></p>
		<p>Vamos a mantener este paquete de datos en nuestros servidores durante una semana. Para volver a la consulta, <a href="${requestURL}" style="color: #a82400;">haga clic aquí</a>.</p>
		<p>Los datos se empaquetan como un <strong>Darwin Core Archive</strong>, que es un archivo .zip que contiene los datos estandarizado como un texto delimitado por tabuladores y los metadatos como XML.</p>
		<p>Legalmente, casi no hay restricciones en cómo se pueden utilizar estos datos (registrados en el <em><a href="http://rs.tdwg.org/dwc/terms/index.htm#dcterms:rights" style="color: #a82400;">derechos</a></em> campo de cada registro), como la mayoría de los participantes SiBBr han dedicado sus datos a la <a href="http://creativecommons.org/publicdomain/zero/1.0/" style="color: #a82400;">public domain licence (CC0)</a>. We do request, however, that you follow the <a href="http://www.sibbr.gov.br/termos" style="color: #a82400;">SiBBr data usage terms</a>, which includes giving credit where credit is due. A suggested citation for the current dataset is:</p>
		<p><code>${institutionCodeList}. <a href="http://www.sibbr.gov.br/explorador" style="color: #a82400;">http://www.sibbr.gov.br/explorador</a> (accessed on ${requestTimestamp?date?iso_utc})</code></p>
		<p>Para la cita de los conjuntos de datos más específicos (por ejemplo, el conjunto de datos no agregada, solo espécimen), consulte los <a href="http://www.sibbr.gov.br/termos" style="color: #a82400;">términos de uso de datos de SiBBr</a>.</p>
		<p>Thanks,</p>
		<p>The <a href="http://www.SiBBr.net/about/people" style="color: #a82400;">SiBBr team</a></p>
		<img src="http://buriti.lncc.br/explorador/common/images/SiBBr-logo-60.png" alt="SiBBr logo">
		<p><small>SiBBr no garantiza la calidad, exactitud o integridad de cualquiera de los datos descargados y / o recuperados de cualquiera de sus servidores. Estos datos se proporcionan en una "TAL CUAL", sin garantía ni condición de ningún tipo. SiBBr niega cualquier otra garantía, expresa o implícita, incluyendo pero no limitándose a las garantías implícitas de comercialización y aptitud para un propósito particular.</small></p>
<p><small>Además, en ningún caso, SiBBr o cualquiera de sus funcionarios, empleados o agentes serán responsables de ningún daño de ningún tipo en relación con cualquier reclamo, acción, demanda o procedimiento de cualquier tipo que surjan o estén relacionados con su uso, imposibilidad de uso o desempeño de los datos recuperados.</small></p>
	</div>
</body>
</html>