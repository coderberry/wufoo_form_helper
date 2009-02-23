function browserDetect() {
    var detect = navigator.userAgent.toLowerCase();
    if (detect.indexOf('safari') + 1) {
			$('body').addClass('safari');
    }
    if (detect.indexOf('firefox') + 1) {
			$('body').addClass('firefox');
    }
}

jQuery(document).ready(function($) {
	browserDetect();
	prepareForms();
})

function prepareForms() {
  $("input").blur(function() {
	  if ($(this).attr("validate") != undefined) {
			validateField($(this), $(this).attr("validate"));
      hideToolTip();
    } else {
      hideToolTip();
    }
	}).filter(function (index) {
    return $(this).attr("tip") != undefined;
  }).focus(function(){
    showToolTip($(this), $(this).attr("tip"));
  });
}

function showToolTip(elm, tip) {
  var pos = elm.offset();
  var elm_width = elm.width();
  var elm_height = elm.height();
  $('<div id="hint" style="width: 200px; display: none;"><img src="/images/tooltip_top.png" width="200" height="30" border="0" /><div id="hint_contents">&nbsp;</div><img src="/images/tooltip_bottom.png" width="200" height="14" border="0" onclick="hideToolTip()" /></div>').appendTo("body");
  $('#hint').css({
    position: "absolute",
    top: pos.top+elm_height+12,
    left: pos.left
  });
  $('#hint_contents').html(tip)
  $('#hint').fadeIn('slow');
}

function hideToolTip() {
  $('#hint').hide();
}

function validateField(elm, val_data) {
  var val_data_items = val_data.split("|");
  for (var i=0; i<val_data_items.length; i++) {
    var k = val_data_items[i].split("=")[0];
    var v = val_data_items[i].split("=")[1];
    
    // Validate Length
    if (k == "length") {
      if (v.split("-").length > 1) {
        // Must have min and max
        var min = v.split("-")[0];
        var max = v.split("-")[1];
        if (elm.val().length < min || elm.val().length > max) {
          elm.addClass("error");
        } else {
          elm.removeClass("error");
        }
      } else {
        // Must be this length
        if (elm.val().length != v) {
          elm.addClass("error");
        } else {
          elm.removeClass("error");
        }
      }
    }
    
    // Validate Email
    if (k == "email") {
      if (isValidEmail(elm.val()) == false) {
        elm.addClass("error");
      } else {
        elm.removeClass("error");
      }
    }
  }
}

function numbersOnly(e, decimal) {
  var key;
  var keychar;
  if (window.event) {
     key = window.event.keyCode;
  } else if (e) {
     key = e.which;
  } else {
     return true;
  }
  keychar = String.fromCharCode(key);
  if ((key==null) || (key==0) || (key==8) ||  (key==9) || (key==13) || (key==27) ) {
     return true;
  } else if ((("0123456789").indexOf(keychar) > -1)) {
     return true;
  } else if (decimal && (keychar == ".")) { 
    return true;
  } else {
     return false;
  }
}

function isValidEmail(str) {
	var at="@";
	var dot=".";
	var lat=str.indexOf(at);
	var lstr=str.length;
	var ldot=str.indexOf(dot);
	if (str.indexOf(at)==-1){
	   return false;
	}
	if (str.indexOf(at)==-1 || str.indexOf(at)==0 || str.indexOf(at)==lstr){
	   return false;
	}
	if (str.indexOf(dot)==-1 || str.indexOf(dot)==0 || str.indexOf(dot)==lstr){
	    return false;
	}
	 if (str.indexOf(at,(lat+1))!=-1){
	    return false;
	 }
	 if (str.substring(lat-1,lat)==dot || str.substring(lat+1,lat+2)==dot){
	    return false;
	 }
	 if (str.indexOf(dot,(lat+2))==-1){
	    return false;
	 }
	 if (str.indexOf(" ")!=-1){
	    return false;
	 }
	 return true;
}