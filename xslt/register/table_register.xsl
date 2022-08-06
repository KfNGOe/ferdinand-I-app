<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="2.0" exclude-result-prefixes="xsl tei xs">
    
    <xsl:template match="/" name="table_register">
        <div class="container de" id="table-register">
            <table class="table register-tabelle">
                <thead>
                    <tr>
                        <th scope="col">Eintrag</th>
                        <th scope="col">Schreibweisen</th>
                        <th scope="col"></th>
                        <th scope="col">Vorkommen</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <p>A</p>
                        </td>
                        <td>
                            <p>Anna</p>
                            <p>bonne seur, vostre compaigne</p>
                            <p>ma fame</p>
                            <p>ma femme</p>
                            <p>mme, vostre compaigne</p>
                        </td>
                        <td>
                            <p>
                                <span class="fas fa-exclamation-circle"></span> <span class="fas fa-edit"></span>
                            </p>
                        </td>
                        <td>
                            <p>Band_1, <a href="#">Brief A10.</a>transcription#</p>
                            <p>Band_1, <a href="#">Brief A102.</a>transcription#2</p>
                            <p>Band_1, <a href="#">Brief A189.</a>transcription#1</p>
                            <p>Band_1, <a href="#">Brief A217.</a>transcription#1</p>
                            <p>Band_1, <a href="#">Brief A234.</a>transcription#3</p>
                            <p>Band_1, <a href="#">Brief A239.</a>transcription#8</p>
                            <p>Band_1, <a href="#">Brief A244.</a>transcription#5</p>
                            <p>Band_1, <a href="#">Brief A254.</a>transcription#2</p>
                        </td>
                    </tr>
                    
                    <tr>
                        <td>
                            <p>Absberg, Hans Thomas von, fränkischer Ritter</p>
                        </td>
                        <td>
                            <p>Hans Thomas von Absberg</p>
                            <p>Hans Toman</p>
                        </td>
                        <td>
                            <p>
                                <span class="fas fa-exclamation-circle"></span> <span class="fas fa-edit"></span>
                            </p>
                        </td>
                        <td>
                            <p>Band_1, <a href="#">Brief A36.</a>transcription#9</p>
                            <p>Band_1, <a href="#">Brief A50.</a>commentary#18</p>
                        </td>
                    </tr>
                    
                    <tr>
                        <td>
                            <p>Adurno, Girolamo, Gesandter K’s in Venedig</p>
                        </td>
                        <td>
                            <p>Adornos</p>
                            <p>Girolamo Adurno</p>
                            <p>Hyeronimo Adorne</p>
                        </td>
                        <td>
                            <p>
                                <span class="fas fa-check"></span> <span class="fas fa-edit"></span>
                            </p>
                        </td>
                        <td>
                            <p>Band_1, <a href="#">Brief A18.</a>commentary#12</p>
                            <p>Band_1, <a href="#">Brief A29.</a>transcription#</p>
                            <p>Band_1, <a href="#">Brief A41.</a>commentary#</p>
                        </td>
                    </tr>
                </tbody>
            </table>            
        </div>
    </xsl:template>
    
</xsl:stylesheet>