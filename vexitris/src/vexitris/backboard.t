<!-- Copyright 2009 - see COPYING for details [GPL] -->

<vexi xmlns:ui="vexi://ui" xmlns:meta="vexi://meta" xmlns="vexitris">
    <zoomeffect>
        var blockcolor = "#5E2605";
        // backboard
        var b = new .board(12, 21);
        // left column
        for (var i=0; 20>i; i++) {
            b[0][i][0] = new .block(blockcolor);
        }
        // right column
        for (var i=0; 20>i; i++) {
            b[11][i][0] = new .block(blockcolor);
        }
        // bottom
        for (var i=0; 12>i; i++) {
            b[i][20][0] = new .block(blockcolor);
        }
        thisbox[0] = b;
    </zoomeffect>
</vexi>