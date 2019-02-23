function changeColor() {
  $('.status').each(function(i, obj) {
	  if (obj.innerHTML == "OPEN") 
		{obj.classList.add("green");
		obj.innerHTML = "CAN";}
	  else if (obj.innerHTML == "PENDING_SD")
	  	{obj.classList.add("orange");
		obj.innerHTML = "SD";}
	  else if (obj.innerHTML == "PENDING_DNF")
	  	{obj.classList.add("yellow");
		obj.innerHTML = "DNF";}
	  else if (obj.innerHTML == "PENDING_COM")
	  	{obj.classList.add("red");
		obj.innerHTML = "COM";}
	  else if (obj.innerHTML == "PENDING_CANDIDATE")
	  	{obj.classList.add("blue");
		obj.innerHTML = "CAN";}
	  else if (obj.innerHTML == "CLOSE")
	  	{obj.classList.add("");}	
	});
}

function changeColorShow() {
  $('.candidate-status').each(function(i, obj) {
	  if (obj.innerText == "En cours de création") 
		{obj.classList.add("green");}
	  else if (obj.innerText == "En attente de validation SD")
  		{obj.classList.add("orange");}
	  else if (obj.innerText == "En attente de validation DNF")
	  	{obj.classList.add("yellow");}
	  else if (obj.innerText == "En attente de validation Pôle Com.")
	  	{obj.classList.add("red");}
	  else if (obj.innerText == "En attende de validation finale du candidat")
	  	{obj.classList.add("blue");}
	  else if (obj.innerText == "CLOSE")
	  	{obj.classList.add("");}	
	});
}

var $ = require('jquery');
window.jQuery = $;
window.$ = $;


window.onload = changeColor()
window.onload = changeColorShow()

window.changeColor = changeColor;
window.changeColorShow = changeColorShow;
