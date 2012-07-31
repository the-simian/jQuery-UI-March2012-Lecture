



;
(function($, window, document, undefined){

	$.widget("nineForm.multiphaseButton", {
		options: {
			initPhaseState: "",
			phaseStateOptionsList: { },
			value: ""
			
		},
		
		
		
		_create: function(){
			
			
			this._options = {
				phaseList: [],
				classList: []
			};
			
			var self = this,
				o = self.options,
				_o = self._options,
				$el = self.element;
			
				
			
			o.value = o.initPhaseState;
			if(o.phaseStateOptionsList[o.initPhaseState]){
				_o.phaseList = Object.keys(o.phaseStateOptionsList);

				for(var i = 0; i < _o.phaseList.length; i++){
					if(o.phaseStateOptionsList[_o.phaseList[i]]["class"]){
						_o.classList.push(o.phaseStateOptionsList[_o.phaseList[i]]["class"]);
					}
				}

				
					
				$el.on('click.multiphaseButtonStateHandler', function(){
					var cp = _o.phaseList.indexOf(o.value);
					cp >= (_o.phaseList.length - 1) ? cp = 0 : cp++;
					self._setPhase(_o.phaseList[cp]);
				});
				self._setPhase(o.initPhaseState);
			} else{

				alert(o.initPhaseState + " is not a valid Phase. Please Select From: " + Object.keys(o.phaseStateOptionsList));
			}
		},

		_init: function(){
		   var self = this,
				o = self.options,
				_o = self._options,
				$el = self.element;
		},

		_setPhase: function(phase){
			var self = this,
				o = self.options,
				_o = self._options,
				$el = self.element;
			$el.button(o.phaseStateOptionsList[phase]);

			if(o.phaseStateOptionsList[phase]["click"]){

				$el.off('click.multiphaseButtonClick').on('click.multiphaseButtonClick', function(){
					o.phaseStateOptionsList[phase]["click"].call();
				});
			} else{
				$el.off('click.multiphaseButtonClick');
			}
			$el.removeClass(_o.classList.join(""));
			if(o.phaseStateOptionsList[phase]["class"]){
				$el.addClass(o.phaseStateOptionsList[phase]["class"]);
			}

			o.value = phase;
			self._trigger("setPhase", null, { value: phase });
			return this;

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
				if(_o.phaseList.indexOf(value) != -1){
				    
                    //console.log(key,value, o.phaseStateOptionsList.deselectAllCustomers.label);

					self._setPhase(value);
				}

				break;
			case "initPhaseState":
				if(_o.phaseList.indexOf(value)){
					o.initPhaseState = value;
					self._create();
				}
				break;
			}
		},
		 _destroy: function(){
			this.off('.multiphaseButtonStateHandler').off('.multiphaseButtonClick');
			this.element.text("").hide().remove();

		}
	});
})(jQuery, window, document);
