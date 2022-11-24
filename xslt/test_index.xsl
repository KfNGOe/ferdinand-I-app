<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="2.0" exclude-result-prefixes="tei xsl xs">
    <xsl:output encoding="UTF-8" media-type="text/html" method="xhtml" version="1.0" indent="yes" omit-xml-declaration="yes"/>
    <xsl:import href="./partials/html_navbar.xsl"/>
    <xsl:import href="./partials/html_head.xsl"/>
    <xsl:import href="./partials/html_footer.xsl"/>
    
    <xsl:import href="./test_index_text.xsl"/>
    
    <xsl:template match="/">
        <xsl:variable name="doc_title">
            <xsl:value-of select="normalize-space(string-join(.//tei:title[@type='sub']//text()))"/>
        </xsl:variable>

        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
        <html xmlns="http://www.w3.org/1999/xhtml">
            <xsl:call-template name="html_head">
                <xsl:with-param name="html_title" select="$doc_title"></xsl:with-param>
            </xsl:call-template>
            
            <body id="start">
                
                <header>
                    <xsl:call-template name="nav_bar"/>
                </header>
                
                <main>
                    <!-- Page Title -->
                    <div class="container" id="pageTitle">                        
                        <div class="row justify">
                            <div class="col-lg-3 pl-0 pr-5">
                                <!--&nbsp;  -->
                            </div>
                            <div class="col-lg-9 pl-5 pr-0">
                                <h1>
                                    <span class="de">Start</span>
                                    <span class="en" style="display: none">Start</span>
                                </h1>
                                <!-- <h2 class="submenutitle"> · Benutzung</h2> -->
                            </div>                            
                        </div>                        
                    </div>
                    
                    <!-- Page Content -->
                    <div class="container" id="pageContent">
                        <div class="row">
                            <div class="side-bar col-lg-3 left-column pl-0 pr-5">
                                <nav>
                                    <ul class="submenu-start">
                                        <li class="list-item">
                                            <a href="#korrFerd_text" id="korrFerd" role="button">
                                                <span class="de">Die Familienkorrespondenz Ferdinands I.</span>
                                                <span class="en" style="display: none">The Family Correspondence of Ferdinand I.</span>
                                            </a>
                                        </li>
                                        <li class="list-item">
                                            <a href="#digEd_text" id="digEd" role="button">
                                                <span class="de">Die digitale Edition</span>
                                                <span class="en" style="display: none">The digital edition</span>
                                            </a>
                                        </li>
                                        <li class="list-item">                                               
                                            <a href="#erschBaende_text" id="erschBaende" role="button">
                                                <span class="de">Bisher im Druck erschienene Bände</span>
                                                <span class="en" style="display: none">Volumes published in print so far</span>                                                    
                                            </a>
                                        </li>                                                                                
                                        <li class="list-item">
                                            <a href="#briefList_text" id="briefList" role="button">
                                                <span class="de">Brieflisten 1537 – 1564</span>
                                                <span class="en" style="display: none">Index of letters 1537 – 1564</span>                                                    
                                            </a>
                                        </li>
                                        <li class="list-item">
                                            <a href="#texts_text" id="texts" role="button">
                                                <span class="de">Begleittexte zum ersten Band (1912)</span>
                                                <span class="en" style="display: none">Companion texts to the first volume (1912)</span>                                                    
                                            </a>
                                        </li>
                                    </ul>
                                </nav>           
                            </div>
                            <div class="texts col-lg-9 right-column pl-5 pr-0">                                
                                <xsl:call-template name="text_start"/>
                            </div>
                        </div>
                    </div>
                    <!-- /Page Content -->                  
                </main>
                
                <footer class="footer mt-auto pt-5">
                    <xsl:call-template name="html_footer"/>
                </footer>
                
                <script src="js/language.js"/>
                <script src="js/frame.js"/>
                <script src="js/index.js"/>
                                                
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>