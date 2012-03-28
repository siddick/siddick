//= require active_admin/base
//= require jquery.markitup
//= require markdown_set

jQuery(function($){
  $('#post_raw_content').markItUp($.MarkdownSettings);
});
