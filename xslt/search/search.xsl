<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet 
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="2.0" exclude-result-prefixes="xsl tei xs">
    <xsl:output encoding="UTF-8" media-type="text/html" method="xhtml" version="1.0" indent="yes" omit-xml-declaration="yes"/>
        
    <xsl:import href="./partials/html_navbar.xsl"/>
    <xsl:import href="./partials/html_head.xsl"/>
    <xsl:import href="./input_search.xsl"/>
    <xsl:import href="./result_search.xsl"/>
    <xsl:import href="partials/html_footer.xsl"/>
    
    <xsl:template match="/">
        <xsl:variable name="doc_title" select="'Volltextsuche'"/>
        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
        
        <html xmlns="http://www.w3.org/1999/xhtml">
            <xsl:call-template name="html_head">
                <xsl:with-param name="html_title" select="$doc_title"></xsl:with-param>
            </xsl:call-template>
            
            <body id="suche">
                <header>
                    <!-- headnav -->
                    <xsl:call-template name="nav_bar"/>
                </header>
                
                <main>
                    <!-- Page Title -->
                    <div class="container de" id="pagetitle">
                        <div class="row justify">
                            <div class="col-lg-3 pl-0 pr-5">
                                <!-- &nbsp; -->
                            </div>
                            <div class="col-lg-9 pl-5 pr-0">
                                <h1>Suche</h1>
                            </div>
                        </div>
                    </div>
                    <div class="container en" id="pagetitle" style="display: none">
                        <div class="row justify">
                            <div class="col-lg-3 pl-0 pr-5">
                                <!-- &nbsp; -->
                            </div>
                            <div class="col-lg-9 pl-5 pr-0">
                                <h1>Search</h1>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Page Content -->
                    <div class="container" id="page-content">
                        <div class="row">
                            <div class="col-lg-3 left-column pl-0 pr-5">
                                <xsl:call-template name="input_search"/>
                            </div>
                            <div class="col-lg-9 right-column pl-5 pr-0">
                                <xsl:call-template name="result_search"/>
                            </div>                            
                        </div>
                    </div>                    
                </main>
                
                <footer class="footer mt-auto pt-5">
                    <xsl:call-template name="html_footer"/>
                </footer>

                <script>
                    $( document ).ready(function() {
                    console.log( "ready!" );                                                
                    $("ul.navbar-nav li.nav-item a").removeClass("active");
                    $( "[href='suche.html']" ).addClass("active");
                    });     

                    let anchor = $(location).attr('hash');  //get link anchor (#...)
                        if(anchor.length!=0){  //check if link anchor exists
                          $(anchor).click(); //click on the menu item to open element
                        }               
                </script>
                
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>