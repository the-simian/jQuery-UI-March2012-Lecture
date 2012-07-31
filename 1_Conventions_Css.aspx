<%@ Page Language="C#" AutoEventWireup="true" CodeFile="1_Conventions_Css.aspx.cs" Inherits="_0_Overview_1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>jQuery UI Lecture [Css]</title>

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

</head>
<body>
    <form id="impress" runat="server">
    <%--slide 1--%>
    <div class="step" data-x="0" data-y="0">
        <div class="container_12">
            <div class="grid_12 alpha omega">
                <h2>Css Conventions</h2>
                <h3>in jQuery UI</h3>
            </div>
        </div>
    </div>
    <%--slide 2--%>
    <div class="step" data-x="1000" data-y="0">
        <div class="container_12">
            <div class="grid_12 alpha omega">
                <h3>A belief I hold:</h3>
                <hr />
                <p>
                    When working in a browser, 30% - 40% of your 'javascript' is actually CSS</p>
            </div>
        </div>
    </div>
    <%--slide 2.1--%>
    <div class="step" data-x="1000" data-y="500">
        <div class="container_12">
            <div class="grid_12 alpha omega">
                <p>
                    What exactly do I mean by this?</p>
                <p>
                    .</p>
                <p>
                    .</p>
            </div>
        </div>
    </div>
    <%--slide 2.2--%>
    <div class="step" data-x="1000" data-y="750">
        <div class="container_12">
            <div class="grid_12 alpha omega">
                <li>You're interacting with the DOM, and presentation layer elements.</li>
            </div>
        </div>
    </div>
    <%--slide 2.3--%>
    <div class="step" data-x="1000" data-y="1000">
        <div class="container_12">
            <div class="grid_12 alpha omega">
                <li>When you aren't working with data, and pure JSON - you are making something the user sees.</li>
            </div>
        </div>
    </div>
    <%--slide 2.4--%>
    <div class="step" data-x="1000" data-y="1500">
        <div class="container_12">
            <div class="grid_12 alpha omega">
                <ul>
                    <li>Animation</li>
                    <li>Colors/ Appearance</li>
                    <li>Size/ Position. Porportion</li>
                    <li>Event Driven Interactivity, controling visuals</li>
                </ul>
                <p>
                    Ever use CSS for this kind of thing?</p>
            </div>
        </div>
    </div>
    <%--slide 3--%>
    <div class="step" data-x="2000" data-y="1500" data-rotate-y="45">
        <div class="container_12">
            <div class="grid_12 alpha omega ui-widget-content ui-corner-all slide">
                <div class="grid_12 alpha omega ">
                    <h2 class="ui-widget-header ui-corner-all">Css is Important</h2>
                </div>
                <p>
                    jQuery UI has some conventions to help your CSS (and HTML)</p>
                <ul>
                    <li>namespacing, and organization</li>
                    <li>Images and Sprites</li>
                    <li>Css State System</li>
                    <li>Modular Organization</li>
                    <li>Conventional Behavior and Structure [Html + CSS]</li>
                </ul>
            </div>
        </div>
    </div>
    <%--slide 3--%>
    <div class="step" data-x="2000" data-y="1500" data-z="-1000" data-rotate-y="60">
        <div class="container_12">
            <div class="grid_12 alpha omega ui-widget-content ui-corner-all slide">
                <div class="grid_12 alpha omega ">
                    <h2 class="ui-widget-header ui-corner-all">Whats in it for you?</h2>
                </div>
                <p>
                    Why should you follow these conventions?</p>
                <ul>
                    <li>You're going to find you rarely need to create additional classes, after you're set up
                        <ul>
                            <li>Smaller footprint</li>
                            <li>No "Library Itits" in your CSS</li>
                        </ul>
                    </li>
                    <li>Devs can predict the presence of Css Structure<ul>
                        <li>ui-namespace</li>
                        <li>widget</li>
                        <li>container</li>
                        <li>states</li>
                    </ul>
                    </li>
                    <li>PERFORMANCE!! →</li>
                </ul>
            </div>
        </div>
    </div>
    <%--slide 4--%>
    <div class="step" data-x="2000" data-y="1500" data-z="-2000" data-rotate-y="75">
        <div class="container_12">
            <div class="grid_12 alpha omega ui-widget-content ui-corner-all slide">
                <div class="grid_12 alpha omega ">
                    <h2 class="ui-widget-header ui-corner-all">[Performance]</h2>
                </div>
                <div class="grid_12">
                    <p>
                        simply put: this</p>
                    <div class="demo_code">
                        <br />

                        <script>
                            $('.someSelector').addClass('ui-state-highlight');
                        </script>

                    </div>
                </div>
                <div class="grid_12">
                    <p>
                        is faster than this</p>
                    <div class="demo_code">
                        <br />

                        <script>
                            $('.someSelector').css({ "background-color": "yellow", "font-size": "1.1em", "color": "green" });
                        </script>

                    </div>
                </div>
                <h3>and last but not least...</h3>
            </div>
        </div>
    </div>
    <%--slide 3--%>
    <div class="step" data-x="2000" data-y="1500" data-z="-3000" data-rotate-y="80">
        <div class="container_12">
            <div class="grid_12 alpha omega ui-widget-content ui-corner-all slide">
                <div class="grid_12 alpha omega ">
                    <h2 class="ui-widget-header ui-corner-all">Cowboy CSS</h2>
                    <li>The death of <span class="ui-priority-primary">Cowboy CSS</span></li>
                    <div class="grid_12">
                        <p>
                            What is cowboy CSS?</p>
                        <p>
                            you'll never hear your devs say again..</p>
                        <div class="smaller">
                            <p>
                                "YEEHAW! ITS THE WILD WEST OF CSS!"</p>
                            <p>
                                "That page is no mans land!"</p>
                            <p>
                                "I think need a class! Out here on the range, we make what we need, with whatever conventions we feel like."</p>
                            <p>
                                "You-hoo, buckaroo!, style="color: blue"</p>
                        </div>
                        <p>
                            .. allow me to illustrate</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--slide 4--%>
    <div class="step" data-x="2000" data-y="1500" data-z="-4000" data-rotate-y="90">
        <div class="container_12">
            <div class="grid_12 alpha omega ui-widget-content ui-corner-all slide">
                <div class="grid_12 alpha omega ">
                    <h2 class="ui-widget-header ui-corner-all">Wat ?!?!?!</h2>
                    <li><span class="ui-priority-primary">Cowboy CSS</span> defined</li>
                    <div class="grid_12">
                        <p class="smaller">
                            Ever Come back to a page you've worked on to find this in the html?</p>
                        <div class="grid_12">
                            <div class="demo_css">
                                <style>
                                    /*At least its not inline styles :P*/
                                    .Thing { font-size: 30%; }
                                    /*screw your em  or pecent- based system*/
                                    ul > li + ol div.obnoxious-selector { font: 45pt; }
                                    /*cryptically named class to make font bold*/
                                    .bd { font-weight: bold; }
                                    /*some hacked-together percent sytem for a table*/
                                    .like-three-percent-column { width: 3%; }
                                    .durr-half-column { width: 50%; }
                                    /*Imma designer too!*/
                                    body { font-family: comic-sans, papyrus; }
                                </style>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--slide 5--%>
    <div class="step" data-x="2000" data-y="1500" data-z="-5000" data-rotate-y="90">
        <div class="container_12">
            <p>
                And now, when your designer needs to make a global change, he/she needs to trek into the wild west like some demented bounty hunter to find and refactor a bunch of random classes and selectors, simply because your frontend didn't follow any convention.</p>
        </div>
    </div>
    <%--slide 6--%>
    <div class="step" data-x="9000" data-y="1500" data-z="-5000" data-rotate-y="0" data-scale="1">
        <div class="container_12">
            <img src="03_FactoryPattern_Images/Cowboy-Css.png" />
        </div>
    </div>
    <%--END OF INTRO--%>
    <%--Namespacing and Organization--%>
    <%-- 0--%>
    <div class="step" data-x="0" data-y="-1000" data-z="0">
        <div class="container_12">
            <p>
                Lets go over the conventions: You'll need these</p>
            <ul>
                <li>Namespacing and Organization</li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
            </ul>
        </div>
    </div>
    <div class="step" data-x="-1500" data-y="-1000" data-z="0" data-rotate-y="-30">
        <div class="container_12">
            <div class="grid_12 alpha omega ui-widget-content ui-corner-all slide">
                <div class="grid_12 alpha omega ">
                    <h2 class="ui-widget-header ui-corner-all">Namespacing and Organization</h2>
                    <div class="grid_12">
                        <ul>
                            <li>jQuery UI, uses What a lot of people call object oriented CSS</li>
                            <li>that just means you 'treat' sections of Css like namespaces/objects to prevent collisions</li>
                            <li>notice the ironic quotes on treat. They're not objects, its all string based</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="step" data-x="-1500" data-y="0" data-z="0" data-rotate-y="-30">
        <div class="container_12">
            <div class="grid_12 alpha omega ui-widget-content ui-corner-all slide">
                <div class="grid_12 alpha omega ">
                    <h2 class="ui-widget-header ui-corner-all">Namespacing and Organization</h2>
                    <div class="grid_12">
                        <ul>
                            <li>Sass and Less can help with this, if Sass use the SCSS format</li>
                            <li class="ui-state-highlight ui-corner-all">sass-convert --from css --to sass path/to/jquery-ui-1.8.2.custom.css > app/stylesheets/_jquery_ui.sass</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="step fullOpactiy" data-x="-1500" data-y="1000" data-z="0" data-rotate-y="-30">
        <div class="container_12 fullOpactiy">
            <img class="fullOpactiy" style="margin-top: 900px;" src="Understanding_css_images/ui-class-breakdown.png" />
        </div>
    </div>
    <div class="step" data-x="-1500" data-y="2000" data-z="0">
        <div class="container_12">
        </div>
    </div>
    <%--Image Organization--%>
    <div class="step" data-x="0" data-y="-1000" data-z="0">
        <div class="container_12">
            <p>
                Lets go over the conventions: You'll need these</p>
            <ul>
                <li></li>
                <li>Image Organization</li>
                <li></li>
                <li></li>
                <li></li>
            </ul>
        </div>
    </div>
    <div class="step" data-x="-3000" data-y="-1000" data-z="0" data-rotate-y="-60">
        <div class="container_12">
            <div class="grid_12 alpha omega">
                <div class="grid_12 alpha omega ">
                    <div class="grid_12">
                        <img src="Understanding_css_images/Icons_sectional.png" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="step" data-x="-3000" data-y="-0" data-z="0" data-rotate-y="-60">
        <div class="container_12">
            <div class="grid_12 alpha omega ui-widget-content ui-corner-all slide">
                <div class="grid_12 alpha omega ">
                    <h2 class="ui-widget-header ui-corner-all">Images</h2>
                    <div class="grid_12">
                        <ul>
                            <li>jQuery UI, uses Spritemaps</li>
                            <li>You indicate 2 classes on a block level element</li>
                            <li>ui-icon ui-icon-(name of icon)</li>
                            <li>Very fast!
                                <ul>
                                    <li>Less Get requests</li>
                                    <li>Images are Cached</li>
                                    <li>you don't swap src, you swap classes</li>
                                </ul>
                            </li>
                            <li>Framework is expandable</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="step" data-x="-3000" data-y="1000" data-z="0" data-rotate-y="-60">
        <div class="container_12">
            <div class="grid_12 alpha omega ui-widget-content ui-corner-all slide">
                <div class="grid_12 alpha omega ">
                    <h2 class="ui-widget-header ui-corner-all">Images</h2>
                    <div class="grid_12">
                        <div class="grid_9 alpha">
                            <div class="demo_html">
                                <span class="ui-icon ui-icon-circle-plus"></span><span class="ui-icon ui-icon-circle-minus"></span><span class="ui-icon ui-icon-check"></span><span class="ui-icon ui-icon-print"></span>
                            </div>
                        </div>
                        <div class="grid_3 omega">
                            <span class="ui-icon ui-icon-circle-plus"></span><span class="ui-icon ui-icon-circle-minus"></span><span class="ui-icon ui-icon-check"></span><span class="ui-icon ui-icon-print"></span>
                        </div>
                        <div class="grid_12 alpha omega">
                            <div class="demo_css">
                                <style>
                                    .ui-icon { width: 16px; height: 16px; background-image: url(images/ui-icons_cccccc_256x240.png); }
                                </style>
                            </div>
                        </div>
                        <div class="grid_12 alpha omega">
                            <div class="demo_css">
                                <style>
                                    .ui-icon-circle-plus { background-position: 0 -192px; }
                                </style>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="step" data-x="-3000" data-y="2000" data-z="0" data-rotate-y="-60">
        <div class="container_12">
            <div class="grid_12 alpha omega ui-widget-content ui-corner-all slide">
                <img src="css/ui-darkness/images/ui-icons_222222_256x240.png" />
                <img src="css/ui-darkness/images/ui-icons_4b8e0b_256x240.png" />
                <img src="css/ui-darkness/images/ui-icons_cccccc_256x240.png" />
                <ul>
                    <li>You can add more icons in the blank spaces, and map their coordinates, accordingly</li>
                    <li>Across a large site, if you can move your icons to this sort of format you will notice a speed increase</li>
                    <li>Fireworks works well, you can then export the various color states</li>
                    <li>you swap background image to change color</li>
                    <li>[above] 3 vs literally hundreds of requests</li>
                </ul>
            </div>
        </div>
    </div>
    <%--Html Structure--%>
    <div class="step" data-x="0" data-y="-1000" data-z="0">
        <div class="container_12">
            <p>
                Lets go over the conventions: You'll need these</p>
            <ul>
                <li></li>
                <li></li>
                <li>Html Structure</li>
                <li></li>
                <li></li>
            </ul>
        </div>
    </div>
    <div class="step" data-x="-4500" data-y="-1000" data-z="0" data-rotate-y="-90">
        <div class="container_12">
            <div class="grid_12 alpha omega">
                <div class="grid_12 alpha omega ">
                    <div class="grid_12">
                        <img src="Understanding_css_images/html-sectional.png" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="step" data-x="-4500" data-y="0" data-z="0" data-rotate-y="-90">
        <div class="container_12">
            <div class="grid_12 alpha omega ui-widget-content ui-corner-all slide">
                <div class="grid_12 alpha omega ">
                    <h2 class="ui-widget-header ui-corner-all">Component Containers</h2>
                    <div class="grid_12">
                        <ul>
                            <li>the parentmost Item always has 2 things:<ul>
                                <li>ui-widget</li>
                                <li>ui-widget-{widget name, such as accordion}</li>
                            </ul>
                            </li>
                            <li>inside this is ui-widget-content, if there is content </li>
                            <li>put the header inside this ui-widget-header</li>
                            <li>Now, all 'special classes' are prefixed by ui-{widgetname}-{subpart ex: 'handle'}</li>
                            <li>This Html convention is important!<ul>
                                <li>highly predictable html patterns</li>
                                <li>establish inheritance 'weight' importance for css</li>
                                <li>you can create state now, by swapping your helpers, etc.</li>
                                <li>I recommend widgets in the document flow <span class="ui-priority-primary">always</span> take 100% of their parent<ul>
                                </ul>
                                </li>
                            </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="step" data-x="-4500" data-y="1000" data-z="0" data-rotate-y="-90">
        <div class="container_12">
            <div class="grid_12 alpha omega ui-widget-content ui-corner-all slide">
                <div class="grid_12 alpha omega ">
                    <h2 class="ui-widget-header ui-corner-all">Component Containers </h2>
                    <h3>[example : input]</h3>
                    <div class="grid_12">
                        <div class="grid_8 alpha">
                            <div class="demo_code">

                                <script>
                                    $('#tabs').tabs();
                                </script>

                            </div>
                            <div class="demo_html" style="font-size: 50%">
                                <div id="Div1">
                                    <ul>
                                        <li><a href="#tabs-1">ONE</a></li>
                                        <li><a href="#tabs-2">TWO</a></li>
                                    </ul>
                                    <div id="Div2">
                                        <p>
                                            ONE</p>
                                    </div>
                                    <div id="Div3">
                                        <p>
                                            TWO</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="grid_4 omega" style="font-size: 50%">
                            <div id="tabs">
                                <ul>
                                    <li><a href="#tabs-1">ONE</a></li>
                                    <li><a href="#tabs-2">TWO</a></li>
                                </ul>
                                <div id="tabs-1">
                                    <p>
                                        ONE</p>
                                </div>
                                <div id="tabs-2">
                                    <p>
                                        TWO</p>
                                </div>
                            </div>

                            <script>
                                $('#tabs').tabs();
                            </script>

                            <div>
                                What does this spit out?
                            </div>
                            <div>
                                <select id="theme_swap" class="grid_12">
                                    <option value="ui-darkness">darkness</option>
                                    <option value="ui-eggplant">eggplant</option>
                                    <option value="ui-lightness">lightness</option>
                                    <option value="ui-fbdefault">default</option>
                                </select>
                                <div id="script_here">
                                </div>

                                <script>
                                    $('document').ready(function () {
                                        $('#theme_swap').on('change',function () {
                                            var val = $('#theme_swap').val();
                                            var scriptString = ' <link href="css/' + val + '/jquery-ui-1.8.17.custom.css" rel="stylesheet" type="text/css" />';
                                            $('#script_here').html(scriptString);

                                        });
                                        
                                        

                                    });
                              
                                </script>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="step" data-x="-4500" data-y="2000" data-z="0" data-rotate-y="-90">
        <div class="container_12">
            <div class="grid_12 alpha omega ui-widget-content ui-corner-all slide">
                <div class="grid_12 alpha omega ">
                    <h2 class="ui-widget-header ui-corner-all">Component Containers </h2>
                    <h3>[example: output]</h3>
                    <div class="grid_12">
                        <div class="grid_12 alpha omega">
                            <div class="demo_html" style="font-size: 50%">
                                <div id="tabs" class="ui-tabs ui-widget ui-widget-content ui-corner-all">
                                    <ul class="ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all">
                                        <li class="ui-state-default ui-corner-top ui-tabs-selected ui-state-active"><a href="#tabs-1">ONE</a></li>
                                        <li class="ui-state-default ui-corner-top"><a href="#tabs-2">TWO</a></li>
                                    </ul>
                                    <div id="Div5" class="ui-tabs-panel ui-widget-content ui-corner-bottom">
                                        <p>
                                            ONE</p>
                                    </div>
                                    <div id="Div6" class="ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide">
                                        <p>
                                            TWO</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--Widget as a CSS driven State Machine--%>
    <div class="step" data-x="0" data-y="-1000" data-z="0">
        <div class="container_12">
            <p>
                Lets go over the conventions: You'll need these</p>
            <ul>
                <li></li>
                <li></li>
                <li></li>
                <li>Widget as a CSS driven State Machine</li>
                <li></li>
            </ul>
        </div>
    </div>
    <div class="step" data-x="-6000" data-y="-1000" data-z="0" data-rotate-y="-120">
        <div class="container_12">
            <div class="grid_12 alpha omega">
                <div class="grid_12 alpha omega ">
                    <div class="grid_12">
                        <img src="Understanding_css_images/state_machine_sectional.png" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="step" data-x="-6000" data-y="0" data-z="0" data-rotate-y="-120">
        <div class="container_12">
            <div class="grid_12 alpha omega ui-widget-content ui-corner-all slide">
                <div class="grid_12 alpha omega ">
                    <h2 class="ui-widget-header ui-corner-all">States</h2>
                    <div class="grid_12">
                        <ul>
                            <li>There are three main categories of states<ul>
                                <li>Interaction - Clicking, hovering</li>
                                <li>Cues - Default, error, disabled related to the widget's internal state</li>
                                <li>Priority - use this instead of things like, bold, etc.</li>
                            </ul>
                            </li>
                        </ul>
                        <li>the state system almost entirely abstract writing CSS away from most of the Devs</li>
                        <li>The designer has complete control over the project</li>
                        <li>These are expandable</li>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="step" data-x="-6000" data-y="1000" data-z="0" data-rotate-y="-120">
        <div class="container_12">
            <div class="grid_12 alpha omega ui-widget-content ui-corner-all slide">
                <div class="grid_12 alpha omega ">
                    <h2 class="ui-widget-header ui-corner-all">States [interaction ]</h2>
                    <div class="grid_12">
                        <div class="demo_css smaller">
                            <style>
                                .ui-state-default, .ui-widget-content .ui-state-default, .ui-widget-header .ui-state-default { }
                                .ui-state-default a, .ui-state-default a:link, .ui-state-default a:visited { }
                                .ui-state-hover, .ui-widget-content .ui-state-hover, .ui-widget-header .ui-state-hover, .ui-state-focus, .ui-widget-content .ui-state-focus, .ui-widget-header .ui-state-focus { }
                                .ui-state-hover a, .ui-state-hover a:hover { }
                                .ui-state-active, .ui-widget-content .ui-state-active, .ui-widget-header .ui-state-active { }
                                .ui-state-active a, .ui-state-active a:link, .ui-state-active a:visited { }
                            </style>
                            <p>
                                You probably won't extend these</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="step" data-x="-6000" data-y="2000" data-z="0" data-rotate-y="-120">
        <div class="container_12">
            <div class="grid_12 alpha omega ui-widget-content ui-corner-all slide">
                <div class="grid_12 alpha omega ">
                    <h2 class="ui-widget-header ui-corner-all">States [cue, priority]</h2>
                    <div class="grid_12">
                        <div class="demo_css smaller">
                            <style>
                                .ui-state-highlight, .ui-widget-content .ui-state-highlight, .ui-widget-header .ui-state-highlight { }
                                .ui-state-highlight a, .ui-widget-content .ui-state-highlight a, .ui-widget-header .ui-state-highlight a { }
                                .ui-state-error, .ui-widget-content .ui-state-error, .ui-widget-header .ui-state-error { }
                                .ui-state-error a, .ui-widget-content .ui-state-error a, .ui-widget-header .ui-state-error a { }
                                .ui-state-error-text, .ui-widget-content .ui-state-error-text, .ui-widget-header .ui-state-error-text { }
                                .ui-state-disabled, .ui-widget-content .ui-state-disabled, .ui-widget-header .ui-state-disabled { }
                            </style>
                        </div>
                        <div class="demo_css smaller">
                            <style>
                                ui-priority-primary, .ui-widget-content .ui-priority-primary, .ui-widget-header .ui-priority-primary { font-weight: bold; }
                                .ui-priority-secondary, .ui-widget-content .ui-priority-secondary, .ui-widget-header .ui-priority-secondary { opacity: .7; filter: Alpha(Opacity=70); font-weight: normal; }
                            </style>
                        </div>
                        <p>
                            But these can be reasonably extended!
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="step" data-x="-6000" data-y="3000" data-z="0" data-rotate-y="-120">
        <div class="container_12">
            <div class="grid_12 alpha omega ui-widget-content ui-corner-all slide">
                <div class="grid_12 alpha omega ">
                    <h2 class="ui-widget-header ui-corner-all">States</h2>
                    <div class="grid_12">
                        <p>
                            What are some states that might make sense for you app?</p>
                        <li>ui-state-Executing?</li>
                        <li>ui-state-Success?</li>
                        <p>
                            What about priority?</p>
                        <li>ui-state-Urgent?</li>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="step" data-x="-6000" data-y="4000" data-z="0" data-rotate-y="-120">
        <div class="container_12">
            <div class="grid_12 alpha omega ui-widget-content ui-corner-all slide">
                <div class="grid_12 alpha omega ">
                    <h2 class="ui-widget-header ui-corner-all">States</h2>
                    <div class="grid_12">
                        <p>
                            Good states decouple style from meaning. "Bold" tells me nothing about what is going on the page. Is it important? An error?</p>
                        <p>
                            What if I change themes?</p>
                        <p>
                            Throughout your widget creation. Think in states.</p>
                        <p>
                            Eventually, you will find you no longer need additional classes</p>
                    </div>
                    <h3>But if you Do.....</h3>
                </div>
            </div>
        </div>
    </div>
    <div class="step" data-x="-6000" data-y="5000" data-z="0" data-rotate-y="-120">
        <div class="container_12">
            <div class="grid_12 alpha omega ui-widget-content ui-corner-all slide">
                <div class="grid_12 alpha omega ">
                    <h2 class="ui-widget-header ui-corner-all">HELPERS</h2>
                    <h3>There is the ui-helper namespace</h3>
                    <div class="grid_12">
                        <div class="demo_css">
                            <style>
                                .ui-helper-hidden { display: none; }
                                .ui-helper-hidden-accessible { position: absolute !important; clip: rect(1px 1px 1px 1px); clip: rect(1px,1px,1px,1px); }
                                .ui-helper-reset { margin: 0; padding: 0; border: 0; outline: 0; line-height: 1.3; text-decoration: none; font-size: 100%; list-style: none; }
                                .ui-helper-clearfix:before, .ui-helper-clearfix:after { content: ""; display: table; }
                                .ui-helper-clearfix:after { clear: both; }
                                .ui-helper-clearfix { zoom: 1; }
                                .ui-helper-zfix { width: 100%; height: 100%; top: 0; left: 0; position: absolute; opacity: 0; filter: Alpha(Opacity=0); }
                            </style>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="step" data-x="-6000" data-y="6000" data-z="0" data-rotate-y="-120">
        <div class="container_12">
            <div class="grid_12 alpha omega ui-widget-content ui-corner-all slide">
                <div class="grid_12 alpha omega ">
                    <h2 class="ui-widget-header ui-corner-all">HELPERS</h2>
                    <div class="grid_12">
                        <p>
                            I didnt list helpers until now, because they are a last resort, nuts and bolts fix for things</p>
                        <p>
                            THese tend to address mechanical page concernts, such as zindexing, visibility</p>
                        <p>
                            You will find yourself extending this often, but eventually even this namespace will be complete enough to handle your projects conventions</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="step" data-x="0" data-y="-1000" data-z="0">
        <div class="container_12">
            <p>
                Lets go over the conventions: You'll need these</p>
            <ul>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
                <li>Overiding Widgets</li>
            </ul>
        </div>
    </div>
    <div class="step" data-x="-7000" data-y="-1000" data-rotate-y="-150">
        <div class="container_12">
            <h3>Most of your CSS will be dealing with the pieces of various individual widgets</h3>
            <p>
                Let your css do the visual heavy lifting. Its faster than javascript, and highly repeatable/ interchangeable.</p>
        </div>
    </div>
    <div class="step" data-x="-7000" data-y="0" data-rotate-y="-150">
        <div class="container_12">
            <div class="grid_12 alpha omega ui-widget-content ui-corner-all slide">
                <div class="grid_12 alpha omega ">
                    <h2 class="ui-widget-header ui-corner-all">Overriding Widgets</h2>
                    <div class="demo_html" style="font-size: 50%">
                        <div id="Div4" class="ui-tabs ui-widget ui-widget-content ui-corner-all">
                            <ul class="ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all">
                                <li class="ui-state-default ui-corner-top ui-tabs-selected ui-state-active"><a href="#tabs-1">ONE</a></li>
                                <li class="ui-state-default ui-corner-top"><a href="#tabs-2">TWO</a></li>
                            </ul>
                            <div id="Div7" class="ui-tabs-panel ui-widget-content ui-corner-bottom">
                                <p>
                                    ONE</p>
                            </div>
                            <div id="Div8" class="ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide">
                                <p>
                                    TWO</p>
                            </div>
                        </div>
                    </div>
                    <p>
                        Remember the tab's emitted html?</p>
                </div>
            </div>
        </div>
    </div>
    <div class="step" data-x="-7000" data-y="1000" data-rotate-y="-150">
        <div class="container_12">
            <div class="grid_12 alpha omega ui-widget-content ui-corner-all slide">
                <div class="grid_12 alpha omega ">
                    <h2 class="ui-widget-header ui-corner-all">Overriding Widgets</h2>
                    <div class="demo_css" style="max-height: 500px">
                        <style>
                            .ui-tabs { position: relative; padding: .2em; zoom: 1; }
                            /* position: relative prevents IE scroll bug (element with position: relative inside container with overflow: auto appear as "fixed") */.ui-tabs .ui-tabs-nav { margin: 0; padding: .2em .2em 0; }
                            .ui-tabs .ui-tabs-nav li { list-style: none; float: left; position: relative; top: 1px; margin: 0 .2em 1px 0; border-bottom: 0 !important; padding: 0; white-space: nowrap; }
                            .ui-tabs .ui-tabs-nav li a { float: left; padding: .5em 1em; text-decoration: none; }
                            .ui-tabs .ui-tabs-nav li.ui-tabs-selected { margin-bottom: 0; padding-bottom: 1px; }
                            .ui-tabs .ui-tabs-nav li.ui-tabs-selected a, .ui-tabs .ui-tabs-nav li.ui-state-disabled a, .ui-tabs .ui-tabs-nav li.ui-state-processing a { cursor: text; }
                            .ui-tabs .ui-tabs-nav li a, .ui-tabs.ui-tabs-collapsible .ui-tabs-nav li.ui-tabs-selected a { cursor: pointer; }
                            /* first selector in group seems obsolete, but required to overcome bug in Opera applying cursor: text overall if defined elsewhere... */.ui-tabs .ui-tabs-panel { display: block; border-width: 0; padding: 1em 1.4em; background: none; }
                            .ui-tabs .ui-tabs-hide { display: none !important; }
                        </style>
                        <p>
                            parentmost class first. coexists with ui-widget</p>
                        <p>
                            If you wanted to break convention for a particular state - do it here.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="step" data-x="0" data-y="-1000" data-z="0">
        <div class="container_12">
            <p>
                Lets go over the conventions: You'll need these</p>
            <ul>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
            </ul>
        </div>
    </div>
    <div class="step" data-x="0" data-y="-2000" data-z="0">
        <div class="container_12">
            <p>
                <a href="Table_of_Contents.aspx">return to table of contents</a></p>
        </div>
    </div>
    <%--END OF SLIDES--%>
    </form>

    <script src="js/syntax-highlighter-global.js" type="text/javascript"></script>

    <script src="js/impress.js" type="text/javascript"></script>

</body>
</html>
