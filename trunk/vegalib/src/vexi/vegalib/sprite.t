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
                image:foo.bar        // Stream
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
        
    <sprite />
</vexi>