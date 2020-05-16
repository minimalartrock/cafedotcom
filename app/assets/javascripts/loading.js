$(function () {
	$(window).on('load', function () {
		$("#page-loading").delay(1000).fadeOut('slow');
	});

	function loaderClose() {
		$("#page-loading").fadeOut('slow');
	}
	setTimeout(loaderClose, 10000);
});
