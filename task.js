function traverseTree(node, spaces) {
	if (node.id == "outputTree") {
		return;
	}
	console.log(" ".repeat(spaces * 4) + node.nodeName);
	document.getElementById("outputTree").innerHTML += "<br>" + "&nbsp;".repeat(spaces * 4) + node.nodeName;
	for (let i = 0; i < node.children.length; i++) {
		traverseTree(node.children[i], spaces + 1);
	}
}

function press(node, spaces) {
	document.getElementById("outputTree").innerHTML = "";
	traverseTree(node, spaces)
}