<%@ Page Language="C#" AutoEventWireup="true" CodeFile="2_Conventions_js.aspx.cs" Inherits="_0_Overview_1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>jQuery UI Lecture [js]</title>
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
                <h2>Javascript Conventions</h2>
                <h3>in jQuery UI</h3>
            </div>
        </div>
    </div>
    <div class="step" data-x="1000" data-y="0">
        <div class="container_12">
            <div class="grid_12 alpha omega">
                <h3>My name is $.Widget</h3>
                <h4>..and I love you</h4>
                <img src="03_FactoryPattern_Images/ALOT.png" />
            </div>
        </div>
    </div>
    <%--Reserved Methods--%>
    <div class="step" data-x="5000" data-rotate-y="60">
        <div class="container_12">
            <div class="grid_12 alpha omega ui-corner-all slide">
                <div class="grid_12 alpha omega ">
                    <h2 class="ui-widget-header ui-corner-all">Conventions</h2>
                    <ul>
                        <li>Reserved Methods</li>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="step" data-x="6000" data-rotate-y="120">
        <div class="container_12">
            <div class="grid_12 alpha omega ui-widget-content ui-corner-all slide">
                <div class="grid_12 alpha omega ">
                    <h2 class="ui-widget-header ui-corner-all">Reserved Methods</h2>
                    <ul>
                        <li>_create</li>
                        <p>This private methos is the first to fire, and fires only once.</p>
                        <p>this is when you should emit the html necessary to be placed in the DOM</p>
                        <p>Protip: Detach the parent from the DOM, manipulate and then reattach</p>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="step" data-x="7000" data-y="500" data-rotate-y="120" data-rotate-z="15">
        <div class="container_12">
            <div class="grid_12 alpha omega ui-widget-content ui-corner-all slide">
                <div class="grid_12 alpha omega ">
                    <h2 class="ui-widget-header ui-corner-all">Reserved Methods</h2>
                    <ul>
                        <li>_init</li>
                        <p>This private method initializes the widget</p>
                        <p>It could fire potentially mroe than once, depending on the widget's lifecycle.</p>
                        <p>The widget should be fully created by now, but thsi is where you 'start it out'</p>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="step" data-x="8000" data-y="1000" data-rotate-y="120" data-rotate-z="30">
        <div class="container_12">
            <div class="grid_12 alpha omega ui-widget-content ui-corner-all slide">
                <div class="grid_12 alpha omega ">
                    <h2 class="ui-widget-header ui-corner-all">Reserved Methods</h2>
                    <ul>
                        <li>_destroy</li>
                        <p class="smaller">This is where you handle Cleanup of the widget. Completely remove the widget from the DOM, and unbind event handlers</p>
                        <p>Every widget needs to implement _destroy</p>
                        <p class="smaller">The widget factory doesn't unbind event handlers because it doesn't bind any. You are fully responsible for undoing anything you do.</p>
                    </ul>
                </div>
                <div class="demo_code">
                    <script>
                        _destroy: function () {
                            this.off('.mywidgetNamespace');
                            $.widget.prototype.destroy.apply(this, arguments);
                        }
                    </script>
                </div>
            </div>
        </div>
    </div>
    <div class="step" data-x="9000" data-y="1500" data-rotate-y="120" data-rotate-z="45">
        <div class="container_12">
            <div class="grid_12 alpha omega ui-widget-content ui-corner-all slide">
                <div class="grid_12 alpha omega ">
                    <h2 class="ui-widget-header ui-corner-all">Reserved Methods</h2>
                    <li>_setOption</li>
                    <p>This function ussually involves a switch, where you can control the widget's state, and replace options</p>
                    <p>Very important function that essentially imbues statefulness</p>
                    <p>must also handle situations, such as dealing with a 'disabled' state</p>
                </div>
            </div>
        </div>
    </div>
    <div class="step" data-x="10000" data-y="2000" data-rotate-y="120" data-rotate-z="60">
        <div class="container_12">
            <div class="grid_12 alpha omega ui-widget-content ui-corner-all slide">
                <div class="grid_12 alpha omega ">
                    <h2 class="ui-widget-header ui-corner-all">Reserved Methods</h2>
                    <li>_setOption</li>
                    <div style="height: 600px; overflow: auto">
                        <div class="demo_code">
                            <script type="slug"> 
                        _setOption: function(key, value) {
                        var self = this,
                            o = self.options,
                            _o = self._options,
                            $el = self.element
                            valsLength = 0;
                        if ($.isArray(o.values)) {
                            valsLength = o.values.length;
                        }
                        $.Widget.prototype._setOption.apply(this, arguments);
                        switch (key) {
                        case "disabled":
                            if (value) {
                                $el.removeClass(".ui-state-focus").blur();
                                $el.removeClass("ui-state-hover");
                                $el.propAttr("disabled", true);
                                $el.addClass("ui-disabled");
                            } else {
                                $el.propAttr("disabled", false);
                                $el.removeClass("ui-disabled");
                            }
                            break;
                        case "value":
                                self._setValue(value);
                            break;
                            </script>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--Options--%>
    <div class="step" data-x="5000" data-rotate-y="60">
        <div class="container_12">
            <div class="grid_12 alpha omega  ui-corner-all slide">
                <div class="grid_12 alpha omega ">
                    <h2 class="ui-widget-header ui-corner-all">Conventions</h2>
                    <ul>
                        <li></li>
                        <li>Options</li>
                        <li></li>
                        <li></li>
                        <li></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="step" data-x="5000" data-y="-1000" data-rotate-y="0">
        <div class="container_12">
            <div class="grid_12 alpha omega  ui-corner-all slide">
                <div class="grid_12 alpha omega ">
                    <h2 class="ui-widget-header ui-corner-all">Options</h2>
                    <div class="demo_code">
                        <script type="slug">
                            (function($, window, document, undefined){
	                            $.widget("yourNameSpace.yourWidget", {
		                            options: {
			                            one: "",
			                            two: { },
			                            three: ""
		                            },
                        </script>
                        <p>These go at the top of the Widget</p>
                    </div>
                    <div class="grid_12">
                        <ul>
                            <li>A note: ints/strings/arrays will be overidden, objects will be extended</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="step" data-x="5000" data-y="-2000" data-rotate-y="0">
        <div class="container_12">
            <div class="grid_12 alpha omega  ui-corner-all slide">
                <div class="grid_12 alpha omega ">
                    <h2 class="ui-widget-header ui-corner-all">Options</h2>
                    <div class="demo_code">
                        <script>
                            _create: function () {
                                this._options = {
                                    privateThingOne: [],
                                    privateThingTwo: []
                                };
                            }
                        </script>
                    </div>
                    <div class="grid_12">
                        <ul>
                            <li>For private options you cna pass around your widget</li>
                            <li>I have had great success creating one like this: in the create method.</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--Namespacing--%>
    <div class="step" data-x="5000" data-rotate-y="60">
        <div class="container_12">
            <div class="grid_12 alpha omega  ui-corner-all slide">
                <div class="grid_12 alpha omega ">
                    <h2 class="ui-widget-header ui-corner-all">Conventions</h2>
                    <ul>
                        <li></li>
                        <li></li>
                        <li>Namespacing</li>
                        <li></li>
                        <li></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="step" data-x="5000" data-y="3000" data-rotate-y="60">
        <div class="container_12">
            <div class="grid_12 alpha omega  ui-corner-all slide">
                <div class="grid_12 alpha omega ">
                    <h2 class="ui-widget-header ui-corner-all">Namespacing</h2>
                    <ul>
                        <li>the ui namespace is reserved, you need to use your own.<ul>
                            <li>$.widget("yourUniqueNamespaceHere.widgetName", </li>
                        </ul>
                        </li>
                        <li>You also need to namespace your events for the widget you are using </li>
                        <li>.on('click.<span class="ui-priority-primary">widgetName</span>', $.proxy(self._selectAllButtonFunction, self)); </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="step" data-x="5000" data-y="4000" data-rotate-y="60">
        <div class="container_12">
            <div class="grid_12 alpha omega  ui-corner-all slide">
                <div class="grid_12 alpha omega ">
                    <h2 class="ui-widget-header ui-corner-all">Namespacing</h2>
                    <p>Free pseudoselector! $(":ui-tabs")</p>
                </div>
            </div>
        </div>
    </div>
    <%--Callbacks--%>
    <div class="step" data-x="5000" data-rotate-y="60">
        <div class="container_12">
            <div class="grid_12 alpha omega  ui-corner-all slide">
                <div class="grid_12 alpha omega ">
                    <h2 class="ui-widget-header ui-corner-all">Conventions</h2>
                    <ul>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li>Callbacks</li>
                        <li></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="step" data-x="5000" data-y="5000" data-rotate-y="60">
        <div class="container_12">
            <div class="grid_12 alpha omega  ui-corner-all slide">
                <div class="grid_12 alpha omega ">
                    <h2 class="ui-widget-header ui-corner-all">Callbacks</h2>
                    <ul>
                        <p>There are two things you pass into your options, callbacks and properties</p>
                        <p>you don't need to define the callback in the options in the widget, you can access them anytime with the provate _trigger() method</p>
                        <li>self._trigger("callbackName", null or {-data-}, { value: someValue });</li>
                        <li>You can pass data into the second argument, if you wish</li>
                        <p>or more simply: ._trigger("event")</p>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="step" data-x="5000" data-y="6000" data-rotate-y="60">
        <div class="container_12">
            <div class="grid_12 alpha omega  ui-corner-all slide">
                <div class="grid_12 alpha omega ">
                    <h2 class="ui-widget-header ui-corner-all">Callbacks</h2>
                    <p>This is not the same as jQuery's trigger method- this is a private and unique method to jQuery UI</p>
                </div>
            </div>
        </div>
    </div>
    <%--_setOption--%>
    <div class="step" data-x="5000" data-rotate-y="60">
        <div class="container_12">
            <div class="grid_12 alpha omega  ui-corner-all slide">
                <div class="grid_12 alpha omega ">
                    <h2 class="ui-widget-header ui-corner-all">Conventions</h2>
                    <ul>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li>Scope</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="step" data-x="5000" data-z="-3000" data-rotate-y="0">
        <div class="container_12">
            <div class="grid_12 alpha omega  ui-widget-content ui-corner-all slide">
                <div class="grid_12 alpha omega ">
                    <h2 class="ui-widget-header ui-corner-all">Scope</h2>
                    <p>the _ prefix means private, otherwise, the function is public!</p>
                    <p>Though if you must, you can still get to it through the widget's prototype....</p>
                    <ul>
                        <li>_somePrivateMethod : function (){} </li>
                        <li>somePublicMethod : function (){} </li>
                    </ul>
                    <p>Awesome! that means you can expose any function to the front!</p>
                    <p>$('selector').myWidget("somePublicMethod")</p>
                    <li>Methods accessible via string - plugin("foo") , or directly - .foo()</li>
                </div>
            </div>
        </div>
    </div>
    <div class="step" data-x="5000" data-z="-6000" data-rotate-y="0">
        <div class="container_12">
            <div class="grid_12 alpha omega ui-widget-content ui-corner-all slide">
                <div class="grid_12 alpha omega ">
                    <h2 class="ui-widget-header ui-corner-all">Scope</h2>
                    <p>Sane default scoping (What is this?)</p>
                    <p>Encapsulated class (jQuery.aj.filterable.prototype)</p>
                    <p>Prevents against multiple instantiation</p>
                </div>
            </div>
        </div>
    </div>
    <div class="step" data-x="5000" data-z="-9000" data-rotate-y="120">
        <div class="container_12">
            <div class="grid_12 alpha omega  ui-corner-all slide">
                <div class="grid_12 alpha omega ">
                    <h2>another nice thing: </h2>
                    <p>Inheritance: $.widget("nameSpace.sexyButton",$.ui.button,{ /* watevah */ }); </p>
                    <p>Though ususally, you will probably use composition over inheritance...</p>
                  

                </div>
            </div>
        </div>
    </div>
    <div class="step" data-x="0" data-y="-2000" data-z="0">
        <div class="container_12">
            <p><a href="Table_of_Contents.aspx">return to table of contents</a></p>
          
        </div>
    </div>
    <%--END OF SLIDES--%>
    </form>
    <script src="js/syntax-highlighter-global.js" type="text/javascript"></script>
    <script src="js/impress.js" type="text/javascript"></script>
</body>
</html>
