<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="2.0" exclude-result-prefixes="tei xsl xs">
    <xsl:output encoding="UTF-8" media-type="text/html" method="xhtml" version="1.0" indent="yes" omit-xml-declaration="yes"/>
    <xsl:import href="../partials/html_navbar.xsl"/>
    <xsl:import href="../partials/html_head.xsl"/>
    <xsl:import href="../partials/html_footer.xsl"/>
    
    <xsl:import href="text_start.xsl"/>
    
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
                    <div class="container de" id="pagetitle">
                        <div class="row justify">
                            <div class="col-lg-3 pl-0 pr-5">
                                <!--&nbsp;  -->
                            </div>
                            <div class="col-lg-9 pl-5 pr-0">
                                <h1>Start</h1>
                                <!-- <h2 class="submenutitle"> · Benutzung</h2> -->
                            </div>                            
                        </div>
                    </div>
                    <div class="container en" id="pagetitle" style="display: none">
                        <div class="row justify">
                            <div class="col-lg-3 pl-0 pr-5">
                                <!--&nbsp;  -->
                            </div>
                            <div class="col-lg-9 pl-5 pr-0">
                                <h1>Start</h1>
                                <!-- <h2 class="submenutitle"> · Benutzung</h2> -->
                            </div>                            
                        </div>
                    </div>
                    
                    <!-- Page Content -->
                    <div class="container" id="page-content">
                        <div class="row">
                            <div class="side-bar de col-lg-3 left-column pl-0 pr-5">
                                <nav>
                                    <ul class="submenu-start">
                                        <li class="list-item">
                                            <a data-toggle="collapse" href="#familienkorrespondenz" id="famChro" role="button" aria-expanded="false" aria-controls="familienkorrespondenz">Die Familienkorrespondenz</a>
                                            <div class="collapse" id="familienkorrespondenz">
                                                <ul class="submenu-start collapsable">
                                                    <li class="list-item"><a href="#allChar" id="allChar" role="button">Allgemeine Charakteristik</a></li><!-- href="#0" due to css underline -->
                                                    <li class="list-item"><a href="#korrPar" id="korrPar" role="button">Die Korrespondenzpartner</a></li>
                                                    <li class="list-item"><a href="#sprFoIn" id="sprFoIn" role="button">Sprache – Form – Inhalt</a></li>
                                                    <li class="list-item"><a href="#druBrie" id="druBrie" role="button">Die Druckedition der Briefe</a></li>
                                                    <li class="list-item"><a href="#ausBibl" id="ausBibl" role="button">Auswahlbibliographie</a></li>
                                                </ul>
                                            </div>
                                        </li>                                        
                                        <li class="list-item"><a href="#vorwKomm" id="vorwKomm" role="button">Vorwort der Kommission (1912)</a></li>
                                        <li class="list-item"><a href="#vorwBauer" id="vorwBauer" role="button">Vorwort Wilhelm Bauer (1912)</a></li>
                                        <li class="list-item"><a href="#einlBauer" id="einlBauer" role="button">Einleitung von Wilhelm Bauer (1912)</a></li>
                                        <li class="list-item"><a href="#digEdit" id="digEdit" role="button">Die digitale Edition</a></li>
                                        <li class="list-item"><a href="#erschBande" id="erschBande" role="button">Bisher im Druck erschienene Bände</a></li>
                                        <li class="list-item"><a href="#verzBuch" id="verzBuch" role="button">Verzeichnis der Büchertitel</a></li>                                                                                
                                        <li class="list-item"><a href="#brieflist" id="brieflist" role="button">Brieflisten 1537 – 1564</a></li>
                                    </ul>
                                </nav><!--
        <h1>A Bootstrap 4 Starter Template</h1>
        <p class="lead">Complete with pre-defined file paths and responsive navigation!</p>
        <ul class="list-unstyled">
          <li>Bootstrap 4.5.0</li>
          <li>jQuery 3.5.1</li>
        </ul> -->
                            </div>
                            <div class="side-bar en col-lg-3 left-column pl-0 pr-5" style="display: none">
                                <nav>
                                    <ul class="submenu-start">
                                        <li class="list-item">
                                            <a data-toggle="collapse" href="#familienkorrespondenz" id="famChro" role="button" aria-expanded="false" aria-controls="familienkorrespondenz">The Family Correspondence</a>
                                            <div class="collapse" id="familienkorrespondenz">
                                                <ul class="submenu-start collapsable">
                                                    <li class="list-item"><a href="#allChar" id="allChar" role="button">General characteristics</a></li><!-- href="#0" due to css underline -->
                                                    <li class="list-item"><a href="#korrPar" id="korrPar" role="button">The correspondence partners</a></li>
                                                    <li class="list-item"><a href="#sprForIn" id="sprFoIn" role="button">Language – form – content</a></li>
                                                    <li class="list-item"><a href="#druBrie" id="druBrie" role="button">The printed edition of the letters</a></li>
                                                    <li class="list-item"><a href="#ausBibl" id="ausBibl" role="button">Selected bibliography</a></li>
                                                </ul>
                                            </div>
                                        </li>                                        
                                        <li class="list-item"><a href="#vorwKomm" id="vorwKomm" role="button">Foreword by the Commission (1912)</a></li>
                                        <li class="list-item"><a href="#vorwBauer" id="vorwBauer" role="button">Foreword by Wilhelm Bauer (1912)</a></li>
                                        <li class="list-item"><a href="#einlBauer" id="einlBauer" role="button">Introduction by Wilhelm Bauer (1912)</a></li>
                                        <li class="list-item"><a href="#digEdit" id="digEdit" role="button">The digital edition</a></li>
                                        <li class="list-item"><a href="#erschBande" id="erschBande" role="button">Volumes published in print so far</a></li>
                                        <li class="list-item"><a href="#verzBuch" id="verzBuch" role="button">Index of book titles</a></li>
                                        <li class="list-item"><a href="#brieflist" id="brieflist" role="button">Index of letters 1537 – 1564</a></li>
                                    </ul>
                                </nav><!--
        <h1>A Bootstrap 4 Starter Template</h1>
        <p class="lead">Complete with pre-defined file paths and responsive navigation!</p>
        <ul class="list-unstyled">
          <li>Bootstrap 4.5.0</li>
          <li>jQuery 3.5.1</li>
        </ul> -->
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
                
                <script>
                    $( document ).ready(function() {
                        console.log( "ready!" );                                                
                        $("ul.navbar-nav li.nav-item a").removeClass("active");
                        $( "[href='index.html']" ).addClass("active");


                        ///link anchor //to make an link anchor work set the href tag to #[uniqueName] and its id to [uniqueName] (uniquenames should match) 
                        let anchor = $(location).attr('hash');  //get link anchor (#...)  
                        if(anchor.length!=0){  //check if link anchor exists
                          $(anchor).click(); //click on the menu item to open element
                        }
                    });                    
                </script>
                <script>
                    $( "ul.submenu-start li.list-item a" ).click(function() {
                        var click = $( this );
                        var textId = "#texts #" + click.attr("id");
                        var itemId = "ul.submenu-start li.list-item #" + click.attr("id");
                        
                        $( "div.text" ).hide();
                        $( textId ).toggle();
                        
                        $("ul.submenu-start li.list-item a").removeClass("active");
                        $( itemId ).addClass("active");
                    });
                    <!-- $( "#click_allChar" ).click(function() {
                    $( "div.text" ).hide();
                    $( "#allChar" ).toggle();
                    
                    $("ul.submenu-start li.list-item a").removeClass("active");
                    $("#click_allChar").addClass("active");
                    });
                     -->
                </script>
                <script>
                    $( "div.langmenu a" ).click(function() {
                        var click_lang = $( this );
                        var navbar = "nav.navbar " ;
                        var sidebar = "#page-content " ;
                        var footer = "footer " ;
                        if (click_lang.text() == "DE") {
                            $( "div.langmenu a:lang(en)" ).removeClass("active");
                            $( "div.langmenu a:lang(de)" ).addClass("active");
                            $( navbar + "div.en" ).hide(); 
                            $( navbar + "div.de" ).show();
                            $( sidebar + "div.en" ).hide(); 
                            $( sidebar + "div.de" ).show();
                            $( footer + "div.en" ).hide(); 
                            $( footer + "div.de" ).show();
                        } else {
                            $( "div.langmenu a:lang(de)" ).removeClass("active");
                            $( "div.langmenu a:lang(en)" ).addClass("active");
                            $( navbar + "div.de" ).hide(); 
                            $( navbar + "div.en" ).show();
                            $( sidebar + "div.de" ).hide(); 
                            $( sidebar + "div.en" ).show();
                            $( footer + "div.de" ).hide(); 
                            $( footer + "div.en" ).show();
                        }
                    });
                </script>
                                
            </body>
        </html>
    </xsl:template>
       
</xsl:stylesheet>