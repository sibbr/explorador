<div id="contact">
   <#if page.contact?has_content>
	   <h1>${page.contact.resource_name!}</h1>
	   <h2>${rc.getMessage("resourcecontact.header")}</h2>
	   <table>
	      <tbody>
	         <tr>
	            <th>${rc.getMessage("resourcecontact.name")}</th>
	            <td>${page.contact.name!}</td>
	         </tr>
	         <tr>
	            <th>${rc.getMessage("resourcecontact.position")}</th>
	            <td>${page.contact.position_name!}</td>
	         </tr>
	         <tr>
	            <th>${rc.getMessage("resourcecontact.organization")}</th>
	            <td>${page.contact.organization_name!}</td>
	         </tr>
	         <tr>
	            <th>${rc.getMessage("resourcecontact.address")}</th>
	            <td>${page.contact.address!}, ${page.contact.city!}, ${page.contact.administrative_area!}, ${page.contact.postal_code!}, ${page.contact.country!}</td>
	         </tr>
	         <tr>
	            <th>${rc.getMessage("resourcecontact.email")}</th>
	            <td>
	               <#if page.contact.email?has_content>
	               <a href="mailto:${page.contact.email}">${page.contact.email}</a>
	               </#if>
	            </td>
	         </tr>
	         <tr>
	            <th>${rc.getMessage("resourcecontact.telephone")}</th>
	            <td>${page.contact.phone!}</td>
	         </tr>
	      </tbody>
	   </table>
	   <h2>Send a message to the publisher about: </h2>
	   <form method="POST" id="sendmailform" name="sendmailform">
	      ${rc.getMessage("resourcecontact.name")}: <input type="text" name="name" style="width: 45%;"/></br>
	      ${rc.getMessage("resourcecontact.email")}: <input type="text" name="email" style="width: 45%;"/></br>
	      ${rc.getMessage("resourcecontact.message")}: <textarea form="sendmailform" id="message" name="message" cols="100" placeholder=${rc.getMessage("resourcecontact.tip")} style="height: 250px; width: 100%;"></textarea></br>
	      <input type="hidden" name ="subject" value=${rc.getMessage("resourcecontact.subject")}>
	      <input type="hidden" name ="domainName" value=${domainName}>
	      <input type="submit" value=${rc.getMessage("resourcecontact.submit")} style="width:10%;float:right">
	   </form>
   </#if>		   
</div>