var TEXT = false;
function btn() {
	var body = document.getElementsByTagName("body")[0];
	if (TEXT) {
		$("#umnaya").text("Вывести");
		$("pre").remove();
		TEXT = false;
	}
	else {
		$("#umnaya").text("Убрать");
		TEXT = true;
	}
	children(body, 0)
}
function children(elem, c) {
	var elemch = elem.childNodes;
	for (var i = 0; i < elemch.length; i++) {
		if (elemch[i].tagName != "PRE") {
			if (elemch[i].tagName != undefined) {
				$("#vivod").append("<pre>" + repeat(' ', c) + elemch[i].tagName.toLowerCase() + "</pre>");
				console.log(elemch[i].tagName);
			}
			else {
				$("#vivod").append("<pre>" + repeat(' ', c) + whatis(elemch[i].nodeType) + "</pre>");
				console.log(whatis(elemch[i].nodeType));
			}
			children(elemch[i], c + 1);
		}
	}
}
function repeat(str, k) {
	var newstr = '';
	for (var j = 0; j < k; j++)
		newstr += str
	return newstr;
}
function whatis(type) {
	switch (type) {
		case 3:
			return "#text";
		case 9:
			return "#document";
		case 8:
			return "#comment";
		case 11:
			return "#documentfragment"
		case 2:
			return "#attr"
	}
}
