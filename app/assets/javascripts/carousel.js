$(document).ready(function () {
	var swiper = new Swiper('.swiper-container', {
		loop: true,
		autoplay: {
			delay: 3000,
			disableOnInteraction: true
		},
		pagination: {
			el: '.swiper-pagination',
		},
		navigation: {
			nextEl: '.swiper-button-next',
			prevEl: '.swiper-button-prev',
		},
		breakpoints: {
			991: {
				slidesPerView: 3,
				spaceBetween: 10,
			},
			767: {
				slidesPerView: 1,
				spaceBetween: 0
			}
		}
	})
});
