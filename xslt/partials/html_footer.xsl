<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xsl xs"
    version="2.0">
    <xsl:template match="/" name="html_footer">
        <div class="container de">
            <a href="#">Links</a><a href="impressum.html">Impressum</a><a href="dsgvo.html">Datenschutzerklärung</a>
        </div>
        <div class="container en" style="display: none">
            <a href="#">Links</a><a href="impressum.html">Imprint</a><a href="dsgvo.html">Privacy policy</a>
        </div>
        
    </xsl:template>
</xsl:stylesheet>