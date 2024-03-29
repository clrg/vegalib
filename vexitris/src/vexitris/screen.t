<!-- Copyright 2009 - see COPYING for details [GPL] -->

<vexi xmlns:ui="vexi://ui" xmlns:meta="vexi://meta" xmlns="vexitris">
    <ui:box>
        
        thisbox.alienbox;
        thisbox.finished;
        thisbox.fadelist;
        thisbox.fadefrom = 0;
        thisbox.next;
        
        var nextReady = function(v) {
            cascade = v;
            display = false;
            next.display = true;
            trapee[trapname] --= callee;
            next = null;
        }
        
        var fadeOut = function(v) {
            if (fadelist==null) {
                return;
            }
            var n = typeof(fadelist)=="array" ? fadelist.length : fadelist.numchildren;
            for (var i=fadefrom; n>i; i++) {
                fadelist[i].fadeout = true;
            }
            fadelist[fadefrom].finished ++= nextReady;
            fadelist[fadefrom].finished --= callee;
            return;
        }
        
        thisbox.visible ++= function(v) {
            cascade = v;
            if (!v) {
                return;
            }
            thisbox.reflow();
            surface.facebox = alienbox;
            if (fadelist==null) return;
            var n = typeof(fadelist)=="array" ? fadelist.length : fadelist.numchildren;
            for (var i=fadefrom; n>i; i++) {
                fadelist[i].fadein = true;
            }
        }
        
        thisbox.next ++= function(v) { cascade = v; fadeOut(); }
        
    </ui:box>
</vexi>