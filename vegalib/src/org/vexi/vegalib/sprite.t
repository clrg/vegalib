<!-- Copyright 2009 - MIT License -->

<vexi xmlns:ui="vexi://ui" xmlns:meta="vexi://meta">
    <meta:doc>
        <author>Charles Goodwin</author>
        <notes>See vexi.vegalib for usage details</notes>
    </meta:doc>
    
    static.defaults = {
        width:32,
        height:32,
        startangle:0,
        clockwise:true
        // box default orient:"horizontal"
    }
    
    <ui:box align="topleft" layout="place">
        <ui:box id="image" />
        
        var init = arguments[0];
        if (init==null) init = static.defaults;
        for (var setting in init) {
            thisbox[setting] = init[setting];
        }
        
        thisbox.image ++= function(v) {
            cascade = v;
            $image.fill = v;
        }
        
        var numframes;
        var numanims;
        
        $image.width ++= function(v) {
            cascade = v;
            if (orient=="horizontal")
                numframes = v / width;
            else numanims = v / width;
        }
        
        $image.height ++= function(v) {
            cascade = v;
            if (orient=="horizontal")
                numanims = v / height;
            else numframes = v / height;
        }
        
        thisbox.angle ++= function(v) {
            /* establish anim */
        }
        
        thisbox.percent ++= function(v) {
            /* establish frame */
        }
        
    </ui:box>
</vexi>