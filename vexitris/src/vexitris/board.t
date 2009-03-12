<!-- Copyright 2008 - see COPYING for details [LGPL] -->

<vexi xmlns:ui="vexi://ui" xmlns:meta="vexi://meta" xmlns="vexitris">
    <meta:doc>
        <author>Charles Goodwin</author>
        <notes>
            This the Tetris game area.  It is an arbitrarily sized grid
            of space widgets, accessed using $board[x][y].
        </notes>
    </meta:doc>
    
    <ui:box>
        
        var dimX = arguments[0];
        var dimY = arguments[1];
        
        for (var i=0; dimX>i; i++) {
            var b = vexi.box;
            thisbox[i] = b;
            for (var j=0; dimY>j; j++) {
                b[j] = .space(vexi.box);
                b[j].orient = "vertical";
            }
        }
        
    </ui:box>
</vexi>
