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
					<img src= "../img/logotipo.png" alt= "Club de montaña" href="../index.html"/>
					<a href="asamblea.xml">Asamblea</a>
					<a href="excursiones.xml">Excursiones</a>
					<a href="carreras.xml">Carreras</a>
					<a href="noticias.html">Noticias</a>
				</header>
				
				<section class="excursiones">
					<h1>Excursiones</h1>
					<!--contamos el total de excursiones-->
					<h2>Total: <xsl:value-of select="count(//excursion)"/></h2>
					<table>
						<tr>
							<th>RUTA</th>
							<th>FECHA</th>
							<th>PRECIO</th>
							<th>DIFICULTAD</th>
						</tr>
						<!--aplicamos el template de excursion tras el encabezado de la tabla-->
						<xsl:apply-templates select="/excursiones/excursion"/>
					</table>			
				</section>
				<footer>
					<address>&#169; 2020 desarrollado por info@birt.eus</address>
				</footer>
			</body>
		</html>
	</xsl:template>
	
	<!-- template para excursion-->
	<xsl:template match="excursion">
		<!-- calculamos el IVA del precio y lo asignamos a la variable $iva-->
		<xsl:variable name="iva"  select="precio * 0.21"></xsl:variable>
		<xsl:variable name="nivel" select="descripcion/@dificultad"></xsl:variable>
	<tr>
		<td><xsl:value-of select="descripcion/ruta"/></td>
		<td><xsl:value-of select="salida/dia"/></td>
		<!-- calculamos el precio total sumando el precio con su IVA-->
		<td><xsl:value-of select="precio + $iva"/>€</td>
		
		<!-- elegimos un span class u otro, dependiendo de la variable $nivel-->
		<xsl:choose>
			<xsl:when test="$nivel='baja'">
				<td><span class="dificultad verde"><xsl:value-of select="$nivel"/></span></td>
			</xsl:when>
			<xsl:when test="$nivel='media'">
				<td><span class="dificultad naranja"><xsl:value-of select="$nivel"/></span></td>
			</xsl:when>
			<xsl:otherwise>
				<td><span class="dificultad rojo"><xsl:value-of select="$nivel"/></span></td>
			</xsl:otherwise>
		</xsl:choose>
	</tr>
	</xsl:template>
</xsl:stylesheet>