
var $ = require('jquery');
window.jQuery = $;
window.$ = $;


$( function() {
	var departments = JSON.parse(document.getElementById("departments").dataset.departments)
	$("#department-tag").autocomplete({
		source: departments,
		minLength: 1,
    	select: function(event, ui) { 
        $("#department-tag").val(ui.item.label);
        $(".form-tag").submit(); },
        messages: {
        noResults: '',
        results: function() {}
    	}
	});
});