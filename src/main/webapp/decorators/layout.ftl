<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${title}</title>
${head}
<#include "include/header.ftl">
</head>
<body>
	${body}
	<#include "include/footer.ftl">
	${page.getProperty("page.local_script")!}
</body>
</html>