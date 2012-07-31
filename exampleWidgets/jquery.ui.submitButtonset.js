/*!
* jQuery UI Widget-factory plugin boilerplate (for 1.8)
* Author: Jesse Harlin @ ninecollective
* License: determined by ninecollective
*  Depends:
*	jquery.ui.core.js
*	jquery.ui.widget.js
*   jquery.ui.Button
*    grid.css
*   knockout
*/


;
(function ($, window, document, undefined) {

    $.widget("nineForm.submitButtonSet", {
        options: {
            hasCancel: true,
            hasSaveAndNew: false,
            hasSpare: false,
            hasSave: true,

            cancelText: "Cancel",
            saveAndNewText: "Save + New",

            spareButtonText: "Another Button",
            saveText: "Save",
            
            cancelRedirectLocation: null,

            saveButtonClickFunction: null,
            saveAndNewButtonClickFunction: null,
            cancelButtonClickFunction: null,
            spareButtonClickFunction: null,
            
            saveButtonBlockUIMessage: "",
            saveAndNewButtonBlockUIMessage: "",
            spareButtonBlockUIMessage: "",

            //SpareButton Extras
            spareButtonClass: "",
            spareButtonIcon: "",

            //Other
            
            submitOnSave: true,
            submitOnSaveAndNew: false,
            submitOnSpare: false,
            
            enableSave: null,
            enableSpare: null,
            enableSaveAndNew: null,
            duplicateValidationMessagesAllowed: false,
            
            //values
            saveButtonValue: "Save",
            saveAndNewButtonValue: "Save and New",
            cancelButtonValue: "Cancel",
            spareButtonValue: "Spare Button",
            submitHiddenInputsForUncheckdCheckboxes : true,
            submitDisabledInputElements: true,

            //DefaultTargetForm
            targetFormSelector : 'form:first'

        },
        
        _buttonType: function (bool){
            if(bool){
                return 'type="submit"';
            }else{
                return 'type="button"';
            }

        },

        _validationConsoleGenerator: function(validationMethod, validationMessage){
            var $formRequireMessages = $('#formRequireMessages').find('ul.formValidationRequirements');

            var visibletMethod;
            var visibleCssClass;
            if(!(validationMethod.charAt(validationMethod.length - 1) == ")")){
                visibletMethod = validationMethod + "()";
                visibleCssClass = validationMethod;


            } else{
                visibletMethod = validationMethod;
                visibleCssClass = validationMethod.slice(0, validationMethod.length - 2);
            }             


            if($formRequireMessages.find('.' + visibleCssClass).length == 0 || this.options.duplicateValidationMessagesAllowed){


                var htmlStringMessage = $('<li class="' + visibleCssClass + '" data-bind="visible: !' + visibletMethod + '"><div class="ui-icon ui-icon-notice ui-state-error-text ui-helper-icon-inline" style="margin-right:3px; margin-bottom:-3px"></div><div class="ui-state-primary ui-helper-icon-inline" >' + validationMessage + '</div></li>');
                $formRequireMessages.append(htmlStringMessage);
            }
        },

        _koStringGenerator: function(enableArray){

            var returnStringOfKoStuff = "";

            if(enableArray){
                returnStringOfKoStuff = 'data-bind="';
            }

            if(enableArray){
                returnStringOfKoStuff += 'enable:(';

                for(var j = 0; j < enableArray.length; j++){

                   
                    if(typeof enableArray[j]['validate'] === "string"){
                        

                        var enableMethod  = enableArray[j]['validate'];
                         
                        if(!(enableMethod.charAt(enableMethod.length - 1) == ")")){
                                enableMethod = enableMethod + "()";
                        }


                        returnStringOfKoStuff += enableMethod;

                        //also hook up to console
                        if(typeof enableArray[j]['message'] === "string"){

                            this._validationConsoleGenerator(enableArray[j]['validate'], enableArray[j]['message']);
                        }

                    } else{

                        alert('enable x Arguments must be in format  [{validate: "theMethodAsString", message: "astring"},{validate: "theMethodAsString", message: "astring"}]');
                    }

                    if(j < enableArray.length - 1){
                        returnStringOfKoStuff += ' && ';
                    }else{
                        returnStringOfKoStuff += ')"';
                    }

                }
            }

            if(returnStringOfKoStuff.length){
                returnStringOfKoStuff += '';
            }

            return returnStringOfKoStuff;
        },

        //Setup widget (eg. element creation, apply theming
        // , bind events etc.)
        _create: function(){
            var self = this,
                o = self.options,
                $el = self.element;


            

            var $buttons = [];

            var $cancelButton = $('<button type="button" class="ui-state-error ui-corner-all" name="cancelButton" value="' + o.cancelButtonValue + '" >' + o.cancelText + '</button>')
                .button({ icons: { 'primary': 'ui-icon-circle-close' } });

            var $saveAndNewButton = $('<button ' + self._buttonType(o.submitOnSaveAndNew) + ' class="ui-state-execute ui-corner-all" name="saveAndNewButton" value="' + o.saveAndNewButtonValue + '" ' + self._koStringGenerator(o.enableSaveAndNew) + '>' + o.saveAndNewText + '</button>')
                .button({ icons: { 'primary': 'ui-icon-circle-plus' } });

            var $spareButton = $('<button  ' + self._buttonType(o.submitOnSpare) + ' class="' + o.spareButtonClass + ' ui-corner-all omega" name="spareButton" value="' + o.cancelButtonValue + '" ' + self._koStringGenerator(o.enableSpare) + '>' + o.spareButtonText + '</button>')
                .button({ icons: { 'primary': o.spareButtonIcon } });

            var $saveButton = $('<button  ' + self._buttonType(o.submitOnSave) + ' class="ui-state-success ui-corner-all omega" name="saveButton" value="' + o.saveButtonValue + '" ' + self._koStringGenerator(o.enableSave) + '>' + o.saveText + '</button>')
                .button({ icons: { 'primary': 'ui-icon-circle-check' } });

            if(o.hasSave){
                $buttons.push($saveButton);
            }
            if(o.hasSaveAndNew){
                $buttons.push($saveAndNewButton);
            }

            if(o.hasSpare){
                $buttons.push($spareButton);
            }

            if(o.hasCancel){
                $buttons.push($cancelButton);
            }

            var gridClass = "grid_" + (12 / $buttons.length);

            var $buttonCapsule;
            for(var i = 0; i < $buttons.length; i++){
                $buttonCapsule = $('<div></div>').addClass(gridClass);
                if(i == 0){
                    $buttonCapsule.addClass('alpha');
                }
                if(i == $buttons.length - 1){
                    $buttonCapsule.addClass('omega');
                }
                $buttonCapsule.append($buttons[i]);
                $el.append($buttonCapsule);
            }
            $el.addClass('grid_12 alpha omega ui-corner-all');
        },

        _init: function(){
            var self = this,
                o = self.options,
                $el = self.element;
            var uncheckedBoxes;
            var disabledInputElements;

            var $form = $(o.targetFormSelector);

            if(o.hasCancel){

                function cancelWrapper(){
                    if(o.cancelButtonClickFunction){
                        o.cancelButtonClickFunction.call();
                    }
                    if(o.cancelRedirectLocation == null){
                        history.go(-1);
                    }else{
                        window.document.location = o.cancelRedirectLocation;
                    }
                }

                $el.on('click.submitButtonSet', 'button[name="cancelButton"]', cancelWrapper);
            }


            if(o.hasSaveAndNew){
                
                function saveAndNewWrapper(){
                
                    if($('button[name="saveAndNewButton"]').is(':disabled') == false){
                        
                        if($(o.targetFormSelector).valid()){
                            
                            

                            $.blockUI({ title: "Submitting Form", message: '<div style="padding:5%"><br/><div class="ui-corner-all ui-widget-content ui-state-waiting"><h2 class="ui-helper-form-text-align-center" style="padding:1px">Wait Please..</h2></div><br /><h3>' + o.saveAndNewButtonBlockUIMessage + '</h3></div>' });


                            if(o.saveAndNewButtonClickFunction){
                                if(typeof o.saveAndNewButtonClickFunction == "string"){
                                    eval(o.saveAndNewButtonClickFunction).call();
                                } else{
                                    o.saveAndNewButtonClickFunction.call();
                                }
                            }

                            if(o.submitOnSaveAndNew){
                                if (o.submitHiddenInputsForUncheckdCheckboxes) {
                                    uncheckedBoxes = $form.find('input[type="checkbox"]:not(:checked)');
                                    uncheckedBoxes.each(function(i, e) {
                                        e = $(e);
                                        var hiddenInput = $('<input type="hidden" value ="false" name="' + e.attr('name') + '"></input>');
                                        e.remove();
                                        $form.append(hiddenInput);
                                    });
                                }
                                
                                if(o.submitDisabledInputElements) {
                                    disabledInputElements = $form.find('input:disabled');
                                    disabledInputElements.each(function (i,e) {
                                        e = $(e);
                                        e.removeAttr('disabled');
                                    });
                                }

                                $(o.targetFormSelector).submit();
                            }

                        }
                    }
                }

                $el.on('click.submitButtonSet', 'button[name="saveAndNewButton"]', saveAndNewWrapper);
            }

            if(o.hasSave){
                function saveWrapper(){
                    if($('button[name="saveButton"]').is(':disabled') == false){
                        if($(o.targetFormSelector).valid()){
                            $.blockUI({ title: "Submitting Form", message: '<div style="padding:5%"><br/><div class="ui-corner-all ui-widget-content ui-state-waiting"><h2 class="ui-helper-form-text-align-center" style="padding:1px">Wait Please..</h2></div><br /><h3>' + o.saveButtonBlockUIMessage + '</h3></div>' });
                            if(o.saveButtonClickFunction){

                                if(typeof o.saveButtonClickFunction == "string"){
                                    eval(o.saveButtonClickFunction).call();
                                } else{
                                    o.saveButtonClickFunction.call();
                                }
                            }
                            if(o.submitOnSave){
                                if(o.submitHiddenInputsForUncheckdCheckboxes) {
                                   uncheckedBoxes  = $form.find('input[type="checkbox"]:not(:checked)');
                                    uncheckedBoxes.each(function (i,e) {
                                        e = $(e);
                                        var hiddenInput = $('<input type="hidden" value ="false" name="'+e.attr('name')+'"></input>');
                                        e.remove();
                                        $form.append(hiddenInput);
                                    });
                                }
                                if (o.submitDisabledInputElements) {
                                    disabledInputElements = $form.find('input:disabled');
                                    disabledInputElements.each(function(i, e) {
                                        e = $(e);
                                        e.removeAttr('disabled');
                                    });
                                }
                                $form.submit();
                            }
                        }
                    }
                }

                $el.on('click.submitButtonSet', 'button[name="saveButton"]', saveWrapper);
            }


            if(o.hasSpare){

                function spareWrapper(){

                    if($('button[name="spareButton"]').is(':disabled') == false){

                        if($(o.targetFormSelector).valid()){

                            $.blockUI({ title: "Submitting Form", message: '<div style="padding:5%"><br/><div class="ui-corner-all ui-widget-content ui-state-waiting"><h2 class="ui-helper-form-text-align-center" style="padding:1px">Wait Please..</h2></div><br /><h3>' + o.spareButtonBlockUIMessage + '</h3></div>' });

                            if(o.spareButtonClickFunction){

                                if(typeof o.spareButtonClickFunction == "string"){
                                    eval(o.spareButtonClickFunction).call();
                                } else{
                                    o.spareButtonClickFunction.call();
                                }
                            }

                            if(o.submitOnSpare){
                                $(o.targetFormSelector).submit();
                            }
                        }
                    }
                }

                $el.on('click.submitButtonSet', 'button[name="spareButton"]', spareWrapper);
            }


        },

        destroy: function(){
            var self = this,
                $el = self.element;
            // this.element.removeStuff(); <-- remove all bindings and classes.

            //then call this last, always.
            $.Widget.prototype.destroy.call(self);
        },
        


        // Respond to any changes the user makes to the option method
        _setOption: function(key, value){
            switch(key){
//            case "someValue":
//                    this.options.someValue = doSomethingWith( value );
//                break;
                

            default:
                 var self = this,
                        o = self.options,
                        $el = self.element;
                    self.o[ key ] = value;

                $el.html('');
                _create();
                _init();    
                break;
            }

            // _setOption must be manually invoked from the base widget
            $.Widget.prototype._setOption.apply(this, arguments);
        }
    });

})(jQuery, window, document);;


/*
Standards
-----------
1. jQuery.ui.keyCode for all Keyboard Events
2. HTML not XHTML (eg <div> not <div/> , </div>)
3. "_" prefix is private, otherwise is public (this is convention)
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
20: you get a free pseudoselector: (:widgetname)./ can be used to do things like, keep only one instance open, etc.

Finally: get rid of comments when the plugin is done, besides the header.
http://docs.jquery.com/JQuery_Core_Style_Guidelines (follow this when in doubt.)
http://docs.jquery.com/Plugins/Authoring (and this)
http://wiki.jqueryui.com/w/page/12137737/Coding%20standards (and this)
*/


