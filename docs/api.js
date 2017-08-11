$( document ).ready( function() {
    var url = location.origin;

    $( "tbody tr" ).each(
        function( index, row ) {
            var column = $( row ).children()[ 0 ];
            var app = $( column ).html();

            $.ajax({
                complete: function( xhr, textStatus ) {
                    if ( xhr.status == 200 ) {
                        var a = "<a href = '../" + app + "/api' target = '_blank'>API</a>";
                        $( $( row ).children()[ 4 ] ).html( a );
                    }
                },
                url: url + "/" + app + "/api"
            });
        }
    );
});
