let dep = document.querySelector("#depSelect")

function select(val) {
	dep.value = val;
}

document.querySelector("#depSelect").addEventListener("change", function() {
	frm.submit();
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
		console.log(result)
	}).catch(function(error) {
		console.log("Data Error!!");
	});
})

function saveChange(){
	console.log("a")
}
