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
       *                         Includes                           *
       *                                                            *
       **************************************************************-->

    <xd:doc>
        <xd:desc>Include the global config XSLT that is derived from the configuration file
        and the create_config.xsl. See <xd:a href="create_config_xsl.xsl">create_config_xsl.xsl</xd:a>
        for more details.</xd:desc>
    </xd:doc>
    <xsl:include href="config.xsl"/>
    
    <xd:doc>
        <xd:desc>Include the captions set and the associated function.</xd:desc>
    </xd:doc>
    <xsl:include href="captions.xsl"/>

    <!--**************************************************************
       *                                                            *
       *                         Modes                              *
       *                                                            *
       **************************************************************-->

    <xd:doc>
        <xd:desc>This mode tag (which applies to the default) specifies that this is an
        identity transform (@on-no-match='shallow-copy'). This require XSLT 3.0.</xd:desc>
    </xd:doc>
    <xsl:mode on-no-match="shallow-copy"/>

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

    <xd:doc>
        <xd:desc><xd:ref name="hasFilters">$hasFilters</xd:ref> is used to specify whether
        the site build process has discovered any filter metadata in the collection. If so, then
        we need to create appropriate form controls.</xd:desc>
    </xd:doc>
    <xsl:param name="hasFilters" as="xs:string" select="'false'"/>
    
    <xd:doc>
        <xd:desc><xd:ref name="docsJSON" type="variable">$docsJSON</xd:ref> is the previously created
        JSON file from the filters specified in the document metadata; we load this and then parse it
        as XML, since we create the filter selector from it.</xd:desc>
    </xd:doc>
    <xsl:variable name="docsJSON"
                select="concat($outDir, '/docs.json') => unparsed-text() => json-to-xml()"
                as="document-node()"/>
    
    <xsl:variable name="filterJSONURIs" select="if ($hasFilters = 'true') then
        uri-collection(concat($outDir,'/filters/?select=*.json')) else ()"/>
    
    <xd:doc>
        <xd:desc><xd:ref name="svgLogoFile">svgLogoFile</xd:ref> is the relative path
        from this XSLT to the file to be used as the staticSearch logo.</xd:desc>
    </xd:doc>
    <xsl:variable name="svgLogoFile" as="xs:string" select="'../images/logo_01.svg'"/>
    
    <xd:doc>
      <xd:desc><xd:ref name="dateRegex">dateRegex</xd:ref> is used for date matching/recognition
        when creating date filters.</xd:desc>
    </xd:doc>
    <xsl:variable name="dateRegex" select="'^\d\d\d\d(-((((01)|(03)|(05)|(07)|(08)|(10)|(12))-((0[1-9])|([12][0-9])|(3[01])))|(((04)|(06)|(09)|(11))-((0[1-9])|([12][0-9])|(30)))|(02-((0[1-9])|([12][0-9]))))|(-((0[123456789])|(1[012]))))?$'" as="xs:string"/>
  
    <xd:doc>
      <xd:desc><xd:ref name="pageLang">pageLang</xd:ref> is the language of the search page (if specified)
      or "en" if not. This is used for sorting filter items.</xd:desc>
    </xd:doc>
  <xsl:variable name="pageLang" as="xs:string" select="if (/html/@*:lang) then /html/@*:lang[1] else 'en'"/>

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
        <xd:desc>This  template replaces an existing style element with the id ssCss (old approach)
            or a link element with the same id (2020-01-21 onward)
            with a link element pointing to the CSS file.</xd:desc>
    </xd:doc>
    <xsl:template match="style[@id='ssCss'] | link[@id='ssCss']">
        <!-- RH 
        <link rel="stylesheet" href="{$outputFolder}/ssSearch.css" id="ssCss"/>
        -->
        <!-- RH
            <style id="ssCss">
            <xsl:comment>
                <xsl:value-of select="$css" disable-output-escaping="yes"/>
            </xsl:comment>
        </style>-->
    </xsl:template>

    <xd:doc>
        <xd:desc>This  template detects an HTML head element which does not contain an
            existing style element with the id ssCss, and injects one containing the code in
            the <xd:ref name="css">$css</xd:ref> parameter. We place it first in the head element
            so that any subsequent style element provided by the user can override it.</xd:desc>
    </xd:doc>
    <xsl:template match="head[not(*[@id='ssCss'])]">
        
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
<!-- RH -->
            <!-- <link rel="stylesheet" href="{$outputFolder}/ssSearch.css" id="ssCss"/> -->
