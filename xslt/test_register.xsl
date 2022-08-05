<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet 
   xmlns="http://www.w3.org/1999/xhtml"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
   version="2.0" exclude-result-prefixes="xsl tei xs">
   <xsl:output encoding="UTF-8" media-type="text/html" method="xhtml" version="1.0" indent="yes" omit-xml-declaration="yes"/>
   
   <xsl:import href="./partials/html_navbar.xsl"/>
   <xsl:import href="./partials/html_head.xsl"/>   
   <xsl:import href="./test_register_table.xsl"/>
   <xsl:import href="./partials/html_footer.xsl"/>
   
   <xsl:template match="/">
      
      <xsl:variable name="full_path">
         <xsl:value-of select="document-uri(/)"/>
      </xsl:variable>
      
      <xsl:variable name="file_name">
         <xsl:value-of select="substring-before(tokenize($full_path, '/')[last()],'.xml')"/>
      </xsl:variable>
      
      <xsl:variable name="doc_title">
         <xsl:value-of select="normalize-space(string-join(.//tei:title//text()))"/>
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
               <div class="container" id="pageTitle">
                  <div class="row justify">
                     <div class="col-lg-3 pl-0 pr-5">
                        <!--&nbsp;  -->
                     </div>
                     <div class="col-lg-9 pl-5 pr-0">
                        <h1>
                           <span class="de">Register-Einträge</span>
                           <span class="en">Registry entries</span> 
                           <a class="fas fa-redo-alt" title="zum Aktualisieren klicken" href="#"></a>
                        </h1>
                     </div>                            
                  </div>
               </div>
               
               <!-- Page Content -->
               <div class="container" id="pageContent">
                  
                     <div class="row">
                        <div class="col-12 px-0 register-menue">
                           <a href="register_person.html" id="regPerson">
                              <span class="de">Personenregister</span>
                              <span class="en">Registry of persons</span>
                           </a>  |  <a href="register_place.html" id="regPlace">
                              <span class="de">Ortsregister</span>
                              <span class="en">Registry of places</span>
                           </a>  |  <a href="register_index.html" id="regIndex">
                              <span class="de">Sachregister</span>
                              <span class="en">Subject index</span>
                           </a>
                        </div>
                        
                        <xsl:call-template name="register_table">
                           <xsl:with-param name="file_name" select = "$file_name" />
                        </xsl:call-template>
                     </div>
                                    
                                    
               </div>
            </main>
            
            <footer class="footer mt-auto pt-5">
               <xsl:call-template name="html_footer"/>
            </footer>
            
            <script>
               function langDeEn(input) {
               var navbar = "nav.navbar " ;
               var sidebar = "#pageContent " ;
               var pagetitle = "#pageTitle " ;         
               var footer = "footer " ;
               if (input == "de") {  
               localStorage.setItem("language", "de") ;
               $( "div.langmenu a:lang(en)" ).removeClass("active");
               $( "div.langmenu a:lang(de)" ).addClass("active");
               $( navbar + "div.en" ).hide(); 
               $( navbar + "div.de" ).show();
               $( sidebar + ".en" ).hide(); 
               $( sidebar + ".de" ).show();
               $( pagetitle + ".en" ).hide(); 
               $( pagetitle + ".de" ).show();             
               $( footer + "div.en" ).hide(); 
               $( footer + "div.de" ).show();
               } else {    
               localStorage.setItem("language", "en") ;                        
               $( "div.langmenu a:lang(de)" ).removeClass("active");
               $( "div.langmenu a:lang(en)" ).addClass("active");
               $( navbar + "div.de" ).hide(); 
               $( navbar + "div.en" ).show();
               $( sidebar + ".de" ).hide(); 
               $( sidebar + ".en" ).show();
               $( pagetitle + ".de" ).hide(); 
               $( pagetitle + ".en" ).show();             
               $( footer + "div.de" ).hide(); 
               $( footer + "div.en" ).show();
               }
               }
            </script>
            <script>
               $( document ).ready(function() {
                  
                  var fileName = '<xsl:value-of select="$file_name"/>' ;
                  
                  $("ul.navbar-nav li.nav-item a").removeClass("active");
                  $( "[href='register.html']" ).addClass("active");
                  
                  if(fileName == 'register_person') {
                     console.log(fileName) ;
                     $("div.register-menue a").removeClass("active");
                     $( "#regPerson" ).addClass("active");
                  }                  
                  if(fileName == 'register_place') {
                     console.log(fileName) ;
                     $("div.register-menue a").removeClass("active");
                     $( "#regPlace" ).addClass("active");
                  }
                  if(fileName == 'register_index') {
                     console.log(fileName) ;
                     $("div.register-menue a").removeClass("active");
                     $( "#regIndex" ).addClass("active");
                  }
                                                      
                  ///link anchor //to make an link anchor work set the href tag to #[uniqueName] and its id to [uniqueName] (uniquenames should match) 
                  let anchor = $(location).attr('hash');  //get link anchor (#...)  
                  if(anchor.length!=0){  //check if link anchor exists
                  $(anchor).click(); //click on the menu item to open element
                  }
                  
                  console.log(localStorage.getItem("language"));
                  
                  if (localStorage.getItem("language") === null || localStorage.getItem("language") == "undefined") {
                  localStorage.setItem("language", "de");
                  }
                  
                  langDeEn(localStorage.getItem("language")) ;                        
               }) ;
               
               $("div.langmenu a").click(function() {
                  var click_lang = $(this);
                  console.log(click_lang.attr("lang"));
                  langDeEn(click_lang.attr("lang"));               
               }) ;               
               
            </script>
            
         </body>
      </html>
   </xsl:template>   
       
</xsl:stylesheet>