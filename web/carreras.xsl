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
				
				<section class="carreras">
					<h1>Carreras hasta 15 km</h1>
					<!--aplicamos el template sólo a las carreras cuyos kilómetros son menores o iguales a 15-->	
					<xsl:apply-templates select="//carrera[kilometros&lt;=15]"/>
				</section>

				<section class="carreras">
					<h1>Carreras de más de 15 km</h1>
					<!--aplicamos el template sólo a las carreras cuyos kilómetros son mayores que 15-->
					<xsl:apply-templates select="//carrera[kilometros&gt;15]"/>
				</section>
				
				<footer>
					<address>&#169; 2020 desarrollado por info@birt.eus</address>
				</footer>
			</body>
		</html>
	</xsl:template>
	<!--template de carrera-->
	<xsl:template match="carrera">
		<article>
			<a href="{informacion}">
				<img src="../img/{imagen}" alt="Negu Trail" />
				<p class="texto"><xsl:value-of select="nombre"/></p>
			</a>
		</article>
	</xsl:template>
	</xsl:stylesheet>