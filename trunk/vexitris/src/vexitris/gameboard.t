<!-- Copyright 2009 - see COPYING for details [GPL] -->

<vexi xmlns:ui="vexi://ui" xmlns:meta="vexi://meta" xmlns="vexitris">
    <ui:box layout="layer" align="topleft">
        <shape id="piece" />
        <ui:box id="cover" />
        
        thisbox[0] = new .board(10, 20);
        
        var px, py;
        
        thisbox.newPiece = function() {
            var s = vexi.math.floor(7 * vexi.math.random());
            $piece.newShape(s);
        }
        
        thisbox.rotateCW = function() { $piece.rotateCW(); }
        
        thisbox.rotateCCW = function() { $piece.rotateCCW(); }
        
        thisbox.moveDown = function() { }
        
        thisbox.moveLeft = function() { }
        
        thisbox.moveRight = function() { }
        
        thisbox.drop = function() {
            while (moveDown()) { }
        }
        
        thisbox.pausegame = function() {
        }
        
        thisbox.startgame = function() {
            surface.scheduler.run(thisbox);
        }
        
        thisbox.call = function(dtime, gotime) {
        }
        
    </ui:box>
</vexi>