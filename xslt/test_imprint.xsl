<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="2.0" exclude-result-prefixes="tei xsl xs">
    <xsl:output encoding="UTF-8" media-type="text/html" method="xhtml" version="1.0" indent="yes" omit-xml-declaration="yes"/>
    <xsl:import href="./partials/html_navbar.xsl"/>
    <xsl:import href="./partials/html_head.xsl"/>
    <!-- 
    <xsl:import href="./partials/html_footer.xsl"/>
    -->
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
                                    <span class="de">Impressum</span>
                                    <span class="en" style="display: none">Imprint</span>
                                </h1>
                                <!-- <h2 class="submenutitle"> · Benutzung</h2> -->
                            </div>                            
                        </div>                        
                    </div>
                    
                    <!-- Page Content -->
                    <div class="container" id="pageContent">
                        <div class="row">
                            <div class="side-bar col-lg-3 left-column pl-0 pr-5">
                                
                            </div>
                            <div class="texts col-lg-9 right-column pl-5 pr-0">
                                <div class="de">
                                    <h2>Impressum und Datenschutz</h2>
                                
                                    <p>Offenlegung gem. § 25 Mediengesetz</p>
                                    
                                    <p>
                                        Fachbereich Romanistik
                                        <br/>
                                        Paris Lodron Universität Salzburg (PLUS)
                                        <br/>
                                        Unipark Nonntal
                                        <br/>
                                        Erzabt-Klotz-Straße 1
                                        <br/>
                                        A-5020 Salzburg
                                        <br/>
                                        Österreich
                                    </p>
                                    
                                    <p>
                                        Kommission für Neuere Geschichte Österreichs
                                        <br/>
                                        Leopold-Franzens Universität Innsbruck
                                        <br/>
                                        Institut für Geschichtswissenschaften und Europäische Ethnologie
                                        <br/>
                                        Innrain 52
                                        <br/>
                                        A-6020 Innsbruck
                                        <br/>
                                        Österreich
                                    </p>
                                    
                                    <p>
                                        Für den Inhalt verantwortlich:
                                        <br/>
                                        Univ. Prof. Dr. Christopher F. Laferl (e-mail: <a href="mailto:christopher.laferl@plus.ac.at" title="Email an Christopher Laferl">christopher.laferl@plus.ac.at</a>)
                                    </p>

                                    <p>
                                        Technische Umsetzung:
                                        <br/>
                                        Peter Andorfer
                                        Richard Hörmann
                                        Josef Wang
                                    </p>
                                    
                                    <p>
                                        Design der Website:<br/>
                                        Birgit Raitmayr, <a href="https://www.pixlerei.at" target="_blank">pixlerei.at</a>    
                                    </p> 
                                    
                                    <p>
                                        Dieses Projekt wird von folgenden Institutionen unterstützt:
                                        <ul>
                                            <li>- Kommission für Neuere Geschichte Österreichs</li>
                                            <li>- FWF (Projekte P18113 und P21016)</li>
                                            <li>- Fachbereich Romanistik der Universität Salzburg</li>
                                            <li>- ACDH-CH Austrian Centre for Digital Humanities and Cultural Heritage</li>
                                        </ul>
                                    </p>                                
                                    
                                    <h2>Hinweise/Haftungsausschluss</h2>
                                    
                                    <p>Die bereitgestellten Informationen auf dieser Website wurden sorgfältig geprüft und werden regelmäßig aktualisiert. Für die Richtigkeit, Aktualität, Vollständigkeit und Verfügbarkeit der Informationen wird jedoch keine Haftung übernommen. Insbesondere können aus der Verwendung der abgerufenen Informationen keinerlei Ansprüche abgeleitet werden.</p>
                                    <p>Links zu anderen Websites wurden sorgfältig ausgewählt. Auf deren Inhalte hat die Kommission für Neuere Geschichte Österreichs und die Universität Salzburg keinen Einfluss und kann daher für diese keine Haftung übernehmen. Wir distanzieren uns ausdrücklich von allen Inhalten dieser verlinkten Seiten, da die Kommission für Neuere Geschichte Österreichs und die Universität Salzburg auf deren Inhalt keinerlei Einfluss haben und sich diese Inhalte nicht zu eigen machen. Falls in dieser Datenbank und Website auf Seiten verwiesen wird, deren Inhalt Anlass zur Beanstandung gibt, bitten wir um Mitteilung.</p>
                                </div>
                                <div class="en">
                                    <h2>Imprint and data protection</h2>
                                    
                                    <p>Disclosure according to § 25 Media Act</p>
                                    
                                    <p>
                                        Department of Romance Studies
                                        <br/>
                                        Paris Lodron University Salzburg (PLUS)
                                        <br/>
                                        Unipark Nonntal
                                        <br/>
                                        Erzabt-Klotz-Straße 1
                                        <br/>
                                        A-5020 Salzburg
                                        <br/>
                                        Austria
                                    </p>
                                    
                                    <p>
                                        Commission for Modern Austrian History
                                        <br/>
                                        Leopold-Franzens Universität Innsbruck
                                        <br/>
                                        Institute for Historical Sciences and European Ethnology
                                        <br/>
                                        Innrain 52
                                        <br/>
                                        A-6020 Innsbruck
                                        <br/>
                                        Austria
                                    </p>
                                    
                                    <p>
                                        Responsible for the content:
                                        <br/>
                                        Univ. Prof. Dr. Christopher F. Laferl (e-mail: <a href="mailto:christopher.laferl@plus.ac.at" title="Email to Christopher Laferl">christopher.laferl@plus.ac.at</a>)
                                    </p>

                                    <p>
                                        Technical realisation:
                                        <br/>
                                        Peter Andorfer
                                        Richard Hörmann
                                        Josef Wang
                                    </p>
                                    
                                    <p>
                                        Design of the website:                                        
                                        <br/>
                                        Birgit Raitmayr, <a href="https://www.pixlerei.at" target="_blank">pixlerei.at</a>    
                                    </p> 
                                    
                                    <p>
                                        This project is supported by the following institutions:
                                        <ul>
                                            <li>- Commission for Modern Austrian History</li>
                                            <li>- FWF (projects P18113 and P21016)</li>
                                            <li>- Department of Romance Studies at the University of Salzburg</li>
                                            <li>- ACDH-CH Austrian Centre for Digital Humanities and Cultural Heritage</li>
                                        </ul>
                                    </p>                                
                                    
                                    <h2>Notice/Disclaimer</h2>
                                    
                                    <p>The information provided on this website has been carefully checked and is regularly updated. However, no liability is assumed for the accuracy, timeliness, completeness and availability of the information. In particular, no claims whatsoever can be derived from the use of the information retrieved.</p>
                                    <p>Links to other websites have been carefully selected. The Commission for Modern Austrian History and the University of Salzburg have no influence on their content and can therefore accept no liability for them. We expressly dissociate ourselves from all contents of these linked sites, as the Commission for Modern History of Austria and the University of Salzburg have no influence on their contents and do not adopt these contents as their own. If this database and website refer to pages whose content gives cause for complaint, please inform us.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /Page Content -->                  
                </main>                
                 
                <footer class="footer-imprint mt-auto pt-5">
                    <div class="container de">
                        <div class="footer-logo">
                            <a href="https://pf.fwf.ac.at/de/wissenschaft-konkret/project-finder?search[what]=P+18113" target="_blank" rel="noopener" aria-label="FWF P 18113">
                                <img src="dist/assets/images/mockup/fwf.gif" alt="FWF" title="FWF gefördertes Projekt P 18113"/>                                
                            </a>
                        </div>
                        <div class="footer-logo">
                            <a href="https://www.oeaw.ac.at/acdh/" target="_blank" rel="noopener" aria-label="ACDHCH">
                                <img src="dist/assets/images/mockup/acdh-ch-logo-grayscale.svg" alt="ACDH" title="Austrian Centre for Digital Humanities and Cultural Heritage"/>
                            </a>
                        </div>
                        <div class="footer-logo">
                            <a href="https://www.plus.ac.at/romanistik/" target="_blank" rel="noopener" aria-label="PLUS">
                                <img src="dist/assets/images/mockup/PLUS_Logo_RGB_farbe.jpg" alt="PLUS" title="Fachbereich Romanistik der Universität Salzburg"/>
                            </a>                            
                        </div>
                    </div>                    
                    <div class="container en">
                        <div class="footer-logo">
                            <a href="https://pf.fwf.ac.at/de/wissenschaft-konkret/project-finder?search[what]=P+18113" target="_blank" rel="noopener" aria-label="FWF P 18113">
                                <img src="dist/assets/images/mockup/fwf.gif" alt="FWF" title="FWF funded project P 18113"/>                                
                            </a>
                        </div>
                        <div class="footer-logo">
                            <a href="https://www.oeaw.ac.at/acdh/" target="_blank" rel="noopener" aria-label="ACDHCH">
                                <img src="dist/assets/images/mockup/acdh-ch-logo-grayscale.svg" alt="ACDH" title="Austrian Centre for Digital Humanities and Cultural Heritage"/>
                            </a>
                        </div>
                        <div class="footer-logo">
                            <a href="https://www.plus.ac.at/romanistik/" target="_blank" rel="noopener" aria-label="PLUS">
                                <img src="dist/assets/images/mockup/PLUS_Logo_RGB_farbe.jpg" alt="PLUS" title="Department of Romance Studies at the University of Salzburg"/>
                            </a>                            
                        </div>
                    </div>                    
                    
                </footer>
                
                <script src="js/language.js"/>
                <script src="js/imprint.js"/>                
            </body>
        </html>
    </xsl:template>
    
</xsl:stylesheet>
