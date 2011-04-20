jQuery.noConflict();
jQuery(document).ready( function($){	
$('#photo').add('#photo-bg').add('#controls').add('.pagination').fadeIn('slow');
$('#imageSlider > div').each(function(){
	if($(this).children().hasClass('top')){
		var compare = $(this).attr('id');
		$('#photo-list > li > a').each(function(){
			if($(this).attr('id') == compare){
				$(this).addClass('here');
				return false;
			}	
		});
		return false;	
	}
});
var config = {    
     sensitivity: 1, // number = sensitivity threshold (must be 1 or higher)    
     interval: 80, // number = milliseconds for onMouseOver polling interval    
     over: slidePanel, // function = onMouseOver callback (REQUIRED)    
     timeout: 500, // number = milliseconds delay before onMouseOut    
     out: doNothing // function = onMouseOut callback (REQUIRED)    
};

var config2 = {    
     sensitivity: 1, // number = sensitivity threshold (must be 1 or higher)    
     interval: 80, // number = milliseconds for onMouseOver polling interval    
     over: slideCategory, // function = onMouseOver callback (REQUIRED)    
     timeout: 500, // number = milliseconds delay before onMouseOut    
     out: doNothing // function = onMouseOut callback (REQUIRED)    
};
	
	//power the home page
	$("#photo-list > li > a").hoverIntent(config)
	$('#photo-list > li > a').add('#photo-list-gallery > li > a').click(function(){
		$('#photo').add('#photo-bg').add('#thumbs').add('#controls').add('.pagination').fadeOut('fast', function(){
			href.location = $(this).attr('href');
		});
	});	
	$(".panel").hoverIntent(config2);	
	
	$(window).load(function(){
		$('.panel').fadeIn('fast');
		$('#imageSlider').css('background','none');
		$('#thumbs').add('.ss-controls, .nav-controls').fadeIn('fast');
		$('#photo').add($('#photo-bg')).css('backgroundImage','none');
	});

	
	//power the photo galleries
	if($('#sub-content.gallery').length > 0){
		var gallery = $('#sub-content.gallery').galleriffic('#thumbs', {
			delay:                4000,
			numThumbs:            12,
			preloadAhead:         12, // Set to -1 to preload all images
			enableTopPager:       false,
			nextPageLinkText:			'More',
			prevPageLinkText:			'Back',
			enableBottomPager:    true,
			imageContainerSel:    '#photo',
			controlsContainerSel: '#controls'
		});
	}
	
	
	//image loaders
	/*
  	$("#thumb-list > li.loading > a > img").each(function(){
  		$(this).parent().parent().removeClass('loading');
	});*/
});

function doNothing(){ return false; }

function slideCategory(){
		slide(jQuery(this));
		var photoID = jQuery(this).attr('id');
		jQuery("#photo-list > li > a").removeClass('here').each(function(){
			if(jQuery(this).attr('id') == photoID){
				jQuery(this).addClass('here');
			}
		});
}

function slidePanel(){
		var hovered_link_id = "#" + jQuery(this).attr('id');
		jQuery("#photo-list > li > a").removeClass('here');
		slide(jQuery(hovered_link_id));
		jQuery(this).addClass('here');
	}

function slide(o){
	if(o.hasClass('right')){
		jQuery(".top").removeClass('top');
		o.nextAll('.right').animate({ right: '+=683px' }, 'slow').removeClass('right').addClass('left');
		o.children('.img').addClass('top');
	} else if(o.hasClass('left')){
		jQuery(".panel > img").removeClass('top')
		o.animate({ right: '-=683px' }, 'slow').prevAll('.left').animate({ right: '-=683px' }, 'fast').addClass('right').removeClass('left');
		o.removeClass('left').addClass('right').children('.img').addClass('top');
	}
}