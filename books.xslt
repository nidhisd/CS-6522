<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:param name="input" />
<xsl:param name="options" />
<xsl:template match="/books">
<html>
<body>
<xsl:if test="$options=''"> 
		<p>Select one option!!</p>
</xsl:if>
<!-- IMplementing Search By Title -->
<xsl:if test="$options='title'">
<xsl:if test="count(book[title=$input])>0">
<table border="1">
  <tr>
		<th bgcolor="salmon">Title</th>
		<th bgcolor="salmon">Author</th>
		<th bgcolor="salmon">price</th>
	</tr>
	<xsl:for-each select="book[title=$input]">
	<tr>
	  <td>
			<xsl:value-of select="title" />
		</td>
		<td>
			<xsl:for-each select="authors">
			<xsl:for-each select="author">
			<xsl:value-of select="."/>
			  <xsl:if test="position() != last()">
					  <xsl:text>, </xsl:text>
				</xsl:if>
			</xsl:for-each>
			</xsl:for-each>
		</td>
		<td>
			<xsl:value-of select="price"/>
		</td>
	</tr>
	</xsl:for-each>
	</table>
	</xsl:if>
	<xsl:if test="count(book[title=$input])=0">
		<p>Book not found!!!</p>
	</xsl:if>
</xsl:if>
  
<!-- IMplementing Search By Author -->
<xsl:if test="$options='author'">
	<xsl:choose>
    <xsl:when test="count(book[authors/author=$input])>0">
		<table border="1">
			<tr>
			  <th bgcolor="salmon">Title</th>
			  <th bgcolor="salmon">Author</th>
			  <th bgcolor="salmon">price</th>
			</tr>
		<xsl:for-each select="book[authors/author=$input]">
			<tr>
				<td>
					<xsl:value-of select="title" />
				</td>
				<td>
					<xsl:for-each select="authors">
					<xsl:for-each select="author">
					<xsl:value-of select="."/>
					<xsl:if test="position() != last()">
					<xsl:text>, </xsl:text>
					</xsl:if>
					</xsl:for-each>
					</xsl:for-each>
				</td>
				<td>
					<xsl:value-of select="price"/>
				</td>
			</tr>
		</xsl:for-each>
    </table>
    </xsl:when>
	<xsl:otherwise>
      <p>Book not found!!!</p>
	</xsl:otherwise>
	</xsl:choose>
</xsl:if>
		
<!-- IMplementing Search By Price -->
<xsl:if test="$options='price'">
	<xsl:choose>
	<xsl:when test="count(book[price=$input])>0">
	<table border="1">
			<tr>
				<th bgcolor="salmon">Title</th>
				<th bgcolor="salmon">Author</th>
				<th bgcolor="salmon">price</th>
			</tr>
		<xsl:for-each select="book[price=$input]">
			<tr>
				<td>
				  <xsl:value-of select="title" />
				</td>
				<td>
					<xsl:for-each select="authors">
					<xsl:for-each select="author">
					<xsl:value-of select="."/>
					<xsl:if test="position() != last()">
					<xsl:text>, </xsl:text>
					</xsl:if>
					</xsl:for-each>	
					</xsl:for-each>
				</td>
				<td>
					<xsl:value-of select="price"/>
				</td>
			</tr>
		</xsl:for-each>
	</table>
	</xsl:when>
	<xsl:otherwise>
	<p>Book not found!!!</p>
	</xsl:otherwise>
	</xsl:choose>
</xsl:if>
</body>
</html>
</xsl:template>
</xsl:stylesheet>

