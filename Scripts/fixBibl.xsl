<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:variable name="docId">
        <xsl:value-of select="concat('/home/lou/Public/ELTeC-deu/Orig/',TEI/@xml:id,'.xml')"/>
    </xsl:variable>
   
    <xsl:template match="teiHeader/fileDesc/sourceDesc/bibl[starts-with(@type,'digital')]/date">
     <!--   <xsl:message>Looking for data in </xsl:message>
        <xsl:message><xsl:value-of select="$docId"/></xsl:message>-->
    <!--    <bibl xmlns="http://www.tei-c.org/ns/1.0" type="digitalSource">
    -->        <xsl:for-each select="doc($docId)//TEI/teiHeader/fileDesc/sourceDesc/bibl[@type='digital_source']/idno">
            <ref xmlns="http://www.tei-c.org/ns/1.0">
                <xsl:attribute name="target">
                    <xsl:apply-templates/>
                   </xsl:attribute>
            </ref>      
             </xsl:for-each>    
        <!--</bibl>-->
    </xsl:template>
    
    
    <!-- Basically, an identity transform -->
    <xsl:template match="/ | @* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    
    
</xsl:stylesheet>