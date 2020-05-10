$(function () {
	var pagetop = $('#page_top');
	var action_btn = $('.fixed-action-btn');
	pagetop.hide();
	$(window).scroll(function () {
		if ($(this).scrollTop() > 100) {
			pagetop.fadeIn();
			action_btn.addClass('gotoleft')
		} else {
			pagetop.fadeOut();
			action_btn.removeClass('gotoleft')
		}
	});
	pagetop.click(function () {
		$('body,html').animate({
			scrollTop: 0
		}, 500);
		return false;
	});
});
