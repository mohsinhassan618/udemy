function sortable_image_gallery_media( $imageContainer, $imageInput ) {
    'use strict'; // use for avoid global variables
 
    var file_frame;
 
    /**
     * If an instance of file_frame already exists, then we can open it
     * rather than creating a new instance.
     */
  
    if ( undefined !== file_frame ) {
        file_frame.open();
        return;
    }
 
    /**
     * If we're this far, then an instance does not exist, so we need to
     * create our own.
     *
     * Here, use the wp.media library to define the settings of the Media
     * Uploader. We're opting to use the 'post' frame which is a template
     * defined in WordPress core and are initializing the file frame
     * with the 'insert' state.
     *
     * We're also not allowing the user to select more than one image.
     */
    file_frame =  wp.media({
       // frame:    "post",
       // state:    "gallery-edit",
        multiple: true,
    });

    file_frame.on('open',function() {
      var selection = file_frame.state().get('selection');
      var ids = $imageInput.val().split(',');
        ids.forEach(function(id) { // foreach call function for each element of an array
          var attachment = wp.media.attachment(id); // getting the attachment
          attachment.fetch();
          selection.add( attachment ? [ attachment ] : [] );
        });
    });

    // When an image is selected in the media frame...
    file_frame.on( 'select', function() {
      
      // Get media attachment details from the frame state
      var attachments = file_frame.state().get('selection').toJSON();

      var attachmentIDs = [];
      $imageContainer.empty();
      var $galleryID = $imageContainer.attr("id");
      for( var i = 0; i < attachments.length; i++ ) {
        if( attachments[ i ].type == "image" ) {
          attachmentIDs.push( attachments[ i ].id );
          $imageContainer.append( sortable_gallery_image_create( attachments[ i ], $galleryID ) );
        }
      }
  
      $imageInput.val( attachmentIDs.join() ); // join function join an array into a string
      sortable_gallery_image_remove();
    });
    // Now display the actual file_frame
    file_frame.open();
}

function sortable_gallery_image_create( $attachment, $galleryID ) {

    var $output = '<li tabindex="0" role="checkbox" aria-label="' + $attachment.title + '" aria-checked="true" data-id="' + $attachment.id + '" class="attachment save-ready selected details">';
    $output += '<div class="attachment-preview js--select-attachment type-image subtype-jpeg portrait">';
    $output += '<div class="thumbnail">';
    $output += '<div class="centered">';
    $output += '<img src="' + $attachment.sizes.thumbnail.url + '" draggable="false" alt="">';
    $output += '</div>';
    $output += '</div>';
    $output += '</div>';
    $output += '<button type="button" data-gallery="#' + $galleryID + '" class="button-link check asap-image-remove" tabindex="0"><span class="media-modal-icon"></span><span class="screen-reader-text">Deselect</span></button>';
    $output += '</li>';

    return $output;

}

function sortable_gallery_image_remove( ) {
    jQuery(".remove-sortable-wordpress-gallery-image").on( 'click', function() {
        $id = jQuery(this).parent().attr("data-id");
        $gallery = jQuery(this).attr("data-gallery");
        $imageInput = jQuery( $gallery + "_input" );
        jQuery(this).parent().remove();
        var ids = $imageInput.val().split(',');
        $idIndex = ids.indexOf( $id ); //The indexOf() method returns the position of the first occurrence of a specified value in a string.
        if( $idIndex >= 0 ) {
            ids.splice( $idIndex, 1 ); //removes the item from array array.splice(index, howmany)
            $imageInput.val( ids.join() );
        }
    });
}


(function($){


    $(document).ready(function(){
        var imageButton = $(".add-sortable-wordpress-gallery");
        sortable_gallery_image_remove();
        imageButton.each( function() {
            var galleryID = $(this).attr("data-gallery");
            var imageContainer = $( galleryID );
            var imageInput = $( galleryID + "_input" );
            imageContainer.sortable();
            imageContainer.on( "sortupdate", function( event, ui ) {
                $ids = []; // $ is the part of variable name and a variable without var keyword is declared as global but 'use strict'; is use to avoid it
                $images = imageContainer.children("li");// get all li children
                $images.each( function(){
                    $ids.push( $(this).attr("data-id") ); //The push() method adds new items to the end of an array, and returns the new length.
                });
                imageInput.val($ids.join());// Join keyword is used to convert an array into string
            } );

            $(this).on('click', function() {
                sortable_image_gallery_media( imageContainer, imageInput );
            });

        });

    });
})(jQuery);