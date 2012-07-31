<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Table_of_Contents.aspx.cs" Inherits="Table_of_Contents" %>

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
    <form id="form1" runat="server">
    <div>
        <h1>JQuery UI</h1>
        <ul>
            <li><a href="0_Intro_Talk.aspx">Intro</a></li>
            <li>Conventions
                <ul>
                    <li><a href="1_Conventions_Css.aspx">Css Conventions</a></li>
                    <li><a href="2_Conventions_js.aspx">Javascript Conventions</a></li>
                </ul>
            </li>
            <li><a href="3_LearnByDoing.aspx">Lets Make a Widget</a></li>
            <li>Lets Dissect a Widget!</li>
            <li>Closing Thoughts</li>
         <%--   <li>Links
            <ul>
                <li><a href="http://juiceui.com/"></a></li>
            </ul>
            </li>--%>

            <li>
            <a href="4_Workspace.aspx">Workspace</a></li>
        </ul>
    </div>
    </form>
</body>
</html>
