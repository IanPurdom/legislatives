
var $ = require('jquery');
window.jQuery = $;
window.$ = $;

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

window.onload = changeColor()
window.changeColor = changeColor;
