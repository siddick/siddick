(function($){
  $(document).on('click', 'a[href*="youtube.com/watch"]', function(){
    $.fancybox({
      'width'         : 640,
      'height'        : 385,
      'href'          : this.href.replace(new RegExp("watch\\?v=", "i"), 'v/') + '?autoplay=1',
      'type'          : 'iframe',
      'swf'           : {
        'wmode'           : 'transparent',
        'allowfullscreen' : 'true'
      }
    });
    return false;
  });
})(jQuery);
