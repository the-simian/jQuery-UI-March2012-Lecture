



;
(function($, window, document, undefined){

	$.widget("jesse.tagCloud", {
		  options: {
            maxFontSize: 40,
            minFontSize: 6,
            data: null,
            title: "Tag Cloud"
        },

		
		_create: function(){
			
			
			this._options = {
                internalTagCloudObjectArray: [],
                minOccurences:null,
                maxOccurences: null,
                scalar: null
            };

			
			var self = this,
				o = self.options,
				_o = self._options,
				$el = self.element;

		},

		_init: function(){
		      var self = this,
                o = self.options,
                _o = self._options,
                $el = self.element;

            var $injectionString;
            var $elParent = $el.parent();
            var $elContent;
            var $elHeader;

            $el.detach();

            if(typeof o.data == "string"){
                var tagArray = o.data.trim().split(" ");
                var squashArrays = self._squashArrays(tagArray);
                _o.internalTagCloudObjectArray = self._squashArrayToObjectArrays(squashArrays);

            }


            _o.internalTagCloudObjectArray = self._addScaledFontToObjectArray(_o.internalTagCloudObjectArray);

            $injectionString = $(self._returnInjectionString(_o.internalTagCloudObjectArray));            


            $el.addClass('ui-widget ui-widget-tagcloud');
            $elContent = $('<div class="ui-widget-content ui-corner-all"></div>').html($injectionString);
            $elHeader = $('<div class="ui-widget-header ui-corner-all">'+o.title+'</div>');

            $elContent.prepend($elHeader);

            $el.html($elContent);

            $elParent.html($el);

            self._trigger("createCallback");

		},

   

		_setOption: function(key, value){

			var self = this,
				o = self.options,
				_o = self._options,
				$el = self.element,
				valsLength = 0;

			if($.isArray(o.values)){
				valsLength = o.values.length;
			}

			$.Widget.prototype._setOption.apply(this, arguments);

			switch(key){
			case "disabled":
				if(value){
					$el.removeClass(".ui-state-focus").blur();
					$el.removeClass("ui-state-hover");
					$el.propAttr("disabled", true);
					$el.addClass("ui-disabled");
				} else{
					$el.propAttr("disabled", false);
					$el.removeClass("ui-disabled");
				}
				break;
			case "value":
				
				}

				break;
		
		},
		 _destroy: function(){
		     //unbind
			this.off('.widgetName');
			//destroy
            $.widget.prototype.destroy.call(this);
		}
	});
})(jQuery, window, document);
