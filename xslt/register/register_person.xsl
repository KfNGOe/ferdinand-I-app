<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
   xmlns="http://www.w3.org/1999/xhtml"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
   version="2.0" exclude-result-prefixes="xsl tei xs">
   <xsl:output encoding="UTF-8" media-type="text/html" method="xhtml" version="1.0" indent="yes" omit-xml-declaration="yes"/>
   
   <xsl:template match="/">
   
      <html>         
         
         <body class="page">
            <div class="container">                                                  
               <table class="table">
                  <thead>
                     <tr>
                        <th scope="col">Eintrag</th>
                        <th scope="col">Schreibweisen</th>
                        <th scope="col">Vorkommen</th>
                     </tr>
                  </thead>
                  <tbody> 
                     <xsl:for-each select="//tei:div[@type='letter']//tei:persName | //tei:div[@type='commentary']//tei:persName">
                        <xsl:sort select="./@key"/>
                        <tr>
                           <td id="{generate-id()}">
                              <xsl:value-of select="./@key"/>
                           </td>
                           <td>
                              
                           </td>
                           <td>
                              
                           </td>
                        </tr>
                     </xsl:for-each>
                  </tbody>
               </table>
               </div>
               
               <script>
                  
               </script>
            
         </body>
      </html>
   </xsl:template>
   
   <xsl:template match="tei:p">
      <p id="{generate-id()}"><xsl:apply-templates/></p>
   </xsl:template>
       
</xsl:stylesheet>