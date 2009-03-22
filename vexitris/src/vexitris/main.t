<!-- Copyright 2008 - see COPYING for details [LGPL] -->

<vexi xmlns:ui="vexi://ui" xmlns:meta="vexi://meta" xmlns="vexitris"
    xmlns:vgl="vexi.vegalib" xmlns:wi="vexi.widget">
    <meta:doc>
        <author>Charles Goodwin</author>
        <notes>
        </notes>
    </meta:doc>
    
    <wi:surface />
    <vgl:game layout="place">
        <shape id="shape" />
        <dropeffect id="dropeffect" />
        
        $dropeffect.gamethread = vgl.scheduler({});
        
        Press1 ++= function(v) {
            var blocks = $shape.getBlocks();
            for (var i=0; blocks.length>i; i++)
                $dropeffect.attach(blocks[i]);
            var s = vexi.math.floor(7 * vexi.math.random());
            var c = vexi.math.floor(7 * vexi.math.random());
            $shape.newShape(s, c);
            cascade = v;
        }
        
        KeyPressed ++= function(v) {
            if (v=="left") $shape.rotateCCW();
            if (v=="right") $shape.rotateCW();
            cascade = v;
        }
        
        vexi.ui.frame = thisbox;
    </vgl:game>
</vexi>
