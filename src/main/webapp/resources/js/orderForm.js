/**
 * 
 */
 
function CheckOrder() {

			const regName = /^[가-힣a-zA-Z]{2,}$/;
			const regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			const regCall = /^\d{3}\d{3,4}\d{4}$/;

			//이름 유효성
			if (od.o_name.value == "") {
				alert("수령인을 입력해주세요");
				return od.o_name.focus();
			} else if (!regName.test(document.od.o_name.value.trim())) {//이름에 특수문자가 들어간 경우
				alert("이름이 잘못 입력되었습니다.(영어 대소문자와 한글만 입력가능합니다.)");
				return document.od.o_name.select();//입력한 부분에 블록 설정되어 바로 수정가능한 상태로 만듦
			} else

			//휴대폰 유효성
			if (od.o_phone.value == "") {
				alert("받으시는분 전화번호를 입력해주세요");
				return od.o_phone.focus();
			} else if (!regCall.test(document.od.o_phone.value.trim())) {
				alert("휴대폰번호가 잘못 입력되었습니다. 숫자로만 입력해주세요.");
				return document.od.o_phone.select();//입력한 부분에 블록 설정되어 바로 수정가능한 상태로 만듦
			} else

			//이메일 유효성	
			if (od.o_email.value == "") {
				alert("이메일을 입력해주세요");
				return od.o_email.focus();
			} else if (!regEmail.test(document.od.o_email.value.trim())) {
				alert("이메일 형식이 올바르지 않습니다.");
				return document.od.o_email.select();//입력한 부분에 블록 설정되어 바로 수정가능한 상태로 만듦
			} else

			if (od.o_address1.value == "") {
				alert("우편번호를 입력해주세요");
				return od.o_address1.focus();
			}
			if (od.o_address2.value == "") {
				alert("주소를 입력해주세요");
				return od.o_address2.focus();
			}
			if (od.o_address3.value == "") {
				alert("상세주소를 입력해주세요");
				return od.o_address3.focus();
			}
			
			if (od.o_address3.value == "") {
				alert("상세주소를 입력해주세요");
				return od.o_address3.focus();
			}
			if(od.pay_kind[0].checked==false && od.pay_kind[1].checked==false){
				alert("결제방법을 선택해주요");
				return ;
			}
			
			if(od.pay_kind[0].checked==true || od.pay_kind[1].checked==false){
				//입금자명
				if(od.pay_name.value==""){
					alert("입금자명을 입력해주세요");
					return od.pay_name.focus();
				}
				//입금은행 선택
				if(od.pay_bank.value==""){
					alert("입금하실 은행을 선택해 주세요");
					return;
				}

			
				od.submit();
				
			}
		iamport();
	
}

	function form_reset() {
		if (confirm(" 다시쓰시겠습니까? ") == true) {
			od.reset();
		} else {
			return false;
		}

	}
	
	
	
	
	
	function sample6_execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) { //[선택]시 입력값 세팅
				console.log(data);

				document.getElementById("o_address1").value = data.zonecode;//우편번호

				var roadAddr = data.roadAddress;//도로명 주소
				var jibunAddr = data.jibunAddress;//지번 주소

				if (roadAddr != '') {//도로명 주소가 있으면 도로명 주소가 등록되고
					document.getElementById("o_address2").value = roadAddr;
				} else if (jibunAddr != '') {//도로명주소가 없고 지번주소만 있으면 지번주소를 등록함
					document.getElementById("o_address2").value = jibunAddr;
				}

				//만약 지번주소 대신 무조건 도로명 주소만 입력하고 싶다면 위의 if~else 대신	
				//document.getElementById("address1").value = data.roadAddress;
				//document.getElementById("address1").value = roadAddr;

				//상세주소 필드에 커서를 두어 바로 입력가능한 상태로 만듦
				document.getElementById("o_address3").focus();
			}
		}).open();
	}
	
	
	
	
	
	
	
///////////////////div
	

/* 
$(function (){
	$('input[type="radio"][id="aaa"]').on('click', function(){
	  var chkValue = $('input[type=radio][id="aaa"]:checked').val;
	  console.log(chkValue);
	  if($('input:radio[id=aaa]').is(':checked')){
	             $('#bankDiv').css('display','none');
	  }else{
	             $('#bankDiv').css('display','block');
	  }
	 
	});
	 
	}); */
	
	
	
	
function addFunc() {

		let point = parseInt(document.getElementById("point").innerHTML.trim());
		let price = parseInt(document.getElementById("price").innerHTML.trim());
		
		  
		let pointBox = parseInt(document.getElementById("pointBox").value);

		
		
		if (price > point) {
			if (pointBox > price) {
				document.getElementById("pointBox").value = point+"점";
			}
			if (pointBox > point) {
				document.getElementById("pointBox").value = point+"점";
			}
		}

		else if (price < point) {
			if (pointBox > price) {
				document.getElementById("pointBox").value = price+"점";
			}
			if (pointBox > point) {
				document.getElementById("pointBox").value = price+"점";
			}

		}
		
		sumFunc();
		document.od.usePoint.value=pointBox;
		document.od.realPrice.value=document.getElementById("sum").innerHTML ;
		return;
		
	}

	function sumFunc() {
		let price = parseInt(document.getElementById("price").innerHTML.trim());

		let pointBox = parseInt(document.getElementById("pointBox").value);
		document.getElementById("sum").innerHTML = price - pointBox+"원";
		
		
	}	
	