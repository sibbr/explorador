<#include "inc/functions.ftl">
<#include "inc/global-functions.ftl">
<#include "inc/tip.ftl">
<head>
   <title>${rc.getMessage("occpage.title")}</title>
   <@cssAsset fileName="occportal" version=page.currentVersion! useMinified=false/>
   <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
   <style>
      .boxcontent {margin: 0 0 20px;background: rgb(255,255,255);border-radius: 0px 5px 5px 5px;-webkit-box-shadow: rgb(240,240,240) 3px 0px 3px 2px;box-shadow: rgb(223,223,223) 3px 0px 3px 2px;border-right: 1px solid #ddd;border-left: 1px solid #ddd;	  border-top: none!important;}
      .round {background-color: #fff!important;border: none!important;}
   </style>
</head>
<a id="main-content"></a>
<div id="body">
   <div id="content" class="clear_fix">
      <h1><i>${page.occModel.scientificname?if_exists}</i> (${page.occModel.collectioncode?if_exists} ${page.occModel.catalognumber?if_exists})</h1>
      <p class="details">${rc.getMessage("occpage.header.details")} <a href="${rc.getContextPath()}/${rc.getMessage("resourcepage.resource")}/${page.resource.getId()}" target="_self">${page.information.getTitle()?if_exists}</a></p>
      <!-- CONTENT TAB -->
      <div id="tabwrap">
         <ul id="tabs">
            <li><a href="?view=interpreted">${rc.getMessage("occpage.header.button.normal")} <span class="question">${rc.getMessage("occpage.information.icon")}</span></a></li>
            <li class="current"><a href="?view=original">${rc.getMessage("occpage.header.button.dwc")} <span class="question2">${rc.getMessage("occpage.information.icon")}</span></a></li>
            <li><a href="?view=name">${rc.getMessage("occpage.other.information")}</a></li>
            <li><a href="?view=contact">${rc.getMessage("occpage.menu.datasetcontact")}</a></li>
         </ul>
         <div id="content_tab" class="boxcontent">

            <!-- NORMAL TAB-->
            <div id="?view=interpreted"></div>
           
            <!-- DWC TAB-->
            <div id="?view=original" class="current">
                <p><a id="dwc_table_toggle" href="#">${rc.getMessage("occpage.header.toggle.unused")}</a></p>
				<table id="dwc_table" class="sortable">
				   <thead>
				      <tr>
				         <th class="sorttable_numeric" scope="col">${rc.getMessage("occpage.dwctable.order")}</th>
				         <th class="sorttable_alpha" scope="col">${rc.getMessage("occpage.dwctable.category")}</th>
				         <th class="sorttable_alpha" scope="col">${rc.getMessage("occpage.dwctable.term")}</th>
				         <th class="sorttable_alpha" scope="col">${rc.getMessage("occpage.dwctable.raw")}</th>
				         <th class="sorttable_alpha" scope="col">${rc.getMessage("occpage.dwctable.interpreted")}</th>
				      </tr>
				   </thead>
				   <tbody>
				      <tr>
				         <td>1</td>
				         <td>root</td>
				         <td><a href="http://purl.org/dc/terms/type" target="_blank">type</a></td>
				         <td>${page.occRawModel.type?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr>
				         <td>2</td>
				         <td>root</td>
				         <td><a href="http://purl.org/dc/terms/modified" target="_blank">modified</a></td>
				         <td> ${page.occRawModel.modified?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr>
				         <td>3</td>
				         <td>root</td>
				         <td><a href="http://purl.org/dc/terms/language" target="_blank">language</a></td>
				         <td>${page.occRawModel.language?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr>
				         <td>4</td>
				         <td>root</td>
				         <td><a href="http://purl.org/dc/terms/rights" target="_blank">rights</a></td>
				         <td>${page.occRawModel.rights?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr>
				         <td>5</td>
				         <td>root</td>
				         <td><a href="http://purl.org/dc/terms/rightsHolder" target="_blank">rightsHolder</a></td>
				         <td>${page.occRawModel.rightsholder?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr class="unused">
				         <td>6</td>
				         <td>root</td>
				         <td><a href="http://purl.org/dc/terms/accessRights" target="_blank">accessRights</a></td>
				         <td>${page.occRawModel.accessrights?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr>
				         <td>7</td>
				         <td>root</td>
				         <td><a href="http://purl.org/dc/terms/bibliographicCitation" target="_blank">bibliographicCitation</a></td>
				         <td>${page.occRawModel.bibliographiccitation?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr>
				         <td>8</td>
				         <td>root</td>
				         <td><a href="http://purl.org/dc/terms/references" target="_blank">references</a></td>
				         <td>${page.occRawModel._references?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr class="unused">
				         <td>9</td>
				         <td>root</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/institutionID" target="_blank">institutionID</a></td>
				         <td>${page.occRawModel.institutionid?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr>
				         <td>10</td>
				         <td>root</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/collectionID" target="_blank">collectionID</a></td>
				         <td>${page.occRawModel.collectionid?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr>
				         <td>11</td>
				         <td>root</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/datasetID" target="_blank">datasetID</a></td>
				         <td>${page.occRawModel.datasetid?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr>
				         <td>12</td>
				         <td>root</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/institutionCode" target="_blank">institutionCode</a></td>
				         <td>${page.occRawModel.institutioncode?if_exists}</td>
				         <td>${page.occModel.institutioncode?if_exists}</td>
				      </tr>
				      <tr>
				         <td>13</td>
				         <td>root</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/collectionCode" target="_blank">collectionCode</a></td>
				         <td>${page.occRawModel.collectioncode?if_exists}</td>
				         <td>${page.occModel.collectioncode?if_exists}</td>
				      </tr>
				      <tr>
				         <td>14</td>
				         <td>root</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/datasetName" target="_blank">datasetName</a></td>
				         <td>${page.occRawModel.datasetname?if_exists}</td>
				         <td>${page.occModel.datasetname?if_exists}</td>
				      </tr>
				      <tr>
				         <td>15</td>
				         <td>root</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/ownerInstitutionCode" target="_blank">ownerInstitutionCode</a></td>
				         <td>${page.occRawModel.ownerinstitutioncode?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr>
				         <td>16</td>
				         <td>root</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/basisOfRecord" target="_blank">basisOfRecord</a></td>
				         <td>${page.occRawModel.basisofrecord?if_exists}</td>
				         <td>${page.occModel.basisofrecord!}</td>
				      </tr>
				      <tr class="unused">
				         <td>17</td>
				         <td>root</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/informationWithheld" target="_blank">informationWithheld</a></td>
				         <td>${page.occRawModel.informationwithheld?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr class="unused">
				         <td>18</td>
				         <td>root</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/dataGeneralizations" target="_blank">dataGeneralizations</a></td>
				         <td>${page.occRawModel.datageneralizations?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr>
				         <td>19</td>
				         <td>root</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/dynamicProperties" target="_blank">dynamicProperties</a></td>
				         <td>${page.occRawModel.dynamicproperties?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr>
				         <td>20</td>
				         <td>occurrence</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/occurrenceID" target="_blank">occurrenceID</a></td>
				         <td>${page.occRawModel.occurrenceid?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr>
				         <td>21</td>
				         <td>occurrence</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/catalogNumber" target="_blank">catalogNumber</a></td>
				         <td>${page.occRawModel.catalognumber?if_exists}</td>
				         <td>${page.occModel.catalognumber?if_exists}</td>
				      </tr>
				      <tr>
				         <td>22</td>
				         <td>occurrence</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/occurrenceRemarks" target="_blank">occurrenceRemarks</a></td>
				         <td>${page.occRawModel.occurrenceremarks?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr>
				         <td>23</td>
				         <td>occurrence</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/recordNumber" target="_blank">recordNumber</a></td>
				         <td>${page.occRawModel.recordnumber?if_exists}</td>
				         <td>${page.occModel.recordnumber?if_exists}</td>
				      </tr>
				      <tr>
				         <td>24</td>
				         <td>occurrence</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/recordedBy" target="_blank">recordedBy</a></td>
				         <td>${page.occRawModel.recordedby?if_exists}</td>
				         <td>${page.occModel.recordedby?if_exists}</td>
				      </tr>
				      <tr class="unused">
				         <td>25</td>
				         <td>occurrence</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/individualID" target="_blank">individualID</a></td>
				         <td>${page.occRawModel.individualid?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr>
				         <td>26</td>
				         <td>occurrence</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/individualCount" target="_blank">individualCount</a></td>
				         <td>${page.occRawModel.individualcount?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr>
				         <td>27</td>
				         <td>occurrence</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/sex" target="_blank">sex</a></td>
				         <td>${page.occRawModel.sex?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr>
				         <td>28</td>
				         <td>occurrence</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/lifeStage" target="_blank">lifeStage</a></td>
				         <td>${page.occRawModel.lifestage?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr>
				         <td>29</td>
				         <td>occurrence</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/reproductiveCondition" target="_blank">reproductiveCondition</a></td>
				         <td>${page.occRawModel.reproductivecondition?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr>
				         <td>30</td>
				         <td>occurrence</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/behavior" target="_blank">behavior</a></td>
				         <td>${page.occRawModel.behavior?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr>
				         <td>31</td>
				         <td>occurrence</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/establishmentMeans" target="_blank">establishmentMeans</a></td>
				         <td>${page.occRawModel.establishmentmeans?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr class="unused">
				         <td>32</td>
				         <td>occurrence</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/occurrenceStatus" target="_blank">occurrenceStatus</a></td>
				         <td>${page.occRawModel.occurrencestatus?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr>
				         <td>33</td>
				         <td>occurrence</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/preparations" target="_blank">preparations</a></td>
				         <td>${page.occRawModel.preparations?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr>
				         <td>34</td>
				         <td>occurrence</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/disposition" target="_blank">disposition</a></td>
				         <td>${page.occRawModel.disposition?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr>
				         <td>35</td>
				         <td>occurrence</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/otherCatalogNumbers" target="_blank">otherCatalogNumbers</a></td>
				         <td>${page.occRawModel.othercatalognumbers?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr>
				         <td>36</td>
				         <td>occurrence</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/previousIdentifications" target="_blank">previousIdentifications</a></td>
				         <td>${page.occRawModel.previousidentifications?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr>
				         <td>37</td>
				         <td>occurrence</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/associatedMedia" target="_blank">associatedMedia</a></td>
				         <td>${page.occRawModel.associatedmedia?if_exists}</td>
				         <td>${page.occModel.associatedmedia?if_exists}</td>
				      </tr>
				      <tr>
				         <td>38</td>
				         <td>occurrence</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/associatedReferences" target="_blank">associatedReferences</a></td>
				         <td>${page.occRawModel.associatedreferences?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr>
				         <td>39</td>
				         <td>occurrence</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/associatedOccurrences" target="_blank">associatedOccurrences</a></td>
				         <td>${page.occRawModel.associatedoccurrences?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr>
				         <td>40</td>
				         <td>occurrence</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/associatedSequences" target="_blank">associatedSequences</a></td>
				         <td>${page.occRawModel.associatedsequences!}</td>
				         <td>${page.occModel.associatedsequences!}</td>
				      </tr>
				      <tr>
				         <td>41</td>
				         <td>occurrence</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/associatedTaxa" target="_blank">associatedTaxa</a></td>
				         <td>${page.occRawModel.associatedtaxa?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr class="unused">
				         <td>42</td>
				         <td>event</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/eventID" target="_blank">eventID</a></td>
				         <td>${page.occRawModel.eventid?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr>
				         <td>43</td>
				         <td>event</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/samplingProtocol" target="_blank">samplingProtocol</a></td>
				         <td>${page.occRawModel.samplingprotocol?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr class="unused">
				         <td>44</td>
				         <td>event</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/samplingEffort" target="_blank">samplingEffort</a></td>
				         <td>${page.occRawModel.samplingeffort?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr>
				         <td>45</td>
				         <td>event</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/eventDate" target="_blank">eventDate</a></td>
				         <td>${page.occRawModel.eventdate?if_exists}</td>
				         <td>${formatdate(page.occModel.syear!-1,page.occModel.smonth!-1,page.occModel.sday!-1)}</td>
				      </tr>
				      <tr>
				         <td>46</td>
				         <td>event</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/eventTime" target="_blank">eventTime</a></td>
				         <td>${page.occRawModel.eventtime?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr class="unused">
				         <td>47</td>
				         <td>event</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/startDayOfYear" target="_blank">startDayOfYear</a></td>
				         <td>${page.occRawModel.startdayofyear?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr class="unused">
				         <td>48</td>
				         <td>event</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/endDayOfYear" target="_blank">endDayOfYear</a></td>
				         <td>${page.occRawModel.enddayofyear?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr class="unused">
				         <td>49</td>
				         <td>event</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/year" target="_blank">year</a></td>
				         <td>${page.occRawModel.year?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr class="unused">
				         <td>50</td>
				         <td>event</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/month" target="_blank">month</a></td>
				         <td>${page.occRawModel.month?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr class="unused">
				         <td>51</td>
				         <td>event</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/day" target="_blank">day</a></td>
				         <td>${page.occRawModel.day?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr>
				         <td>52</td>
				         <td>event</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/verbatimEventDate" target="_blank">verbatimEventDate</a></td>
				         <td>${page.occRawModel.verbatimeventdate?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr>
				         <td>53</td>
				         <td>event</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/habitat" target="_blank">habitat</a></td>
				         <td>${page.occRawModel.habitat?if_exists}</td>
				         <td>${page.occModel.habitat?if_exists}</td>
				      </tr>
				      <tr class="unused">
				         <td>54</td>
				         <td>event</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/fieldNumber" target="_blank">fieldNumber</a></td>
				         <td>${page.occRawModel.fieldnumber?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr class="unused">
				         <td>55</td>
				         <td>event</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/fieldNotes" target="_blank">fieldNotes</a></td>
				         <td>${page.occRawModel.fieldnotes?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr>
				         <td>56</td>
				         <td>event</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/eventRemarks" target="_blank">eventRemarks</a></td>
				         <td>${page.occRawModel.eventremarks?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr class="unused">
				         <td>57</td>
				         <td>location</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/locationID" target="_blank">locationID</a></td>
				         <td>${page.occRawModel.locationid?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr class="unused">
				         <td>58</td>
				         <td>location</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/higherGeographyID" target="_blank">higherGeographyID</a></td>
				         <td>${page.occRawModel.highergeographyid?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr class="unused">
				         <td>59</td>
				         <td>location</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/higherGeography" target="_blank">higherGeography</a></td>
				         <td>${page.occRawModel.highergeography?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr>
				         <td>60</td>
				         <td>location</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/continent" target="_blank">continent</a></td>
				         <td>${page.occRawModel.continent?if_exists}</td>
				         <td>${page.occModel.continent?if_exists}</td>
				      </tr>
				      <tr>
				         <td>61</td>
				         <td>location</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/waterBody" target="_blank">waterBody</a></td>
				         <td>${page.occRawModel.waterbody?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr class="unused">
				         <td>62</td>
				         <td>location</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/islandGroup" target="_blank">islandGroup</a></td>
				         <td>${page.occRawModel.islandgroup?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr class="unused">
				         <td>63</td>
				         <td>location</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/island" target="_blank">island</a></td>
				         <td>${page.occRawModel.island?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr>
				         <td>64</td>
				         <td>location</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/country" target="_blank">country</a></td>
				         <td>${page.occRawModel.country?if_exists}</td>
				         <td>${page.occModel.country?if_exists}</td>
				      </tr>
				      <tr>
				         <td>65</td>
				         <td>location</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/countryCode" target="_blank">countryCode</a></td>
				         <td>${page.occRawModel.countrycode?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr>
				         <td>66</td>
				         <td>location</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/stateProvince" target="_blank">stateProvince</a></td>
				         <td>${page.occRawModel.stateprovince?if_exists}</td>
				         <td>${page.occModel.stateprovince?if_exists}</td>
				      </tr>
				      <tr>
				         <td>67</td>
				         <td>location</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/county" target="_blank">county</a></td>
				         <td>${page.occRawModel.county?if_exists}</td>
				         <td>${page.occModel.county?if_exists}</td>
				      </tr>
				      <tr>
				         <td>68</td>
				         <td>location</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/municipality" target="_blank">municipality</a></td>
				         <td>${page.occRawModel.municipality?if_exists}</td>
				         <td>${page.occModel.municipality?if_exists}</td>
				      </tr>
				      <tr>
				         <td>69</td>
				         <td>location</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/locality" target="_blank">locality</a></td>
				         <td>${page.occRawModel.locality?if_exists}</td>
				         <td>${page.occModel.locality?if_exists}</td>
				      </tr>
				      <tr class="unused">
				         <td>70</td>
				         <td>location</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/verbatimLocality" target="_blank">verbatimLocality</a></td>
				         <td>${page.occRawModel.verbatimlocality?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr>
				         <td>71</td>
				         <td>location</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/verbatimElevation" target="_blank">verbatimElevation</a></td>
				         <td>${page.occRawModel.verbatimelevation?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr>
				         <td>72</td>
				         <td>location</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/minimumElevationInMeters" target="_blank">minimumElevationInMeters</a></td>
				         <td>${page.occRawModel.minimumelevationinmeters?if_exists}</td>
				         <td>${page.occModel.minimumelevationinmeters?if_exists}</td>
				      </tr>
				      <tr>
				         <td>73</td>
				         <td>location</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/maximumElevationInMeters" target="_blank">maximumElevationInMeters</a></td>
				         <td>${page.occRawModel.maximumelevationinmeters?if_exists}</td>
				         <td>${page.occModel.maximumelevationinmeters?if_exists}</td>
				      </tr>
				      <tr>
				         <td>74</td>
				         <td>location</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/verbatimDepth" target="_blank">verbatimDepth</a></td>
				         <td>${page.occRawModel.verbatimdepth?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr class="unused">
				         <td>75</td>
				         <td>location</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/minimumDepthInMeters" target="_blank">minimumDepthInMeters</a></td>
				         <td>${page.occRawModel.minimumdepthinmeters?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr class="unused">
				         <td>76</td>
				         <td>location</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/maximumDepthInMeters" target="_blank">maximumDepthInMeters</a></td>
				         <td>${page.occRawModel.maximumdepthinmeters?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr class="unused">
				         <td>77</td>
				         <td>location</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/minimumDistanceAboveSurfaceInMeters" target="_blank">minimumDistanceAboveSurfaceInMeters</a></td>
				         <td>${page.occRawModel.minimumdistanceabovesurfaceinmeters?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr class="unused">
				         <td>78</td>
				         <td>location</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/maximumDistanceAboveSurfaceInMeters" target="_blank">maximumDistanceAboveSurfaceInMeters</a></td>
				         <td>${page.occRawModel.maximumdistanceabovesurfaceinmeters?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr class="unused">
				         <td>79</td>
				         <td>location</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/locationAccordingTo" target="_blank">locationAccordingTo</a></td>
				         <td>${page.occRawModel.locationaccordingto?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr>
				         <td>80</td>
				         <td>location</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/locationRemarks" target="_blank">locationRemarks</a></td>
				         <td>${page.occRawModel.locationremarks?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr>
				         <td>81</td>
				         <td>location</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/verbatimCoordinates" target="_blank">verbatimCoordinates</a></td>
				         <td>${page.occRawModel.verbatimcoordinates?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr>
				         <td>82</td>
				         <td>location</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/verbatimLatitude" target="_blank">verbatimLatitude</a></td>
				         <td>${page.occRawModel.verbatimlatitude?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr>
				         <td>83</td>
				         <td>location</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/verbatimLongitude" target="_blank">verbatimLongitude</a></td>
				         <td>${page.occRawModel.verbatimlongitude?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr>
				         <td>84</td>
				         <td>location</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/verbatimCoordinateSystem" target="_blank">verbatimCoordinateSystem</a></td>
				         <td>${page.occRawModel.verbatimcoordinatesystem?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr>
				         <td>85</td>
				         <td>location</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/verbatimSRS" target="_blank">verbatimSRS</a></td>
				         <td>${page.occRawModel.verbatimsrs?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr>
				         <td>86</td>
				         <td>location</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/decimalLatitude" target="_blank">decimalLatitude</a></td>
				         <td>${page.occRawModel.decimallatitude?if_exists}</td>
				         <td>${safeNumber(page.occModel.decimallatitude!"","")}</td>
				      </tr>
				      <tr>
				         <td>87</td>
				         <td>location</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/decimalLongitude" target="_blank">decimalLongitude</a></td>
				         <td>${page.occRawModel.decimallongitude?if_exists}</td>
				         <td>${safeNumber(page.occModel.decimallongitude!"","")}</td>
				      </tr>
				      <tr>
				         <td>88</td>
				         <td>location</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/geodeticDatum" target="_blank">geodeticDatum</a></td>
				         <td>${page.occRawModel.geodeticdatum?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr>
				         <td>89</td>
				         <td>location</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/coordinateUncertaintyInMeters" target="_blank">coordinateUncertaintyInMeters</a></td>
				         <td>${page.occRawModel.coordinateuncertaintyinmeters?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr class="unused">
				         <td>90</td>
				         <td>location</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/coordinatePrecision" target="_blank">coordinatePrecision</a></td>
				         <td>${page.occRawModel.coordinateprecision?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr class="unused">
				         <td>91</td>
				         <td>location</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/pointRadiusSpatialFit" target="_blank">pointRadiusSpatialFit</a></td>
				         <td>${page.occRawModel.pointradiusspatialfit?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr>
				         <td>92</td>
				         <td>location</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/footprintWKT" target="_blank">footprintWKT</a></td>
				         <td>${page.occRawModel.footprintwkt?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr class="unused">
				         <td>93</td>
				         <td>location</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/footprintSRS" target="_blank">footprintSRS</a></td>
				         <td>${page.occRawModel.footprintsrs?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr class="unused">
				         <td>94</td>
				         <td>location</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/footprintSpatialFit" target="_blank">footprintSpatialFit</a></td>
				         <td>${page.occRawModel.footprintspatialfit?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr>
				         <td>95</td>
				         <td>location</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/georeferencedBy" target="_blank">georeferencedBy</a></td>
				         <td>${page.occRawModel.georeferencedby?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr>
				         <td>96</td>
				         <td>location</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/georeferencedDate" target="_blank">georeferencedDate</a></td>
				         <td>${page.occRawModel.georeferenceddate?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr>
				         <td>97</td>
				         <td>location</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/georeferenceProtocol" target="_blank">georeferenceProtocol</a></td>
				         <td>${page.occRawModel.georeferenceprotocol?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr>
				         <td>98</td>
				         <td>location</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/georeferenceSources" target="_blank">georeferenceSources</a></td>
				         <td>${page.occRawModel.georeferencesources?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr>
				         <td>99</td>
				         <td>location</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/georeferenceVerificationStatus" target="_blank">georeferenceVerificationStatus</a></td>
				         <td>${page.occRawModel.georeferenceverificationstatus?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr>
				         <td>100</td>
				         <td>location</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/georeferenceRemarks" target="_blank">georeferenceRemarks</a></td>
				         <td>${page.occRawModel.georeferenceremarks?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr class="unused">
				         <td>101</td>
				         <td>identification</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/identificationID" target="_blank">identificationID</a></td>
				         <td>${page.occRawModel.identificationid?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr>
				         <td>102</td>
				         <td>identification</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/identifiedBy" target="_blank">identifiedBy</a></td>
				         <td>${page.occRawModel.identifiedby?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr>
				         <td>103</td>
				         <td>identification</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/dateIdentified" target="_blank">dateIdentified</a></td>
				         <td>${page.occRawModel.dateidentified?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr class="unused">
				         <td>104</td>
				         <td>identification</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/identificationReferences" target="_blank">identificationReferences</a></td>
				         <td>${page.occRawModel.identificationreferences?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr class="unused">
				         <td>105</td>
				         <td>identification</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/identificationVerificationStatus" target="_blank">identificationVerificationStatus</a></td>
				         <td>${page.occRawModel.identificationverificationstatus?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr>
				         <td>106</td>
				         <td>identification</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/identificationRemarks" target="_blank">identificationRemarks</a></td>
				         <td>${page.occRawModel.identificationremarks?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr>
				         <td>107</td>
				         <td>identification</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/identificationQualifier" target="_blank">identificationQualifier</a></td>
				         <td>${page.occRawModel.identificationqualifier?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr>
				         <td>108</td>
				         <td>identification</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/typeStatus" target="_blank">typeStatus</a></td>
				         <td>${page.occRawModel.typestatus!}</td>
				         <td> ${page.occModel.typestatus!}</td>
				      </tr>
				      <tr class="unused">
				         <td>109</td>
				         <td>taxon</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/taxonID" target="_blank">taxonID</a></td>
				         <td>${page.occRawModel.taxonid?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr class="unused">
				         <td>110</td>
				         <td>taxon</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/scientificNameID" target="_blank">scientificNameID</a></td>
				         <td>${page.occRawModel.scientificnameid?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr class="unused">
				         <td>111</td>
				         <td>taxon</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/acceptedNameUsageID" target="_blank">acceptedNameUsageID</a></td>
				         <td>${page.occRawModel.acceptednameusageid?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr class="unused">
				         <td>112</td>
				         <td>taxon</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/parentNameUsageID" target="_blank">parentNameUsageID</a></td>
				         <td>${page.occRawModel.parentnameusageid?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr class="unused">
				         <td>113</td>
				         <td>taxon</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/originalNameUsageID" target="_blank">originalNameUsageID</a></td>
				         <td>${page.occRawModel.originalnameusageid?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr class="unused">
				         <td>114</td>
				         <td>taxon</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/nameAccordingToID" target="_blank">nameAccordingToID</a></td>
				         <td>${page.occRawModel.nameaccordingtoid?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr class="unused">
				         <td>115</td>
				         <td>taxon</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/namePublishedInID" target="_blank">namePublishedInID</a></td>
				         <td>${page.occRawModel.namepublishedinid?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr class="unused">
				         <td>116</td>
				         <td>taxon</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/namePublishedInYear" target="_blank">namePublishedInYear</a></td>
				         <td>${page.occRawModel.namepublishedinyear?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr class="unused">
				         <td>117</td>
				         <td>taxon</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/taxonConceptID" target="_blank">taxonConceptID</a></td>
				         <td>${page.occRawModel.taxonconceptid?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr>
				         <td>118</td>
				         <td>taxon</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/scientificName" target="_blank">scientificName</a></td>
				         <td>${page.occRawModel.scientificname?if_exists}</td>
				         <td>${page.occModel.scientificname?if_exists}</td>
				      </tr>
				      <tr>
				         <td>119</td>
				         <td>taxon</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/acceptedNameUsage" target="_blank">acceptedNameUsage</a></td>
				         <td>${page.occRawModel.acceptednameusage?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr class="unused">
				         <td>120</td>
				         <td>taxon</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/parentNameUsage" target="_blank">parentNameUsage</a></td>
				         <td>${page.occRawModel.parentnameusage?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr class="unused">
				         <td>121</td>
				         <td>taxon</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/originalNameUsage" target="_blank">originalNameUsage</a></td>
				         <td>${page.occRawModel.originalnameusage?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr class="unused">
				         <td>122</td>
				         <td>taxon</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/nameAccordingTo" target="_blank">nameAccordingTo</a></td>
				         <td>${page.occRawModel.nameaccordingto?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr class="unused">
				         <td>123</td>
				         <td>taxon</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/namePublishedIn" target="_blank">namePublishedIn</a></td>
				         <td>${page.occRawModel.namepublishedin?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr>
				         <td>124</td>
				         <td>taxon</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/higherClassification" target="_blank">higherClassification</a></td>
				         <td>${page.occRawModel.higherclassification?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr>
				         <td>125</td>
				         <td>taxon</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/kingdom" target="_blank">kingdom</a></td>
				         <td>${page.occRawModel.kingdom?if_exists}</td>
				         <td>${page.occModel.kingdom?if_exists}</td>
				      </tr>
				      <tr>
				         <td>126</td>
				         <td>taxon</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/phylum" target="_blank">phylum</a></td>
				         <td>${page.occRawModel.phylum?if_exists}</td>
				         <td>${page.occModel.phylum?if_exists}</td>
				      </tr>
				      <tr>
				         <td>127</td>
				         <td>taxon</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/class" target="_blank">class</a></td>
				         <td>${page.occRawModel._class?if_exists}</td>
				         <td>${page.occModel._class?if_exists}</td>
				      </tr>
				      <tr>
				         <td>128</td>
				         <td>taxon</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/order" target="_blank">order</a></td>
				         <td>${page.occRawModel._order?if_exists}</td>
				         <td>${page.occModel._order?if_exists}</td>
				      </tr>
				      <tr>
				         <td>129</td>
				         <td>taxon</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/family" target="_blank">family</a></td>
				         <td>${page.occRawModel.family?if_exists}</td>
				         <td>${page.occModel.family?if_exists}</td>
				      </tr>
				      <tr>
				         <td>130</td>
				         <td>taxon</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/genus" target="_blank">genus</a></td>
				         <td>${page.occRawModel.genus?if_exists}</td>
				         <td>${page.occModel.genus?if_exists}</td>
				      </tr>
				      <tr class="unused">
				         <td>131</td>
				         <td>taxon</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/subgenus" target="_blank">subgenus</a></td>
				         <td>${page.occRawModel.subgenus?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr>
				         <td>132</td>
				         <td>taxon</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/specificEpithet" target="_blank">specificEpithet</a></td>
				         <td>${page.occRawModel.specificepithet?if_exists}</td>
				         <td>${page.occModel.specificepithet?if_exists}</td>
				      </tr>
				      <tr>
				         <td>133</td>
				         <td>taxon</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/infraspecificEpithet" target="_blank">infraspecificEpithet</a></td>
				         <td>${page.occRawModel.infraspecificepithet?if_exists}</td>
				         <td>${page.occModel.infraspecificepithet?if_exists}</td>
				      </tr>
				      <tr>
				         <td>134</td>
				         <td>taxon</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/taxonRank" target="_blank">taxonRank</a></td>
				         <td>${page.occRawModel.taxonrank?if_exists}</td>
				         <td>${page.occModel.taxonrank?if_exists}</td>
				      </tr>
				      <tr class="unused">
				         <td>135</td>
				         <td>taxon</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/verbatimTaxonRank" target="_blank">verbatimTaxonRank</a></td>
				         <td>${page.occRawModel.verbatimtaxonrank?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr>
				         <td>136</td>
				         <td>taxon</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/scientificNameAuthorship" target="_blank">scientificNameAuthorship</a></td>
				         <td>${page.occRawModel.scientificnameauthorship?if_exists}</td>
				         <td>${page.occModel.scientificnameauthorship?if_exists}</td>
				      </tr>
				      <tr class="unused">
				         <td>137</td>
				         <td>taxon</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/vernacularName" target="_blank">vernacularName</a></td>
				         <td>${page.occRawModel.vernacularname?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr>
				         <td>138</td>
				         <td>taxon</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/nomenclaturalCode" target="_blank">nomenclaturalCode</a></td>
				         <td>${page.occRawModel.nomenclaturalcode?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr class="unused">
				         <td>139</td>
				         <td>taxon</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/taxonomicStatus" target="_blank">taxonomicStatus</a></td>
				         <td>${page.occRawModel.taxonomicstatus?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr class="unused">
				         <td>140</td>
				         <td>taxon</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/nomenclaturalStatus" target="_blank">nomenclaturalStatus</a></td>
				         <td>${page.occRawModel.nomenclaturalstatus?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr>
				         <td>141</td>
				         <td>taxon</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/taxonRemarks" target="_blank">taxonRemarks</a></td>
				         <td>${page.occRawModel.taxonremarks?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr class="unused">
				         <td>142</td>
				         <td>geological</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/geologicalContextID" target="_blank">geologicalContextID</a></td>
				         <td>${page.occRawModel.geologicalcontextid?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr class="unused">
				         <td>143</td>
				         <td>geological</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/earliestEonOrLowestEonothem" target="_blank">earliestEonOrLowestEonothem</a></td>
				         <td>${page.occRawModel.earliesteonorlowesteonothem?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr class="unused">
				         <td>144</td>
				         <td>geological</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/latestEonOrHighestEonothem" target="_blank">latestEonOrHighestEonothem</a></td>
				         <td>${page.occRawModel.latesteonorhighesteonothem?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr class="unused">
				         <td>145</td>
				         <td>geological</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/earliestEraOrLowestErathem" target="_blank">earliestEraOrLowestErathem</a></td>
				         <td>${page.occRawModel.earliesteraorlowesterathem?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr class="unused">
				         <td>146</td>
				         <td>geological</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/latestEraOrHighestErathem" target="_blank">latestEraOrHighestErathem</a></td>
				         <td>${page.occRawModel.latesteraorhighesterathem?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr class="unused">
				         <td>147</td>
				         <td>geological</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/earliestPeriodOrLowestSystem" target="_blank">earliestPeriodOrLowestSystem</a></td>
				         <td>${page.occRawModel.earliestperiodorlowestsystem?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr class="unused">
				         <td>148</td>
				         <td>geological</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/latestPeriodOrHighestSystem" target="_blank">latestPeriodOrHighestSystem</a></td>
				         <td>${page.occRawModel.latestperiodorhighestsystem?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr class="unused">
				         <td>149</td>
				         <td>geological</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/earliestEpochOrLowestSeries" target="_blank">earliestEpochOrLowestSeries</a></td>
				         <td>${page.occRawModel.earliestepochorlowestseries?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr class="unused">
				         <td>150</td>
				         <td>geological</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/latestEpochOrHighestSeries" target="_blank">latestEpochOrHighestSeries</a></td>
				         <td>${page.occRawModel.latestepochorhighestseries?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr class="unused">
				         <td>151</td>
				         <td>geological</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/earliestAgeOrLowestStage" target="_blank">earliestAgeOrLowestStage</a></td>
				         <td>${page.occRawModel.earliestageorloweststage?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr class="unused">
				         <td>152</td>
				         <td>geological</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/latestAgeOrHighestStage" target="_blank">latestAgeOrHighestStage</a></td>
				         <td>${page.occRawModel.latestageorhigheststage?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr class="unused">
				         <td>153</td>
				         <td>geological</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/lowestBiostratigraphicZone" target="_blank">lowestBiostratigraphicZone</a></td>
				         <td>${page.occRawModel.lowestbiostratigraphiczone?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr class="unused">
				         <td>154</td>
				         <td>geological</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/highestBiostratigraphicZone" target="_blank">highestBiostratigraphicZone</a></td>
				         <td>${page.occRawModel.highestbiostratigraphiczone?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr class="unused">
				         <td>155</td>
				         <td>geological</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/lithostratigraphicTerms" target="_blank">lithostratigraphicTerms</a></td>
				         <td>${page.occRawModel.lithostratigraphicterms?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr class="unused">
				         <td>156</td>
				         <td>geological</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/group" target="_blank">group</a></td>
				         <td>${page.occRawModel.group?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr class="unused">
				         <td>157</td>
				         <td>geological</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/formation" target="_blank">formation</a></td>
				         <td>${page.occRawModel.formation?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr class="unused">
				         <td>158</td>
				         <td>geological</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/member" target="_blank">member</a></td>
				         <td>${page.occRawModel.member?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				      <tr class="unused">
				         <td>159</td>
				         <td>geological</td>
				         <td><a href="http://rs.tdwg.org/dwc/terms/bed" target="_blank">bed</a></td>
				         <td>${page.occRawModel.bed?if_exists}</td>
				         <td class="unused"></td>
				      </tr>
				   </tbody>
				</table>
            </div>
            <!-- END ORIGINAL VIEW TAB-->
            
            <!-- NAME TAB -->
            <div id="?view=name"></div>
            <!-- CONTACT TAB -->
            <div id="?view=contact"></div>
         </div>
      </div>
      <!-- END TAB content_tab -->	
   </div>
   <#-- content -->
</div>
<#-- body -->
<#assign coordinateuncertaintyinmeters=0>
<#if page.occRawModel.coordinateuncertaintyinmeters?? && (page.occRawModel.coordinateuncertaintyinmeters?length>0)>
<#assign coordinateuncertaintyinmeters=page.occRawModel.coordinateuncertaintyinmeters?number>
</#if>
<#-- JavaScript handling -->
<content tag="local_script">
   <script src="//maps.googleapis.com/maps/api/js?sensor=false"></script>
   <@jsLibAsset libName="sorttable.js"/>
   <@jsAsset fileName="explorer" version=page.currentVersion! useMinified=page.useMinified/>
   <@jsAsset fileName="explorer.portal" version=page.currentVersion! useMinified=page.useMinified/>
   <script>
      $(function() {
        EXPLORER.details.setupSingleOccurrenceMap('occpage_map',${safeNumber(page.occModel.decimallatitude!"","undefined")},${safeNumber(page.occModel.decimallongitude!"","undefined")},${coordinateuncertaintyinmeters?c});
      });
   </script>
</content>