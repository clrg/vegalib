<!-- Copyright 2008 - see COPYING for details [LGPL] -->

<vexi xmlns:ui="vexi://ui" xmlns:meta="vexi://meta" xmlns="org.vexi.lib.layout">
    <meta:doc>
        <author>Charles Goodwin</author>
        <todo>
            Support fade skipping using 'showContents' or something similar
        </todo>
    </meta:doc>
    
    <ui:box redirect=":$content" layout="layer">
        <ui:box id="content" />
        <ui:box id="overlay" fill="black" />
        
        v_content = $content;
        v_textbox = null;
        v_overlay = $overlay;
        
        var alphastate = 255;
        var fadein = false;
        var fadeprop = null;
        var fillbase = "000000";
        var isfading = false;
        var time = 0;
        
        thisbox.fadecolor ++= function() { return '#'+fillbase; }
        thisbox.fadeperiod = 2000;
        thisbox.fading ++= function() { return isfading; }
        thisbox.finished = false;
        thisbox.waitperiod = 2000;
        
        /** call implementation for scheduling */
        thisbox.call = function(gotime, dtime) {
            // dtime in seconds
            time += dtime;
            var dfill = vexi.math.floor(255 * time/fadeperiod);
            var finished = false;
            if (fadein) {
                alphastate = startstate - dfill;
                if (0 >= alphastate) {
                    alphastate = 0;
                    finished = true;
                }
            } else {
                alphastate = startstate + dfill;
                if (alphastate >= 255) {
                    alphastate = 255; 
                    finished = true;
                }
            }
            if (useoverlay) {
                var a = alphastate.toString(16);
                var f = '#'+ (a.length>1?'':'0') + a + fillbase;
                $overlay.fill = f;
            } else {
                var a = (255-alphastate).toString(16);
                var f = '#'+ (a.length>1?'':'0') + a + fillbase;
                thisbox[fadeprop] = f;
            }
            if (finished) {
                isfading = false;
                thisbox.finished = true;
            }
            return finished;
        }
        
        /** function to fade in then out with a gap period of 'ms' milliseconds */
        thisbox.fade ++= function(v) {
            fadein = !fadein;
            startstate = alphastate;
            time = 0;
            if (isfading==false) {
                isfading = true;
                surface.scheduler.run(thisbox);
            }
            return;
        }
        
        thisbox.fadecolor ++= function(v) {
            fillbase = vexi.ui.getColor(v).substring(1);
            if (!isfading and fadein) {
                thisbox[fadeprop] = '#'+fillbase;
            }
            return;
        }
        
        // conditional fade i.e. only in or only out
        thisbox.fadein ++= function(v) { if (!fadein) fade = true; return; }
        thisbox.fadeout ++= function(v) { if (fadein) fade = true; return; }
        
        thisbox.finish ++= function(v) {
            if (useoverlay) {
                var f = (fadein?"#ff":"#00")+fillbase;
                $overlay.fill = f;
            } else {
                var f = (fadein?"#00":"#ff")+fillbase;
                thisbox[fadeprop] = f;
            }
            isfading = false;
            thisbox.finished = true;
            return;
        }
        
        thisbox.fadetype ++= function(v) {
            switch (v) {
            case "textcolor":
            case "fill":
                fadeprop = v;
                useoverlay = false;
                $overlay.display = false;
                return;
            case "overlay":
                useoverlay = true;
                $overlay.display = true;
                return;
            case null:
                fadetype = "fill";
                return;
            default:
                throw "invalid fadetype '"+v+"'";
            }
        }
        
    </ui:box>
    <container />
</vexi>
