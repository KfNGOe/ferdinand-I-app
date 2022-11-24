<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="2.0" exclude-result-prefixes="xsl tei xs">
    
    <xsl:template match="/" name="toc_letters">
        <div class="container de" id="select-list">        
            <h2>Inhaltsverzeichnis <!--<span class="fas fa-arrows-alt-v"></span>--><a class="fas fa-redo-alt" title="zum Aktualisieren klicken" href="#0"></a></h2>
            <!--
          <div class="scroll-area"> -->
            <h3><a class="selected" href="">Band 1 (Band_1)</a></h3>
            <ul>
                <xsl:for-each select="collection('../data/band_001')//tei:TEI">
                    <xsl:variable name="full_path">
                        <xsl:value-of select="document-uri(/)"/>
                    </xsl:variable>
                    
                    <li class="toc-item">
                        <a>
                            <xsl:attribute name="href">                                                
                                <xsl:value-of select="concat( '#', tokenize($full_path, '/')[last()] )"/>
                            </xsl:attribute>                            
                            <xsl:value-of select="normalize-space(concat( .//tei:title[@type='main']//text(), ': ', .//tei:title[@type='sub']//text() ))"/>                            
                        </a>
                    </li>
                </xsl:for-each>                
            </ul>
            <!--
        </div> -->
        </div>
    </xsl:template>
</xsl:stylesheet>