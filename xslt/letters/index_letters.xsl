<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet 
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="2.0" exclude-result-prefixes="tei xsl xs">
    
    <xsl:variable name="reg_person" select="document('../data/register/register_person.xml')"/>
    <xsl:variable name="reg_place" select="document('../data/register/register_place.xml')"/>
    <xsl:variable name="reg_index" select="document('../data/register/register_index.xml')"/>    
    
    <xsl:template match="/" name="index_letters">
        
        <div class="container de" id="index-letters">
            <xsl:for-each select=".//tei:persName[@xml:id]">
                <xsl:variable name="ID" select="./@xml:id"/>                
                <div class="item" id="{./@xml:id}">                    
                    <h3>Eintrag</h3>
                    <h4><xsl:value-of select="./@key"/> (Person)</h4>
                    
                    <h4>Schreibweisen: <span class="fas fa-arrows-alt-v"></span></h4>
                    <ul class="scroll-area">
                        <xsl:for-each select="$reg_person//tei:note[@type='writings']/tei:p[ancestor::tei:item//tei:persName/@xml:id=$ID]">
                            <li><xsl:value-of select="."/></li>    
                        </xsl:for-each>                                                
                    </ul>
                    
                    <h4>Vorkommen: <span class="fas fa-arrows-alt-v"></span></h4>            
                    <ul class="scroll-area">
                        <xsl:for-each select="$reg_person//tei:note[@type='occurence']/tei:p[ancestor::tei:item//tei:persName/@xml:id=$ID]">
                            <li>Band_1, <a href="{replace(./@source, '.xml', '.html')}#{$ID}"><xsl:value-of select="."/></a></li>                            
                        </xsl:for-each>                        
                    </ul>
                </div>
            </xsl:for-each>
            
            <xsl:for-each select=".//tei:placeName[@xml:id]">
                <xsl:variable name="ID" select="./@xml:id"/>                
                <div class="item" id="{./@xml:id}">                    
                    <h3>Eintrag</h3>
                    <h4><xsl:value-of select="./@key"/> (Ort)</h4>
                    
                    <h4>Schreibweisen: <span class="fas fa-arrows-alt-v"></span></h4>
                    <ul class="scroll-area">
                        <xsl:for-each select="$reg_place//tei:note[@type='writings']/tei:p[ancestor::tei:item//tei:placeName/@xml:id=$ID]">
                            <li><xsl:value-of select="."/></li>    
                        </xsl:for-each>                                                
                    </ul>
                    
                    <h4>Vorkommen: <span class="fas fa-arrows-alt-v"></span></h4>            
                    <ul class="scroll-area">
                        <xsl:for-each select="$reg_place//tei:note[@type='occurence']/tei:p[ancestor::tei:item//tei:placeName/@xml:id=$ID]">
                            <li>Band_1, <a href="{replace(./@source, '.xml', '.html')}#{$ID}"><xsl:value-of select="."/></a></li>                            
                        </xsl:for-each>                        
                    </ul>
                </div>
            </xsl:for-each>
            
            <xsl:for-each select=".//tei:index/tei:term[@xml:id]">
                <xsl:variable name="ID" select="./@xml:id"/>                
                <div class="item" id="{./@xml:id}">                    
                    <h3>Eintrag</h3>
                    <h4><xsl:value-of select="./@key"/> (Schlagwort)</h4>
                    
                    <h4>Schreibweisen: <span class="fas fa-arrows-alt-v"></span></h4>
                    <ul class="scroll-area">
                        <xsl:for-each select="$reg_index//tei:note[@type='writings']/tei:p[ancestor::tei:item//tei:index/tei:term/@xml:id=$ID]">
                            <li><xsl:value-of select="."/></li>    
                        </xsl:for-each>                                                
                    </ul>
                    
                    <h4>Vorkommen: <span class="fas fa-arrows-alt-v"></span></h4>            
                    <ul class="scroll-area">
                        <xsl:for-each select="$reg_index//tei:note[@type='occurence']/tei:p[ancestor::tei:item//tei:index/tei:term/@xml:id=$ID]">
                            <li>Band_1, <a href="{replace(./@source, '.xml', '.html')}#{$ID}"><xsl:value-of select="."/></a></li>                            
                        </xsl:for-each>                        
                    </ul>
                </div>
            </xsl:for-each>
        </div><!-- /col-lg-3 -->
        
    </xsl:template>
    
</xsl:stylesheet>