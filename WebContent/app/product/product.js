function sendit(){
	let productform = document.productForm;
	let nameTag = productform.prodname;
	let priceTag = productform.price;
	let colorTag = productform.prod_color;
	let cntTag = productform.prodcnt;
	let sizeTag = productform.prodsize;
	let classify1Tag = productform.classify;
	let classify2Tag = productform. classify_prod;
	let brandTag = productform.brand;
	let stateTag = productform.prodstate;
	let ageTag = productform.sug_age;
	let prodexplain = productform.prodexplain;
	
	if(nameTag.value == ""|| nameTag.value == null){
		alert("상품이름을 입력해주세요");
		nameTage.focus();
		return false;
	}
	if(priceTag.value == ""|| priceTag.value == null){
		alert("상품가격을 입력해주세요");
		priceTag.focus();
		return false;
	}
	if(colorTag.value == ""|| colorTag.value == null){
		alert("상품색깔을 입력해주세요");
		colorTag.focus();
		return false;
	}
	if(cntTag.value == ""|| cntTag.value == null){
		alert("상품 수량을 입력해주세요");
		nameTage.focus();
		return false;
	}
	if(sizeTag.value == ""|| sizeTag.value == null){
		alert("상품 사이즈를 입력해주세요");
		sizeTag.focus();
		return false;
	}
	if(classify1Tag.value == ""|| classify1Tag.value == null){
		alert("상품 분류를 입력해주세요");
		classify1Tag.focus();
		return false;
	}
	if(classify2Tag.value == ""|| classify2Tag.value == null){
		alert("상품 분류를 입력해주세요");
		classify2Tag.focus();
		return false;
	}
	if(brandTag.value == ""|| brandTag.value == null){
		alert("상품 브랜드를 입력해주세요");
		brandTag.focus();
		return false;
	}
	if(stateTag.value == ""|| stateTag.value == null){
		alert("상품 상태를 입력해주세요");
		stateTag.focus();
		return false;
	}
	if(ageTag.value == ""|| ageTag.value == null){
		alert("상품 나이를 입력해주세요");
		ageTag.focus();
		return false;
	}
	if(prodexplain.value == ""|| prodexplain.value == null){
		alert("상품 설명을 입력해주세요");
		prodexplain.focus();
		return false;
	}
	productform.submit();
	
}