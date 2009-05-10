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
            width = a.width;
            height = a.height;
            return true;
        }
        
        var imageLoaded = function(v) {
            cascade = v;
            vexi.trace("imageLoaded: "+trapname+", "+v);
            if (v>0) {
                cache[trapee.name] = trapee;
                assignAlien(trapee.name);
            }
        }
        
        thisbox.face ++= function(v) {
            vexi.trace("face: "+v);
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
        
        var ttime;
        var target;
        var running;
        var from_x, from_y;
        
        thisbox.call = function(gotime, dtime) {
        vexi.trace("calling alien");
            ttime += dtime;
            if (ttime>=1000) {
                thisbox.x = target.x;
                thisbox.y = target.y;
                running = false;
                return true;
            }
            var dt = ttime/1000;
            thisbox.x = dt * (target.x-from_x);
            thisbox.y = dt * (target.y-from_y);
            return false;
        }
        
        thisbox.surface ++= function(v) {
            cascade = v;
            if (v) {
                v.face ++= function(v) { cascade = v; face = v; }
                v.facebox ++= function(v) {
                    var f = trapee.facebox;
                    target = v;
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