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
                
                <script>
                    function langDeEn(input) {                    
                        if (input == "de") {  
                            localStorage.setItem("language", "de") ;
                            $( "div.langmenu a:lang(en)" ).removeClass("active");
                            $( "div.langmenu a:lang(de)" ).addClass("active");
                            
                            $(".en").hide();   //hide all elements with en class
                            $(".de").show();   //show all elements with de class
                        } else {    
                                localStorage.setItem("language", "en") ;
                                $( "div.langmenu a:lang(de)" ).removeClass("active");
                                $( "div.langmenu a:lang(en)" ).addClass("active");
                                $(".de").hide(); //hide all elements with de class
                                $(".en").show(); //show all elements with en class
                        }
                    }
                </script>
                
                <script>
                    $( document ).ready(function() {
                        console.log( "ready!" );                                                   //highlight nav bar button 
                        $("ul.navbar-nav li.nav-item a").removeClass("active");
                        $( "[href='map.html']" ).addClass("active");
                        
                        //hide toc map
                        $("#pageContent #toc-map").hide();
                        
                        ///link anchor //to make an link anchor work set the href tag to #[uniqueName] and its id to [uniqueName] (uniquenames should match) 
                        let anchor = $(location).attr('hash');  //get link anchor (#...)  
                        if(anchor.length!=0){  //check if link anchor exists
                        $(anchor).click(); //click on the menu item to open element
                        }
                        
                        console.log( localStorage.getItem("language") ) ;
                        if ((localStorage.getItem("language") === null) || (localStorage.getItem("language") == "undefined")) {
                            localStorage.setItem("language", "de") ;
                        }
                        langDeEn(localStorage.getItem("language")) ;
                    }) ;

                    $("div.langmenu a").click(function() {
                        var click_lang = $(this);
                        console.log(click_lang.attr("lang"));
                        langDeEn(click_lang.attr("lang"));               
                    }) ; 
                </script>

                <script type="text/javascript" src="js/placeMappings.js"></script>
                <script type="text/javascript" src="js/register_place.js"></script>

                <script>
                //map settings
                   let map = L.map('map', {
                        center: [10.0, 5.0],
                        minZoom: 2,
                        zoom: 2,
                    })  

                    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {  
                        attribution: '© <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
                        subdomains: ['a', 'b', 'c'],
                    }).addTo(map)  //add openstreatmaps to leaflet

                    let markerClusters = L.markerClusterGroup()
                    for (let marker of markers) {
                        //generate a html popup for each mark
                        let popup = marker.key +
                        '<br />' +                            
                        '<b>Geo Names:</b><br /> ' +
                        '<div style="margin-left: 10px"><a href="' + marker.mappedTo.url + '" target="blank">' + marker.mappedTo.url + "</a></div>"

                        let m = L.marker([marker.mappedTo.coordinates.latitude, marker.mappedTo.coordinates.longitude], {}).bindPopup(popup).on('click', function(e){markerSelected(marker)});  //generate a marker and bind popup and select callback to it
                        m.getPopup().on('remove', function(e){markerUnselected()})//when a popup is unselected call markerUnselected function

                        markerClusters.addLayer(m)
                    }

                    map.addLayer(markerClusters)  //add marker cluster to map


                    function markerSelected(marker){  //is called when a marker is selected
                        $('.toc_map#key').text(marker.key);  //set the place name in the toc
                        $('.toc_map#details').text(marker.mappedTo.description);    //set the place details in the toc
                        $('.toc_map#coordinates').text(marker.mappedTo.coordinates.latitude + ', ' + marker.mappedTo.coordinates.longitude); //set the coordinates in the toc

                        let places = registerPlace.text.body.list.item;  //get the places out of the place resiter

                        //check for each place if its name matches the one of the selected marker
                        for(let place of places){
                            if(place.note[0].placeName["#text"] == marker.key){ 
                                $('.toc_map#writings').text(place.note[1].p);  //if it is a match display the writings in the toc
                            }
                        }

                    }

                    function markerUnselected(){  //when a marker is unselected clear the left side
                        $('.toc_map').text('');
                    }
                </script>
                
                <script>
                    $( "#pageContent #map" ).click(function() {
                        let test = $("#pageContent #toc-map #coordinates");
                        if (test.is(':empty') ) {
                        console.log("no coordinates") ;
                        $("#pageContent #toc-map").hide();
                        } else {
                        $("#pageContent #toc-map").show();
                        } ;                       
                    }) ;
                </script>
                
            </body>
        </html>
    </xsl:template>        
</xsl:stylesheet>