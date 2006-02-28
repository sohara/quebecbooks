/* This function is used for the drop down menu.
It is used because IE doesn't support the :hover pseudo 
class for elements other than anchors, e.g. li, etc. */

sfHover = function() {
	var sfEls = 
	document.getElementById("nav").getElementsByTagName("LI");
	for (var i=0; i<sfEls.length; i++) {
		sfEls[i].onmouseover=function() {
			this.className+=" sfhover";
		}
			
		sfEls[i].onmouseout=function() {
			this.className=this.className.replace(new RegExp(" sfhover\\b"), "");
		}
	}
}


/* This function is the same as above but calls it on an element with a 
different name, i.e. homenav */

if (window.attachEvent) 
		window.attachEvent("onload", sfHover);
		
sfHover2 = function() {
	var sfEls = 
	document.getElementById("homenav").getElementsByTagName("LI");
	for (var i=0; i<sfEls.length; i++) {
		sfEls[i].onmouseover=function() {
			this.className+=" sfhover";
		}

		sfEls[i].onmouseout=function() {
			this.className=this.className.replace(new RegExp(" sfhover\\b"), "");
		}
	}
}

if (window.attachEvent) 
		window.attachEvent("onload", sfHover2);