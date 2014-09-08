<div id="contact">
   <h1>${page.data.resource_name!}</h1>
   <h2>${rc.getMessage("resourcecontact.header")}</h2>
   <table>
      <tbody>
         <tr>
            <th>${rc.getMessage("resourcecontact.name")}</th>
            <td>${page.data.name!}</td>
         </tr>
         <tr>
            <th>${rc.getMessage("resourcecontact.position")}</th>
            <td>${page.data.position_name!}</td>
         </tr>
         <tr>
            <th>${rc.getMessage("resourcecontact.organization")}</th>
            <td>${page.data.organization_name!}</td>
         </tr>
         <tr>
            <th>${rc.getMessage("resourcecontact.address")}</th>
            <td>${page.data.address!}, ${page.data.city!}, ${page.data.administrative_area!}, ${page.data.postal_code!}, ${page.data.country!}</td>
         </tr>
         <tr>
            <th>${rc.getMessage("resourcecontact.email")}</th>
            <td>
               <#if page.data.email?has_content>
               <a href="mailto:${page.data.email}">${page.data.email}</a>
               </#if>
            </td>
         </tr>
         <tr>
            <th>${rc.getMessage("resourcecontact.telephone")}</th>
            <td>${page.data.phone!}</td>
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
</div>