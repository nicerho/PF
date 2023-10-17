document.querySelector("#loginTry").addEventListener("click", function() {
	const loginId = document.getElementById("loginId");
	const loginPw = document.getElementById("loginPw");

	fetch("./memberLogin", {
		method: "POST",
		cache: "no-cache",
		headers: {
			"Content-Type": "application/x-www-form-urlencoded"
		},
		body: "loginId=" + loginId.value + "&loginPw=" + loginPw.value
	}).then(function(response) {
		return response.text();
	}).then(function(result) {
		if (result == "noid" || result == "loginfail") {
			alert("아이디 또는 비밀번호를 확인해주시길 바랍니다.")
		}
		else if (result == "noerr") {
			location.href = "./mainpage"
		}
	}).catch(function(error) {
		console.log("Data Error!!");
		console.log(error)
	});
});