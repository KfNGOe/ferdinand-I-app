<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet 
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="2.0" exclude-result-prefixes="xsl tei xs">
    <xsl:output encoding="UTF-8" media-type="text/html" method="xhtml" version="1.0" indent="yes" omit-xml-declaration="yes"/>
    
    <xsl:import href="./partials/html_navbar.xsl"/>
    <xsl:import href="./partials/html_head.xsl"/>
    <xsl:import href="./test_map_toc.xsl"/>
    <xsl:import href="./partials/html_footer.xsl"/>
    
    <xsl:variable name="map_tmp" select="'../data/json/map.json'"/>
    <xsl:variable name="map_tmp_ws" select="unparsed-text($map_tmp)"/>
    <xsl:variable name="map_json" select="normalize-space($map_tmp_ws)"/>
    
    <xsl:variable name="placeWritings_tmp" select="'../data/json/register_place_writings.json'"/>    
    <xsl:variable name="placeWritings_json" select="unparsed-text($placeWritings_tmp)"/>
    
    <xsl:template match="/">
        <xsl:variable name="doc_title">
            <xsl:value-of select="normalize-space(string-join(.//tei:title[@type='sub']//text()))"/>
        </xsl:variable>
        
        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
        
        <html>
            <head>
                <xsl:call-template name="html_head">
                    <xsl:with-param name="html_title" select="$doc_title"></xsl:with-param>
                </xsl:call-template>

                <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css" integrity="sha384-VzLXTJGPSyTLX6d96AxgkKvE/LRb7ECGyTxuwtpjHnVWVZs2gp5RDjeM/tgBnVdM" crossorigin="anonymous" />
                <link rel="stylesheet" href="https://unpkg.com/leaflet.markercluster@1.5.0/dist/MarkerCluster.css" integrity="sha384-pmjIAcz2bAn0xukfxADbZIb3t8oRT9Sv0rvO+BR5Csr6Dhqq+nZs59P0pPKQJkEV" crossorigin="anonymous" />
                <link rel="stylesheet" href="https://unpkg.com/leaflet.markercluster@1.5.0/dist/MarkerCluster.Default.css" integrity="sha384-wgw+aLYNQ7dlhK47ZPK7FRACiq7ROZwgFNg0m04avm4CaXS+Z9Y7nMu8yNjBKYC+" crossorigin="anonymous" />

                <script src="https://unpkg.com/jquery@3.6.0/dist/jquery.min.js" integrity="sha384-vtXRMe3mGCbOeY7l30aIg8H9p3GdeSe4IFlP6G8JMa7o7lXvnz3GFKzPxzJdPfGK" crossorigin="anonymous"></script>
                <script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js" integrity="sha384-RFZC58YeKApoNsIbBxf4z6JJXmh+geBSgkCQXFyh+4tiFSJmJBt+2FbjxW7Ar16M" crossorigin="anonymous"></script>
                <script src="https://unpkg.com/leaflet.markercluster@1.5.0/dist/leaflet.markercluster.js" integrity="sha384-89yDmbSkL9reFc77m10ZbqLaUMf1sp7FAJs2oAD/rczNnY7I+17yN9KML6tpYpCk" crossorigin="anonymous"></script>
            </head>
            <body id="karte">
                <!-- headnav -->
                <header>
                    <xsl:call-template name="nav_bar"/>
                </header>
                
                <main>
                    <!-- Page Title -->
                    <div class="container" id="pageTitle">
                        <div class="row justify">
                            <div class="col-lg-3 pl-0 pr-5">
                                <small>
                                    <span class="de">Bitte einen Ort auswählen</span>
                                    <span class="en">Please select a location</span>
                                </small>
                            </div>
                            <div class="col-lg-9 pl-5 pr-0">
                                <h1>
                                    <span class="de">Karte</span>
                                    <span class="en">Map</span>
                                </h1>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Page Content -->
                    <div class="container" id="pageContent">
                        <div class="row">
                            <div class="col-lg-3 left-column pl-0 pr-5">
                                <xsl:call-template name="toc_map"/>
                            </div>
                            <div class="col-lg-9 right-column pl-5 pr-0 flex-grow-1 flex-shrink-0">
                                <div id="map" style="width: 800px; height: 500px; border: 1px solid #aaa"></div>  
                            </div>
                        </div>
                    </div>
                </main>
                
                <footer class="footer mt-auto pt-5">
                    <xsl:call-template name="html_footer"/>
                </footer>
                
                <script type="text/javascript">
                    var placeWritings_json = '<xsl:value-of select="$placeWritings_json"/>' ;
                    console.log("placeWritings_json =", placeWritings_json) ;
                    let registerPlace = JSON.parse(placeWritings_json) ;
                    console.log("registerPlace =", registerPlace) ;
                </script>
                <script type="text/javascript">
                    var map_json = '<xsl:value-of select="$map_json"/>' ;
                    console.log("map_json =", map_json) ;
                    let markers = JSON.parse(map_json) ;
                    console.log("markers =", markers) ;
                </script>
                <script type="text/javascript" src="js/language.js"/>                                
                <script type="text/javascript" src="js/mapSettings.js"/>
                <script type="text/javascript" src="js/map.js"/>
                                                
            </body>
        </html>
    </xsl:template>        
</xsl:stylesheet>