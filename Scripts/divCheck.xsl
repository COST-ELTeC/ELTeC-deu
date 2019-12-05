<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.tei-c.org/ns/1.0"
    xmlns:t="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs t" version="2.0">
    <xsl:output method="text"></xsl:output>
    <xsl:template match="/">
        <xsl:text>Text </xsl:text>
        <xsl:value-of select="t:TEI/@xml:id"/>
        <xsl:apply-templates select="//t:body/t:div"/>
    </xsl:template>

    <xsl:template match="t:div">
        <xsl:if test="@type = 'group'">
            <xsl:variable name="chaps">
                <xsl:value-of select="count(t:div[@type = 'chapter'])"/>
            </xsl:variable>
            <xsl:variable name="groups">
                <xsl:value-of select="count(t:div[@type = 'group'])"/>
            </xsl:variable>

            <xsl:if test="$groups ne '0' and $chaps ne '0'">
                <xsl:text>
Group with title "</xsl:text> 
                    <xsl:value-of select="t:head"/> 
                <xsl:text>" has chapters (</xsl:text>
                <xsl:value-of select="$chaps"/>
                <xsl:text>) and groups (</xsl:text>
                <xsl:value-of select="$groups"/>
                 <xsl:text>) at the same level</xsl:text>   
            </xsl:if>

        </xsl:if>

        <xsl:apply-templates select="t:div"/>
    </xsl:template>
</xsl:stylesheet>