<!-- RH --> 
            <xsl:apply-templates select="node()"/>
        </xsl:copy>
        
    </xsl:template>

    <xd:doc>
        <xd:desc>This is the main template for matching the staticSearch div;
        this is where all the work happens for create the search box and the filter
        options. This is also where we load in the Javasript; we do this here
        rather than in the head of the document so not to interfere with existing Javascript
        in the header of document.</xd:desc>
    </xd:doc>
    <xsl:template match="div[@id='staticSearch']">
        
        <!--Get the language we should be using for retrieving captions, defaulting to 'en'
            if no language is specified-->
        <xsl:variable name="captionLang" as="xs:string">
            <xsl:variable name="declaredLang" select="string(ancestor-or-self::*[@xml:lang or @lang][1]/(@xml:lang, @lang)[1])" as="xs:string?"/>
            <xsl:choose>
                <xsl:when test="exists($declaredLang)">
                    <xsl:sequence select="$declaredLang"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:if test="$verbose">
                        <xsl:message>WARNING: No language declared for div/@id='staticSearch' to determine captions. Using 'en' by default.</xsl:message>
                    </xsl:if>
                    <xsl:sequence select="'en'"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <!--First, copy out the div-->
        <xsl:copy>

            <!--Copy out attributes-->
            <xsl:copy-of select="@*"/>

            <!--Warn if there is anything contained within the div, since it will be wiped out-->
            <xsl:if test="* or node()[string-length(normalize-space(string-join(descendant::text(), ''))) gt 0]">
                <xsl:message>WARNING: Contents of div/@id='staticSearch' will be overwritten</xsl:message>
            </xsl:if>

            <!--Now add the script for the staticSearch library-->

            <script src="{$outputFolder}/ssSearch-debug.js"><!-- Don't self-close script tags. --></script>

            <xsl:comment>
              Note that if you want to debug a problem with the JavaScript, you can
              change "ssSearch.js" to "ssSearch-debug.js" to link the uncompressed, 
              unminified code instead.
            </xsl:comment>

            <!-- RH -->
            <script>
                var Sch ;
                window.addEventListener('load', function(){
                Sch = new StaticSearch() ;
                
                Sch.searchFinishedHook = function(num) {
                console.log("search returned");
                console.log(num);
                transformSearchResultLinks();
                showMaxHits();
                showMinWordLength() ;
                } ;
                }) ;
            </script>
            <!-- RH -->

            <!--Now create the form-->
            <form accept-charset="UTF-8" id="ssForm"
                data-allowphrasal="{if ($phrasalSearch) then 'yes' else 'no'}"
                data-allowwildcards="{if ($wildcardSearch) then 'yes' else 'no'}"
                data-minwordlength="{if ($minWordLength) then $minWordLength else '3'}"
                data-scrolltotextfragment="{if ($scrollToTextFragment) then 'yes' else 'no'}"
                data-maxkwicstoshow="{if ($maxKwicsToShow) then $maxKwicsToShow else 10}"
                data-resultsperpage="{$resultsPerPage}"
                onsubmit="return false;"
                data-versionstring="{$versionString}"
                data-ssfolder="{$outputFolder}"
                data-kwictruncatestring="{$kwicTruncateString}"
                data-resultslimit="{$resultsLimit}"
                >
                
                <!--Standard inputs-->
<!-- RH -->
                <div id="ssQueryAndButton">
                    <div class="form-group row">
                        <div class="de">
                            <label class="col-12 col-form-label">Suche nach</label></div>
                        <div class="en"><label class="col-12 col-form-label">Searching for</label></div>
                        <div class="col-12">
                            <!-- <input type="text" id="ssQuery"/> -->
                            <input type="text" placeholder="Begriff hier eingeben" class="form-control" id="ssQuery"/>
                        </div>
                    </div>
                    
                    <div class="form-group row">
                        <div class="offset-4 col-8">
                            <!-- <button id="ssDoSearch"><xsl:sequence select="hcmc:getCaption('ssDoSearch', $captionLang)"/></button> -->
                            <button id="ssDoSearch" name="submit" type="submit" class="btn btn-primary">Absenden</button>                            
                        </div>
                    </div>
<!-- RH -->                    
                </div>
            </form>
            
            <!-- Popup message to show that search is being done. -->
            <div id="ssSearching" style="display: none;">
                <div class="de">Suche...</div>
                <div class="en">Searching...</div>                
                <!-- <xsl:sequence select="hcmc:getCaption('ssSearching', $captionLang)"/> -->
            </div>
<!-- RH -->
            <div id="showMaxHits" style="display: none;">
                <div class="de">Angezeigte Treffer max <span>5</span></div>
                <div class="en">Displayed hits max <span>5</span></div>
            </div>

            <div id="showMinWordLength" style="display: none;">
                <div class="de">Wortlänge min <span></span></div>
                <div class="en">Word length min <span></span></div>
             </div>

            <!--And now create the results div in the document-->
