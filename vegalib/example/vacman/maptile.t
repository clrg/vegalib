<!-- Copyright 2009 - MIT License -->

<vexi xmlns:ui="vexi://ui" xmlns="vacman">
    <ui:box redirect=":$content" align="topleft" layout="place" width="32" height="32">
        <ui:box id="tile" />
        <ui:box id="content" />
        
        thisbox.iswall = true;
        
        thisbox.type ++= function(v) {
            cascade = v;
            switch(v) {
            case .map..wall:
                $tile.fill = .image.wall_blue;
                iswall = true;
                break;
            default:
                $tile.fill = "black";
                break;
            }
        }
        
        thisbox.near ++= function(v) {
            // v = [n, e, s, w]
            if (v[0]) {
                if (v[1]) {
                    if (v[2]) {
                        if (v[3]) { $tile.x = -96; $tile.y = -96; } // n,e,s,w
                        else { $tile.x = -64; $tile.y = -96; } // n,e,s
                    } else {
                        if (v[3]) { $tile.x = -32; $tile.y = -96; } // n,e,w
                        else { $tile.x = -64; $tile.y = -64; } // n,e
                    }
                } else {
                    if (v[2]) {
                        if (v[3]) { $tile.x = 0; $tile.y = -96; } // n,s,w
                        else { $tile.x = -64; $tile.y = -32; } // n,s
                    } else {
                        if (v[3]) { $tile.x = -32; $tile.y = -64; } // n,w
                        else { $tile.x = 0; $tile.y = -32; } // n
                    }
                }
            } else {
                if (v[1]) {
                    if (v[2]) {
                        if (v[3]) { $tile.x = -96; $tile.y = -64; } // e,s,w
                        else { $tile.x = -96; $tile.y = -32; } // e,s
                    } else {
                        if (v[3]) { $tile.x = -32; $tile.y = -32; } // e,w
                        else { $tile.x = -32; $tile.y = 0; } // e
                    }
                } else {
                    if (v[2]) {
                        if (v[3]) { $tile.x = 0; $tile.y = -64; } // s,w
                        else { $tile.x = -64; $tile.y = 0; } // s
                    } else {
                        if (v[3]) { $tile.x = -32; $tile.y = -64; } // w
                        else { $tile.x = 0; $tile.y = 0; } // o
                    }
                }
            }
            return;
        }
        
    </ui:box>
</vexi>