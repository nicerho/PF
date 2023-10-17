let search = document.querySelector("#searchPart")
let search2 = document.querySelector("#search_part")
function select2(val) {
	search2.value = val;
}

function deleteMember(val) {
	if (confirm("삭제하시겠습니까")) {
		fetch("./deleteMember", {
			method: "POST",
			cache: "no-cache",
			headers: {
				"Content-Type": "application/x-www-form-urlencoded"
			},
			body: "memberNumber=" + val
		}).then(function(response) {
			alert("삭제완료")
			return response.text();
		}).then(function(result) {
			location.href = "./adminMember"
		}).catch(function(error) {
			console.log("Data Error!!");
		});
	}
}