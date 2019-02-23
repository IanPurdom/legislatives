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



window.loadDoc = loadDoc;
window.loadKit = loadKit;