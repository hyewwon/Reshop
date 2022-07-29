function submitted() {
	let sellordonate = document.sellordonate;
	let clothingcntTag = sellordonate.clothingcnt;
	let useraddrTag = sellordonate.useraddr;
	let useraddrdetailTag = sellordonate.useraddrdetail;
	let userphoneTag = sellordonate.userphone;
	
	if(clothingcntTag.value < 5) {
		alert("5벌 이상부터 수거 가능합니다.");
		clothingcntTag.focus();
		return false;
	}
	
	if (useraddrTag.value == "" || useraddrTag.value == null) {
		alert("주소를 입력해주세요");
		useraddrTag.focus();
		return false;
	}
	
	if (useraddrdetailTag.value == "" || useraddrdetailTag.value == null) {
		alert("상세주소를 입력해주세요");
		useraddrdetailTag.focus();
		return false;
	}
	
	if (userphoneTag.value == "" || userphoneTag.value == null) {
		alert("전화번호를 입력하세요!");
		userphoneTag.focus();
		return false;
	}
	
	alert("제출되었습니다💌  감사합니다.");
	
	sellordonate.submit(); 
   }

function sample6_execDaumPostcode() {
	new daum.Postcode(
			{
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 각 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var addr = ''; // 주소 변수
					var extraAddr = ''; // 참고항목 변수

					// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을
															// 경우
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
							extraAddr += (extraAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraAddr !== '') {
							extraAddr = ' (' + extraAddr + ')';
						}
						// 조합된 참고항목을 해당 필드에 넣는다.
						document.getElementById("sample6_extraAddress").value = extraAddr;

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
function checkId() {
	let idInput = document.joinform.userid;
	let userid = idInput.value;
	let spanTag = document.getElementById('text');
	if (userid == "" || userid == null) {
		alert("아이디를 입력하세요!");
		idInput.focus();
		return false;
	}
	$.ajax({
		url:contextPath+"/user/CheckIdOk.us?userid="+userid,
		type:'get',
		dataType:'text',
		success:function(data){
			if(data.trim() == 'O'){
				spanTag.innerHTML = "사용 가능한 아이디입니다."
			}else{
				spanTag.innerHTML = "중복된 아이디입니다."
			}
		},
		error:function(){
			console.log("ajax실패");
		}
	})
}
function sendit() {
	let joinform = document.joinform;
	let idTag = joinform.userid;
	let pwTag = joinform.userpw;
	let nameTag = joinform.username;
	let ageTag = joinform.userage;

	if (idTag.value == "" || idTag.value == null) {
		alert("아이디를 입력하세요!");
		idTag.focus();
		return false;
	}
	if (idTag.value.length < 4 || idTag.value.length > 12) {
		alert("아이디는 4자리 이상 12자리 이하로 입력하세요!");
		idTag.focus();
		return false;
	}
	let hangle = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
	if (hangle.test(idTag.value)) {
		alert("아이디에는 한글을 쓸 수 없습니다!");
		idTag.focus();
		return false;
	}
	/*
	if (document.getElementById("text").innerHTML == "중복된 아이디입니다.") {
		alert("중복된 아이디는 사용할 수 없습니다!");
		return false;
	}
	if (document.getElementById("text").innerHTML != "사용할 수 있는 아이디입니다.") {
		alert("중복체크를 먼저 해주세요!");
		return false;
	}
	*/
	if (pwTag.value == "" || pwTag.value == null) {
		alert("비밀번호를 입력하세요!");
		return false;
	}
	// 대문자,소문자,숫자,해당 특수문자들이 다 포함된 8자 이상인지 판단하는 정규식
	let reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[~!@#$%^&*_-]).{8,}$/;
	if (!reg.test(pwTag.value)) {
		alert("비밀번호는 8자 이상이며, 숫자, 대문자, 소문자, 특수문자 모두를 포함해야 합니다.");
		pwTag.focus();
		return false;
	}
	// 연속된 문자가 있는지 확인하는 정규식
	if (/(\w)\1\1\1/.test(pwTag.value)) {
		alert("비밀번호는 같은문자를 4번 사용하실 수 없습니다!");
		pwTag.focus();
		return false;
	}
	if (pwTag.value.search(' ') != -1) {
		alert("비밀번호는 공백을 포함할 수 없습니다!");
		pwTag.focus();
		return false;
	}
	if (nameTag.value == "" || nameTag.value == null) {
		alert("이름을 입력하세요!");
		nameTag.focus();
		return false;
	}
	if (ageTag.value == "" || ageTag.value == null) {
		alert("나이를 입력하세요!");
		ageTag.focus();
		return false;
	}
	// 여기까지 왔다면 위의 유효성 검사를 다 통과했다는 뜻이므로 폼 제출
	joinform.submit();
}
function lostId() {
	let username = document.lostform.username;
	let userid = idInput.value;
	let spanTag = document.getElementById('text');
	if (userid == "" || userid == null) {
		alert("아이디를 입력하세요!");
		idInput.focus();
		return false;
	}
//	joinform.submit();
}













