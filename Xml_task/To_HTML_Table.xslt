<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<body>
				<h2>Product_List</h2>
				<table style="border: 1px solid black">
					<tr bgcolor="#7ac2cd" style="text-align:center">
						<th>Name</th>
						<th>Price</th>
					</tr>
					<xsl:for-each select="//CPU">
						<tr>
							<td>
								<xsl:value-of select="name"/>
							</td>
							<td>
								<xsl:value-of select="price"/>
							</td>
						</tr>
					</xsl:for-each>
					<xsl:for-each select="//Graphics_Card">
						<tr>
							<td>
								<xsl:value-of select="name"/>
							</td>
							<td>
								<xsl:value-of select="price"/>
							</td>
						</tr>
					</xsl:for-each>
					<xsl:for-each select="//SSD">
						<tr>
							<td>
								<xsl:value-of select="name"/>
							</td>
							<td>
								<xsl:value-of select="price"/>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>