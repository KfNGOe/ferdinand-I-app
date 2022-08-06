<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
   xmlns="http://www.w3.org/1999/xhtml"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
   version="2.0" exclude-result-prefixes="xsl tei xs">
   <xsl:output encoding="UTF-8" media-type="text/xml" method="xml" version="1.0" indent="yes" omit-xml-declaration="yes"/>
   
   <xsl:template match="/">
   
      <TEI xmlns="http://www.tei-c.org/ns/1.0">
         <teiHeader>
            <fileDesc>
               <titleStmt>
                  <title>Person Register in TEI generated from TEI data of letters</title>
               </titleStmt>
               <publicationStmt>
                  <p>Publication Information</p>
               </publicationStmt>
               <sourceDesc>
                  <p>Information about the source</p>
               </sourceDesc>
            </fileDesc>
         </teiHeader>
         <text>
            <body>
               <list>
                  <xsl:for-each-group select="//tei:div[@type='letter']//tei:persName | //tei:div[@type='commentary']//tei:persName" group-by="@key">
                     <xsl:sort select="@key"/> 
                     <item>                    
                        <persName xml:id="#person_{generate-id()}">
                           <xsl:value-of select="@key"/>
                        </persName>
                        <note type="writings">
                           <xsl:for-each select="current-group()">
                              <p><xsl:value-of select="normalize-space(text())"/></p>
                           </xsl:for-each>
                        </note>
                        <note type="occurence">
                           <xsl:for-each select="current-group()">
                              <p><xsl:value-of select="//tei:title[@type='main']"/></p>
                           </xsl:for-each>
                        </note>                    
                     </item>
                  </xsl:for-each-group>                            
               </list>
            </body>
         </text>
      </TEI>
   </xsl:template>
   
   <xsl:template match="tei:p">
      <p id="{generate-id()}"><xsl:apply-templates/></p>
   </xsl:template>
       
</xsl:stylesheet>