
function changeColor() {
  $('.status').each(function(i, obj) {
	  if (obj.innerHTML == "En cours de création") 
		{obj.classList.add("green");}
	  else if (obj.innerHTML == "En attente de validation SD")
	  	{obj.classList.add("blue");}
	  else if (obj.innerHTML == "En attente de validation DNF")
	  	{obj.classList.add("yellow");}
	  else if (obj.innerHTML == "En attente de validation Pôle Com.")
	  	{obj.classList.add("orange");}
	  else if (obj.innerHTML == "En attende de validation finale du candidat")
	  	{obj.classList.add("red");}
	  else if (obj.innerHTML == "Candidature close")
	  	{obj.classList.add("bg-success");}	
	});
}

var $ = require('jquery');
window.jQuery = $;
window.$ = $;
window.changeColor = changeColor
window.onload = changeColor()
