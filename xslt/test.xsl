<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet 
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="2.0" exclude-result-prefixes="tei xsl xs">
    <xsl:output encoding="UTF-8" media-type="text/html" method="xhtml" version="1.0" indent="yes" omit-xml-declaration="yes"/>
    
    <xsl:import href="./partials/html_head.xsl"/>   
    <xsl:import href="./partials/html_navbar.xsl"/>
    <xsl:import href="./partials/html_footer.xsl"/>
    
    
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
                <!-- headnav -->
                <header>
                    <xsl:call-template name="nav_bar"/>
                </header>

                <main>
                    <div id="dialog" title="Basic dialog">
                        <p>This is the default dialog which is useful for displaying information. The dialog window can be moved, resized and closed with the &apos;x&apos; icon.</p>
                    </div>
                </main>

                <footer></footer>
                
                <script>
                    $( function() {
                        $( "#dialog" ).dialog();
                    } );
                </script>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>