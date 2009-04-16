YAHOO.widget.Uploader.SWFURL = "/swf/uploader.swf";

function Yuppie(element, url, method) {
  if (!method) method = 'post';
  this.method = method;
  this.url = url;
  this.container = $(element);
  var c = this.container;
  this.button = c.find('.yuppie-uploader-button');
  this.statusbar = c.find('.yuppie-statusbar');
  this.statusbarContainer = c.find('.yuppie-statusbar-container');
  this.currentFilename = c.find('.yuppie-current-filename');
  this.hiddenField = c.find('input[type=hidden]');

  var uploader = new YAHOO.widget.Uploader(this.button.get(0));
  this.uploader = uploader;

  var yuppie = this;

  this.container.data("yuppie", this);
  uploader.addListener('contentReady', function() {
    uploader.setSimUploadLimit(1);

    uploader.addListener('fileSelect', function(arg1) {
      yuppie.currentFilename.html(arg1.fileList.file0.name);
      yuppie.startUpload();
    });

    uploader.addListener('uploadCompleteData', function(e) {
      yuppie.hiddenField.val(e.data);
      yuppie.currentFilename.html(yuppie.currentFilename.html() + " <em>OK!</em>");
    });

    uploader.addListener('uploadProgress', function(e) {
      yuppie.statusbar.css({"width": parseInt((e.bytesLoaded / e.bytesTotal * 100)) + "%"});
    });
  });
}

$.extend(Yuppie.prototype, {
  startUpload: function() {
    this.statusbarContainer.show();
    this.button.css({width: '0', height: '0'});
    return this.uploader.uploadAll(this.url, this.method);
  }
});


