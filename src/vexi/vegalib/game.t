<!-- LGPL -->

<vexi xmlns:ui="vexi://ui">
    <ui:box>
        
        var player;
        thisbox.setPlayer = function(v) {
            player = v;
        }
        
        thisbox.KeyPressed ++= function(v) {
            if (player) player.KeyPressed = v;
            return;
        }
        
        thisbox.KeyReleased ++= function(v) {
            if (player) player.KeyReleased = v;
            return;
        }
        
        var units = [];
        var unlen = 0;
        thisbox.addUnit = function(v) { units[units.length] = v; unlen++; }
        thisbox.removeUnit = function(v) {
            for (var i=0; unlen>i; i++) {
                if (units[i]==v) {
                    units.splice(i, 1);
                    unlen--;
                    break;
                }
            }
        }
        
        thisbox.Children ++= function(v) {
            if (!v and trapee[trapname]) removeUnit(trapee[trapname]);
            cascade = v;
            if (v) addUnit(v);
        }
        
        var run = true;
        var time;
        var dtime = 50;
        var fcount = 0;
        thisbox.start = function() {
            run = true;
            vexi.thread = function() {
                while (run) {
                    time = vexi.date().getTime();
                    for (var i=0; unlen>i; i++) {
                        units[i].animate();
                    }
                    dtime = vexi.date().getTime() - time;
                    if (40>dtime) vexi.thread.sleep(40-dtime);
                }
            }
        }
        
        thisbox.visible ++= function(v) {
            cascade = v;
            if (!v) run = false;
        }
        
    </ui:box>
</vexi>