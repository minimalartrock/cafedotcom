$(function () {
	var _window = $(window),
		_header = $('.first-header'),
		headerChange = $('.second-header'),
		heroBottom;

	_window.on('scroll', function () {
		if (_window.scrollTop() > 415) {
			headerChange.addClass('show');
		} else {
			headerChange.removeClass('show');
		}
	});

	_window.trigger('scroll');
});
