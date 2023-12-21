function addItem() {
	let itemName = document.getElementById("itemName").value;
	let itemPrice = document.getElementById("itemPrice").value;

	if (isNaN(itemPrice) || itemPrice <= 0) {
		alert("Введите корректную стоимость товара.");
		return;
	}

	if (itemName === '') {
		alert("Введите корректное название товара.");
		return;
	}

	let table = document.getElementById("itemsTable").getElementsByTagName('tbody')[0];
	let newRow = table.insertRow(table.rows.length);
	let cell1 = newRow.insertCell(0);
	let cell2 = newRow.insertCell(1);
	let cell3 = newRow.insertCell(2);
	cell2.classList.add("costCell");
	cell1.innerHTML = itemName;
	cell2.innerHTML = itemPrice;
	cell3.innerHTML = '<button onclick=\'toBasket(this)\'>Добавить в корзину</button>';
}

function toBasket(button) {
	let row = button.closest('tr');
	let itemName = row.cells[0].innerHTML;
	let itemPrice = parseFloat(row.cells[1].innerHTML);
	let orderTable = document.getElementById("orderTable").getElementsByTagName('tbody')[0];
	let newRow = orderTable.insertRow(orderTable.rows.length);
	let cell1 = newRow.insertCell(0);
	let cell2 = newRow.insertCell(1);
	cell2.classList.add("costCell");
	cell1.innerHTML = itemName;
	cell2.innerHTML = itemPrice;
	button.style.display = 'none';
	document.getElementById("totalResult").innerHTML = "";
}

function calculateTotal() {
	let table = document.getElementById("orderTable").getElementsByTagName('tbody')[0];
	let rows = table.getElementsByTagName('tr');
	let total = 0;

	for (let i = 0; i < rows.length; i++) {
		let cells = rows[i].getElementsByTagName('td');
		let itemPrice = parseFloat(cells[1].innerHTML);
		total += itemPrice;
	}

	document.getElementById("totalResult").innerHTML = "Общая стоимость заказа: " + total;
}