<!-- Copyright 2008 - see COPYING for details [LGPL] -->

<vexi xmlns:ui="vexi://ui" xmlns:meta="vexi://meta">
    <meta:doc>
        <author>Charles Goodwin</author>
        <todo>
            support fade skipping using 'showContents' or something similar
        </todo>
    </meta:doc>
    
    <vexi.util.redirect />
    <ui:box redirect=":$content" layout="layer">
        <ui:box id="content" />
        <ui:box id="overlay" fill="black" />
        
        addRedirect(thisbox, $content, "font", "fontsize", "text", "textcolor");
        
        thisbox.fadeperiod = 2000;
        thisbox.fading = false;
        thisbox.finished = false;
        thisbox.waitperiod = 2000;
        
        var time = 0;
        var fadein = false;
        var isfading = false;
        var fillbase = "000000";
        var alphastate = 255;
        
        thisbox.call = function(gotime, dtime) {
            // dtime in seconds
            time += dtime;
            var dfill = vexi.math.floor(255 * time/fadeperiod);
            var finished = false;
            if (fadein) {
                alphastate = startstate - dfill;
                if (0 > alphastate) {
                    alphastate = 0;
                    finished = true;
                }
            } else {
                alphastate = startstate + dfill;
                if (alphastate > 255) {
                    alphastate = 255; 
                    finished = true;
                }
            }
            var a = alphastate.toString(16);
            var f = '#'+ (a.length>1?'':'0') + a + fillbase;
            $overlay.fill = f;
            try { if (finished) thisbox.finished = true; }
            finally { return finished; }
        }
        
        /** function to fade in then out with a gap period of 'ms' milliseconds */
        thisbox.fade ++= function(v) {
            fadein = !fadein;
            startstate = alphastate;
            time = 0;
            surface.scheduler.run(thisbox);
            return;
        }
        
    </ui:box>
</vexi>
