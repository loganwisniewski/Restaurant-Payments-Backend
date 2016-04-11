<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Web Chef (for now)</title>
        {{ assets.outputCss() }}
        {{ assets.outputJs() }}
    </head>
    <body>

        <!-- Restaurant ID Modal -->
        <div id="verifyRestaurant" class="modal fade" data-backdrop="static">
            <div class="modal-dialog">
                <div class="modal-content" id="verifyContent">

                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->

        {{ content() }}

    </body>
</html>
