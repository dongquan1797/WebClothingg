/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function sendData(){
    var select = document.getElementById('cateId');
    var category_id = select.options[select.selectedIndex].value;
    var path = document.getElementById("path").value;
    path+=category_id;
    document.myform.action =  path;
    document.myform.submit();
}

