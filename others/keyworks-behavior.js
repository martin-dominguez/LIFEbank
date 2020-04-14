function setCookie(cname, cvalue, exdays) {
    var d = new Date();
    d.setTime(d.getTime() + (exdays*24*60*60*1000));
    var expires = "expires="+ d.toUTCString();
    document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}

function getCookie(cname) {
    var name = cname + "=";
    var decodedCookie = decodeURIComponent(document.cookie);
    var ca = decodedCookie.split(';');
    for(var i = 0; i <ca.length; i++) {
      var c = ca[i];
      while (c.charAt(0) == ' ') {
        c = c.substring(1);
      }
      if (c.indexOf(name) == 0) {
        return c.substring(name.length, c.length);
      }
    }
    return "";
}

function deleteCookie(cname) {
    document.cookie = cname +'=; Path=/; Expires=Thu, 01 Jan 1970 00:00:01 GMT;';
}

function setValues(value) {
    _jsObject[value] = _jsObject.hasOwnProperty(value)?_jsObject[value] + 1:1;
}

function calcInterest() {
    var metaKeywords = $('meta[name=keywords]').attr("content");
    if (metaKeywords) {
        var keywords = metaKeywords.split(",");
        cookieObj = getCookie("lfr_bhvr_obj");
        if (cookieObj != "") {
            _jsObject = JSON.parse(cookieObj);
        }
        // Add and/or increment keys
        keywords.forEach(setValues);

        // Find the most visited key
        var result = {
            key: "",
            value: 0
        };

        for (var key in _jsObject) {
            if (_jsObject[key] > result.value) {
                    result.key = key;
                    result.value = _jsObject[key];
            }
        }

        // Set Cookies
        setCookie("lfr_bhvr_obj", JSON.stringify(_jsObject), 1);
        setCookie("lrf_bhvr_int", result.key, 1);
    }
}

var _jsObject = {};
calcInterest();