<!-- RH -->
            <!-- <div id="ssResults"> -->
            <div id="ssResults" style="display: none;">
                <!--...results here...-->
            </div>
            
            <!-- Finally, we add our logo and powered-by message. -->
            <!-- <div id="ssPoweredBy"> -->
            <div id="ssPoweredBy" style="display: none;">
<!-- RH -->     
                <p>
                    <xsl:sequence select="hcmc:getCaption('ssPoweredBy', $captionLang)"/>
                </p>
                <a href="https://github.com/projectEndings/staticSearch"><xsl:apply-templates select="doc($svgLogoFile)" mode="svgLogo"/></a>
            </div>
        </xsl:copy>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Repeated running of this process over the same document can 
        result in excessive quantities of whitespace. Rather than try to figure out
        where to preserve whitespace and where not, we just constrain it with this
        template.</xd:desc>
    </xd:doc>
    <xsl:template match="text()[matches(., '^(\s*\n\s*\n\s*)+$')][not(ancestor::script or ancestor::style)]">
        <xsl:text>&#x0a;&#x0a;</xsl:text>
    </xsl:template>
    
    <xd:doc>
        <xd:desc><xd:ref name="hcmc:normalizeDateString" type="function">hcmc:normalizeDateString</xd:ref>
        converts truncated dates (yyyy, or yyyy-mm) to fully-specified dates. It ignores leap years.
        </xd:desc>
        <xd:param name="dateString">dateString is the incoming string representation of a date.</xd:param>
        <xd:param name="earliest">earliest is a boolean parameter specifying whether
            it should be the earliest possible date or the latest.</xd:param>
        <xd:return>An xs:date or the null sequence</xd:return>
    </xd:doc>
    <xsl:function name="hcmc:normalizeDateString" as="xs:date?">
        <xsl:param name="dateString" as="xs:string"/>
        <xsl:param name="earliest" as="xs:boolean"/>
        <!--<xsl:message>Processing date <xsl:value-of select="$dateString"/></xsl:message>-->
        <xsl:choose>
            <xsl:when test="matches($dateString, '^\d\d\d\d$')">
                <xsl:choose>
                    <xsl:when test="$earliest"><xsl:sequence select="xs:date(concat($dateString, '-01-01'))"/></xsl:when>
                    <xsl:otherwise><xsl:sequence select="xs:date(concat($dateString, '-12-31'))"/></xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="matches($dateString, '^\d\d\d\d-\d\d$')">
                <xsl:choose>
                    <xsl:when test="$earliest"><xsl:sequence select="xs:date(concat($dateString, '-01'))"/></xsl:when>
                    <xsl:otherwise>
                        <xsl:choose>
                            <xsl:when test="matches($dateString, '^\d\d\d\d-((01)|(03)|(05)|(07)|(08)|(10)|(12))$')">
                                <xsl:sequence select="xs:date(concat($dateString, '-31'))"/>
                            </xsl:when>
                            <xsl:when test="matches($dateString, '^\d\d\d\d-((04)|(06)|(09)|(11))$')">
                                <xsl:sequence select="xs:date(concat($dateString, '-30'))"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:sequence select="xs:date(concat($dateString, '-28'))"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="matches($dateString, '^\d\d\d\d-\d\d-\d\d$')">
                <xsl:sequence select="xs:date($dateString)"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:sequence select="()"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    
    <!--**************************************************************
       *                                                            *
       *        Templates for cleaning up and simplifying SVG       *
       *                                                            *
       **************************************************************-->
    <xd:doc>
        <xd:desc>We create a mode for svg templates to keep it separate.</xd:desc>
    </xd:doc>
    <xsl:mode name="svgLogo" exclude-result-prefixes="#all" on-no-match="shallow-copy"/>
    <xd:doc>
        <xd:desc>We eliminate a few elements.</xd:desc>
    </xd:doc>
    <xsl:template match="svg:defs | svg:metadata" mode="svgLogo"/>
    <xd:doc>
        <xd:desc>We need to prevent the proliferation of namespaces which 
        make things invalid.</xd:desc>
    </xd:doc>
    <xsl:template match="svg:*" mode="svgLogo" exclude-result-prefixes="#all">
        <xsl:copy copy-namespaces="no">
            <xsl:apply-templates mode="#current" select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>We convert the size to something reasonable for a logo.</xd:desc>
    </xd:doc>
    <xsl:template match="svg:svg" mode="svgLogo">
        <xsl:copy exclude-result-prefixes="#all" copy-namespaces="no">
            <xsl:copy-of select="@*[local-name() != ('width', 'height')]"/>
            <xsl:variable name="proportion" select="ceiling(xs:float(@width) div 40)"/>
            <xsl:attribute name="width" select="round(xs:float(@width) div $proportion)"/>
            <xsl:attribute name="height" select="round(xs:float(@height) div $proportion)"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
</xsl:stylesheet>