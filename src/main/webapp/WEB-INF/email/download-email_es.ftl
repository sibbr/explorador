<!DOCTYPE html>
<html>
	<body>
		<style type="text/css">
		a { text-decoration: none; }
		a:hover { text-decoration: underline; }
		a:visited { color: #00A81B; }
		</style>
		<div style="color: #22241e; font-family: 'Lucida Grande', Arial, Sans-Serif; font-size: 14px; line-height: 1.5em; padding: 18px 36px">
			<p>Los datos que ha solicitado a través de la <a href="http://gbif.sibbr.gov.br/explorador" style="color: #15c;">explorador SiBBr </a> on ${requestTimestampText}están ahora disponibles para su descarga:</p>
			<a href="${dwcaLink}" style="background: #D9ECE0 top right no-repeat;border: 1px solid #a8a7a5; border-radius: 5px; color: #15c; display: block; height: 48px; font-size: 15px; line-height: 48px; margin: auto; padding: 0 5px 0 5px; text-decoration: none; width: 140px">Download data</a></p>
			<p>Vamos a mantener este paquete de datos en nuestros servidores durante <b>una semana</b>. Para volver a la consulta, <a href="${requestURL}" style="color: #15c;">↓haga clic aquí↓</a>.</p>
			<p>Los datos se empaquetan como un <strong>Darwin Core Archive</strong>, que es un archivo .zip que contiene los datos estandarizado como un texto delimitado por tabuladores y los metadatos como XML.</p>
			<p>Legalmente, casi no hay restricciones en cómo se pueden utilizar estos datos (registrados en el <em><a href="http://rs.tdwg.org/dwc/terms/index.htm#dcterms:rights" style="color: #15c;">derechos</a></em> campo de cada registro). We do request, however, that you follow the <a href="http://www.sibbr.gov.br/termos" style="color: #15c;">SiBBr data usage terms</a>, que incluyen darle créditos donde séa apropriado. Una cita que se recomienda para el conunto de datos actual és:</p>
			<div style="background: #D9ECE0 top right no-repeat;border: 1px solid #a8a7a5; border-radius: 5px; color: #15c; display: block; width: 80%; font-size: 15px; line-height: 20px; margin: auto; padding: 0 0 0 10px;">
				<p><code>${institutionCodeList}. <a href="http://www.sibbr.gov.br/explorador" style="color: #15c;">http://gbif.sibbr.gov.br/explorador</a> (consultado el ${requestTimestamp?date?iso_utc})</code></p>
			</div>
			<p>Para la cita de los conjuntos de datos más específicos (por ejemplo, el conjunto de datos no agregada, solo espécimen), consulte los <a href="http://www.sibbr.gov.br/termos" style="color: #15c;">términos de uso de datos de SiBBr</a>.</p>
			<p>La equipo de SiBBr le da las gracias.</a></p>
			<p><small>SiBBr no garantiza la calidad, exactitud o integridad de cualquiera de los datos descargados y / o recuperados de cualquiera de sus servidores. Estos datos se proporcionan sin garantía ni condición de ningún tipo. SiBBr niega cualquier otra garantía, expresa o implícita, incluyendo pero no limitándose a las garantías implícitas de comercialización y aptitud para un propósito particular.</small></p>
			<p><small>Además, en ningún caso, SiBBr o cualquiera de sus funcionarios, empleados o agentes serán responsables de ningún daño de ningún tipo en relación con cualquier reclamo, acción, demanda o procedimiento de cualquier tipo que surjan o estén relacionados con su uso, imposibilidad de uso o desempeño de los datos recuperados.</small></p>
		</div>
	</body>
</html>