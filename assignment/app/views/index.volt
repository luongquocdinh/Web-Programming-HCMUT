<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        {{ get_title() }}
        {{ stylesheet_link('css/avatar.css') }}
        {{ stylesheet_link('css/bootstrap.min.css') }}
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Your invoices">
        <meta name="author" content="Phalcon Team">
    </head>
    <body>
        {{ content() }}
        {{ javascript_include('js/jquery.min.js') }}
        {{ javascript_include('js/bootstrap.min.js') }}
        {{ javascript_include('js/utils.js') }}
        <script>
            $(function () {
                $(":file").change(function () {
                    if (this.files && this.files[0]) {
                        var reader = new FileReader();
                        reader.onload = imageIsLoaded;
                        reader.readAsDataURL(this.files[0]);
                    }
                });
                $(":file").filestyle({input: false});
            });

            function imageIsLoaded(e) {
                $('#myImg').attr('src', e.target.result);
            };

            function showimagepreview(input) { //image preview after select image
              if (input.files && input.files[0]) {
                var filerdr = new FileReader();

                filerdr.onload = function(e) {
                  var img = new Image();

                  img.onload = function() {
                    var canvas = document.createElement('canvas');
                    var ctx = canvas.getContext('2d');
                    canvas.width = 250;
                    canvas.height = canvas.width * (img.height / img.width);
                    ctx.drawImage(img, 0, 0, canvas.width, canvas.height);

                    // SEND THIS DATA TO WHEREVER YOU NEED IT
                    var data = canvas.toDataURL('image/png');

                    $('#myImg').attr('src', img.src);
                    //$('#imgprvw').attr('src', data);//converted image in variable 'data'
                  }
                  img.src = e.target.result;
                }
                filerdr.readAsDataURL(input.files[0]);
              }
            }

            $(document).ready(function() {
                $("#myImg").css("height", "200px");
                $("#myImg").css("width", "150px");
            });
        </script>
    </body>
</html>