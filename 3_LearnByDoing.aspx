<%@ Page Language="C#" AutoEventWireup="true" CodeFile="3_LearnByDoing.aspx.cs" Inherits="_05_Learn_By_Doing" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="js/jquery-1.7.1.min.js" type="text/javascript"> </script>
    <script src="js/jquery-ui-1.8.17.custom.min.js" type="text/javascript"> </script>
    <link href="css/grid.css" rel="stylesheet" type="text/css" />
    <link href="css/ui-fbdefault/jquery-ui-1.8.17.custom.css" rel="stylesheet" type="text/css" />
    <link href="css/jquery-ui-slideshow-stuff.css" rel="stylesheet" type="text/css" />
    <link href="dp.SyntaxHighlighter/Styles/SyntaxHighlighter.css" rel="stylesheet" type="text/css" />
    <script src="dp.SyntaxHighlighter/Scripts/shCore.js" type="text/javascript"> </script>
    <script src="dp.SyntaxHighlighter/Scripts/shBrushCss.js" type="text/javascript"> </script>
    <script src="dp.SyntaxHighlighter/Scripts/shBrushXml.js" type="text/javascript"></script>
    <script src="dp.SyntaxHighlighter/Scripts/shBrushJScript.js" type="text/javascript"></script>
    <script src="dp.SyntaxHighlighter/Scripts/highlight_init.js" type="text/javascript"></script>
    <script src="my_lecture_widget/jquery.ui.tagCloud.js" type="text/javascript"></script>
    <script src="exampleWidgets/jquery.ui.fluidtable.js" type="text/javascript"></script>
    
    <link href="css/ui-widget-tagcloud.css" rel="stylesheet" type="text/css" />
    

    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container_12">

        <div class="grid_12" style="min-height:400">

            <div class="grid_6 alpha">
                <br/>
               <div id="tagCloud">
                   
               </div>
             
            </div>
            <div class="grid_6 omega">
                <div class="grid_12 alpha omega">
                        <textarea id="inputText" style="width:100%; min-height:200px">

                </textarea>
                    
                </div>
                <div class="grid_12 alpha omega">
                     <button type="button" id="tagItButton">Tag it bro!</button>
                </div>
                <%--This is inline cause my slideshow theme is huuuge--%>
                <div class="grid_12 alpha omega" style="font-size:30%">
                    <div id="rangeSlider"></div>
                </div>
             

            </div>
        </div>

        <div class="grid_12">
            <div class="demo_code">
                <script >
                    $('document').ready(function () {
                        var $tagItButton = $('#tagItButton').button();
                        var $inputTextArea = $('#inputText');
                        var inputText;
                        var $tagCloud = $('#tagCloud');
                        var $rangeSlider = $('#rangeSlider').slider({
                            range: true,
                            min: 0,
                            max: 150,
                            values: [10, 50]
                        });

                        $tagItButton.click(function () {
                            inputText = $inputTextArea.val();
                            $tagCloud.tagcloud({
                                data: inputText,
                                maxFontSize: $rangeSlider.slider("values", 1),
                                minFontSize: $rangeSlider.slider("values", 0)
                                //title: "Taggin-And-Baggin"
                                //createCallback: function () {alert('create');}
                            });
                        });
                    })
                </script>
            </div>
        </div>
    </div>
    </form>
    <script src="js/syntax-highlighter-global.js" type="text/javascript"></script>
</body>
</html>
