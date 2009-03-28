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
        
        var logo = ["* *  *  * * *** *   **  ***  **",
                    "* * * * * *  *  *** * *  *  *  ",
                    "* * ***  *   *  *   **   *   * ",
                    "* * *   * *  *  *   * *  *    *",
                    " *   ** * * ***  ** * * *** ** "];
        
        var logowidth = logo[0].length;
        var logoheight = logo.length;
        var logoboard = .board(vexi.box, [logowidth, logoheight]);
        thisbox[0] = logoboard;
        
        for (var i=0; logowidth>i; i++) {
            for (var j=0; logoheight>j; j++) {
                if (logo[j].charAt(i)!='*') continue;
                var b = .block(vexi.box);
                b.fill = "blue";
                vexi.trace(i+", "+j);
                logoboard[i][j][0] = b;
            }
        }
        
    </ui:box>
</vexi>
