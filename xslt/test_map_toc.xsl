<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="2.0" exclude-result-prefixes="xsl tei xs">
    
    <xsl:template match="/" name="toc_map">
        <div class="container" id="toc-map" style="display: none">        
            <h2><span class="toc_map" id="key"></span></h2>
            <h4><span class="toc_map" id="details"></span></h4>
          <!--   <h3><a href="#" class="active">Information</a> | <a href="#">Eintrag</a></h3> -->
            <h4>
                <span class="de">Koordinaten: </span>
                <span class="en">Coordinates: </span>
                <span class="toc_map" id="coordinates"></span>
            </h4>
            <h2>
                <span class="de">Schreibweisen: </span>
                <span class="en">Writings: </span>
            </h2>
            <h4>
                <span class="toc_map" id="writings"></span>
            </h4>
        </div>
    </xsl:template>
</xsl:stylesheet>