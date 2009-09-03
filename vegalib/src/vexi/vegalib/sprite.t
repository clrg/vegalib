<!-- Copyright 2009 - MIT License -->

<vexi xmlns:meta="vexi://meta" xmlns="org.vexi.vegalib">
    <meta:doc>
        <author>Charles Goodwin</author>
        <desc>A straightforward animated sprite implementation</desc>
        <notes>
            The sprite is always animated, where sprite animations
            are part of a [set of] larger image which are selectively
            drawn.  This implementation assumes each sprite is of the
            same size i.e. the animations are laid out in grids.
            
            If most or all of your sprites have similar construction
            then assign .org.vegalib.sprite..defaults to an object
            containing the following properties:
            
            {
                width:32,            // integer
                height:32,           // integer
                startangle:0,        // integer
                clockwise:true,      // boolean
                orient:"horizontal", // "horizontal"|"vertical"
            }
            
            Where:
              - width/height describe the bounding size of each
                sprite within the assigned image.
              - startangle specifies the direction the sprite at
                0,0 position faces
              - clockwise (or anticlockwise) the turning direction
                of the animation sequence as you move from 0+
              - orient (horizontal/vertical) is the the animation
                sequence direction
            
            For sprites with custom properties, initialize them
            using their own properties object:
            
            var initobj = { width:100, height:100 /* etc */ }
            var customsprite = new .mygame.customsprite(initobj);
        </notes>
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
        
        ////////
        // Image handling
        
        thisbox.image ++= function(v) {
            cascade = v;
            $image.fill = v;
        }
        
        var numframes;
        var numanims;
        
        $image.width ++= function(v) {
            cascade = v;
            if (orient=="horizontal")
                numframes = v / spritewidth;
            else numanims = v / spritewidth;
        }
        
        $image.height ++= function(v) {
            cascade = v;
            if (orient=="horizontal")
                numanims = v / spritewidth;
            else numframes = v / spritewidth;
        }
        
        ////////
        // Sprite logic
        
        var init = arguments.length ? arguments[0] : static.defaults;
        var w = width = init.width;
        var h = height = init.height;
        var startangle = init.startangle;
        var clockwise = init.clockwise;
        
        thisbox.angle ++= function(v) {
        }
        
    </ui:box>
</vexi>