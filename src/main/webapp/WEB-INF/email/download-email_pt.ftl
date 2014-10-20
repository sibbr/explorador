<!DOCTYPE html>
<html>
<body>
	<style type="text/css">
	a { text-decoration: none; }
	a:hover { text-decoration: underline; }
	a:visited { color: #00A81B; }
	</style>
	<div style="color: #22241e; font-family: 'Lucida Grande', Arial, Sans-Serif; font-size: 14px; line-height: 1.5em; padding: 18px 36px">
		<p>Os dados requisitados pelo <a href="http://www.sibbr.gov.br/explorador" style="color: #15c;">Portal de Dados de Biodiversidade</a> do SiBBr ${requestTimestampText}, estão disponíveis para download no link:</p>
		<a href="${dwcaLink}" style="background: #F7F4B2 url('http://buriti.lncc.br/explorador/common/images/button-dwca.png') top right no-repeat; ; border: 1px solid #a8a7a5; border-radius: 5px; color: #15c; display: block; height: 48px; font-size: 15px; line-height: 48px; margin: auto; padding: 0 63px 0 15px; text-decoration: none; width: 150px">Baixar dados DwC-A</a></p>
		<p>Estes dados serão mantidos nos nossos servidores por <b>uma semana</b>. Para visitar novamente a consulta que gerou este arquivo, <a href="${requestURL}" style="color: #15c;">↓clique aqui↓</a>.</p>
		<p>Os dados estão empacotados como um arquivo <strong>Darwin Core</strong>, ou seja, um arquivo ".zip" padrão contendo dados no formato de texto delimitado por tab e seus metadados associados em um arquivo ".xml".</p>
		<p>Legalmente, praticamente não há restrições sobre como você pode utilizar estes dados (registrado no campo <em><a href="http://rs.tdwg.org/dwc/terms/index.htm#dcterms:rights" style="color: #15c;">direitos(<i>rights</i>)</a></em> de cada registro), uma vez que os publicadores da rede SiBBr dedicaram seus dados ao <a href="http://creativecommons.org/publicdomain/zero/1.0/" style="color: #15c;">domínio público, através da aplicação da licença "CC0", do Creative Commons</a>. Nós pedimos, entretanto, que você siga <a href="http://www.sibbr.gov.br/termos" style="color: #15c;">normas de uso dos dados do SiBBr</a>, que incluem a apresentação dos créditos, nos casos onde aplicável. Uma citação sugerida para o conjunto de dados acima é:</p>
		<p><code>${institutionCodeList}. <a href="http://buriti.lncc.br/explorador" style="color: #15c;">http://buriti.lncc.br/explorador</a> (acessado em ${requestTimestamp?date?iso_utc})</code></p>
		<p>Para a citação de conjuntos de dados mais específicos (ex.: conjuntos de dados não agregados, espécime único), observe as orientações da <a href="http://www.sibbr.gov.br/termos" style="color: #15c;">normas de uso dos dados do SiBBr</a>.</p>
		<p><b>O time do <a href="http://www.sibbr.gov.br/sobre/equipe" style="color: #15c;">SiBBr agradece pela sua participação.</a></b></p>
		<p><small>O SiBBr não garante a qualidade, exatidão ou a completudede dos dados baixados ou adquiridos de nossos servidores. Estes dados são fornecidos "COMO ESTÃO" sem garantias ou condições de qualquer maneira. O SiBBr nega todas as outras garantias, expressas ou implícitas, incluindo mas não se limitando a garantias implícitas de comercialização e adequação a usos particulares.</small></p>
<p><small>Furthermore, in no event shall Canadensys or any of their officers, employees or agents be liable for any damages whatsoever in respect of any claim, action, demand or proceeding of any kind arising out or related to your use, inability to use or performance of the Data retrieved.</small></p>
	</div>
</body>
</html>