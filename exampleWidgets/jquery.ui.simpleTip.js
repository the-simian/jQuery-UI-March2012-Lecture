




(function ($) {
    $.widget('nine_C.simpleTip', {
        _create: function () {

            

            this._tooltipDiv = $('<div></div>')
                .addClass('nine_C-simpleTip-tooltip-text ' + 'ui-widget ui-state-highlight ui-corner-all')
                .hide()
                .appendTo('body');
            this.element
                .addClass('nine_C-simpleTip-trigger')
                .bind('mouseenter.nine_C-simpleTip', $.proxy(this._open, this))
                .bind('mouseleave.nine_C-simpleTip', $.proxy(this._close, this));
        },

        _open: function () {
            var elementOffset = this.element.offset();

            this._tooltipDiv.css({
                left: elementOffset.left,
                top: elementOffset.top + this.element.height()
            }).text(this.element.attr('title'));

            this._tooltipDiv.show();
        },
        _close: function () {
            this._tooltipDiv.hide();
        },

        destroy: function () {
            this._tooltipDiv.remove();
            this.element
                .removeClass('nine_C-simpleTip-trigger')
                .unbind('.nine_C-simpleTip');
            $.Widget.prototype.destroy.apply(this, arguments);
        }
    });
})(jQuery);