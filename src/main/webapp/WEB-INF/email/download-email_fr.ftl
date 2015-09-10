<!DOCTYPE html>
<html>
	<body>
		<style type="text/css">
		a { text-decoration: none; }
		a:hover { text-decoration: underline; }
		a:visited { color: #00A81B; }
		</style>
		<div style="color: #22241e; font-family: 'Lucida Grande', Arial, Sans-Serif; font-size: 14px; line-height: 1.5em; padding: 18px 36px">
			<p>Les donn&eacute;es que vous avez demand&eacute;es via l'<a href="http://gbif.sibbr.gov.br/explorador" style="color: #15c;">explorateur SiBBr</a> le ${requestTimestampText} sont maintenant disponibles pour t&eacute;l&eacute;chargement:</p>
			<a href="${dwcaLink}" style="background: #D9ECE0 top right no-repeat;border: 1px solid #a8a7a5; border-radius: 5px; color: #15c; display: block; height: 48px; font-size: 15px; line-height: 48px; margin: auto; padding: 0 5px 0 5px; text-decoration: none; width: 140px"">T&eacute;l&eacute;charger les donn&eacute;es</a></p>
			<p>Vos donn&eacute;es seront conserv&eacute;es sur notre serveur pendant une semaine. Afin de visualiser votre recherche &agrave; nouveau, <a href="${requestURL}" style="color: #a82400;">↓cliquez ici↓</a>.</p>
			<p>Les donn&eacute;es sont fournies sous la forme d'une <strong>archive Darwin Core</strong>, un fichier compress&eacute; et standardis&eacute; comprenant les donn&eacute;es en format texte, d&eacute;limit&eacute; par des tabulations, et les m&eacute;tadonn&eacute;es en format xml.</p>
			<p>Il n'existe l&eacute;galement pas de restriction sur l'utilisation que vous ferez de ces donn&eacute;es (tel que mentionn&eacute; dans le champ <em><a href="http://rs.tdwg.org/dwc/terms/index.htm#dcterms:rights" style="color: #a82400;">droits</a></em> de tous les enregistrements). Nous vous demandons n&eacute;anmoins de vous conformer aux <a href="http://www.sibbr.gov.br/termos" style="color: #15c;">normes de SiBBr</a> et en particulier de citer la source appropri&eacute;e lorsque cela est n&eacute;cessaire. Pour citer de tels jeux de donn&eacute;es combin&eacute;es, nous vous sugg&eacute;rons la formulation suivante: </p>
			<div style="background: #D9ECE0 top right no-repeat;border: 1px solid #a8a7a5; border-radius: 5px; color: #15c; display: block; width: 80%; font-size: 15px; line-height: 20px; margin: auto; padding: 0 0 0 10px;">
				<p><code>${institutionCodeList}. <a href="http://gbif.sibbr.gov.br/explorador" style="color: #15c;">http://gbif.sibbr.gov.br/explorador</a> (visit&eacute; le  ${requestTimestamp?date?iso_utc})</code></p>
			</div>
			<p>Si vous voulez citer un sp&eacute;cimen particulier ou un jeu de donn&eacute;es non combin&eacute;, veuillez vous r&eacute;f&eacute;rer aux <a href="http://www.sibbr.gov.br/termos" style="color: #15c;">normes de SiBBr</a>.</p>
			<p>Merci, l'&eacute;quipe SiBBr</a></p>
			<p><small>SiBBr ne garantit pas la qualité, l'exactitude ni l'intégralité des données ayant été téléchargées et/ou extraites de tous serveurs de SiBBr. 
			Lesdites données sont fournis « telles quelles », sans garantie ni condition de toute sorte. Canadensys rejette toute autre garantie, expresse ou tacite, 
			y compris, mais non de façon limitative, les garanties implicites de la qualité marchande ou de l'utilité aux fins d'un usage particulier des données.</small></p>
			<p><small>De plus, vous dégagez de toute responsabilité et renoncez à exercer toute poursuite, réclamation, action, recours ou procédure contre SiBBr ainsi que tous leurs officiers,
			employés et agents pour tout dommage quel qu'il soit, pouvant résulter de votre utilisation ou incapacité d'utilisation des Données ou lier à la performance de celles-ci.</small></p>
		</div>
	</body>
</html>