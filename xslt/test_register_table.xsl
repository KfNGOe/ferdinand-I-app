<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet 
   xmlns="http://www.w3.org/1999/xhtml"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
   version="2.0" exclude-result-prefixes="xsl tei xs">
   
   <xsl:output encoding="UTF-8" media-type="text/html" method="xhtml" version="1.0" indent="yes" omit-xml-declaration="yes"/>
   
   <xsl:template match="/" name="register_table">
      
      <xsl:param name="file_name"/>
      
	  <div id="registerFormat" style="display: none">		
		<small>
			<a href="./data/register/{$file_name}.xml" target="_blank" download="">xml</a>
		</small>
	  </div>
	  
      <div class="container" id="table-register">
         <table class="table register-tabelle">
            <thead>
               <tr>
                  <th scope="col" style="display: none">Local-ID</th>
                  <th scope="col" style="display: none">GND</th>
                  <th scope="col" style="display: none">Geonames</th>
                  <th scope="col">
                     <span class="de">Eintrag</span>
                     <span class="en">Entry</span>
                  </th>
                  <th scope="col">
                     <span class="de">Schreibweisen</span>
                     <span class="en">Writings</span>
                  </th>                                    
                  <th scope="col">
                     <span class="de">Vorkommen</span>
                     <span class="en">Occurence</span>
                  </th>
               </tr>
            </thead>
            <tbody>
               <xsl:for-each select=".//tei:item">
                  <tr>
                     <td style="display: none">
                        <xsl:if test="$file_name = 'register_person'">
                           <xsl:variable name="ID" select=".//tei:persName/@xml:id"/>
                           <xsl:value-of select="$ID"/>   
                        </xsl:if>
                        <xsl:if test="$file_name = 'register_place'">
                           <xsl:variable name="ID" select=".//tei:placeName/@xml:id"/>
                           <xsl:value-of select="$ID"/>   
                        </xsl:if>
                        <xsl:if test="$file_name = 'register_index'">                           
                           <xsl:variable name="ID" select=".//tei:index/tei:term/@xml:id"/>
                           <xsl:value-of select="$ID"/>
                        </xsl:if>
                     </td>
                     <td style="display: none"></td>
                     <td style="display: none"></td>
                     <td>                        
                        <xsl:if test="$file_name = 'register_person'">
                           <xsl:value-of select=".//tei:persName/text()"/>   
                        </xsl:if>
                        <xsl:if test="$file_name = 'register_place'">
                           <xsl:value-of select=".//tei:placeName/text()"/>   
                        </xsl:if>
                        <xsl:if test="$file_name = 'register_index'">
                           <xsl:value-of select=".//tei:index/tei:term/text()"/>   
                        </xsl:if>
                     </td>
                     <td>
                        <xsl:for-each select="./tei:note[@type='writings']/tei:p">
                           <p>
                              <xsl:value-of select="."/>
                           </p>    
                        </xsl:for-each>
                     </td>
                     <td>
                        <xsl:for-each select="./tei:note[@type='occurence']/tei:p">
                           <xsl:variable name="volumeNr" select="./tei:note[@type='volNr']"/>
                           <p>
                              <span class="de">Band_<xsl:value-of select="$volumeNr"/></span>
                              <span class="en">Volume_<xsl:value-of select="$volumeNr"/></span>
                              <span>
                                 <xsl:text>,</xsl:text>
                              </span>
                              <a href="{replace(./@source, '.xml', '.html')}">
                                 <xsl:value-of select="./tei:val"/>
                              </a>
                              
                              <span>
                                 <xsl:text>.</xsl:text>
                                 <xsl:if test="./tei:note[@type='div'] = 'regest_de'">
                                    <span class="de">regest_de</span><span class="en">regest_de</span>
                                 </xsl:if>
                                 <xsl:if test="./tei:note[@type='div'] = 'regest_en'">
                                    <span class="de">regest_en</span><span class="en">regest_en</span>
                                 </xsl:if>
                                 <xsl:if test="./tei:note[@type='div'] = 'archive_desc'">
                                    <span class="de">archiv</span><span class="en">archive</span>
                                 </xsl:if>                                 
                                 <xsl:if test="./tei:note[@type='div'] = 'transcription'">
                                    <span class="de">transkript</span><span class="en">transcript</span>
                                 </xsl:if>
                                 <xsl:if test="./tei:note[@type='div'] = 'commentary'">
                                    <span class="de">kommentar</span><span class="en">commentary</span>
                                 </xsl:if>
                                 <xsl:if test="exists(./tei:note[@type='para']/text())">
                                    <xsl:text>#</xsl:text>
                                    <xsl:value-of select="./tei:note[@type='para']"/>   
                                 </xsl:if>
                              </span>
                           </p>                            
                        </xsl:for-each>
                     </td>                     
                  </tr>
               </xsl:for-each>
            </tbody>
         </table>            
      </div>      
      
   </xsl:template>            

</xsl:stylesheet>