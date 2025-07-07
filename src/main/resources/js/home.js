
function An(id){
    var input=document.getElementById(id);
    input.style.display='none';
}
function Hien(id){
    var input=document.getElementById(id);
    input.style.display='block';
}
function hamKiemTra(){
    var obj =document.getElementById('inputNumberPhone');
    var numberP= obj.value;
    var soDauTien=numberP[0];
    var errorSpan=document.getElementById('error');
     if(soDauTien!='0'||numberP.length<10||numberP.length>10){
         errorSpan.style.display="block";
        }
     if(soDauTien=='0'&&numberP.length==10){
         errorSpan.style.display="none";
     }
    
    
}
function hamHienLogIn(){
    var passwordPlace =document.getElementById('pass');
    passwordPlace.style.display="block";
    var squareLogIn=document.getElementById('square-logIn');
    squareLogIn.style.height="590px";
    var errorSpan=document.getElementById('error');
    errorSpan.style.top="185px";
}
function hamKiemTraTen(){
    var obj =document.getElementById('input-name');
    var name= obj.value;
    var errorSpan=document.getElementById('error2');
     if(name.length < 2){
         errorSpan.style.display="block";
        }
     else{
         errorSpan.style.display="none";
     }
    
    
}
function thayDoiLi(id){
    
    var arrayOjb=document.getElementsByClassName('li-linked');
    for(var i=0;i<arrayOjb.length;i++){
        if(arrayOjb[i].getAttribute("id")==id && arrayOjb[i].getAttribute("id") != "tree0"){
            arrayOjb[i].style.color="white";
            arrayOjb[i].style.backgroundColor="#009750";
            arrayOjb[i].style.padding="9px 9px ";
            arrayOjb[i].style.marginTop="0";
            arrayOjb[i].style.marginBottom="0";
            arrayOjb[i].style.border="1px solid rgba(0, 0, 0, 0.297)";
            arrayOjb[i].style.borderRadius="5px";
        }
        else if(arrayOjb[i].getAttribute("id")!=id && arrayOjb[i].getAttribute("id") != "tree0"){
            arrayOjb[i].style.color="#288ad6";
            arrayOjb[i].style.backgroundColor="unset";
            arrayOjb[i].style.padding="0";
            arrayOjb[i].style.marginTop="10px";
            arrayOjb[i].style.marginBottom="10px";
            arrayOjb[i].style.border="none";
            arrayOjb[i].style.borderRadius="none";
        }
       
    }
}
function hienDecor(id){
    var ojbLi=document.getElementById('liBrandSelected');
    var arrayOjb=document.getElementsByClassName('decor-selected-brand');
    if(id=='decor1'){
        ojbLi.innerHTML="Bách hóa xanh";
    }
    else if(id=='decor2'){
        ojbLi.innerHTML="Pacow";
    }
    else{
        ojbLi.innerHTML="Trung Đồng";
    }
    for(var i=0;i<arrayOjb.length;i++){
        if(arrayOjb[i].getAttribute("id")==id ){
            arrayOjb[i].style.backgroundColor="#28a018a7";
        
        }
        else{
            arrayOjb[i].style.backgroundColor="unset";
        }
    }

}
function AnBackGroundDecor(){
    var arrayOjb=document.getElementsByClassName('decor-selected-brand');
    for(var i=0;i<arrayOjb.length;i++){
        arrayOjb[i].style.backgroundColor="unset";
    }
}
function hienHistory(){
    var title1=document.getElementById('history');
    var title2=document.getElementById('vouchers');
    var ojb =document.getElementById('content-card');
    var ojb1 =document.getElementById('element1');
    var ojb2 =document.getElementById('element2');
    var ojb3 =document.getElementById('element3');
    title1.style.borderBottom="4px solid #008848";
    title2.style.borderBottom="none";
    ojb.style.textAlign="center";
    ojb1.style.display="block";
    ojb1.style.marginLeft="35%";
    ojb3.style.display="block";
    ojb2.innerHTML=" Lịch sử mua hàng của anh đang trống.<br> Trải nghiệm mua sắm với chúng tôi ngay bây giờ. "
}
function hienVoucher(){
    var title1=document.getElementById('history');
    var title2=document.getElementById('vouchers');
    var ojb1 =document.getElementById('element1');
    var ojb2 =document.getElementById('element2');
    var ojb3 =document.getElementById('element3');
    title2.style.borderBottom="4px solid #008848";
    title1.style.borderBottom="none";
    ojb1.style.display="none";
    ojb3.style.display="none";
    ojb2.innerHTML="Tài khoản của anh chưa có phiếu mua hàng ";
}
var silderNumber=0;
var firstTime=0;
setInterval(function(){
    var ojbsImg=document.getElementsByClassName('img-slider');
    var i;
    for(i=0;i<ojbsImg.length;i++)
    {
        
        if(i==silderNumber&&silderNumber!=3){
            ojbsImg[i].style.display="block";
        }
        else if(i==silderNumber&&silderNumber==3){
            ojbsImg[i].style.display="block";
            silderNumber=-1;
        }else{
            ojbsImg[i].style.display="none";
        }

    }
    silderNumber++;
},1000)
setInterval(function(){
    var ojbsBtn=document.getElementsByClassName('btn-circle');
    for(var i=0;i<ojbsBtn.length;i++)
    {
        
        if(i==silderNumber&&silderNumber!=3){
            ojbsBtn[i].style.backgroundColor="#008848";
        }
        else if(i==silderNumber&&silderNumber==3){
            ojbsBtn[i].style.backgroundColor="#008848";
           
        }else{
            ojbsBtn[i].style.backgroundColor="white";
        }

    }
   
},1000)

function xemMatKhau(id){
    var inputPass=document.getElementById(id);
    inputPass.setAttribute("type","text");
}
function anMatKhau(id){
    var inputPass=document.getElementById(id);
    inputPass.setAttribute("type","password");
}
function soSanhNhapLai(){
    var password=document.getElementById('password-input');
    var retypepassword=document.getElementById('retype-password');
    var p_error=document.getElementById('p_error');
    var btn = document.getElementById('btn-hoantat');
  
    if(password.value!=retypepassword.value){
       	p_error.style.display="block";
        btn.style.display="none";
    }
    if(password.value==retypepassword.value){
	p_error.style.display="none";
	btn.style.display="block";
	btn.style.position="relative";
    btn.style.left="110px";
    btn.style.top="0px";
    btn.style.marginTop="60px";
}
   
    
}
var demS=0;
setInterval(function(){
    var inputS = document.getElementById('inputSearch');
    var a="Bạn tìm gì hôm nay...";
    var b="Thịt cá rau củ tìm gì cũng có";
    var c="Giao nhanh, đơn ít cũng giao !";
    var d="Unilever vô vàn giảm giá !";
    
   inputS.setAttribute("placeholder","Bạn tìm gì hôm nay...");
   if(demS%4 == 1){
	inputS.setAttribute("placeholder",a);
}
else if(demS%4 == 2){
	inputS.setAttribute("placeholder",b);
}
else if(demS%4 == 3){
	inputS.setAttribute("placeholder",c);
}
else{
	inputS.setAttribute("placeholder",d);
}
   
   demS++;
},1000)
 