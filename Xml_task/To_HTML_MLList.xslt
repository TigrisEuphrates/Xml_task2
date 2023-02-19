<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<body>
				<h2>Product_List</h2>
				<ol style="list-style-type: 1; padding-bottom: 0;">
					CPUs
					<xsl:for-each select="//CPU">
						<li style="margin-left:2em">
							<xsl:value-of select="name"/>
						</li>
						<ol type="1" style="list-style-type: 1; list-style: none; padding-bottom: 0;">
							<li style="margin-left:2em">
								<xsl:value-of select="price"/>
							</li>
						</ol>
					</xsl:for-each>
				</ol>
				<ol style="list-style-type: 1; padding-bottom: 0;">
					GCards
					<xsl:for-each select="//Graphics_Card">
						<li style="margin-left:2em">
							<xsl:value-of select="name"/>
						</li>
						<ol style="list-style-type: 1; list-style: none; padding-bottom: 0;">
							<li style="margin-left:2em">
								<xsl:value-of select="price"/>
							</li>
						</ol>
					</xsl:for-each>
				</ol>
				<ol style="list-style-type: 1; padding-bottom: 0;">
					SSDs
					<xsl:for-each select="//SSD">
						<li style="margin-left:2em">
							<xsl:value-of select="name"/>
						</li>
						<ol style="list-style-type: 1; list-style: none; padding-bottom: 0;">
							<li style="margin-left:2em">
								<xsl:value-of select="price"/>
							</li>
						</ol>
					</xsl:for-each>
				</ol>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>