<!-- Copyright 2009 - MIT License -->

<vexi xmlns:ui="vexi://ui" xmlns="vacman">
    <ui:box>
        <ui:box id="map" orient="vertical" shrink="true" />
        
        var near = [];             // reusable array
        var wall = static.wall;    // convenience
        var m = static.maps[0];    // grab a map
        var x_l = m.length;        // convenience
        for (var i,m_i in m) {
            var y_l = m_i.length;  // convenience
            var row = vexi.box;
            $map[i] = row;
            for (var j,m_i_j in m_i) {
                var t = new .maptile();
                t.type = m_i_j;
                if (t.iswall) {
                    near[0] = i>0 and (m[i-1][j] == wall);     // n
                    near[1] = y_l>j+1 and (m[i][j+1] == wall); // e
                    near[2] = x_l>i+1 and (m[i+1][j] == wall); // s
                    near[3] = j>0 and (m[i][j-1] == wall);     // w
                    t.near = near;
                }
                row[j] = t;
            }
        }
        
    </ui:box>
    
    var e=0; // empty
    var w=1; // wall
    var P=2; // powerup
    var S=3; // player start
    var G=4; // ghost1 start
    var H=5; // ghost2 start
    var J=6; // ghost3 start
    var K=7; // ghost4 start
    static.wall = w;
    
    var map1 = [ [ w,w,w,w,w,w,w,e,w,w,w,w,w,w,w ],
                 [ w,e,e,e,e,e,e,e,e,e,e,e,e,e,w ],
                 [ w,P,w,w,w,e,w,w,w,e,w,w,w,P,w ],
                 [ w,e,e,e,w,e,e,w,e,e,w,e,e,e,w ],
                 [ w,w,w,e,w,w,e,w,e,w,w,e,w,w,w ],
                 [ e,e,e,e,e,e,e,e,e,e,e,e,e,e,e ],
                 [ w,w,w,w,e,w,w,d,w,w,e,w,w,w,w ],
                 [ w,e,e,e,e,w,e,G,e,w,e,e,e,e,w ],
                 [ w,e,w,w,e,w,H,J,K,w,e,w,w,e,w ],
                 [ w,e,w,e,e,w,w,w,w,w,e,e,w,e,w ],
                 [ e,e,e,e,w,w,e,e,e,w,w,e,e,e,e ],
                 [ w,e,w,e,w,e,e,w,e,e,w,e,w,e,w ],
                 [ w,e,w,e,w,e,w,w,w,e,w,e,w,e,w ],
                 [ w,e,e,e,e,e,e,S,e,e,e,e,e,e,w ],
                 [ w,P,w,w,w,e,w,w,w,e,w,w,w,P,w ],
                 [ w,e,e,e,e,e,e,e,e,e,e,e,e,e,w ],
                 [ w,w,w,w,w,w,w,e,w,w,w,w,w,w,w ] ];
    
    static.maps = [map1];
    
</vexi>