let dep = document.querySelector("#depSelect")
let search = document.querySelector("#searchPart")
let search2 = document.querySelector("#search_part")
function select(val) {
	dep.value = val;
}
function select2(val) {
	search2.value = val;
}

document.querySelector("#depSelect").addEventListener("change", function() {
	fetch("./config", {
		method: "POST",
		cache: "no-cache",
		headers: {
			"Content-Type": "application/x-www-form-urlencoded"
		},
		body: "depSelect=" + dep.value
	}).then(function(response) {
		return response.text();
	}).then(function(result) {
		document.querySelector("#webhtml").innerHTML = result;
		location.href = "./config?depSelect=" + dep.value;
	}).catch(function(error) {
		console.log("Data Error!!");
	});
})

function saveChange(val) {
	console.log(document.querySelector("#use"+val).value)
	console.log(val)
	if(confirm("변경사항을 저장하시겠습니까?")){
		fetch("./adminConfigChange", {
			method: "POST",
			cache: "no-cache",
			headers: {
				"Content-Type": "application/x-www-form-urlencoded"
			},
			body: "adminNumber=" + val + "&adminUse=" + document.querySelector("#use"+val).value
		}).then(function(response) {
			alert("저장완료")
			return response.text();
		}).then(function(result) {
			location.href = "./config"
		}).catch(function(error) {
			console.log("Data Error!!");
		});
	}
}
document.querySelector("#searchPart2").addEventListener("click", function() {
	if (search.value == "") {
		alert("값을 입력해주세요")
	} else {
		fetch("./adminSearch", {
			method: "POST",
			cache: "no-cache",
			headers: {
				"Content-Type": "application/x-www-form-urlencoded"
			},
			body: "searchPart=" + search.value + "&search_part=" + search2.value
		}).then(function(response) {
			console.log(response)
			return response.text();
		}).then(function(result) {
			console.log(result)
			document.querySelector("#webhtml").innerHTML = result;
			location.href = "./adminSearch?searchPart=" + search.value + "&search_part=" + search2.value;
		}).catch(function(error) {
			console.log("Data Error!!");
		});
	}

})


