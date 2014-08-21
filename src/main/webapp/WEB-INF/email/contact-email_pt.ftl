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
		<p>Olá, caro publicador <#if nameto?has_content> ${nameto}</#if>. O usuário <b><#if namefrom?has_content>${namefrom}</#if></b> <a href="${mailfrom}">(${mailfrom})</a> enviou-lhe a seguinte mensagem através do nosso portal:</p>
		<div style="border: 0px solid;border-radius: 25px;background: #E4F1CA;width: 90%;text-decoration: none; margin: auto; padding: 5px 5px 5px 30px">
			<p>"${message}"</p>
		</div>	
		<p>Por favor, para responder, entre em contato diretamente com <#if namefrom?has_content>${namefrom}</#if> no endereço <a href="${mailfrom}">(${mailfrom})</a>.
		<p>Obrigado, equipe SiBBr.</p>
		<p>Esta mensagem foi enviada ${time}.</p>
		<p><small style="float: right">O SiBBr não se responsabiliza pelo conteúdo dos e-mails enviados através de nossos serviços.</small></p>
	</div>
</body>
</html>