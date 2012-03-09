jQuery(function($){
  $('a[href*="youtube.com/watch"]').click(function(){
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
});
