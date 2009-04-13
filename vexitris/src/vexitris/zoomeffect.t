<!-- Copyright 2009 - see COPYING for details [GPL] -->

<vexi xmlns:ui="vexi://ui" xmlns:meta="vexi://meta" xmlns="vexi.vegalib">
    <meta:doc>
        <author>Charles Goodwin</author>
        <notes>
            Takes a board of blocks and grows/shrinks the blocks
        </notes>
    </meta:doc>
    
    <ui:box>
        
        thisbox.gamethread;
        
        var zoomeffect = function(board, show) {
            var range = 5;
            var numx = board.numchildren;
            var numy = board[0].numchildren;
            var curx = 0;
            var inc = show ? 4 : -4;
            surface.scheduler.run({
                call:function(gotime, dtime) {
                    if (curx - numy - range > numx) return true;
                    // dtime in seconds
                    var dsecs = dtime/1000;
                    for (var j=0; numy>j; j++) {
                        for (var i=0; range>i; i++) {
                            if (0 > curx-i-j) continue;
                            if (curx-i-j >= numx) continue;
                            var b = board[curx-i-j][j][0];
                            if (b) {
                                b.width += inc;
                                b.height += inc;
                            }
                        }
                    }
                    curx++;
                    return false;
                }
            });
        }
        
        var zoomstate = false;
        
        thisbox.zoom ++= function(v) {
            var b = thisbox[0];
            if (b==null) return;
            zoomstate = !zoomstate;
            zoomeffect(b, zoomstate);
            return;
        }
        
        /** initalize contents to be hidden */
        thisbox.Children ++= function(v) {
            cascade = v;
            if (v) {
                var nx = v.numchildren;
                for (var i=0; nx>i; i++) {
                    var ny = v[i].numchildren;
                    for (var j=0; ny>j; j++) {
                        var b = v[i][j][0];
                        if (b==null) continue;
                        b.width = 0;
                        b.height = 0;
                    }
                }
            }
        }
        
    </ui:box>
</vexi>
