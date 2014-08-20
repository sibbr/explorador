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
		<p>Bonjour, cher éditeur ${nameto}. L'utilisateur <b>${namefrom}</b> <a href="${mailfrom}">(${mailfrom})</a> vous a envoyé le message suivant à partir de notre portail:</p>
		<div style="border: 0px solid;border-radius: 25px;background: #E4F1CA;width: 90%;text-decoration: none; margin: auto; padding: 5px 5px 5px 30px">
			<p>"${message}"</p>
		</div>	
		<p>S'il vous plaît, afin de répondre, contactez directement l'utilisateur ${namefrom} à l'adresse <a href="${mailfrom}">(${mailfrom})</a>.
		<p>OMerci, l'équipe SiBBr.</p>
		<p>Ce message a été envoyé ${time}.</p>
		<p><small style="float: right">SiBBr ne prend pas la responsabilité pour le contenu des e-mails envoyés par nos services.</small></p>
	</div>
</body>
</html>