let adnum = document.querySelector("#adm1").value
let adnum2 = document.querySelector("#adm2").value
let adnum3 = document.querySelector("#adm3").value
let checkResult = document.querySelector("#checkResult").value;

document.querySelector("#adm_ok").addEventListener("click", function() {
	let adnums = document.querySelector("#adnums")
	adnums.value = document.querySelector("#adm1").value + document.querySelector("#adm2").value + document.querySelector("#adm3").value;
	if (document.querySelector("#apw").value != document.querySelector("#pwCheck").value) {
		alert("동일한 패스워드를 입력하세요")
	} else if (checkResult == "N" || checkResult == "") {
		alert("아이디를 다시 확인하세여")
	}
	else {
		f.submit();
		console.log(adnums.value)
	}
})


document.querySelector("#idck").addEventListener("click", function() {
	this.aid = document.querySelector("#aid")

	fetch("./idCheck", {
		method: "POST",
		cache: "no-cache",
		headers: {
			"Content-Type": "application/x-www-form-urlencoded"
		},
		body: "aid=" + this.aid.value
	}).then(function(response) {
		return response.text();
	}).then(function(result) {
		if (result == "yes") {
			document.querySelector("#checkResult").innerHTML = "사용불가";
			document.querySelector("#checkResult").value = "N";
		} else {
			document.querySelector("#checkResult").innerHTML = "사용가능";
			document.querySelector("#checkResult").value = "Y";
		}
		console.log(document.querySelector("#checkResult").value)
	}).catch(function(error) {
		console.log("Data Error!!");
	});
});

