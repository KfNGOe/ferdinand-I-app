<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet 
   xmlns="http://www.w3.org/1999/xhtml"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
   version="2.0" exclude-result-prefixes="xsl tei xs">
   <xsl:output encoding="UTF-8" media-type="text/html" method="xhtml" version="1.0" indent="yes" omit-xml-declaration="yes"/>
   
   <xsl:import href="./partials/html_navbar.xsl"/>
   <xsl:import href="./partials/html_head.xsl"/>
   <xsl:import href="./table_register.xsl"/>
   <xsl:import href="./partials/html_footer.xsl"/>
   
   <xsl:template match="/">
      <xsl:variable name="doc_title">
         <xsl:value-of select=".//tei:title[@type='main'][1]/text()"/>
      </xsl:variable>
      
      <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
      
      <html>
         <xsl:call-template name="html_head">
            <xsl:with-param name="html_title" select="$doc_title"></xsl:with-param>
         </xsl:call-template>
         
         <body id="register">
            <!-- headnav -->
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
                        <h1>Register-Einträge <a class="fas fa-redo-alt" title="zum Aktualisieren klicken" href="#"></a></h1>
                     </div>                            
                  </div>
               </div>
               <div class="container en" id="pagetitle" style="display: none">
                  <div class="row justify">
                     <div class="col-lg-3 pl-0 pr-5">
                        <!--&nbsp;  -->
                     </div>
                     <div class="col-lg-9 pl-5 pr-0">
                        <h1>Register entries</h1>
                        <!-- <h2 class="submenutitle"> · Benutzung</h2> -->
                     </div>                            
                  </div>
               </div>
               
               <!-- Page Content -->
               <div class="container" id="page-content">
                  <div class="row">
                     <div class="col-12 px-0 register-menue">
                        <a href="#" class="active">Personenregister</a>  |  <a href="#">Ortsregister</a>  |  <a href="#">Sachregister</a>
                     </div>
                     
                     <xsl:call-template name="table_register"/>
                     
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
               $( "[href='register.html']" ).addClass("active");
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