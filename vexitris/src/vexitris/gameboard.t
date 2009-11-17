<!-- Copyright 2009 - see COPYING for details [GPL] -->

<vexi xmlns:ui="vexi://ui" xmlns:meta="vexi://meta" xmlns="vexitris">
    <ui:box layout="layer" align="topleft">
        <shape id="piece" />
        
        thisbox[0] = new .board(10, 20);
        
        thisbox.startgame = function() {
            var s = vexi.math.floor(7 * vexi.math.random());
            $piece.newShape(s);
            surface.scheduler.run(thisbox);
        }
        
        thisbox.call = function(dtime, gotime) {
        }
        
        thisbox.drop = function() { }
        
        thisbox.rotateCW = function() { $piece.rotateCW(); }
        
        thisbox.rotateCCW = function() { $piece.rotateCW(); }
        
        thisbox.moveDown = function() { }
        
        thisbox.moveLeft = function() { }
        
        thisbox.moveRight = function() { }
        
    </ui:box>
</vexi>