$(function() {
	if (!placeholderSupport()) { 
		$('[placeholder]').focus(function() {
		
			var input = $(this);
			if (input.val() == input.attr('placeholder')) {
				input.val('');
				input.removeClass('placeholder');
			}
		}).blur(function() {
			var input = $(this);
			if (input.val() == '' || input.val() == input.attr('placeholder')) {
				input.addClass('placeholder');
				//input.val(input.attr('placeholder'));
				input.attr("title",input.attr('placeholder'));
			}
		}).blur();
	}
})

function placeholderSupport() {
	return 'placeholder' in document.createElement('input');
}