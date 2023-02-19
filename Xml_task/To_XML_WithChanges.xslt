<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<hardware>

			<xsl:for-each select="//CPU">
				<xsl:if test="(@on_sale='false') and (@recommended='true')">
					<CPUs>
						<CPU on_sale="false" recommended="true">
							<name>
								<xsl:value-of select="name"/>
							</name>
							<price>
								<xsl:value-of select="price"/>
							</price>
						</CPU>
					</CPUs>
				</xsl:if>

				<xsl:if test="(@on_sale='true') and (@recommended='true')">
					<CPUs>
						<CPU on_sale="true" recommended="true">
							<name>
								<xsl:value-of select="name"/>
							</name>
							<price>
								<xsl:value-of select="price"/>
							</price>
						</CPU>
					</CPUs>
				</xsl:if>

				<xsl:if test="(@on_sale='false') and (not(@recommended))">
					<CPUs>
						<CPU on_sale="false">
							<name>
								<xsl:value-of select="name"/>
							</name>
							<price>
								<xsl:value-of select="price"/>
							</price>
						</CPU>
					</CPUs>
				</xsl:if>

				<xsl:if test="(@on_sale='true') and (not(@recommended))">
					<CPUs>
						<CPU on_sale="true">
							<name>
								<xsl:value-of select="name"/>
							</name>
							<price>
								<xsl:value-of select="price"/>
							</price>
						</CPU>
					</CPUs>
				</xsl:if>
			</xsl:for-each>

			<xsl:for-each select="//Graphics_Card">
				<xsl:if test="(@on_sale='false') and (@recommended='true')">
					<GCards>
						<Graphics_Card on_sale="false" recommended="true">
							<name>
								<xsl:value-of select="name"/>
							</name>
							<price>
								<xsl:value-of select="price"/>
							</price>
						</Graphics_Card>
					</GCards>
				</xsl:if>

				<xsl:if test="(@on_sale='true') and (@recommended='true')">
					<GCards>
						<Graphics_Card on_sale="true" recommended="true">
							<name>
								<xsl:value-of select="name"/>
							</name>
							<price>
								<xsl:value-of select="price"/>
							</price>
						</Graphics_Card>
					</GCards>
				</xsl:if>

				<xsl:if test="(@on_sale='false') and (not(@recommended))">
					<GCards>
						<Graphics_Card on_sale="false">
							<name>
								<xsl:value-of select="name"/>
							</name>
							<price>
								<xsl:value-of select="price"/>
							</price>
						</Graphics_Card>
					</GCards>
				</xsl:if>

				<xsl:if test="(@on_sale='true') and (not(@recommended))">
					<GCards>
						<Graphics_Card on_sale="true">
							<name>
								<xsl:value-of select="name"/>
							</name>
							<price>
								<xsl:value-of select="price"/>
							</price>
						</Graphics_Card>
					</GCards>
				</xsl:if>
			</xsl:for-each>

			<xsl:for-each select="//SSD">
				<xsl:if test="(@on_sale='false') and (@recommended='true')">
					<SSDs>
						<SSD on_sale="false" recommended="true">
							<name>
								<xsl:value-of select="name"/>
							</name>
							<price>
								<xsl:value-of select="price"/>
							</price>
						</SSD>
					</SSDs>
				</xsl:if>

				<xsl:if test="(@on_sale='true') and (@recommended='true')">
					<SSDs>
						<SSD on_sale="true" recommended="true">
							<name>
								<xsl:value-of select="name"/>
							</name>
							<price>
								<xsl:value-of select="price"/>
							</price>
						</SSD>
					</SSDs>
				</xsl:if>

				<xsl:if test="(@on_sale='false') and (not(@recommended))">
					<SSDs>
						<SSD on_sale="false">
							<name>
								<xsl:value-of select="name"/>
							</name>
							<price>
								<xsl:value-of select="price"/>
							</price>
						</SSD>
					</SSDs>
				</xsl:if>

				<xsl:if test="(@on_sale='true') and (not(@recommended))">
					<SSDs>
						<SSD on_sale="true">
							<name>
								<xsl:value-of select="name"/>
							</name>
							<price>
								<xsl:value-of select="price"/>
							</price>
						</SSD>
					</SSDs>
				</xsl:if>
			</xsl:for-each>
			
		</hardware>
	</xsl:template>
</xsl:stylesheet>