function scScrollTo(destination, distance) {
    if (destination != '') {
        distance = typeof distance !== 'undefined' ? distance : 99;
        // where in px from top is the element?
        var dest = $(destination).offset().top - distance;
        // show the element and as callback scroll it into the viewport (if not animated)
        $(this).show(1, function() {
            $("html:not(:animated),body:not(:animated)").animate({ scrollTop: dest }, 1000, "swing");
        });
    }
}

function jumpTo(destination, distance) {
    distance = typeof distance !== 'undefined' ? distance : 99;
    // where in px from top is the element?
    var dest = $(destination).offset().top - distance;
    // show the element and as callback scroll it into the viewport (if not animated)
    $(this).show(1, function() {
        $("html:not(:animated),body:not(:animated)").animate({ scrollTop: dest }, 1);
    });
}

function sameHeight() {
    if ($('.sameHeightWrapper .sameHeightElement').length) {
        $('.sameHeightWrapper .sameHeightElement').removeAttr('style');

        if ($(window).width() >= 820) {
            $('.sameHeightWrapper').each(function(parentIndex) {
                var maxHeight = 0;
                $(this).find('.sameHeightElement').each(function() {
                    if ($(this).outerHeight() >= maxHeight) {
                        maxHeight = $(this).outerHeight();
                    }
                });
                $(this).find('.sameHeightElement').css({ 'min-height': maxHeight + 'px' });
            });
        }
    }
}

function initMenu() {
    if ($(window).scrollTop() > 0) {
        $('header').addClass('fixed');

        $('.nav-scrollbar-arrow.right').css({
            'pointer-events': 'all',
            'opacity': '1'
        });
    } else {
        $('header').removeClass('fixed');
        $('.nav-scrollbar-arrow.right').removeAttr('style');
    }
}

function initJumpingNav(jumpingNavOffset) {
    if ($('.jumpingNav').length) {
        $('.jumpingNav').removeClass('fixed').removeAttr('style');
        $('#content-wrapper').removeAttr('style');

        if ($(window).width() >= 960 && $(window).scrollTop() > $('.jumpingNav').offset().top - $('.navbar').height()) {
            $('.jumpingNav').addClass('fixed');
            $('.jumpingNav').css({
                'top': $('.navbar').height() + 'px'
            });
            $('#content-wrapper').css({
                'padding-top': $('.jumpingNav').height() + 75 + 'px'
            });
        } else {
            $('.jumpingNav').removeClass('fixed').removeAttr('style');
            $('#content-wrapper').removeAttr('style');
        }

        $('.jumpingNav a').each(function() {
            var res = $(this).attr('href').split('#');

            if ($('#' + res[1]).length && $('#' + res[1]).is(':visible') && $(window).scrollTop() >= $('#' + res[1]).offset().top - 200) {
                $('.jumpingNav li').removeClass('active');
                $(this).parents('li').addClass('active');
            }
        });


        if ($('#downloads').length == 0 || ($('#downloads .mediafiles').html().trim() == '' && $('#downloads .innerWrapper').html().trim() == '')) {
            $('.jumpingNav .downloads').hide();
            $('#downloads').hide();
        }

        if ($('#anwendungen').length == 0 || $('#anwendungen .innerWrapper').html().trim() == '') {
            $('.jumpingNav .anwendungen').hide();
            $('#anwendungen').hide();
        }

        if ($('#passende').length == 0) {
            $('.jumpingNav .passende').hide();
        }
    }
}


function updateCarouselClasses() {
    $('.carousel:not(.slick-initialized)').each(function() {
        var $carousel = $(this);
        var numChildren = $carousel.children().length;
        var windowWidth = $(window).width();

        if ((numChildren > 5 && windowWidth > 992) || (numChildren > 3 && windowWidth <= 992 && windowWidth > 768) || (numChildren > 2 && windowWidth <= 768)) {
            $carousel.addClass('arrows');
        } else {
            $carousel.removeClass('arrows');
        }
    });
}

// Initialisieren beim Laden und bei Änderungen der Fenstergröße
updateCarouselClasses();
$(window).resize(updateCarouselClasses);


// 

initMenu();
sameHeight();


// offset der fixed jumpingNav 
var jumpingNavOffset = '';
if ($('.jumpingNav').length) {
    jumpingNavOffset = $('.jumpingNav').offset().top;
    initJumpingNav(jumpingNavOffset);
}

if (window.location.hash.substr(1) != '') {
    setTimeout(function() { jumpTo('#' + window.location.hash.substr(1), 120) }, 400);
}

$('header .navbar-nav a').bind('click', function() {
    if (window.location.hash.substr(1) != '') {
        setTimeout(function() { jumpTo('#' + window.location.hash.substr(1), 120) }, 100);
    }
});

// scrollTo
$('.jumpingNav a, a.scrollTo, .scrollTo a').unbind();
$('.jumpingNav a, a.scrollTo, .scrollTo a').off();
$('.jumpingNav a, a.scrollTo, .scrollTo a').on('click', function() {
    var res = $(this).attr('href').split('#');
    scScrollTo('#' + res[1], 120);
    return false;
});



$(window).resize(function() {
    initMenu();
    sameHeight();
});

$(window).scroll(function() {
    initMenu();
    initJumpingNav(jumpingNavOffset);
});