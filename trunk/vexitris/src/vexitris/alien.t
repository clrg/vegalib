<!-- Copyright 2009 - see COPYING for details [GPL] -->

<vexi xmlns:ui="vexi://ui" xmlns:meta="vexi://meta" xmlns="vexitris.image">
    <ui:box redirect=":$content" shrink="true">
        <!-- precache is required because an unassigned box will never
          be "constrained" by reflow, so a "off-screen" holder trick is
          used to invoke constraining of images to get their dimensions -->
        <ui:box id="precache" width="0" height="0" />
        <ui:box id="content" />
        
        var cache = {};
        
        var assignAlien = function(v) {
            var a = cache[v];
            if (a==null) return false;
            if (thisbox[0]) thisbox[0] = null;
            thisbox[0] = a;
            return true;
        }
        
        var imageLoaded = function(v) {
            cascade = v;
            if (v>0) {
                cache[trapee.name] = trapee;
                assignAlien(trapee.name);
            }
        }
        
        var ttime;
        var moveto;
        var target;
        var running;
        var from_x, from_y;
        
        thisbox.face ++= function(v) {
            if (v==face) return;
            cascade = v;
            if (!assignAlien(v)) {
                var b = vexi.box;
                b.fill = .alien[v];
                b.name = v;
                b.width ++= imageLoaded;
                $precache[0] = b;
            }
        }
        
        thisbox.call = function(gotime, dtime) {
            ttime += dtime;
            if (ttime>=1000) {
                thisbox.x = target.x;
                thisbox.y = target.y;
                running = false;
                return true;
            }
            var dt = ttime/1000;
            thisbox.x = from_x + dt * (target.x-from_x);
            thisbox.y = from_y + dt * (target.y-from_y);
            return false;
        }
        
        var forwardDimensions = function(v) {
            cascade = v;
            if (moveto) moveto[trapname] = v;
        }
        thisbox.width ++= forwardDimensions;
        thisbox.height ++= forwardDimensions;
        
        thisbox.surface ++= function(v) {
            cascade = v;
            if (v) {
                v.face ++= function(v) { cascade = v; face = v; }
                v.facebox ++= function(v) {
                    var f = trapee.facebox;
                    moveto = v;
                    cascade = v;
                    if (!running) {
                        running = true;
                        surface.scheduler.run(thisbox);
                    }
                    // following logic operates on the premise that only
                    // one of the new facebox or old facebox may be null
                    if (v==null) {
                        target = { x:from_x, y:surface.frame.height };
                    } else {
                        target = surface.frame.distanceto(v);
                        v.width = width;
                        v.height = height;
                    }
                    if (f==null) {
                        from_x = target.x;
                        from_y = surface.frame.height;
                    } else {
                        from_x = thisbox.x;
                        from_y = thisbox.y;
                    }
                    // reset ttime
                    ttime = 0;
                }
            }
        }
        
    </ui:box>
</vexi>