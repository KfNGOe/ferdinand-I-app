<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet 
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xsl xs" version="2.0">
    
    <xsl:template match="/" name="text_letters">
        
        <xsl:variable name="doc_title">
            <xsl:value-of select="normalize-space(string-join( ( .//tei:title[@type='main']//text(), .//tei:title[@type='sub']//text()), ' '))"/>
        </xsl:variable>
        
        <div class="container de" id="text-letters"><!-- style="display: none" -->        
            <h2><xsl:value-of select="$doc_title"/></h2>            
            <small><a href="#">xml</a>  |  <a href="#">doc</a></small>
            <h3>Metadaten</h3>
            <table class="table metadaten">
                <tbody>
                    <tr>
                        <td>Absender/in</td>
                        <td>
                            <xsl:value-of select="normalize-space(//tei:correspAction[@type='sent']/tei:persName)"/>
                        </td>
                    </tr>
                    <tr>
                        <td>Empfänger/in</td>
                        <td>
                            <xsl:value-of select="normalize-space(//tei:correspAction[@type='received']/tei:persName)"/>
                        </td>
                    </tr>
                    <tr>
                        <td>Datierung</td>
                        <td>
                            <xsl:value-of select="normalize-space(//tei:correspAction[@type='sent']/tei:date)"/>
                        </td>
                    </tr>
                    <tr>
                        <td>Brief-ID</td>
                        <td>
                            <xsl:value-of select="normalize-space(//tei:title[@type='main']//text())"/>
                        </td>
                    </tr>
                    <tr>
                        <td>Personen-Verweise</td>
                        <td>
                            <xsl:for-each-group select=".//tei:persName" group-by="@key">
                                <xsl:sort select="@key"/>
                                <a href="#{./@xml:id}">
                                    <xsl:value-of select="./@key"/>
                                </a> | 
                            </xsl:for-each-group>
                        </td>
                    </tr>
                    <tr>
                        <td>Ortsverweise</td>
                        <td>
                            <xsl:for-each-group select=".//tei:placeName" group-by="@key">
                                <xsl:sort select="@key"/>
                                <a href="#{./@xml:id}">
                                    <xsl:value-of select="./@key"/>
                                </a> | 
                            </xsl:for-each-group>
                        </td>
                    </tr>
                    <tr>
                        <td>Index-Einträge</td>
                        <td>
                            <xsl:for-each-group select=".//tei:index/tei:term" group-by="@key">
                                <xsl:sort select="@key"/>
                                <a href="#{./@xml:id}">
                                    <xsl:value-of select="./@key"/>
                                </a> | 
                            </xsl:for-each-group>
                        </td>
                    </tr>
                </tbody>
            </table>
            
            <h3>Text</h3>
            <h4>
                <b>
                    <xsl:value-of select="normalize-space(//tei:div[@type='header']/tei:p[1]/tei:hi[1])"/>
                </b>
            </h4>
            <table class="table text-detail">
                <tbody>
                    <tr>
                        <td>
                            <xsl:value-of select="normalize-space(//tei:div[@type='header']//tei:table[@rend='rules']//tei:cell[1]/tei:hi)"/>
                        </td>
                        <td>
                            <xsl:value-of select="normalize-space(//tei:div[@type='header']//tei:table[@rend='rules']//tei:cell[2]/tei:hi)"/>
                        </td>
                    </tr>
                </tbody>
            </table>
            
            <!-- //div[(@type="regest" ) and (@xml:lang="de")]/p -->
            <div class="regest de">
                <h4>Regest (Deutsch)</h4>
                <xsl:apply-templates select="//tei:div[@type='regest' and @xml:lang='de']"/>                
            </div>
            
            <div class="regest en">
                <h4>Regest (Englisch)</h4>
                <xsl:apply-templates select="//tei:div[@type='regest' and @xml:lang='en']"/>
            </div>
            
            <div class="archive_desc">
                <h4>Archivvermerk, Überlieferung</h4>
                <xsl:apply-templates select="//tei:div[@type='archive_desc']"/>    
            </div>
            
            <div class="letter">
                <h4>Transkript</h4>
                <xsl:apply-templates select="//tei:div[@type='letter']"/>
            </div>
            
            <div class="commentary">
                <h4>Kommentar</h4>
                <xsl:apply-templates select="//tei:div[@type='commentary']"/>
            </div>
        </div><!-- /col-lg-9 -->                        
    </xsl:template>
    
    <xsl:template match="//tei:div[@type='regest' and @xml:lang='de']">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="//tei:div[@type='regest' and @xml:lang='en']">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="//tei:div[@type='archive_desc']">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="//tei:div[@type='letter']">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="//tei:div[@type='commentary']">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:hi">
        <b><xsl:apply-templates/></b>    
    </xsl:template>
    
    <xsl:template match="tei:p">
        <p><xsl:apply-templates/></p>        
    </xsl:template>
    
    <xsl:template match="tei:persName[@key]">
        <a href="#{./@xml:id}">
            <xsl:apply-templates/>            
        </a>        
    </xsl:template>
    
    <xsl:template match="tei:placeName[@key]">
        <a href="#{./@xml:id}">
            <xsl:apply-templates/>            
        </a>                
    </xsl:template>
    
    <xsl:template match="tei:index/tei:term[@key]">
        <a href="#{./@xml:id}">
            <xsl:apply-templates/>                        
        </a>                
    </xsl:template>
    
</xsl:stylesheet>