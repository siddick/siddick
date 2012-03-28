(function($){
  $.MarkdownSettings = {
    previewParserPath:  '',
    onShiftEnter:    {keepDefault:false, openWith:'\n\n'},
    markupSet: [
      {name:'First Level Heading', key:'1', placeHolder:'Your title here...',
        closeWith:function(markItUp) { return markdownTitle(markItUp, '=') } },
      {name:'Second Level Heading', key:'2', placeHolder:'Your title here...',
        closeWith:function(markItUp) { return markdownTitle(markItUp, '-') } },
      {name:'Heading 3', key:'3', openWith:'### ', placeHolder:'Your title here...' },
      {name:'Heading 4', key:'4', openWith:'#### ', placeHolder:'Your title here...' },
      {name:'Heading 5', key:'5', openWith:'##### ', placeHolder:'Your title here...' },
      {name:'Heading 6', key:'6', openWith:'###### ', placeHolder:'Your title here...' },
      {separator:'---------------' },
      {name:'Bold', key:'B', openWith:'**', closeWith:'**'},
      {name:'Italic', key:'I', openWith:'_', closeWith:'_'},
      {separator:'---------------' },
      {name:'Bulleted List', openWith:'- ' },
      {name:'Numeric List', openWith:function(markItUp) {
        return markItUp.line+'. ';
      }},
      {separator:'---------------' },
      {name:'Picture', key:'P', replaceWith:'![[![Alternative text]!]]([![Url:!:http://]!] "[![Title]!]")'},
      {name:'Link', key:'L', openWith:'[', closeWith:']([![Url:!:http://]!] "[![Title]!]")', placeHolder:'Your text to link here...' },
      {name:'Video', key:'V', className:'tinyUrl', openWith:function(markItUp) { return findVideo(markItUp) } },
      {separator:'---------------'},
      {name:'Quotes', openWith:'> '},
      {name:'Code Block / Code', openWith:'(!(\t|!|`)!)', closeWith:'(!(`)!)'},
      {separator:'---------------'}
    ]
  }

  function findVideo(markItUp) {
    var url, image = "no-image", title = "no-title";
    url = prompt("Url:", "http://");
    if (url) {
      $.ajax({ url: "/admin/posts/video_info.json", data: { url: url },
        dataType: 'json', async: false,
        success: function(obj) {
          if(obj && obj["video"]){
            url   = obj["video"]["url"];
            title = obj["video"]["title"];
            image = '!['+title+']('+obj["video"]["thumbnail_large"]+')';
          }
        }
      });
      return '['+image+']('+url+' "'+title+'")';
    }
  }

  function markdownTitle(markItUp, char) {
    heading = '';
    n = $.trim(markItUp.selection||markItUp.placeHolder).length;
    for(i = 0; i < n; i++) {
      heading += char;
    }
    return '\n'+heading;
  }
})(jQuery);
