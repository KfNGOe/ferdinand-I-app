<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="2.0" exclude-result-prefixes="xsl tei xs">
     
    <xsl:variable name="coll_toc" select="collection('../data/dtabf_id/band_001/')//tei:TEI"/>
    
    <!--  
    <xsl:variable name="coll_toc" select="document('../data/dtabf_id/test/A005.xml')//tei:TEI"/>
    -->
    <xsl:template match="/" name="toc_letters">
        <div class="container" id="selectList">
            <div class="de">            
                <h2>Inhaltsverzeichnis <!--<span class="fas fa-arrows-alt-v"></span>--><a class="fas fa-redo-alt" title="zum Aktualisieren klicken" href="#0"></a>
                </h2>
                <!--
          <div class="scroll-area"> -->
                <h3>
                    <a class="selected" href="">Band 1 (Band_1)</a>
                </h3>
                <xsl:call-template name="toc_content"/>
            </div>
            <div class="en" style="display: none">        
                <h2>Table of content <!--<span class="fas fa-arrows-alt-v"></span>--><a class="fas fa-redo-alt" title="zum Aktualisieren klicken" href="#0"></a>
                </h2>
                <!--
          <div class="scroll-area"> -->
                <h3>
                    <a class="selected" href="">Volume 1 (Volume_1)</a>
                </h3>
                <xsl:call-template name="toc_content"/>
            </div>            
        </div>
    </xsl:template>
    
    <xsl:template name="toc_content">
        <ul>
            <xsl:for-each select="$coll_toc">
                <xsl:sort select="tokenize(document-uri(/), '/')[last()]"/>                
                <xsl:variable name="full_path">
                    <xsl:value-of select="document-uri(/)"/>
                </xsl:variable>
                <xsl:if test="not(starts-with(tokenize($full_path, '/')[last()], 'test'))">                    
                    <li class="toc-item">
                        <a>
                            <xsl:attribute name="href">                                                
                                <xsl:value-of select="replace(tokenize($full_path, '/')[last()], '.xml', '.html')"/>
                            </xsl:attribute>
                            <xsl:value-of select="concat( .//tei:fileDesc/tei:titleStmt/tei:title[@type='main']//text(), ': ', normalize-space(string-join(.//tei:fileDesc/tei:titleStmt/tei:title[@type='sub']//text())))"/>                            
                        </a>
                    </li>
                </xsl:if>
            </xsl:for-each>                
        </ul>        
    </xsl:template>
</xsl:stylesheet>