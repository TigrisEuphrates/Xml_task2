<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
	Product_List
	CPUs
		<xsl:for-each select="//CPU">
			<xsl:value-of select="name"/>
			<xsl:text>&#xA;		</xsl:text>
			<xsl:value-of select="price"/>
			<xsl:text>&#xA;		</xsl:text>
		</xsl:for-each>
	GCards
		<xsl:for-each select="//Graphics_Card">
			<xsl:value-of select="name"/>
			<xsl:text>&#xA;		</xsl:text>
			<xsl:value-of select="price"/>
			<xsl:text>&#xA;		</xsl:text>
		</xsl:for-each>
	SSDs
		<xsl:for-each select="//SSD">
			<xsl:value-of select="name"/>
			<xsl:text>&#xA;		</xsl:text>
			<xsl:value-of select="price"/>
			<xsl:text>&#xA;		</xsl:text>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>