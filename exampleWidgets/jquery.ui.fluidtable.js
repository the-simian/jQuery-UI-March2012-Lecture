;
(function($, window, document, undefined){

	$.widget("nineForm.fluidtable", {
		options: {			
			columns: [{				
				name: "name",
				click: null,
				toolTip: "",
				entity: ""
			}],
			value: "",
			viewModel: null,
			maxHeight: 600,
			visible: true,
			animation: "fade",
			entityList: null,
			selectedEntityList: null,
			generateSelectAllButton: true,
			title: "",
			pushFunction: "push",
			removeFunction: "remove",
			
            errorFlagProperty: null,

			contextFunction: null,
			clickFunction: null,


			hideShowAnimation: "fade", //changing this might look terrible - just sayin (JH)
			showAnimationSpeed: 900,
			hideAnimationSpeed: 150
			
		},

		_create: function(){

			this._options = {
				columnList: ["Customer Name", "Open"],
				scrollBarWidth: 17,
				resizeThrottleSpeed: 50,
				$fluidTable: null,
				$firstRowBodyCells: null,
				$fluidTableHeaderCells: null,
				$fluidTableHeader: null,
				$selectAllButton: null,
				freshSort : false,
				resizeDebounceThrottleSpeed: 125,
				resizeThrottleSwitch: true,
				resizeDebounceTimeout: null,
				dynamicTemplateMarkup: null,
				templateName: null,
				tmplOptions: null,
				previousWasVisibleState: false
				
			};

			var self = this,
				o = self.options,
				_o = self._options,
				$el = self.element;

			var $thisParent = $el.parent();

			if(o.entityList == null){
				alert('must have entity list');
			}


			_o.columnList = $.map(o.columns, function (x){
				return x.name;
			});

			_o.templateName = _o.columnList.join("").split(' ').join('');


			//Generate header off the DOM
			$el.detach();
			var $fluidTable = $('<div class="ui-widget ui-fluid-table"></div>');
			var $fluidTableBody = $('<div class="ui-fluid-table-body" style="max-height:' + o.maxHeight + 'px;"></div>');
			var $fluidTableHeader = $('<div class="ui-fluid-table-header"></div>');
			

			$.each(o.columns, function(i, val){
				var colName = o.columns[i]['name'] || o.columns[i]['entity'] || " ";
				var colEntity =  o.columns[i]['entity'] || o.columns[i]['name'].split(' ').join('') || null;
				
				var $td = $('<div class="ui-fluid-table-header-td" ><span class="ui-widget-header ui-fluid-table-header-cell ui-state-default" >' + colName + '</span></div>');
				var clickFunction = val['click'];		        
				var clickSortAndCallback = function(){
					if(colEntity){
						self.sortColumn(colEntity);
					}
					if(clickFunction){
						clickFunction.call();
					}
					_o.freshSort = true;
					$.proxy(self._attachEventsAndResize(), self);
				};
				$td.on('click', clickSortAndCallback);
				// table header interactivity
				$td.on('mouseenter.fluidtable', 'span', function(){
					$(this).addClass('ui-state-highlight').removeClass('ui-state-default').css({ "cursor": "pointer" });
				});

				$td.on('mouseleave.fluidtable', 'span', function(){
					$(this).removeClass('ui-state-highlight').addClass('ui-state-default').css({ "cursor": "default" });
				});
				if(o.columns[i]['toolTip']){
					$td.attr('title', o.columns[i]['toolTip']);
				}
				$fluidTableHeader.append($td);
			});

			$fluidTable
				.append($fluidTableHeader)
				.append($fluidTableBody.append($el))
				.prependTo($thisParent);

			// Generate a select all button?
			if(o.generateSelectAllButton){
				var $selectAllButton = $('<button type="button" >Select All</button>').button({
					label: "[ " + o.selectedEntityList.length + " ] Select All " + o.title,
					icons: { primary: "ui-icon-circle-plus" }
				})
					.removeClass('ui-corner-all')
					.addClass('ui-corner-bottom')
					.on('click.fluidtable', $.proxy(self._selectAllButtonFunction, self));

				_o.$selectAllButton = $selectAllButton;
				$fluidTable.append(_o.$selectAllButton);
			}               
			_o.$fluidTable = $fluidTable;

			
			$fluidTableHeader.find('.ui-fluid-table-header-cell:first').addClass('ui-corner-tl');
			$fluidTableHeader.find('.ui-fluid-table-header-cell:last').addClass('ui-corner-tr');

			var $firstRowBodyCells = $fluidTableBody.find('tr:first').find('td');
			var $fluidTableHeaderCells = $fluidTableHeader.find('.ui-fluid-table-header-td');

			_o.$firstRowBodyCells = $firstRowBodyCells;
			_o.$fluidTableHeaderCells = $fluidTableHeaderCells;
			_o.$fluidTableHeader = $fluidTableHeader;
			
			//Init visibility state
			(!o.visible) ? _o.$fluidTable.hide() : _o.$fluidTable.show();
		},

		_init: function(){
			var self = this,
				o = self.options,
				_o = self._options,
				$el = self.element;

			//corners

			$(document).ready(function(){
				//create table template dynamically
				_o.dynamicTemplateMarkup = '<tr data-row="${$item.dataArrayIndex()}" class="${$item.zebraAllRowsInit()}  ${$item.highlightAllRowsInit()} ${$item.errorAllRowsInit}">';
				$.each(o.columns, function(i, val){
					var minWidth = o.columns[i]['minWidth'] || 0;
					var entity = o.columns[i]['entity'] || o.columns[i]['name'].split(' ').join('') || null;

				    

					_o.dynamicTemplateMarkup += '<td style="min-width:' + minWidth + 'px" data-cell=' + i + '>${' + entity+ '}</td>';
				});
				_o.dynamicTemplateMarkup += '</tr>';

				//TODO: attach push and pull functions via tmpl options! (90% done)
				_o.tmplOptions = {
					//dataArrayIndex exists because $tmpl has no array property. Expect this to completely rerender on sort
					dataArrayIndex: function(){
						return $.inArray(this.data, o.entityList());
					},
					//ui - alternate rows on create
					zebraAllRowsInit: function(){
						return ($.inArray(this.data, o.entityList()) % 2) ? "ui-fluid-table-tr ui-fluid-table-tr-odd " : "ui-fluid-table-tr ui-fluid-table-tr-even ";
					},

					highlightAllRowsInit: function(){
						return $.inArray(this.data, o.selectedEntityList()) != -1 ? "ui-state-highlight" : "";
					},
					
                    errorAllRowsInit: function (){
                        
                        if(o.errorFlagProperty && this.data[o.errorFlagProperty]){

                            return "ui-state-error";
                            
                        } else{
                            return "";
                        }
                        
                    },

                    highlightOneRow: function($rowElement){
						if(this.itemIsSelected(this.data)){
							$rowElement.removeClass('ui-state-highlight ');
						} else{
							$rowElement.addClass('ui-state-highlight ');
						}
					},					    
					//push pull entity to and from selected list
					toggleEntityToSelectedlist: function(entity){
						if(this.itemIsSelected(entity)){
							o.selectedEntityList[o.pushFunction](entity);
						} else{
							o.selectedEntityList[o.removeFunction](entity);
						}
					},
					itemIsSelected: function(item){
						return $.inArray(item, o.selectedEntityList()) === -1;
					}
				};

				$.template(_o.templateName, _o.dynamicTemplateMarkup);
				$el.html($.tmpl(_o.templateName, o.entityList, _o.tmplOptions));
			    self._updateSelectAllButton();


				_o.$fluidTable
					//Hover interactivity
					.on('mouseenter.fluidtable', 'tr', function(e){
						$(this).addClass('ui-state-hover');
					})
					.on('mouseleave.fluidtable', 'tr', function(e){
						$(this).removeClass('ui-state-hover');
					})
					//click interactivity
					.on('click.fluidtable', 'tr', function(e){

						// insert item in selected Tickets
						e.preventDefault();
						var $el = $(this);
						var tmplItem = $el.data('tmplItem');
						var entity = tmplItem.data;

						if(this.debouncefunction){
							clearTimeout(this.debouncefunction);
						}
						this.debouncefunction = setTimeout(function(){
							//push or pull item
							tmplItem.toggleEntityToSelectedlist(entity);
							// Ui -s tate
							tmplItem.highlightOneRow($el);

							self._updateSelectAllButton();

						}, 1);
						
						//fire click callbacks

					})
					.on('contextmenu.fluidtable', 'tr', function(e){
						
						//fire context callbacks

						if(typeof o.contextFunction == "function"){
							e.preventDefault();
							o.contextFunction.call();
						}

					});

				$.proxy(self._attachEventsAndResize(), self);
			});
		},

		_selectAllButtonFunction: function(){
			var self = this,
				o = self.options,
				_o = self._options,
				$el = self.element;

			var selectedEntityListLength = (typeof o.selectedEntityList == "function") ? o.selectedEntityList().length : o.selectedEntityList.length;
			var entityListLength = (typeof o.entityList == "function") ? o.entityList().length : o.entityList.length;

			if(selectedEntityListLength == entityListLength){
				self.unselectEveryEntity();

				$el.find('tr').removeClass('ui-state-highlight ui-state-active');
			} else{
				self.selectEveryEntity();

				$el.find('tr').addClass('ui-state-highlight ui-state-active');
			}
			self._updateSelectAllButton();
		},

		selectEveryEntity: function(){
			var self = this,
				o = self.options,
				_o = self._options,
				$el = self.element;

            typeof o.selectedEntityList == "function" ? o.selectedEntityList([]) : o.selectedEntityList = [];

			var entityList = (typeof o.entityList == "function") ? o.entityList() : o.entityList;
		    var entityListLength = entityList.length;
            // I am doing these one by one because otherwise a pass by reference results in a tight coupling of the two lists.
		    // there may be a way to do this in "one move"
		    for(var i = 0; i < entityListLength; i++){
		         o.selectedEntityList[o.pushFunction](entityList[i]);
		    }
		    
			return this;
		},
		
		unselectEveryEntity: function(){
			var self = this,
				o = self.options,
				_o = self._options,
				$el = self.element;
			if(typeof o.selectedEntityList == "function"){
				o.selectedEntityList([]);

			} else{
				o.selectedEntityList = [];
			}
			return this;
		},
		_updateSelectAllButton: function(){
			var self = this,
				o = self.options,
				_o = self._options,
				$el = self.element;


			if(o.generateSelectAllButton && _o.$selectAllButton){
				var selectedEntityListLength = 0;
				var entityListLength = 0;


				var selectedEntityListLength = (typeof o.selectedEntityList == "function") ? o.selectedEntityList().length : o.selectedEntityList.length;
				var entityListLength = (typeof o.entityList == "function") ? o.entityList().length : o.entityList.length;

			   

				if(selectedEntityListLength < entityListLength){
					_o.$selectAllButton.button({
						label: "[ " + selectedEntityListLength + " ] Select All " + o.title,
						icons: { primary: "ui-icon-circle-plus" }
					});
				} else{
					_o.$selectAllButton.button({
						label: "[ " + selectedEntityListLength + " ] Unselect All " + o.title,
						icons: { primary: "ui-icon-circle-minus" }
					});
				}
			}
		},
		sortColumn: function(columnToSort){
			var self = this,
				o = self.options,
				_o = self._options,
				$el = self.element;

			var sortFlagWithPredicate = columnToSort + "_isAscending";

			if(!_o.sortFlagWithPredicate){
				_o.sortFlagWithPredicate = false;
			}

			// TODO: remove backbone dependancy!!!
			// TODO: show current sort directionin table header
			// TODO; abstract prime sorting method.

			if(!_o.sortFlagWithPredicate){
				if(typeof o.entityList()[0][columnToSort] == 'function'){
					o.entityList(_.sortBy(o.entityList(), function(x){

						return x[columnToSort].call();
					}));
				} else{
					o.entityList(_.sortBy(o.entityList(), function(x){
						return x[columnToSort];
					}));
				}
			} else{
				if(typeof o.entityList()[0][columnToSort] == 'function'){
					o.entityList(_.sortBy(o.entityList(), function(x){

						return x[columnToSort].call();
					}));
				} else{
					o.entityList(_.sortBy(o.entityList(), function(x){
						return x[columnToSort];
					}));
				}
				o.entityList(o.entityList().reverse()); //sort by this column, then reverse order
			}

			_o.sortFlagWithPredicate = !_o.sortFlagWithPredicate;

			$el.html($.tmpl(_o.templateName, o.entityList, _o.tmplOptions));

			return this;
		},

		_resizeTableHeader: function(){
			var self = this,
				o = self.options,
				_o = self._options,
				$el = self.element;

			if(_o.resizeThrottleSwitch){
				_o.resizeThrottleSwitch = false;

				var $fluidTable = _o ? _o.$fluidTable : $(this);
				var $fluidTableHeader = _o ? _o.$fluidTableHeader : $fluidTable.find('div.ui-fluid-table-header');
				var $firstRowBodyCells = _o && _o.$firstRowBodyCells.length > 0 ? _o.$firstRowBodyCells : $fluidTable.find('tr:first').find('td');
				var $fluidTableHeaderCells = _o ? _o.$fluidTableHeaderCells : $fluidTableHeader.find('.ui-fluid-table-header-td');

				var scrollBarWidth = _o ? _o.scrollBarWidth : 17;

				$fluidTableHeader.width($fluidTable.width() - scrollBarWidth);

				$firstRowBodyCells = $fluidTable.find('tr:first').find('td');

				$firstRowBodyCells.each(function(index, element){
					var assignWidth = $(element).outerWidth();
					$fluidTableHeaderCells.eq(index).width(assignWidth);
				});

				//throttle
				setTimeout(function(){
					_o.resizeThrottleSwitch = true;
				}, _o.resizeDebounceThrottleSpeed);
				
				//debounce
				if(_o.resizeDebounceTimeout){
					clearTimeout(_o.resizeDebounceTimeout);
				}
				_o.resizeDebounceTimeout = setTimeout(function(){
					self._attachEventsAndResize();
					clearTimeout(_o.resizeDebounceTimeout);
				}, _o.resizeDebounceThrottleSpeed * 4);
			}
		},

		_attachEventsAndResize: function(){
			var self = this,
				o = self.options,
				_o = self._options,
				$el = self.element;
			$.proxy(self._resizeTableHeader(), self);
			$(window).on('resize.fluidtable',$.proxy(self._resizeTableHeader, self));

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
					// to Be disabled
					$el.removeClass(".ui-state-focus").blur();
					$el.removeClass("ui-state-hover");
					$el.propAttr("disabled", true);
					$el.addClass("ui-disabled");
				} else{
					// to be Enabled
					$el.propAttr("disabled", false);
					$el.removeClass("ui-disabled");
				}
				break;
			case "value":

				return (typeof o.selectedEntityList == "function") ? o.selectedEntityList() : o.selectedEntityList;
				
			case "visible":
					if(value != _o.previousWasVisibleState){
						if(value){
							_o.$fluidTable.show(o.hideShowAnimation, { }, o.showAnimationSpeed, function() { $.proxy(self._attachEventsAndResize(), self); });
							_o.previousWasVisibleState = value;
						} else{
							_o.$fluidTable.hide(o.hideShowAnimation, { }, o.hideAnimationSpeed, function() { $el.off('.fluidtable'); });
							_o.previousWasVisibleState = value;
						}
					    
                        self._updateSelectAllButton();
					}
				break;
			}		    
		},
		_destroy: function(){
			this.off('.fluidtable');
			this.element.text("").hide().remove();

		}
	});
})(jQuery, window, document);
