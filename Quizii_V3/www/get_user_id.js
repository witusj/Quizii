function listener(event){
  Shiny.unbindAll();
  var userDataVariableName = event.data;
  var userData = document.getElementById("userData"); 
  userData.value = userDataVariableName;
  Shiny.bindAll();
}

if (window.addEventListener){
  addEventListener("message", listener, false)
} else {
  attachEvent("onmessage", listener)
}