<!DOCTYPE html>
<html>
<body>
	<head><metacharset="UTF-8"></head>
	<style type="text/css">
	a { text-decoration: none; }
	a:hover { text-decoration: underline; }
	a:visited { color: #00A81B; }
	</style>
	<div style="color: #22241e; font-family: 'Lucida Grande', Arial, Sans-Serif; font-size: 14px; line-height: 1.5em; padding: 18px 36px">
		<p>Hola, querido editor <#if nameto?has_content> ${nameto}</#if>. User <b><#if namefrom?has_content>${namefrom}</#if></b> <a href="${mailfrom}">(${mailfrom})</a> te ha enviado el siguiente mensaje de nuestro portal:</p>
		<div style="border: 0px solid;border-radius: 25px;background: #E4F1CA;width: 90%;text-decoration: none; margin: auto; padding: 5px 5px 5px 30px">
			<p>"${message}"</p>
			<a href="${occurrenceUrl}">${occurrenceUrl}</a>
		</div>	
		<p>Por favor, con el fin de responder a ella, póngase en contacto con el usuario <#if namefrom?has_content>${namefrom}</#if> directamente a través de la dirección <a href="${mailfrom}">(${mailfrom})</a>.
		<p>Gracias, el equipo SiBBr.</p>
		<p>Este mensaje fue enviado ${time}.</p>
		<p><small style="float: right">SiBBr no toma responsabilidad por el contenido de los correos electrónicos enviados a través de nuestros servicios.</small></p>
	</div>
</body>
</html>