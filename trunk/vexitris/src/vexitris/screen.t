<!-- Copyright 2009 - see COPYING for details [GPL] -->

<vexi xmlns:ui="vexi://ui" xmlns:meta="vexi://meta" xmlns="vexitris">
    <ui:box>
        
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
            var n = fadelist.numchildren;
            for (var i=fadefrom; n>i; i++)
                fadelist[i].fadeout = true;
            fadelist[fadefrom].finished ++= nextReady;
            fadelist[fadefrom].finished --= callee;
            return;
        }
        
        thisbox.start ++= function(v) {
            var n = fadelist.numchildren;
            for (var i=fadefrom; n>i; i++)
                fadelist[i].fadein = true;
            return;
        }
        
        thisbox.next ++= function(v) { cascade = v; fadeOut(); }
        
        thisbox.display ++= function(v) { cascade = v; if (v) start = true; }
        
    </ui:box>
</vexi>