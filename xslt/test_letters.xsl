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
    <xsl:import href="./test_letters_toc.xsl"/>
    <xsl:import href="./test_letters_text.xsl"/>
    <xsl:import href="./test_letters_index.xsl"/>
        
    <!-- <xsl:variable name="coll" select="collection('../data/dtabf_id/band_001')"/>
        -->
    <xsl:template match="/">
        <!-- <xsl:for-each select="$coll">
            <xsl:variable name="full_path">
                <xsl:value-of select="document-uri(/)"/>
            </xsl:variable>
            <xsl:variable name="doc_title">
                <xsl:value-of select="normalize-space(string-join(.//tei:title[@type='sub']//text()))"/>
            </xsl:variable>
            
            <xsl:result-document href="../html/{replace(tokenize($full_path, '/')[last()], '.xml', '.html')}" media-type="xml" method="xhtml">
                <xsl:call-template name="letter_page">
                    <xsl:with-param name="doc_title" select="$doc_title"/>
                </xsl:call-template>
            </xsl:result-document>
        </xsl:for-each>
        -->
        
        
            <xsl:variable name="full_path">
                <xsl:value-of select="document-uri(/)"/>
            </xsl:variable>
            <xsl:variable name="doc_title">
                <xsl:value-of select="normalize-space(string-join(.//tei:title[@type='sub']//text()))"/>
            </xsl:variable>
            
            
                <xsl:call-template name="letter_page">
                    <xsl:with-param name="doc_title" select="$doc_title"/>
                </xsl:call-template>
            
        
        
    </xsl:template>
    
    <xsl:template name="letter_page">
        
        <xsl:param name="doc_title"/>
        
        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
        
        <html>
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
                    <div class="container" id="pageTitle">                        
                        <div class="de">
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
                        <div class="en" style="display: none">
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
                    </div>
                    
                    <!-- Page Content -->
                    <div class="container" id="pageContent">
                        <div class="row">
                            <div class="col-lg-3 left-column pl-0 pr-5">
                                <xsl:call-template name="toc_letters"/>
                            </div>                                
                            <div class="col-lg-9 right-column pl-5 pr-0">
                                <div class="row">                                     
                                    <div class="col-lg-9 pl-2 pr-5">
                                        <xsl:call-template name="text_letters"/>
                                    </div>                                     
                                    <div class="col-lg-3 right-column-sub pl-5 pr-0">
                                        <xsl:call-template name="index_letters"/>
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
                    function langDeEn(input) {
                    var navbar = "nav.navbar " ;
                    var sidebar = "#pageContent " ;
                    var pagetitle = "#pageTitle " ;
                    var indexletters = "#indexLetters " ;
                    var footer = "footer " ;
                    if (input == "de") {  
                        localStorage.setItem("language", "de") ;
                        $( "div.langmenu a:lang(en)" ).removeClass("active");
                        $( "div.langmenu a:lang(de)" ).addClass("active");
                        $( navbar + "div.en" ).hide(); 
                        $( navbar + "div.de" ).show();
                        $( sidebar + "div.en" ).hide(); 
                        $( sidebar + "div.de" ).show();
                        $( pagetitle + "div.en" ).hide(); 
                        $( pagetitle + "div.de" ).show();
                        $( indexletters + "div.de" ).show();
                        $( indexletters + "div.en" ).hide();
                        $( footer + "div.en" ).hide(); 
                        $( footer + "div.de" ).show();
                    } else {    
                        localStorage.setItem("language", "en") ;                        
                        $( "div.langmenu a:lang(de)" ).removeClass("active");
                        $( "div.langmenu a:lang(en)" ).addClass("active");
                        $( navbar + "div.de" ).hide(); 
                        $( navbar + "div.en" ).show();
                        $( sidebar + "div.de" ).hide(); 
                        $( sidebar + "div.en" ).show();
                        $( pagetitle + "div.de" ).hide(); 
                        $( pagetitle + "div.en" ).show();
                        $( indexletters + "div.de" ).hide(); 
                        $( indexletters + "div.en" ).show();
                        $( footer + "div.de" ).hide(); 
                        $( footer + "div.en" ).show();
                    }
                    }
                </script>                
                <script>
                    $( document ).ready(function() {
                        console.log( "ready!" );                                                
                        $("ul.navbar-nav li.nav-item a").removeClass("active");
                        $( "[href='letters.html']" ).addClass("active");
                        
                        $("#indexLetters div.item").hide();
                        
                        let anchor = $(location).attr('hash');  //get link anchor (#...)                        
                        if(anchor.length!=0){  //check if link anchor exists
                        //$(anchor).click(); //click on the menu item to open element
                            var itemId = "#indexLetters " + anchor;
                            $( itemId ).show();
                        }                        
                        
                        console.log( localStorage.getItem("language") ) ;                        
                        if ((localStorage.getItem("language") === null) || (localStorage.getItem("language") == "undefined")) {                            
                            localStorage.setItem("language", "de") ;                            
                        }
                        
                        langDeEn(localStorage.getItem("language")) ;                                                
                    });
                    
                    $( "table.metadata a" ).click(function() {
                        console.log( this );
                        var click = $( this );
                        var itemId = "#indexLetters " + click.attr("href");
                        console.log( itemId );
                        
                        $("#indexLetters div.item").hide();
                        $( itemId ).toggle();                        
                    })                    
                    
                    $( "div.letter a" ).click(function() {
                        console.log( this );
                        var click = $( this );
                        var itemId = "#indexLetters " + click.attr("href");
                        console.log( itemId );
                        
                        $("#indexLetters div.item").hide();
                        $( itemId ).toggle();                        
                    })
                    
                    $( "div.commentary a" ).click(function() {
                        console.log( this );
                        var click = $( this );
                        var itemId = "#indexLetters " + click.attr("href");
                        console.log( itemId );
                        
                        $("#indexLetters div.item").hide();
                        $( itemId ).toggle();
                    })
                    
                    $( "div.langmenu a" ).click(function() {
                        var click_lang = $( this );
                        console.log( click_lang.attr( "lang" ));
                        langDeEn(click_lang.attr( "lang" )) ;                        
                    });
                </script>
                
                <script src="./static-search/ssHighlight.js"></script>
                
            </body>
        </html>        
        
    </xsl:template>
       
</xsl:stylesheet>