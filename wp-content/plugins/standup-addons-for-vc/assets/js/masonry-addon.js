/*
VC custom masonry grid Jquery
*/

jQuery( document ).ready(function() {
    // init Masonry
    var $grid = jQuery('.pt-custom-masonry-grid').masonry({
      itemSelector: '.pt-custom-masonry-grid-item',
      percentPosition: true,
      columnWidth: '.pt-custom-masonry-grid-sizer'
    });
    // layout Isotope after each image loads
    $grid.imagesLoaded().progress( function() {
      $grid.masonry();
    }); 
});

