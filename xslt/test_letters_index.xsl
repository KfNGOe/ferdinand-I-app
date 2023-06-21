<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet 
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="2.0" exclude-result-prefixes="tei xsl xs">
    
    <xsl:variable name="reg_index" select="document('../data/register/register_index.xml')"/>
    <xsl:variable name="reg_person" select="document('../data/register/register_person.xml')"/>
    <xsl:variable name="reg_place" select="document('../data/register/register_place.xml')"/>
    
    <xsl:template match="/" name="index_letters">
        <div class="container" id="indexLetters">            
                <xsl:for-each-group select=".//tei:persName" group-by="@n">
                    <xsl:variable name="ID" select="./@n"/>                
                    <div class="item" id="{./@n}">                    
                        <h3>
                            <span class="de">Eintrag</span>
                            <span class="en">Entry</span>
                        </h3>
                        <h4><xsl:value-of select="./@key"/> (Person)</h4>                        
                        <h4>
                            <span class="de">Schreibweisen</span>
                            <span class="en">Spellings</span>
                            <span>
                                <xsl:text>: </xsl:text>
                            </span>
                            <span class="fas fa-arrows-alt-v"></span>
                        </h4>
                        <ul class="scroll-area">
                            <xsl:for-each select="$reg_person//tei:note[@type='writings']/tei:p[ancestor::tei:item//tei:persName/@n=$ID]">
                                <li><xsl:value-of select="."/></li>    
                            </xsl:for-each>
                        </ul>
                        
                        <h4>
                            <span class="de">Vorkommen</span>
                            <span class="en">Occur</span>
                            <span>
                                <xsl:text>: </xsl:text>
                            </span>
                            <span class="fas fa-arrows-alt-v"></span>
                        </h4>            
                        <ul class="scroll-area">
                            <xsl:for-each select="$reg_person//tei:note[@type='occurence']/tei:p[ancestor::tei:item//tei:persName/@n=$ID]">
                                <xsl:variable name="volumeNr" select="./tei:note[@type='volNr']"/>
                                <li>
                                    <span class="de">Band_<xsl:value-of select="$volumeNr"/></span>
                                    <span class="en">Volume_<xsl:value-of select="$volumeNr"/></span>
                                    <span>
                                        <xsl:text>,</xsl:text>
                                    </span>
                                    <a href="{replace(./@source, '.xml', '.html')}#{$ID}"><xsl:value-of select="./tei:val"/></a>
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
                                </li>
                                
                            </xsl:for-each>                                                    
                        </ul>
                    </div>
                </xsl:for-each-group>
                
                <xsl:for-each-group select=".//tei:placeName" group-by="@n">
                    <xsl:variable name="ID" select="./@n"/>                    
                    <xsl:variable name="geoID" select="$reg_place//tei:note[@type ='geoname']/text()[ancestor::tei:item//tei:placeName/@n=$ID]"/>
                    <div class="item" id="{./@n}">                    
                        <h3>
                            <span class="de">Eintrag</span>
                            <span class="en">Entry</span>
                        </h3>
                        <h4>
                            <xsl:choose>
                                <xsl:when test="exists($geoID)">
                                    <a href="map.html#{$geoID}">
                                        <xsl:value-of select="./@key"/>
                                    </a>                                    
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="./@key"/>                                    
                                </xsl:otherwise>
                            </xsl:choose>                                                                                    
                            <span>
                                <xsl:text> (</xsl:text>
                            </span>
                            <span class="de">Ort</span>
                            <span class="en">Place</span>
                            <span>
                                <xsl:text>)</xsl:text>
                            </span>
                        </h4>
                        
                        <h4>
                            <span class="de">Schreibweisen</span>
                            <span class="en">Spellings</span>
                            <span>
                                <xsl:text>: </xsl:text>
                            </span>
                            <span class="fas fa-arrows-alt-v"></span>
                        </h4>
                        <ul class="scroll-area">
                            <xsl:for-each select="$reg_place//tei:note[@type='writings']/tei:p[ancestor::tei:item//tei:placeName/@n=$ID]">
                                <li><xsl:value-of select="."/></li>    
                            </xsl:for-each>                                                
                        </ul>
                        
                        <h4>
                            <span class="de">Vorkommen</span>
                            <span class="en">Occur</span>
                            <span>
                                <xsl:text>: </xsl:text>
                            </span>
                            <span class="fas fa-arrows-alt-v"></span>
                        </h4>
                        <ul class="scroll-area">
                            <xsl:for-each select="$reg_place//tei:note[@type='occurence']/tei:p[ancestor::tei:item//tei:placeName/@n=$ID]">
                                <xsl:variable name="volumeNr" select="./tei:note[@type='volNr']"/>
                                <li>
                                    <span class="de">Band_<xsl:value-of select="$volumeNr"/></span>
                                    <span class="en">Volume_<xsl:value-of select="$volumeNr"/></span>
                                    <span>
                                        <xsl:text>,</xsl:text>
                                    </span>
                                    <a href="{replace(./@source, '.xml', '.html')}#{$ID}"><xsl:value-of select="./tei:val"/></a>
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
                                </li> 
                            </xsl:for-each>
                        </ul>
                    </div>
                </xsl:for-each-group>
                
                <xsl:for-each-group select=".//tei:index/tei:term" group-by="@n">                
                    <xsl:variable name="ID" select="./@n"/>                
                    <div class="item" id="{./@n}">                    
                        <h3>
                            <span class="de">Eintrag</span>
                            <span class="en">Entry</span>
                        </h3>
                        <h4>
                            <xsl:value-of select="./@key"/>
                            <span>
                                <xsl:text> (</xsl:text>
                            </span>
                            <span class="de">Schlagwort</span>
                            <span class="en">Keyword</span>
                            <span>
                                <xsl:text>)</xsl:text>
                            </span>
                        </h4>
                        
                        <h4>
                            <span class="de">Schreibweisen</span>
                            <span class="en">Spellings</span>
                            <span>
                                <xsl:text>: </xsl:text>
                            </span>
                            <span class="fas fa-arrows-alt-v"></span>
                        </h4>
                        <ul class="scroll-area">
                            <xsl:for-each select="$reg_index//tei:note[@type='writings']/tei:p[ancestor::tei:item//tei:index/tei:term/@n=$ID]">
                                <li><xsl:value-of select="."/></li>    
                            </xsl:for-each>                                                
                        </ul>
                        
                        <h4>
                            <span class="de">Vorkommen</span>
                            <span class="en">Occur</span>
                            <span>
                                <xsl:text>: </xsl:text>
                            </span>
                            <span class="fas fa-arrows-alt-v"></span>
                        </h4>            
                        <ul class="scroll-area">
                            <xsl:for-each select="$reg_index//tei:note[@type='occurence']/tei:p[ancestor::tei:item//tei:index/tei:term/@n=$ID]">
                                <xsl:variable name="volumeNr" select="./tei:note[@type='volNr']"/>
                                <li>
                                    <span class="de">Band_<xsl:value-of select="$volumeNr"/></span>
                                    <span class="en">Volume_<xsl:value-of select="$volumeNr"/></span>
                                    <span>
                                        <xsl:text>,</xsl:text>
                                    </span>
                                    <a href="{replace(./@source, '.xml', '.html')}#{$ID}"><xsl:value-of select="./tei:val"/></a>
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
                                </li> 
                            </xsl:for-each>                                                    
                        </ul>                        
                    </div>
                </xsl:for-each-group>
        </div>
    </xsl:template>

</xsl:stylesheet>