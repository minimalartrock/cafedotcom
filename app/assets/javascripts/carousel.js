$(document).ready(function () {
	var swiper = new Swiper('.swiper-container', {
		loop: true,
		autoplay: {
			delay: 3000,
			disableOnInteraction: true
		},
		navigation: {
			nextEl: '.swiper-button-next',
			prevEl: '.swiper-button-prev',
		},
		breakpoints: {
			991: {
				slidesPerView: 3,
				spaceBetween: 20,
			},
			767: {
				slidesPerView: 1,
				spaceBetween: 0
			}
		}
	})
});
