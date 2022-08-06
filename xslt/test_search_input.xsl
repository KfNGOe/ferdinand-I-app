<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="2.0" exclude-result-prefixes="xsl tei xs">
    
    <xsl:template match="/" name="input_search">
        <div class="container de" id="input-search">        
            <h2>Suche</h2>
            <form>
                <div class="form-group row">
                    <label class="col-12 col-form-label" for="">Suche nach:</label>
                    <div class="col-12 mb-3">
                        <input id="" name="" placeholder="Begriff hier eingeben" type="text" class="form-control"/>                            
                    </div>
                </div> 
                <div class="form-group row">
                    <div class="col-12">
                        <button name="submit" type="submit" class="btn btn-primary">Absenden</button>
                    </div>
                </div>
            </form>
        </div>
    </xsl:template>
    
</xsl:stylesheet>