// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

Event.observe(window, 'load', function() {
  YAHOO.widget.Uploader.SWFURL = "/assets/uploader.swf";
  uploader = new YAHOO.widget.Uploader("uploader");

  uploader.addListener('contentReady', function() {
    uploader.setSimUploadLimit(1);

    uploader.addListener('fileSelect', function(arg1) {
      $('filename').value = arg1.fileList.file0.name;
    });

    uploader.addListener('uploadProgress', function(e) {
      $('status_bar').setStyle({"width": parseInt((e.bytesLoaded / e.bytesTotal * 100)) + "%"});
    });
  });

});

function start_upload() {
  uploader.uploadAll("/uploads", "post");
}
