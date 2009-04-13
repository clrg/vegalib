<!-- Copyright 2009 - see COPYING for details [GPL] -->

<vexi xmlns:ui="vexi://ui" xmlns:meta="vexi://meta" xmlns="vexitris">
    <ui:box>
        
        thisbox.finished;
        thisbox.fadelist;
        thisbox.fadefrom = 0;
        
        var fadeOut = function(v) {
            cascade = v;
            var n = fadelist.numchildren;
            for (var i=fadefrom; n>i; i++)
                fadelist[i].fade = true;
            fadelist[fadefrom].finished ++= function(v) { finished = true; return; }
            surface.KeyPressed --= callee;
            Press1 --= callee;
            Press2 --= callee;
            Press3 --= callee;
        }
        
        thisbox.start ++= function(v) {
            var n = fadelist.numchildren;
            for (var i=fadefrom; n>i; i++)
                fadelist[i].fade = true;
            surface.KeyPressed ++= fadeOut;
            Press1 ++= fadeOut;
            Press2 ++= fadeOut;
            Press3 ++= fadeOut;
            return;
        }
        
        thisbox.display ++= function(v) { cascade = v; if (v) start = true; }
        
    </ui:box>
</vexi>