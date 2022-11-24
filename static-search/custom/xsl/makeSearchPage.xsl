<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:map="http://www.w3.org/2005/xpath-functions"
    xmlns:hcmc="http://hcmc.uvic.ca/ns/staticSearch"
    xmlns:svg="http://www.w3.org/2000/svg"
    xpath-default-namespace="http://www.w3.org/1999/xhtml"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="#all"
    version="3.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Sep 16, 2019</xd:p>
            <xd:p><xd:b>Author:</xd:b> joeytakeda</xd:p>
            <xd:p>This stylesheet transforms the search page into a workable one, based off of
                filters etc.</xd:p>
        </xd:desc>
    </xd:doc>
    
    <!--**************************************************************
       *                                                            *
       *                         Output                             *
       *                                                            *
       **************************************************************-->
    
    <xd:doc>
        <xd:desc>Output as XHTML with HTML version 5.0; this is necessary for adding the
            propery DOCTYPE processing instruction.</xd:desc>
    </xd:doc>
    <xsl:output method="xhtml" encoding="UTF-8" normalization-form="NFC"
        exclude-result-prefixes="#all" omit-xml-declaration="yes" html-version="5.0"/>
    
    <!--**************************************************************
       *                                                            *
       *                         Variables and parameters                         *
       *                                                            *
       **************************************************************-->
    
    <xsl:variable name="ssSearchJs">
        <script src="static-search/ssSearch.js"></script>
    </xsl:variable>
    
    <xsl:variable name="ssSearchReturnJs">
        <script>
            var Sch ;
            window.addEventListener('load', function() {
                Sch = new StaticSearch() ;
                
                Sch.searchFinishedHook = function(num) {
                    console.log("search returned");
                    console.log(num);
                    
                    if (num == 1 || num == 4 ){
                        list2Table();                
                    } ;
                    
                    transformSearchResultLinks();
                    showMaxHits();
                    showMinWordLength() ;
                } ;
            }) ;
        </script>
    </xsl:variable>
    
    <xsl:variable name="ssForm">
        <div id="ssQueryAndButton">
            <div class="form-group row">
                <div class="col-12 col-form-label">
                    <label>
                        <span class="de">Suche nach</span>
                        <span class="en">Searching for</span>
                    </label>
                </div>                
                <div class="col-12">
                    <!-- <input type="text" id="ssQuery"/> -->
                    <input id="ssQuery" type="text" placeholder="Begriff hier eingeben" class="form-control"/>
                </div>
                <div class="col-12">
                    <button id="ssDoSearch" name="submit" type="submit" class="btn btn-primary">
                        <span class="de">Absenden</span>
                        <span class="en">Submit</span>                        
                    </button>                            
                </div>
            </div>            
            
        </div>
    </xsl:variable>
    
    <xsl:variable name="ssSearching">
        <div id="ssSearching" style="display: none;">
            <div class="de">Suche...</div>
            <div class="en">Searching...</div>
        </div>
    </xsl:variable>
    
    <xsl:variable name="ssShowMaxHits">
        <div id="showMaxHits" style="display: none;">
            <div class="de">Angezeigte Treffer max <span></span></div>
            <div class="en">Displayed hits max <span></span></div>
        </div>
    </xsl:variable>
    
    <xsl:variable name="ssShowMinWordLength">
        <div id="showMinWordLength" style="display: none;">
            <div class="de">Wortlänge min <span></span></div>
            <div class="en">Word length min <span></span></div>
        </div>
    </xsl:variable>
    
    <xsl:variable name="ssResults">
        <div id="ssResults" style="display: none;"></div>
    </xsl:variable>
    
    <!--**************************************************************
       *                                                            *
       *                         Templates                          *
       *                                                            *
       **************************************************************-->
    
    <xd:doc>
        <xd:desc>Root template just for checking to see whether or not the document has
            the require div/@id='staticSearch'.</xd:desc>
    </xd:doc>
    <xsl:template match="/">
        
        <!--Warning message if there is no staticSearch div in the document-->
        <xsl:if test="not(descendant::div[@id='staticSearch'])">
            <xsl:message>ERROR: Document does not contain a div/@id='staticSearch' and thus this transformation
                will not do anything.</xsl:message>
        </xsl:if>
        
        <!--Now apply templates-->
        <xsl:apply-templates/>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>This  template detects an HTML head element which does not contain an
            existing style element with the id ssCss, and injects one containing the code in
            the <xd:ref name="css">$css</xd:ref> parameter. We place it first in the head element
            so that any subsequent style element provided by the user can override it.</xd:desc>
    </xd:doc>     
    <xsl:template match="node()|@*">        
        <xsl:choose>
            <xsl:when test="./@id='ssCss'">                
                <xsl:apply-templates/>    
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy>
                    <xsl:apply-templates select="@*"/>                     
                    <xsl:apply-templates/>
                </xsl:copy>       
            </xsl:otherwise>
        </xsl:choose>        
    </xsl:template>
        
    <xd:doc>
        <xd:desc></xd:desc>
    </xd:doc>
    <xsl:template match="div[@id='staticSearch']">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:sequence select="$ssSearchJs"/>
            <xsl:sequence select="$ssSearchReturnJs"/>
            <xsl:apply-templates select="./form"/>
            <xsl:sequence select="$ssSearching"/>
            <xsl:sequence select="$ssShowMaxHits"/>
            <xsl:sequence select="$ssShowMinWordLength"/>
            <xsl:sequence select="$ssResults"/>
            <xsl:apply-templates select="./div[@id='ssPoweredBy']"/>            
        </xsl:copy>        
    </xsl:template>
    
    <xd:doc>
        <xd:desc></xd:desc>
    </xd:doc>
    <xsl:template match="div[@id='staticSearch']/form">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:sequence select="$ssForm"/>                        
        </xsl:copy>                        
    </xsl:template>
    
    <xd:doc>
        <xd:desc></xd:desc>
    </xd:doc>
    <xsl:template match="div[@id='staticSearch']/div[@id='ssPoweredBy']">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:attribute name="style">display: none;</xsl:attribute>
            <xsl:apply-templates select="child::element()"/>                        
        </xsl:copy>                        
    </xsl:template>       
        
</xsl:stylesheet>