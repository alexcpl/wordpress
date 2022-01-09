    // Full artical on https://therichpost.com/hide-wordpress-content-non-logged-users/
    
    // functions.php file code
    add_shortcode( 'member', 'member_check_shortcode' );
    function member_check_shortcode( $atts, $content = null ) {
         if ( is_user_logged_in() && !is_null( $content ) && !is_feed() )
         return $content;
         return '';
    }
    
    //Here you can use this hook into wordpress dashboard post or pages :
    [member]
    Plugin Code
    [/member]
    
    //if you want to use it in a PHP template file, you can do it like this:
    echo do_shortcode( '[member]' . $youcodetext. '[/member]' );
