





/*!
* jQuery UI Widget-factory plugin boilerplate (for 1.8)
* Author: jHarlin
* Licensed under the MIT license
* dependencies: [list dependencies here eg, ui.Button nine.HerpinDerp, jQuery is assumed]
*/




; (function ($, window, document, undefined) {

    // Our Namespaces for most widgets:
    //  nine
    //  nineForm
    //  nineGrid
    //  nineDashboard
    
    // namespace.widgetname[camelCase]
 

    $.widget("nine.multiPercentPageNavBar", {

        
        options: {
            someValue: null,
            someValue2: "test"
        },

        //Setup widget (eg. element creation, apply theming
        // , bind events etc.)
        _create: function () {

            console.log(this.options.someValue2);

            // Put the initial widget
            // setup code here, then you can access the element
            // on which the widget was called via this.element.
            // The options defined above can be accessed
            // via this.options this.element.addStuff();
        },


        destroy: function () {

            // this.element.removeStuff(); <-- remove all bindings and classes.
            // destroy must be invoked from the base widget
            $.Widget.prototype.destroy.call(this);
        },

        methodA: function (event) {
            //_trigger dispatches callbacks the plugin user
            // can subscribe to
            // signature: _trigger( "callbackName" , [eventObject],
            // [uiObject] )
            // eg. this._trigger( "hover", e /*where e.type == "mouseenter"*/, { hovered: $(e.target)});
            this._trigger('methodB', event, {
                key: value
            });
        },

        methodB: function (event) {
            this._trigger('dataChanged', event, {
                key: value
            });
        },

        // Respond to any changes the user makes to the option method
        _setOption: function (key, value) {
            switch (key) {
                case "someValue":
                    //this.options.someValue = doSomethingWith( value );
                    break;
                default:
                    //this.options[ key ] = value;
                    break;
            }

            // _setOption must be manually invoked from the base widget
            $.Widget.prototype._setOption.apply(this, arguments);
        }
    });

})(jQuery, window, document);


/*

Standards
-----------

1. jQuery.ui.keyCode for all Keyboard Events
2. HTML not XHTML (eg <div> not <div/> , </div>)
3. "_" prefix is private, otherwise is public
4. camelCase, no Hungarian notation
5. if default behavior is to parse the DOM then use null for default
6. Plugins must work regardless of what options are passed to init
7. do not use the .ui namespace. That is reserved for core jQuery UI stuff. use our namespaces.
8. Always uses braces on control statements.
9. namespace all events for easy cleanup !!!! (eg. 'click.myWidgetName' not just 'click')
10. "Use '===' to compare with 'null'." and "Use '!==' to compare with 'null'."
11. no underscore allowed! (sorry) only other jQuery ui and jQuery dependencies.
12. no For..in loops. They are slow and they suck. Use a normal for loop.
13. cache your loop lengths when you can. this can resule in a 20% loop speed increase
14. Strict equality checks (===) should be used in favor of == wherever possible
15. view jQuery style guide for all proper type checks. DOn't use underscore, or anything else.
16. .nodeName used in favor of .tagName
17. use .test() and .exec() for REGEX, not .match();
18. do not attach expandos to nodes, use .data
19. for jQuery object var names, i recommend prefixing with a $ (eg. $anchors)


Finally: get rid of comments when the plugin is done, besides the header.
http://docs.jquery.com/JQuery_Core_Style_Guidelines (follow this when in doubt.)
http://docs.jquery.com/Plugins/Authoring (and this)
http://wiki.jqueryui.com/w/page/12137737/Coding%20standards (and this)

*/

