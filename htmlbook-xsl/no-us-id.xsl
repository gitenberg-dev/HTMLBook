<xsl:stylesheet version="1.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns="http://www.w3.org/1999/xhtml"
		>
  <xsl:output method="xml"
              encoding="UTF-8"/>
  <xsl:preserve-space elements="*"/>
  
  <!-- prepend "xx" to ids starting with _  -->
  <xsl:template match="@id[starts-with(.,'_')]">
        <xsl:attribute name="id">xx<xsl:value-of select="."/></xsl:attribute>
  </xsl:template>
  <xsl:template match="@href[starts-with(.,'#_')]">
        <xsl:variable name="frag" select="."/>
        <xsl:attribute name="href">#xx<xsl:value-of select="substring($frag, 2)"/></xsl:attribute>
  </xsl:template>

  <!-- Default Rule; when no other templates are specified, copy direct to output -->
  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>


  
</xsl:stylesheet> 