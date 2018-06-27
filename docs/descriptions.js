$( document ).ready( function() {
    $( "tbody tr" ).each(
        function( index, row ) {
            if ( index % 2 == 1 ) {
                var column = $( row ).children()[ 0 ];
                $( column ).attr( "colspan", row.cells.length );
            }
        }
    );
});
