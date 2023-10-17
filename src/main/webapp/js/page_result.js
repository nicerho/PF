let adds = document.querySelector("#member_add");
adds.addEventListener("click",function(){
   location.href="./admin_ship.jsp";
});

document.querySelector("#loginTry").addEventListener("click", function() {
	this.aid = document.querySelector("#login_id")
	this.apw = document.querySelector("#login_pass")

	fetch("./adminMain", {
		method: "POST",
		cache: "no-cache",
		headers: {
			"Content-Type": "application/x-www-form-urlencoded"
		},
		body: "login_id=" + this.aid.value + "&login_pass="+this.apw.value
	}).then(function(response) {
		return response.text();
	}).then(function(result) {
		if (result == "noid") {
			alert("해당되는 아이디가 존재하지 않습니다")
		}else if(result=="nouse"){
			alert("해당 아이디는 현재 사용정지 상태입니다 관리자에게 문의하세요")
		}else if(result=="overmaxattempt"){
			console.log(result)
			alert("해당 아이디는 비밀번호 오류가 5회 이상으로 로그인이 불가능한 상태입니다.")
		}else if(result=="noerr"){
			location.href="./config"
		}
		else{
			alert("비밀번호가 맞지 않습니다 5회 이상 틀릴 시 로그인이 불가능합니다 현재 :"+result.substring(9)+"회")
		}
	}).catch(function(error) {
		console.log("Data Error!!");
		console.log(error)
	});
});