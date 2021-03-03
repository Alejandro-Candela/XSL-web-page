<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
<xsl:output encoding="UTF-8" method="html" doctype-system="about: legacy-doctype"/>

<!-- template general-->
<xsl:template match="/">          
    
        <html lang="es">
            <head>
                <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
                <meta charset="utf-8"/>
                <meta name="description" content="Página principal" />
                <title>titulo de la web</title>
            </head>
        
            <body>
				<header>
					<img src= "../img/logotipo.png" alt= "Club de montaña"  href="../index.html"/>
					<a href="asamblea.xml">Asamblea</a>
					<a href="excursiones.xml">Excursiones</a>
					<a href="carreras.xml">Carreras</a>
					<a href="noticias.html">Noticias</a>
				</header>
                
                <main class="principal">
                    <section class="asamblea">
                    <!-- iteramos y ordenamos las asambleas en orden descdendente según su fecha de convocatoria -->    
                    <xsl:for-each select="asambleas/asamblea">
                        <xsl:sort order="descending" data-type="date" select="convocatoria"/>

                        <!-- seleccionamos la asamblea en la que se cumpla que su posición es la primera -->
                        <xsl:if test="position()=1">
                        
                            <h1>ASAMBLEA</h1>
                            <!-- valores "convocatoria" y atributo "@tipo" de asamblea-->
                            <p>El <xsl:value-of select="convocatoria"/> celebraremos una asamblea <xsl:value-of select="@tipo"/>.</p>
                            <p>Los temas a tratar serán:</p>
                            <ol>
                                <!-- iteración de temas en listado numerado-->
                                <xsl:for-each select="orden_dia/tema">
                                <li><xsl:value-of select="."/></li>
                                </xsl:for-each>
                            </ol>
                            <p>Te esperamos</p>
                        </xsl:if>
                    </xsl:for-each>
                    </section>
                </main>
        
                <footer>
                    <address>&#169; 2020 desarrollado por info@birt.eus</address>
                </footer>
            </body>
        </html>
</xsl:template>



</xsl:stylesheet>