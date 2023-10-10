document.querySelector("#faqSpan").addEventListener("click", function(z) {
	console.log(z.target)
	var n = document.querySelectorAll("#faqSpan > .node ");
	this.node = [].indexOf.call(n, z.srcElement.parentNode); //li 자식노드에서 부모노드를 찾아 확인작업
	this.ea = document.querySelectorAll("#faqSpan > ol ").length; //답변에 대한 갯수
	var w = 0;
	while(w<this.ea){
		document.querySelectorAll("#faqSpan > ol ")[w].style["display"] = "none"; // 해당 모든 답변을 숨김
		w++
	}
	document.querySelectorAll("#faqSpan > ol ")[this.node].style["display"] = "flex";	//클릭된 질문에 대한 답변만 출력
	console.log(this.ea)
})