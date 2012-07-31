



;
(function($, window, document, undefined){

	$.widget("jesse.tagCloud", {
		options: {
			one: "",
			two: { },
			value: ""
			
		},

		
		_create: function(){
			
			
			this._options = {
				privOne: [],
				privTwo: []
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
