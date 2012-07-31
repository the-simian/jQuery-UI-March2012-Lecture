



;
(function($, window, document, undefined){

    $.widget("jesse.tagcloud", {
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
        

        _returnInjectionString: function(objArr){
              var self = this,
                o = self.options,
                _o = self._options,
                $el = self.element;


            var objArrLength = objArr.length;
            var returnInjectionString;

            for(var i = 0; i < objArrLength; i++){

                returnInjectionString += '<span style="font-size:'+objArr[i].fontSize +'px" title="This happens '+objArr[i].occurences +' times">'+objArr[i].name +'</span>&nbsp;';
            }

            return returnInjectionString;
        },

        _addScaledFontToObjectArray: function(arrObj){
            var self = this,
                o = self.options,
                _o = self._options,
                $el = self.element;

            var min = 0;
            var max = 0;
            var maxFontSize = o.maxFontSize;
            var minFontSize = o.minFontSize;
            

            var arrObjLength = arrObj.length;
            for(var i = 0; i < arrObjLength; i++){
                if(i == 0){
                    min = arrObj[i].occurences;
                    max = arrObj[i].occurences;
                }
                (arrObj[i].occurences > max) ? max = arrObj[i].occurences : max = max;
                (arrObj[i].occurences < min) ? min = arrObj[i].occurences : min = min;
            }

            _o.minOccurences = min;
            _o.maxOccurences = max;

            var offsetOcc = max - min;
            var offsetFont = maxFontSize - minFontSize;

            

            for(var i = 0; i < arrObjLength; i++){
                var size = (((arrObj[i].occurences - _o.minOccurences) * offsetFont) / offsetOcc) + o.minFontSize;
                //catch Nan, min and max were equal apparently
                arrObj[i].fontSize = size || offsetFont * 0.5;
            }

            return arrObj;
        },


        _squashArrayToObjectArrays: function (arr){
            var arrLength = arr[0].length;
              var obj = [];

                for(var i = 0; i < arrLength; i++){
                    var x = 0;
                    obj.push({
                        name: arr[0][i],
                        occurences: arr[1][i]

                    });

                }
            return obj;
        },

        _squashArrays: function(arr){
                var a = [], b = [], prev;
                arr.sort();
                for(var i = 0; i < arr.length; i++){
                    if(arr[i] !== prev){
                        a.push(arr[i]);
                        b.push(1);
                    } else{
                        b[b.length - 1]++;
                    }
                    prev = arr[i];
                }
                return [a, b];
        },

        _scaleData: function(){
            

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
                return _o.internalTagCloudObjectArray;
            }
        },
        _destroy: function(){
            //unbind
            this.off('.tagcloud');
            //destroy
            $.widget.prototype.destroy.call(this);
        }
    });
})(jQuery, window, document);
