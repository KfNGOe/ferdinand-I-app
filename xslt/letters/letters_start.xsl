<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet 
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="2.0" exclude-result-prefixes="tei xsl xs">
    <xsl:output encoding="UTF-8" media-type="text/html" method="xhtml" version="5.0" indent="yes" omit-xml-declaration="yes"/>
    <xsl:import href="./partials/html_navbar.xsl"/>
    <xsl:import href="./partials/html_head.xsl"/>
    <xsl:import href="./partials/html_footer.xsl"/>
    <xsl:import href="./test_toc_letters.xsl"/>
    <xsl:import href="./test_text_letters.xsl"/>
    <xsl:import href="./test_index_letters.xsl"/>  
    
    <xsl:template match="/">
        
        <xsl:variable name="full_path">
            <xsl:value-of select="document-uri(/)"/>
        </xsl:variable>
        <xsl:variable name="doc_title">
            <xsl:value-of select="normalize-space(string-join(.//tei:title[@type='sub']//text()))"/>
        </xsl:variable>
        
        <xsl:result-document href="../html/briefe.html" method="html">
            <xsl:call-template name="letter_page"/>                    
        </xsl:result-document>
        
    </xsl:template>
    
    <xsl:template name="letter_page">
        
        <xsl:param name="doc_title"/>
        
        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
        
        <html xmlns="http://www.w3.org/1999/xhtml">
            <xsl:call-template name="html_head">
                <xsl:with-param name="html_title" select="$doc_title"/>
            </xsl:call-template>
            
            <body id="briefe">
                
                <header>
                    <!-- headnav -->
                    <xsl:call-template name="nav_bar"/>
                </header>
                
                <main>
                    <!-- Page Title -->
                    <div class="container de" id="pagetitle">
                        <div class="row justify">
                            <div class="col-lg-3 pl-0 pr-5">
                                <small>Bitte auf einen Verweis klicken.</small>
                            </div>
                            <div class="col-lg-9 pl-5 pr-0">
                                <h1>Briefe</h1>
                                <!-- <h2 class="submenutitle"> · Benutzung</h2> -->
                            </div>                            
                        </div>
                    </div>
                    <div class="container en" id="pagetitle" style="display: none">
                        <div class="row justify">
                            <div class="col-lg-3 pl-0 pr-5">
                                <small>Please click on a reference.</small>
                            </div>
                            <div class="col-lg-9 pl-5 pr-0">
                                <h1>Letters</h1>
                                <!-- <h2 class="submenutitle"> · Benutzung</h2> -->
                            </div>                            
                        </div>
                    </div>
                    
                    <!-- Page Content -->
                    <div class="container" id="page-content">                        
                        <div class="row">
                            <div class="col-lg-3 left-column pl-0 pr-5">                                
                                <xsl:call-template name="toc_letters"/>
                            </div>                                
                            <div class="col-lg-9 right-column pl-5 pr-0">
                                <div class="row">
                                    <div class="col-lg-9 pl-2 pr-5"/>
                                    <div class="col-lg-3 right-column-sub pl-5 pr-0">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /Page Content -->                  
                </main>
                
                <footer class="footer mt-auto pt-5">
                    <xsl:call-template name="html_footer"/>
                </footer>
                
                <script>
                    $( document ).ready(function() {
                    console.log( "ready!" );                                                
                    $("ul.navbar-nav li.nav-item a").removeClass("active");
                    $( "[href='briefe.html']" ).addClass("active");
                    
                    $("#index-letters div.item").hide();
                    });
                </script>
                
            </body>
        </html>        
        
    </xsl:template>
    
</xsl:stylesheet>