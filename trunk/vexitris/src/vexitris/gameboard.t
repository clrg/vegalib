<!-- Copyright 2009 - see COPYING for details [GPL] -->

<vexi xmlns:ui="vexi://ui" xmlns:meta="vexi://meta" xmlns="vexitris">
    <ui:box layout="layer">
        <shape id="piece" />
        
        thisbox[0] = .board(vexi.box, [10, 20]);
        
        thisbox.startgame = function() {
            var s = vexi.math.floor(7 * vexi.math.random());
            $shape.newShape(s);
            surface.scheduler.run(thisbox);
        }
        
        thisbox.call = function(dtime, gotime) {
        }
        
    </ui:box>
</vexi>