<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet 
   xmlns="http://www.w3.org/1999/xhtml"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
   version="2.0" exclude-result-prefixes="xsl tei xs">
   
   <xsl:output encoding="UTF-8" media-type="text/html" method="xhtml" version="1.0" indent="yes" omit-xml-declaration="yes"/>
   
   <xsl:template match="/" name="register_table">
      
      <xsl:param name="file_name"/>
      
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
                           <xsl:value-of select=".//tei:persName/@xml:id"/>   
                        </xsl:if>
                        <xsl:if test="$file_name = 'register_place'">
                           <xsl:value-of select=".//tei:placeName/@xml:id"/>   
                        </xsl:if>
                        <xsl:if test="$file_name = 'register_index'">
                           <xsl:value-of select=".//tei:index/tei:term/@xml:id"/>   
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
                           <p>
                              <span class="de">Band_1</span><span class="en">Volume_1</span>, <a href="{replace(./@source, '.xml', '.html')}"><xsl:value-of select="."/></a>
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