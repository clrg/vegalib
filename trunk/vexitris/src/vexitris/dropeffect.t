<!-- Copyright 2008 - see COPYING for details [LGPL] -->

<vexi xmlns:ui="vexi://ui" xmlns:meta="vexi://meta" xmlns="vexi.vegalib">
    <meta:doc>
        <author>Charles Goodwin</author>
        <notes>
            Drops a give item off the screen.
        </notes>
    </meta:doc>
    
    <ui:box align="topleft" layout="place">
        
        thisbox.gamethread;
        
        // optimized lookup of height
        var h = 0;
        thisbox.height ++= function(v) {
            cascade = v; h = v;
        }
        
        // optimized lookup of numchildren
        var num = 0;
        
        /** attach and drop the given box */
        thisbox.attach = function(b) {
            var dt = thisbox.distanceto(b);
            var bx = dt.x;
            var by = dt.y;
            thisbox[num++] = b;
            // maintain on-screen position
            b.x = bx;
            b.y = by;
            // box position properties are integers but we
            // need more precision so store them separately
            b.pos_x = bx;
            b.pos_y = by;
            // slighty random initial velocities
            b.vel_x = 10-vexi.math.floor(20*vexi.math.random());
            b.vel_y = 0-vexi.math.floor(20*vexi.math.random());
            // get started!
            if (num==1) gamethread.run(thisbox);
        }
        
        // optimized reference to power-of function
        var pow = vexi.math.pow;
        // standard y acceleration in pixels/second
        var acc = 1000;
        
        /** update invoked by gamethread */
        thisbox.call = function(gotime, dtime) {
            // dtime in seconds
            var dsecs = dtime/1000;
            for (var i=0; num>i; i++) {
                // accelerate and move box relative
                // to the time since last rendering
                var b = thisbox[i];
                
                // x has no acceleration, equation:
                //           d = v * t
                b.pos_x += b.vel_x * dsecs;
                b.x = b.pos_x;
                
                // y is accelerating according to:
                //         v = v0 + a * t
                var v0 = b.vel_y;
                var v1 = v0 + acc * dsecs;
                b.vel_y = v1;
                
                // y acceration, distance equation:
                //             v0^2 - v^2
                //        d = ------------
                //               2 * a
                b.pos_y += (pow(v1,2) - pow(v0,2)) / (2 * acc);
                b.y = b.pos_y;
                
                // remove boxes that are off-screen
                if (b.y > h) {
                    b.thisbox = null;
                    num--;
                    i--;
                }
            }
            // finished when there are no more blocks left
            return num==0;
        }
        
    </ui:box>
</vexi>
