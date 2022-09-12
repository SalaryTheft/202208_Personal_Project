let isHamMenuOpen = false;
let isSearchOpen = false;

$(function () {
    $("#hamburger-toggle").click(function () {
        if (isHamMenuOpen) {
            $(".hamburger-menu").slideUp();
            $("#hamburger-toggle").attr("name", "menu-outline");
            isHamMenuOpen = false;
        } else {
            $(".hamburger-menu").slideDown({
                start: function () {
                    $(this).css({
                        display: "flex"
                    })
                }
            });
            $("#hamburger-toggle").attr("name", "close-outline");
            isHamMenuOpen = true;
        }

    });

    $("#search-toggle").click(function () {
        if (isSearchOpen) {
            $(".search").slideUp();
            isSearchOpen = false;
            $("#search-toggle").attr("name", "search-outline");
        } else {
            $(".search").slideDown({
                start: function () {
                    $(this).css({
                        display: "block"
                    })
                }
            });
            $("#search-toggle").attr("name", "chevron-up-outline");
            $("#search-input").focus();
            isSearchOpen = true;
        }
    });


});