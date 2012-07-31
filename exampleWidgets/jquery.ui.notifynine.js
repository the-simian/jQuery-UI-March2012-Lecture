/*!
 * NotifyNine - v0.0.1 - 2011
 * http://ninecollective.com
 * 
 * Copyright (c) 2011 Nine Collective
 * Proprietary License
 */
(function ($) {
    $.notifyNine = function (message, severity, opts) {

        if (message === "destroy") {
            if ($("#notificator").length > 0) { $("#notificator").remove(); }
            return;
        }

        return new NotifyNine(message, severity, opts);
    };

    $.widget("ui.notifyNine", {
        options: {
            message: null,
            severity: 'info',
            fadeDuration: 1000,
            messageDuration: 5000
        },

        _init: function () {
            this.element.addClass("notifynine-container").addClass("ui-widget ui-widget-content").addClass("ui-corner-all");
            this.element.hide();
            this.parseError();
        },

        parseError: function () {
            var content = "<p>";
            var $this = this;
            var $elem = this.element;
            var messageTimer;

            if ($this.options.severity == "info" || $this.options.severity == "highlight") { // Is a notification / warning
                content += "<span class='notifynine-icon ui-icon ui-icon-info f-left' />";
                $elem.addClass("ui-state-highlight");
                $elem.fadeToggle($this.options.fadeDuration);
                if ($this.options.messageDuration !== 0) {
                    messageTimer = setTimeout(function () { $elem.fadeToggle($this.options.fadeDuration); }, $this.options.messageDuration);
                }

            }
            else if ($this.options.severity == "success") {
                content += "<span class='notifynine-icon ui-icon ui-icon-success f-left' />";
                $elem.addClass("ui-state-success");
                $elem.fadeToggle($this.options.fadeDuration);
                if ($this.options.messageDuration !== 0) {
                    messageTimer = setTimeout(function () { $elem.fadeToggle($this.options.fadeDuration); }, $this.options.messageDuration);
                }

            }
            else if ($this.options.severity == "execute") {
                content += "<span class='notifynine-icon ui-icon ui-icon-info f-left' />";
                $elem.addClass("ui-state-execute");
                $elem.fadeToggle($this.options.fadeDuration);
                if ($this.options.messageDuration !== 0) {
                    messageTimer = setTimeout(function () { $elem.fadeToggle($this.options.fadeDuration); }, $this.options.messageDuration);
                }

            }
            else if ($this.options.severity == "waiting") {
                content += "<span class='notifynine-icon ui-icon ui-icon-info f-left' />";
                $elem.addClass("ui-state-waiting");
                $elem.fadeToggle($this.options.fadeDuration);
                if ($this.options.messageDuration !== 0) {
                    messageTimer = setTimeout(function () { $elem.fadeToggle($this.options.fadeDuration); }, $this.options.messageDuration);
                }

            }
            else {  // This is an error
                content += "<span class='notifynine-icon ui-icon ui-icon-alert f-left' />";
                $elem.addClass("ui-state-error");
                $elem.fadeToggle($this.options.fadeDuration);
            }

            content += $this.options.message;
            $elem.html(content + "</p>");
            $elem.append("<a class='notifynine-close-button ui-icon ui-icon-circle-close'><span></span></a>");
            $elem.children(".notifynine-close-button").click(function () {
                if (messageTimer) { clearTimeout(messageTimer); }
                $elem.fadeOut($this.options.fadeDuration);
            });
        },

        destroy: function () {
            $.Widget.prototype.destroy.apply(this, arguments);
            this.element.html("");
        }
    });

    var NotifyNine = function (message, severity, opts) {
        if ($("#notificator").length > 0) { $("#notificator").remove(); }
        $("body").append("<div id='notificator' ></div>");
        $("#notificator").notifyNine($.extend({ message: message, severity: severity }, opts));
        return this;
    };
})(jQuery);
