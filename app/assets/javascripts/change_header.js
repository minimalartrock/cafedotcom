$(function () {
	var _window = $(window),
		_header = $('.first-header'),
		headerChange = $('.second-header'),
		heroBottom;

	_window.on('scroll', function () {
		heroBottom = $('.search-container').height();
		if (_window.scrollTop() > heroBottom) {
			headerChange.addClass('show');
		} else {
			headerChange.removeClass('show');
		}
	});

	_window.trigger('scroll');
});
