<xsl:stylesheet exclude-result-prefixes="opds" version="1.0" xmlns:opds="http://www.w3.org/2005/Atom" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" version="5"/>
    <xsl:output indent="yes"/>
    <xsl:template match="/opds:feed">
        <html>
            <head>
                <meta charset="utf-8"/>
                <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
                <meta name="viewport" content="width=device-width, initial-scale=1"/>
                <title>OPDS library</title>

                <!-- Bootstrap -->
                <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet"/>

                <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
                <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
                <!--[if lt IE 9]>
                <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
                <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
                <![endif]-->
            </head>
            <body>
                <div class="container">
                    <h1><xsl:value-of select="opds:title"/></h1>
                    <xsl:if test="opds:link[@rel='prev'] or opds:link[@rel='next']">
                        <ul class="pager">
                            <xsl:if test="opds:link[@rel='prev']">
                                <li class="previous">
                                    <a href="{opds:link[@rel='prev']/@href}">
                                        <xsl:value-of select="opds:link[@rel='prev']/@title"/>
                                    </a>
                                </li>
                            </xsl:if>
                            <xsl:if test="opds:link[@rel='next']">
                                <li class="next">
                                    <a href="{opds:link[@rel='next']/@href}">
                                        <xsl:value-of select="opds:link[@rel='next']/@title"/>
                                    </a>
                                </li>
                            </xsl:if>
                        </ul>
                    </xsl:if>
                    <div class="list-group">                
                        <xsl:for-each select="opds:entry">
                            <xsl:choose>
                                <xsl:when test="
                                opds:link[@rel='http://opds-spec.org/acquisition' and @type='application/fb2'] or
                                opds:link[@rel='http://opds-spec.org/acquisition' and @type='application/epub'] or
                                opds:link[@rel='http://opds-spec.org/acquisition' and @type='application/mobi']">
                                    <span class="list-group-item">
                                        <h4 class="list-group-item-heading">
                                            <xsl:value-of select="opds:title"/>
                                        </h4>
                                        <div class="btn-group">
                                            <xsl:if test="opds:link[@rel='http://opds-spec.org/acquisition' and @type='application/fb2']">
                                                <a class="btn btn-default"
                                                   href="{opds:link[@rel='http://opds-spec.org/acquisition' and @type='application/fb2']/@href}">
                                                    <span class="glyphicon glyphicon-download"></span>
                                                    FB2
                                                </a>
                                            </xsl:if>
                                            <xsl:if test="opds:link[@rel='http://opds-spec.org/acquisition' and @type='application/epub']">
                                                <a class="btn btn-default"
                                                   href="{opds:link[@rel='http://opds-spec.org/acquisition' and @type='application/epub']/@href}">
                                                    <span class="glyphicon glyphicon-download"></span>
                                                    EPUB
                                                </a>
                                            </xsl:if>
                                            <xsl:if test="opds:link[@rel='http://opds-spec.org/acquisition' and @type='application/mobi']">
                                                <a class="btn btn-default"
                                                   href="{opds:link[@rel='http://opds-spec.org/acquisition' and @type='application/mobi']/@href}">
                                                    <span class="glyphicon glyphicon-download"></span>
                                                    MOBI
                                                </a>
                                            </xsl:if>
                                        </div>
                                        <p class="list-group-item-text">
                                            <xsl:value-of select="opds:content[@type='text']"/>
                                        </p>
                                        <p class="list-group-item-text">
                                            <xsl:value-of select="opds:content[@type='text/html']"
                                                          disable-output-escaping="yes"/>
                                        </p>
                                    </span>
                                </xsl:when>
                                <xsl:otherwise>
                                    <a href="{opds:link/@href}" class="list-group-item">
                                        <h4 class="list-group-item-heading">
                                            <xsl:value-of select="opds:title"/>
                                        </h4>
                                        <p class="list-group-item-text">
                                            <xsl:value-of select="opds:content[@type='text']"/>
                                        </p>
                                        <p class="list-group-item-text">
                                            <xsl:value-of select="opds:content[@type='text/html']"
                                                          disable-output-escaping="yes"/>
                                        </p>
                                    </a>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:for-each>
                    </div>
                    <!-- TODO: Remove copy-paste -->
                    <xsl:if test="opds:link[@rel='prev'] or opds:link[@rel='next']">
                        <ul class="pager">
                            <xsl:if test="opds:link[@rel='prev']">
                                <li class="previous">
                                    <a href="{opds:link[@rel='prev']/@href}">
                                        <xsl:value-of select="opds:link[@rel='prev']/@title"/>
                                    </a>
                                </li>
                            </xsl:if>
                            <xsl:if test="opds:link[@rel='next']">
                                <li class="next">
                                    <a href="{opds:link[@rel='next']/@href}">
                                        <xsl:value-of select="opds:link[@rel='next']/@title"/>
                                    </a>
                                </li>
                            </xsl:if>
                        </ul>
                    </xsl:if>
                </div>

                <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
                <!-- Include all compiled plugins (below), or include individual files as needed -->
                <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>