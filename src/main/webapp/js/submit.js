let adnum = document.querySelector("#adm1").value
let adnum2 = document.querySelector("#adm2").value
let adnum3 = document.querySelector("#adm3").value

document.querySelector("#adm_ok").addEventListener("click",function(){
	let adnums = document.querySelector("#adnums")
	adnums.value = document.querySelector("#adm1").value +document.querySelector("#adm2").value + document.querySelector("#adm3").value; 
	if(document.querySelector("#apw").value != document.querySelector("#pwCheck").value){
		alert("동일한 패스워드를 입력하세요")
	}else{
		f.submit();
		console.log(adnums.value)
	}
})


document.querySelector("#idck").addEventListener("click", function(){
	this.aid = document.querySelector("#aid").value;
	
	fetch("./idCheck", {
		method: "POST",
		cache: "no-cache",
		headers: {
			"Content-Type":"application/x-www-form-urlencoded"
		},
		body: "userid="+this.aid
	}).then(function(aa){
		console.log(aa);
		return aa.text();
	}).then(function(bb){
		console.log(bb);
	}).catch(function(error){
		console.log("Data Error!!");
	});
});

