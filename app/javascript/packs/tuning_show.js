

var addDoc = document.querySelector('.add-doc');

if (addDoc) {
	addDoc.addEventListener("click", function() {
		document.getElementById('input-add-doc').click()
	});
	document.getElementById("input-add-doc").addEventListener("change", function () {
		document.getElementById("btn-input-add-doc").click()
	})
}

var addKit = document.querySelector('.add-kit');

if (addKit) { 
	addKit.addEventListener("click", function() {
	document.getElementById('input-add-kit').click()
	});
	document.getElementById("input-add-kit").addEventListener("change", function () {
		document.getElementById("btn-input-add-kit").click()
	});
}

var loadDoc = ((clicked_id)=> {
  document.getElementById(`btn-${clicked_id}`).click();
})



var loadKit = ((clicked_id)=> {
  document.getElementById(`btn-${clicked_id}`).click();
})

var $ = require('jquery');
window.jQuery = $;
window.$ = $;

function changeColorShow() {
	console.log("hello")
  $('.candidate-status').each(function(i, obj) {
	  if (obj.innerText == "Ouverte") 
		{obj.classList.add("green");}
	  else if (obj.innerText == "Validation SD")
  		{obj.classList.add("orange");}
	  else if (obj.innerText == "Validation DNF")
	  	{obj.classList.add("yellow");}
	  else if (obj.innerText == "Validation Com.")
	  	{obj.classList.add("red");}
	  else if (obj.innerText == "Validation candidat")
	  	{obj.classList.add("blue");}
	  else if (obj.innerText == "Bon à tirer")
	  	{obj.classList.add("");}	
	});
}

window.onload = changeColorShow();
window.changeColorShow = changeColorShow;
window.loadDoc = loadDoc;
window.loadKit = loadKit;