$(function () {
	var mySwiper = new Swiper('.swiper-container', {
		navigation: {
			nextEl: '.swiper-button-next',
			prevEl: '.swiper-button-prev',
		},
		loop: true,
		pagination: {
			el: '.swiper-pagination',
			type: 'bullets',
			clickable: true,
		},
		slidesPerView: 1,
		spaceBetween: 0,
		autoplay: {
			delay: 3000,
			disableOnInteraction: true
		},
		breakpoints: {
			767: {
				slidesPerView: 4,
				spaceBetween: 20
			}
		}
	});
});
