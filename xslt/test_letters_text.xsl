<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet 
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xsl xs" version="2.0">
    
    <xsl:template match="/" name="text_letters">
        
        <xsl:variable name="doc_title">
            <xsl:value-of select="normalize-space(string-join( ( .//tei:fileDesc/tei:titleStmt/tei:title[@type='main']//text(), .//tei:fileDesc/tei:titleStmt/tei:title[@type='sub']//text()), ' '))"/>
        </xsl:variable>
        
        <xsl:variable name="xml_path">
            <xsl:value-of select="tokenize(document-uri(/), '/')[last()]"/>
        </xsl:variable>
        
        <xsl:variable name="docx_path">
            <xsl:value-of select="replace(tokenize(document-uri(/), '/')[last()], '.xml', '.docx')"/>
        </xsl:variable>       
        
        <div class="container" id="textLetters"><!-- style="display: none" -->
            <div id="letterTitle">
                <div class="de">
                    <h2><xsl:value-of select="$doc_title"/></h2>
                </div>
                <div class="en">
                    <h2><xsl:value-of select="$doc_title"/></h2>
                </div>
            </div>
            <div id="letterFormat">
                <small>
                    <a href="../data/dtabf_id/band_001/{$xml_path}" target="_blank" download="">xml</a>  |  <a href="../data/docx/band_001/{$docx_path}" target="_blank" download="">doc</a>
                </small>
            </div>            
            <div id="letterMdata">
                <div class="de"><h3>Metadaten</h3></div>
                <div class="en"><h3>Metadata</h3></div>                    
                <table class="table metadata">
                    <tbody>
                        <tr>
                            <td>
                                <div class="de">Absender/in</div>
                                <div class="en">Sender</div>
                            </td>
                            <td>
                                <xsl:value-of select="normalize-space(//tei:correspAction[@type='sent']/tei:persName)"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="de">Empfänger/in</div>
                                <div class="en">Receiver</div>
                            </td>
                            <td>
                                <xsl:value-of select="normalize-space(//tei:correspAction[@type='received']/tei:persName)"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="de">Datierung</div>
                                <div class="en">Dating</div>
                            </td>
                            <td>
                                <xsl:value-of select="normalize-space(//tei:correspAction[@type='sent']/tei:date)"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="de">Brief-ID</div>
                                <div class="en">Letter-ID</div>
                            </td>
                            <td>
                                <xsl:value-of select="normalize-space(//tei:fileDesc/tei:titleStmt/tei:title[@type='main']//text())"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="de">Personen-Verweise</div>
                                <div class="en">People references</div>
                            </td>
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
                            <td>
                                <div class="de">Ortsverweise</div>
                                <div class="en">Place references</div>
                            </td>
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
                            <td>
                                <div class="de">Index-Einträge</div>
                                <div class="en">Index entries</div>
                            </td>
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
            </div>
            <div id="letterContent">
                <h3>Text</h3>
                <h4>
                    <b>
                        <xsl:value-of select="normalize-space(//tei:div[@n='1']/tei:p[1]/tei:hi[1])"/>
                    </b>
                </h4>
                <table class="table text-detail">
                    <tbody>
                        <tr>
                            <td>
                                <xsl:value-of select="normalize-space(//tei:div[@n='1']//tei:table[@rend='rules']//tei:cell[1]/tei:hi)"/>
                            </td>
                            <td>
                                <xsl:value-of select="normalize-space(//tei:div[@n='1']//tei:table[@rend='rules']//tei:cell[2]/tei:hi)"/>
                            </td>
                        </tr>
                    </tbody>
                </table>
                
                <!-- //div[(@type="regest" ) and (@xml:lang="de")]/p -->
                <div class="regest de">
                    <h4>Regest (Deutsch)</h4>
                    <xsl:apply-templates select="//tei:div[@n='2' and @xml:lang='de']"/>                
                </div>
                
                <div class="regest en">
                    <h4>Regest (Englisch)</h4>
                    <xsl:apply-templates select="//tei:div[@n='3' and @xml:lang='en']"/>
                </div>
                
                <div class="archive_desc">
                    <h4>Archivvermerk, Überlieferung</h4>
                    <xsl:apply-templates select="//tei:div[@n='4']"/>    
                </div>
                
                <div class="letter">
                    <h4>Transkript</h4>
                    <xsl:apply-templates select="//tei:div[@type='letter']"/>
                </div>
                
                <div class="commentary">
                    <h4>Kommentar</h4>
                    <xsl:apply-templates select="//tei:div[@n='6']"/>
                </div>
            </div>
            <!-- /col-lg-9 -->
        </div>
    </xsl:template>
    
    <xsl:template match="//tei:div[@n='2' and @xml:lang='de']">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="//tei:div[@n='3' and @xml:lang='en']">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="//tei:div[@n='4']">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="//tei:div[@type='letter']">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="//tei:div[@n='6']">
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