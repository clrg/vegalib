<!-- Copyright 2009 - see COPYING for details [GPL] -->

<vexi xmlns:ui="vexi://ui" xmlns:meta="vexi://meta" xmlns="vexitris">
    <meta:doc>
        <author>Charles Goodwin</author>
        <notes>
            This the Tetris game area.  It is an arbitrarily sized grid
            of space widgets, accessed using $board[x][y].
        </notes>
    </meta:doc>
    
    <ui:box shrink="true">
        
        var dimX = arguments[0];
        var dimY = arguments[1];
        
        for (var i=0; dimX>i; i++) {
            var b = vexi.box;
            thisbox.add(b);
            b.orient = "vertical";
            for (var j=0; dimY>j; j++) {
                b.add(new .space());
            }
        }
        
    </ui:box>
</vexi>
