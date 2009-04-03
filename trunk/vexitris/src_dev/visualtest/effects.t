<!-- Copyright 2008 - see COPYING for details [LGPL] -->

<vexi xmlns:ui="vexi://ui" xmlns:meta="vexi://meta" xmlns="vexitris"
    xmlns:vgl="vexi.vegalib" xmlns:wi="vexi.widget">
    <meta:doc>
        <author>Charles Goodwin</author>
        <notes>
        </notes>
    </meta:doc>
    
    <wi:surface />
    <ui:box fill="black" layout="place">
        <zoomeffect id="zoom">
            <logo />
        </zoomeffect>
        <ui:box layout="place">
            <shape id="shape" />
            <dropeffect id="dropeffect" />
            <ui:box id="fpsdisplay" align="topright" textcolor="white">
                vexi.ui.fontsize.medium = "16";
                //vexi.ui.font.defaultstream = .font["slkscr.ttf"];
                font = .font["slkscr.ttf"];
            </ui:box>
        </ui:box>
        
        var s = vgl.scheduler({});
        s.fps ++= function(v) { cascade = v; $fpsdisplay.text = v+" frames per second"; }
        surface.scheduler = s;
        
        Press1 ++= function(v) {
            var blocks = $shape.getBlocks();
            for (var i=0; blocks.length>i; i++)
                $dropeffect.attach(blocks[i]);
            var s = vexi.math.floor(7 * vexi.math.random());
            var c = vexi.math.floor(7 * vexi.math.random());
            $shape.newShape(s, c);
            cascade = v;
        }
        
        Press2 ++= function(v) {
            $zoom.zoom = true;
            cascade = v;
        }
        
        KeyPressed ++= function(v) {
            if (v=="left") $shape.rotateCCW();
            if (v=="right") $shape.rotateCW();
            cascade = v;
        }
        
        vexi.thread = function() {
            vexi.ui.frame = thisbox;
            $zoom.zoom = true;
        }
        
    </ui:box>
</vexi>
