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
                    <a href="./data/dtabf_id/band_001/{$xml_path}" target="_blank" download="">xml</a>  |  <a href="./data/docx/band_001/{$docx_path}" target="_blank" download="">doc</a>
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
                                    </a>
                                    <xsl:if test="position() != last()">
                                        <xsl:text> | </xsl:text>
                                    </xsl:if>
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
                                    </a>
                                    <xsl:if test="position() != last()">
                                        <xsl:text> | </xsl:text>
                                    </xsl:if>
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
                                    </a>
                                    <xsl:if test="position() != last()">
                                        <xsl:text> | </xsl:text>
                                    </xsl:if>
                                </xsl:for-each-group>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div id="letterContent">
                <h3>Text</h3>
                <h4>
                    <span class="bold">
                        <xsl:value-of select="//tei:div[@n='1']/tei:p[1]/tei:hi[1]"/>
                    </span>                                        
                </h4>
                <table class="table text-detail">
                    <tbody>
                        <tr>
                            <td>
                                <xsl:apply-templates select="//tei:div[@n='1']//tei:table[@rend='rules']//tei:cell[1]"/>
                            </td>
                            <td>
                                <xsl:apply-templates select="//tei:div[@n='1']//tei:table[@rend='rules']//tei:cell[2]"/>                                
                            </td>
                        </tr>
                    </tbody>
                </table>
                
                <xsl:if test="exists(//tei:div[@n='2' and @xml:lang='de'])">
                    <div class="regest de">
                        <h4>Regest (Deutsch)</h4>
                        <xsl:apply-templates select="//tei:div[@n='2' and @xml:lang='de']"/>                
                    </div>    
                </xsl:if>                
                
                <xsl:if test="exists(//tei:div[@n='3' and @xml:lang='en'])">
                    <div class="regest en">
                        <h4>Regest (Englisch)</h4>
                        <xsl:apply-templates select="//tei:div[@n='3' and @xml:lang='en']"/>
                    </div>    
                </xsl:if>
                
                <xsl:if test="exists(//tei:div[@n='4'])">
                    <div class="archive_desc">
                        <h4>Archivvermerk, Überlieferung</h4>
                        <xsl:apply-templates select="//tei:div[@n='4']"/>    
                    </div>    
                </xsl:if>                
                
                <xsl:if test="exists(//tei:div[@n='5'])">
                    <div class="letter">
                        <h4>Transkript</h4>
                        <xsl:apply-templates select="//tei:div[@type='letter']"/>
                    </div>    
                </xsl:if>                
                
                <xsl:if test="exists(//tei:div[@n='6'])">
                    <div class="commentary">
                        <h4>Kommentar</h4>
                        <xsl:apply-templates select="//tei:div[@n='6']"/>
                    </div>    
                </xsl:if>
                
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
        
    <xsl:template match="//tei:div[@n='1']//tei:table[@rend='rules']//tei:cell[1]">
        <xsl:apply-templates select="tei:hi"/>
    </xsl:template>
    
    <xsl:template match="//tei:div[@n='1']//tei:table[@rend='rules']//tei:cell[2]">
        <xsl:apply-templates select="tei:hi"/>
    </xsl:template>
    
    <xsl:template match="//tei:div[@type='letter' and @n='5']//tei:table[@rend='rules']">        
        <table class="table text">
            <tbody>
                <xsl:for-each select="./tei:row">                                        
                    <xsl:variable name="cell1Level1" select="./tei:cell[1]/text()[1]"/>                    
                    <xsl:variable name="cell2Level1" select="./tei:cell[2]/text()[1]"/>
                    <xsl:variable name="cell2Level2" select="./tei:cell[2]/*[1]/text()[1]"/>
                    <tr>
                        <td>
                            <xsl:choose>
                                <xsl:when test="exists($cell1Level1)">
                                    <xsl:choose>
                                        <xsl:when test="matches($cell1Level1, '^\d+\]\s+')">
                                            <xsl:analyze-string select="$cell1Level1" regex="^(\d+)\]\s+">
                                                <xsl:matching-substring>
                                                    <xsl:element name="a">
                                                        <xsl:attribute name="href">#comm_<xsl:value-of select="regex-group(1)"/></xsl:attribute>
                                                        <xsl:attribute name="id">trans_<xsl:value-of select="regex-group(1)"/></xsl:attribute>
                                                        <span class="paragraphNr transcription de" title="Emendation des Herausgebers"><xsl:value-of select="regex-group(1)"/>] </span>
                                                        <span class="paragraphNr transcription en" title="Emendation of the editor"><xsl:value-of select="regex-group(1)"/>] </span>
                                                    </xsl:element>            
                                                </xsl:matching-substring>
                                                <xsl:non-matching-substring>
                                                    <xsl:value-of select="."/>
                                                    <xsl:apply-templates select="$cell1Level1/following-sibling::node()"/>                                                        
                                                </xsl:non-matching-substring>
                                            </xsl:analyze-string>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:apply-templates/>                                                
                                        </xsl:otherwise>
                                    </xsl:choose>                                
                                </xsl:when>                                                        
                            </xsl:choose>
                        </td>
                        <td>
                            <xsl:choose>
                                <xsl:when test="exists($cell2Level1)">
                                    <xsl:value-of select="$cell2Level1"/>
                                    <xsl:apply-templates select="$cell2Level1/following-sibling::node()"/>                                                                                
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:choose>
                                        <xsl:when test="exists($cell2Level2)">
                                            <xsl:choose>
                                                <xsl:when test="matches($cell2Level2, '^\d+\]\s+')">
                                                    <xsl:analyze-string select="$cell2Level2" regex="^(\d+)\]\s+">
                                                        <xsl:matching-substring>
                                                            <xsl:element name="a">
                                                                <xsl:attribute name="href">#comm_<xsl:value-of select="regex-group(1)"/></xsl:attribute>
                                                                <xsl:attribute name="id">trans_<xsl:value-of select="regex-group(1)"/></xsl:attribute>
                                                                <span class="paragraphNr transcription de" title="Emendation des Herausgebers"><xsl:value-of select="regex-group(1)"/>] </span>
                                                                <span class="paragraphNr transcription en" title="Emendation of the editor"><xsl:value-of select="regex-group(1)"/>] </span>
                                                            </xsl:element>            
                                                        </xsl:matching-substring>
                                                        <xsl:non-matching-substring>                                
                                                            <xsl:value-of select="."/>
                                                            <xsl:apply-templates select="$cell2Level2/following-sibling::node()"/>                                                        
                                                        </xsl:non-matching-substring>
                                                    </xsl:analyze-string>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:apply-templates/>
                                                </xsl:otherwise>
                                            </xsl:choose>                                                
                                        </xsl:when>                                            
                                    </xsl:choose>                                        
                                </xsl:otherwise>
                            </xsl:choose>
                        </td>
                    </tr>
                </xsl:for-each>
            </tbody>
        </table>
    </xsl:template>
    
    <xsl:template match="tei:hi">
        <xsl:choose>
            <xsl:when test="./@rendition = '#b'">
                <span class="bold">
                    <xsl:apply-templates/>
                </span>
            </xsl:when>
            <xsl:otherwise>
                <xsl:choose>
                    <xsl:when test="./@rendition = '#i'">
                        <span class="italic">
                            <xsl:apply-templates/>
                        </span>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:choose>
                            <xsl:when test="./@rendition = '#sup'">
                                <span class="sup">
                                    <xsl:apply-templates/>
                                </span>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:choose>                                    
                                    <xsl:when test="./@rendition = '#i #sup'">
                                        <span class="italic sup">
                                            <xsl:apply-templates/>
                                        </span>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:choose>
                                            <xsl:when test="./@rendition = '#k'">
                                                <span class="uppercase">
                                                    <xsl:apply-templates/>
                                                </span>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:choose>
                                                    <xsl:when test="./@rendition = '#g'">
                                                    <span class="spaced">
                                                        <xsl:apply-templates/>
                                                    </span>
                                                    </xsl:when>
                                                    <xsl:otherwise>                                                
                                                        <xsl:apply-templates/>
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:otherwise>
                                        </xsl:choose>                                        
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>                
    </xsl:template>
    
    <xsl:template match="tei:p">
        <p>            
            <xsl:if test="exists(./@n)">
                <xsl:choose>
                    <xsl:when test="exists(./@rend)">
                        <xsl:element name="a">
                            <xsl:attribute name="href">#trans_<xsl:value-of select="./@n"/></xsl:attribute>
                            <xsl:attribute name="id">comm_<xsl:value-of select="./@n"/></xsl:attribute>
                            <span class="paragraphNr commentary"><xsl:value-of select="./@n"/>] </span>
                        </xsl:element>                                                
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:element name="a">
                            <xsl:attribute name="href">#comm_<xsl:value-of select="./@n"/></xsl:attribute>
                            <xsl:attribute name="id">trans_<xsl:value-of select="./@n"/></xsl:attribute>
                            <span class="paragraphNr transcription de" title="Emendation des Herausgebers"><xsl:value-of select="./@n"/>] </span>
                            <span class="paragraphNr transcription en" title="Emendation of the editor"><xsl:value-of select="./@n"/>] </span>
                        </xsl:element>                        
                    </xsl:otherwise>
                </xsl:choose>                                
            </xsl:if>            
            <xsl:apply-templates/>
        </p>        
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
    

