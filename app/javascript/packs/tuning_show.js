
document.querySelector('.add-doc').addEventListener("click", function() {
	document.getElementById('input-add-doc').click()
	});

document.querySelector('.add-kit').addEventListener("click", function() {
	document.getElementById('input-add-kit').click()
	});

var loadDoc = ((clicked_id)=> {
  document.getElementById(`btn-${clicked_id}`).click();
});

document.getElementById("input-add-doc").addEventListener("change", function () {
	document.getElementById("btn-input-add-doc").click()
})


var loadKit = ((clicked_id)=> {
  document.getElementById(`btn-${clicked_id}`).click();
});

document.getElementById("input-add-kit").addEventListener("change", function () {
	document.getElementById("btn-input-add-kit").click()
})


window.loadDoc = loadDoc;
window.loadKit = loadKit;