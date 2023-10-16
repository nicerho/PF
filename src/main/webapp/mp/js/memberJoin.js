const mmarket1 = document.querySelector("#mmarket1");
const mmarket2 = document.querySelector("#mmarket2");
const mmarket3 = document.querySelector("#mmarket3");
const mmarket4 = document.querySelector("#mmarket4");
const mmarkett1 = document.querySelector("#mmarkett1");
const mmarkett2 = document.querySelector("#mmarkett2");
const mmarkett3 = document.querySelector("#mmarkett3");
const mmarkett4 = document.querySelector("#mmarkett4");

if (mmarkett1.checked = true) {
	mmarket1.value = "Y";
} else {
	mmarket1.value = "N";
}
if (mmarkett2.checked = true) {
	mmarket2.value = "Y";
} else {
	mmarket2.value = "N";
}
if (mmarkett3.checked = true) {
	mmarket3.value = "Y";
} else {
	mmarket3.value = "N";
}
if (mmarkett4.checked = true) {
	mmarket4.value = "Y";
} else {
	mmarket4.value = "N";
}

document.querySelector("#idck").addEventListener("click", function() {
	this.mid = document.querySelector("#mid")

	fetch("../memberIdCheck", {
		method: "POST",
		cache: "no-cache",
		headers: {
			"Content-Type": "application/x-www-form-urlencoded"
		},
		body: "mid=" + this.mid.value
	}).then(function(response) {
		return response.text();
	}).then(function(result) {
		if (result == "yes") {
			document.querySelector("#checkResult").innerHTML = "사용불가";
			document.querySelector("#checkResult").value = "N";
		} else {
			if (confirm("현재 입력하신 아이디는 사용가능합니다. 사용하시겠습니까?")) {
				this.mid.readOnly = true;
			}
			document.getElementById('idck').style.cssText = "display:hidden;";
			document.querySelector("#checkResult").value = "Y";
		}
		console.log(document.querySelector("#checkResult").value)
	}).catch(function(error) {
		console.log("Data Error!!");
	});
});
function sub() {
	if (mmarket1.checked = false) {
		mmarket1.value = "N";
	}
	memberSubmit.submit();
}