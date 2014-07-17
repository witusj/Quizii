function listener(event){
  var userDataVariableName = event.data
  var userData = document.getElementById("userData"); 
  userData.value = userDataVariableName;
}

if (window.addEventListener){
  addEventListener("message", listener, false)
} else {
  attachEvent("onmessage", listener)
}