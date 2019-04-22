function userLogin() {
    var user = {
      userName:$("#form_login input[name='userName']").val(),
      password:$("#form_login input[name='password']").val()
    };
    console.log(JSON.stringify(user));
    var ajaxState = ajaxdata("/blogmanage/userLogin",user).state;
    if(ajaxState==="success"){
        window.parent.location.href = "/blogmanage/index";
    }else{
        alert(ajaxState);
    }
}