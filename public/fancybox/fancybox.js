$(document).ready(function() {
	$(".fancybox-thumb").fancybox({
		openEffect : 'elastic',
 		closeEffect : 'elastic',
		prevEffect	: 'none',
		nextEffect	: 'none',
		helpers	: {
			title	: {
				type: 'float'
			},
			thumbs	: {
				width	: 50,
				height	: 50
			}
		}
	});
});

