<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet 
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="2.0" exclude-result-prefixes="xsl tei xs">
    <xsl:output encoding="UTF-8" media-type="text/html" method="xhtml" version="1.0" indent="yes" omit-xml-declaration="yes"/>
        
    <xsl:import href="./partials/html_navbar.xsl"/>
    <xsl:import href="./partials/html_head.xsl"/>    
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
                    <div class="container" id="pageTitle">
                        <div class="de">
                            <div class="row justify">
                                <div class="col-lg-3 pl-0 pr-5">
                                    <!-- &nbsp; -->
                                </div>
                                <div class="col-lg-9 pl-5 pr-0">
                                    <h1>Suche</h1>
                                </div>
                            </div>    
                        </div>
                        <div class="en" style="display: none">
                            <div class="row justify">
                                <div class="col-lg-3 pl-0 pr-5">
                                    <!-- &nbsp; -->
                                </div>
                                <div class="col-lg-9 pl-5 pr-0">
                                    <h1>Search</h1>
                                </div>
                            </div>
                        </div>                        
                    </div>
                    
                    <!-- Page Content -->
                    <div class="container" id="pageContent">
                        <div class="row">
                            <div class="col-lg-3 left-column pl-0 pr-5">
                                <div class="container" id="searchContent">
                                    <div class="de">
                                        <h2>Suche</h2>
                                    </div>
                                    <div class="en">
                                        <h2>Search</h2>
                                    </div>
                                    
                                    <div id="staticSearch"></div>
                                </div>
                            </div>
                            
                            <div class="col-lg-9 right-column pl-5 pr-0">
                                <div class="container" id="resultSearch">
                                    <div class="de">
                                        <h2>Treffer:</h2>
                                    </div>
                                    <div class="en">
                                        <h2>Hits:</h2>
                                    </div>
                                    
                                    <div id="questionSearch">
                                        <div class="de">
                                            <p>Sie haben noch keine Suchanfrage gestellt.</p>
                                        </div>
                                        <div class="en">
                                            <p>You haven't made a search yet.</p>
                                        </div>
                                    </div>
                                    
                                    <div id="showInputSearch">
                                        <div class="de">
                                            <p></p>
                                        </div>
                                        <div class="en">
                                            <p></p>
                                        </div>
                                    </div>
                                    
                                    <table class="table metadaten">
                                        <thead>
                                            <tr>
                                                <th scope="col">
                                                    <div class="de">Brief</div>
                                                    <div class="en">Letter</div>
                                                </th>
                                                <th scope="col">
                                                    <div class="de">Feld mit Auszug</div>
                                                    <div class="en">Field with excerpt</div>
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody></tbody>
                                    </table>

                                    <div id="rhPagination" style="display: none;">                                    
                                        <button class="btn btn-primary" id="rhShowMore">Show more</button>                     
                                        <button class="btn btn-primary" id="rhShowAll">Show all</button>
                                        <button class="btn btn-primary" id="rhShowLess">Show less</button>
                                    </div>
                                </div>
                                
                                
                            </div>
                        </div>
                    </div>                    
                </main>
                <footer class="footer mt-auto pt-5">
                    <xsl:call-template name="html_footer"/>
                </footer>
                
                <script src="js/language.js"/>
                <script src="js/search.js"></script>
                
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
