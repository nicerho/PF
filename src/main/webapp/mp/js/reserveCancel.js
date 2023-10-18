document.querySelector("#btn").addEventListener("click",function(){
	if(confirm("확인 버튼 클릭시 정보가 모두 삭제됩니다 계속 하시겠습니까")){
		r.submit();
	}
})