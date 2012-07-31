<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Slide_Template_Test CodeBlock.aspx.cs" Inherits="Slide_Template_Only" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>jQuery UI Lecture</title>

    <script src="js/jquery-1.7.1.min.js" type="text/javascript"> </script>

    <script src="js/jquery-ui-1.8.17.custom.min.js" type="text/javascript"> </script>

    <link href="css/grid.css" rel="stylesheet" type="text/css" />
    <link href="css/ui-lightness/jquery-ui-1.8.17.custom.css" rel="stylesheet" type="text/css" />
    <link href="css/jquery-ui-slideshow-stuff.css" rel="stylesheet" type="text/css" />
    <link href="dp.SyntaxHighlighter/Styles/SyntaxHighlighter.css" rel="stylesheet" type="text/css" />

    <script src="dp.SyntaxHighlighter/Scripts/shCore.js" type="text/javascript"> </script>

    <script src="dp.SyntaxHighlighter/Scripts/shBrushCss.js" type="text/javascript"> </script>

    <script src="dp.SyntaxHighlighter/Scripts/shBrushJScript.js" type="text/javascript"></script>

    <script src="dp.SyntaxHighlighter/Scripts/highlight_init.js" type="text/javascript"></script>

</head>
<body>



    <form id="impress" runat="server">
    <%--slide 1--%>
    <div class="step" data-x="0" data-y="0">
        <div class="container_12">
            <div class="grid_12 alpha omega ui-widget-content ui-corner-all slide">
                <div class="grid_12 alpha omega ">
                    <h2 class="ui-widget-header ui-corner-all">Test Slide</h2>
                </div>
                <div class="grid_8 alpha">
                    <div class="demo_code">
                        <br />
                        <script language="javascript">
                            var x = "hello";
                            $('document').ready(function () {
                                console.log('I ran');
                            });
                        </script>
                    </div>
                </div>
                <div class="grid_4 omega">
                    <ul>
                        <li>stuff</li>
                        <li>stuff</li>
                        <li>stuff</li>
                        <li>stuff</li>
                        <li>stuff</li>
                        <li>stuff</li>
                        <li>stuff</li>
                        <li>stuff</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    
        <%--slide 2--%>
    <div class="step" data-x="0" data-y="9000" data-rotate-x="90">
        <div class="container_12">
            <div class="grid_12 alpha omega ui-widget-content ui-corner-all slide">
                <div class="grid_12 alpha omega ">
                    <h2 class="ui-widget-header ui-corner-all">Test Slide</h2>
                </div>
                <div class="grid_8 alpha">
                    <div class="demo_code">
                        <br />

                        <script>
                            var x = "hello";
                            $('document').ready(function () {
                                //Test Script
                            });
                        </script>
                    </div>
                </div>
                <div class="grid_4 omega">
                    <ul>
                        <li>stuff</li>
                        <li>stuff</li>
                        <li>stuff</li>
                        <li>stuff</li>
                        <li>stuff</li>
                        <li>stuff</li>
                        <li>stuff</li>
                        <li>stuff</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    </form>
        <script>
            
            var $allDemocodeblocks = $('div.demo_code');
            $allDemocodeblocks.each(function (i, e) {
                $e = $(e);
                $e.hide();
                var script = $e.find('script');
                script.detach();
                script = script.html();
                $e.append('<pre name="code" class="javascript" cols="40" rows="20">' + script + '</pre>');
                $e.show();
                
            });
            
        </script>
    <script src="js/impress.js" type="text/javascript"></script>

</body>
</html>
