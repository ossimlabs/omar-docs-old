$( document ).ready( function() {
    $( "tbody tr" ).each(
        function( index, row ) {
            var column = $( row ).children()[ 0 ];
            if ( index % 2 == 0 ) {
                var app = $( column ).html();

                var url = "/" + app + "/api";
                $.ajax({
                    complete: function( xhr, textStatus ) {

                        var swaggerColumn = $( row ).children()[ 4 ];
                        if ( xhr.status == 200 ) {
                            var a = "<a href = '" + url + "' target = '_blank'>API</a>";
                            $( swaggerColumn ).html( a );
                        }
                        else {
                            $( swaggerColumn ).html( "" );
                        }
                    },
                    url: url
                });
            }
            else {
                $( column ).attr( "colspan", row.cells.length );
            }
        }
    );
});
