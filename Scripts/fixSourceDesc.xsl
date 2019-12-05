<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:variable name="docId">
        <xsl:value-of select="concat('/home/lou/Public/ELTeC-deu/Orig/',TEI/@xml:id,'.xml')"/>
    </xsl:variable>
   
    <xsl:template match="teiHeader/fileDesc/sourceDesc">
        <xsl:message>Looking for data in </xsl:message>
        <xsl:message><xsl:value-of select="$docId"/></xsl:message>
        <sourceDesc xmlns="http://www.tei-c.org/ns/1.0">
            <xsl:for-each select="doc($docId)//TEI/teiHeader/fileDesc/sourceDesc/bibl">
                <bibl xmlns="http://www.tei-c.org/ns/1.0">
                    <xsl:attribute name="type">
                        <xsl:choose>
                            <xsl:when test="@type='digital_source'">digitalSource</xsl:when>
                            <xsl:when test="@type='print_source'">printSource</xsl:when>
                        </xsl:choose>
                    </xsl:attribute>
                    <xsl:apply-templates/>
                    <xsl:if test="note">
                        <xsl:analyze-string select="note"
                            regex=".*(18\d\d)">
                            <xsl:matching-substring>
                                <date>
                                    <xsl:value-of select="regex-group(1)"/>
                                </date>
                            </xsl:matching-substring>
                        </xsl:analyze-string>
                        
                    </xsl:if>
                </bibl>
            </xsl:for-each>            
        </sourceDesc>        
    </xsl:template>
    
    
    <!-- Basically, an identity transform -->
    <xsl:template match="/ | @* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    
    
</xsl:stylesheet>