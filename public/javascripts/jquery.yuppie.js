(function($) {

  function Yuppie(element, options) {
    this.init(element, options);
  }

  $.extend(Yuppie.prototype, {
    defaultOptions: {
    },

    init: function(element, options) {
    }
  });

  $.fn.yuppie = function() {
    return $(this).each(function(options) {
      new Yuppie($(this));
    });
  };

})(jQuery);
