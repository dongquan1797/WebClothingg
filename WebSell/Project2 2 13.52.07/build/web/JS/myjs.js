/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function CheckDataLogin(){    
    var user = document.getElementById("Username").value;
    var pass = document.getElementById("PassWord").value;
    
    if(user==""){
        alert("Please enter your username.")
        return false;
    }
    if(pass==""){
        alert("Please enter your password");
        return false;
    }
    return true;
}
    
function CheckData(){
    var cusName = document.getElementById("CustomerName").value;
    var dob = document.getElementById("DateOfBirth").value;
    var phone = document.getElementById("Phone").value;
    var address = document.getElementById("Address").value;
    var email = document.getElementById("Email").value;
    var user = document.getElementById("UserName").value;
    var pass = document.getElementById("PassWord").value;
    var cpass = document.getElementById("cpass").value;
    
    if(cusName==""){
        alert("Please enter your name");
        return false;
    }
//    if(dob==""){
//        alert("Please enter your date");
//         return false;
//    } else{
//        var now = new Date();
//        var cur=now.getFullYear();
//        var birth=new Date(dob);
//        var year = birth.getFullYear();
//        var age=cur-year+1;
//        if(age<18){
//            alert("You are under 18 years old");
//            return false;
//        }
//    }
    if(phone==""){
        alert("Please enter your phone");
        return false;
    }
    if(address==""){
        alert("Please enter your address");
        return false;
    }
    if(email==""){
        alert("Please enter your email");
        return false;
    }
    if(user==""){
        alert("Please enter your username");
        return false;
    }
    if(pass=="" || pass.length<2){
        alert("Please enter your password");
        return false;
    }

    if(pass.localeCompare(cpass) != 0){
        alert("Password or Confirm Password does not match");
        return false;
    }
    return true;
}