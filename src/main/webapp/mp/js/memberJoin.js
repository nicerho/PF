const mmarket1 = document.querySelector("#mmarket1");
const mmarket2 = document.querySelector("#mmarket2");
const mmarket3 = document.querySelector("#mmarket3");
const mmarket4 = document.querySelector("#mmarket4");



document.querySelector("#idck").addEventListener("click", function() {
	this.mid = document.querySelector("#mid")
	if (this.mid.value.length <= 5 || this.mid.value.length >= 12) {
		alert("6~12자의 아이디를 입력해주세요.")
	} else {
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
					document.querySelector("#ck").value = "Y";
				}
			}
		}).catch(function(error) {
			console.log("Data Error!!");
		});
	}


});

function sample6_execDaumPostcode() {
	new daum.Postcode({
		oncomplete: function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var addr = ''; // 주소 변수
			var extraAddr = ''; // 참고항목 변수

			//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				addr = data.roadAddress;
			} else { // 사용자가 지번 주소를 선택했을 경우(J)
				addr = data.jibunAddress;
			}

			// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
			if (data.userSelectedType === 'R') {
				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraAddr !== '') {
					extraAddr = ' (' + extraAddr + ')';
				}
				// 조합된 참고항목을 해당 필드에 넣는다.			
			} else {
				document.getElementById("sample6_extraAddress").value = '';
			}
			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById('sample6_postcode').value = data.zonecode;
			document.getElementById("sample6_address").value = addr;
			// 커서를 상세주소 필드로 이동한다.
			document.getElementById("sample6_detailAddress").focus();
		}
	}).open();
}

function sub() {
	if (document.getElementById("m1").checked == true) {
		mmarket1.value = "Y";
	}
	if (document.getElementById("m2").checked == true) {
		mmarket2.value = "Y";
	}
	if (document.getElementById("m3").checked == true) {
		mmarket3.value = "Y";
	}
	if (document.getElementById("m4").checked == true) {
		mmarket4.value = "Y";
	}
	if (document.querySelector("#ck").value == "N") {
		alert("아이디 중복체크를 해주세요")
	} else if (document.querySelector("#mname").value == "") {
		alert("이름을 입력해주세요.")
	} else if (document.querySelector("#mpw").value == "") {
		alert("비밀번호는 필수값입니다.")
	}
	else if (document.querySelector("#mpw").value != document.querySelector("#mpwck").value) {
		alert("동일한 패스워드를 입력해주세요.")
	} else if (document.getElementById("sample6_postcode").value == "" || document.getElementById("sample6_address").value == "" || document.getElementById("sample6_detailAddress").value == "") {
		alert("주소를 입력하셔야합니다.")
	}
	else {
		memberSubmit.submit();
	}

}