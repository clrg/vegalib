<!-- Copyright 2009 - MIT License -->

<vexi xmlns:ui="vexi://ui" xmlns="pacman">
    <ui:box>
        <ui:box id="map" orient="vertical" shrink="true" />
        
        var m = static.maps[0];
        var l = m.length;
        var near = [];
        for (var i=0; l>i; i++) {
            var row = vexi.box;
            var m_i = m[i];
            var i_l = m_i.length;
            $map[i] = row;
            for (var j=0; i_l>j; j++) {
                var t = .maptile(vexi.box);
                t.type = m_i[j];
                if (t.iswall) {
                    near[0] = i>0 and m[i-1][j] == static.wall;     // n
                    near[1] = i_l>j+1 and m[i][j+1] == static.wall; // e
                    near[2] = l>i+1 and m[i+1][j] == static.wall;   // s
                    near[3] = j>0 and m[i][j-1] == static.wall;     // w
                    t.near = near;
                }
                row[j] = t;
            }
        }
         
    </ui:box>
    
    var e=0; // empty
    var w=1; // wall
    var u=2; // powerup
    var p=3; // player start
    var g=4; // ghost1 start
    var h=5; // ghost2 start
    var j=6; // ghost3 start
    var k=7; // ghost4 start
    static.wall = w;
    
    var map1 = [ [ w,w,w,w,w,w,w,e,w,w,w,w,w,w,w ],
                 [ w,e,e,e,e,e,e,e,e,e,e,e,e,e,w ],
                 [ w,u,w,w,w,e,w,w,w,e,w,w,w,u,w ],
                 [ w,e,e,e,w,e,e,w,e,e,w,e,e,e,w ],
                 [ w,w,w,e,w,w,e,w,e,w,w,e,w,w,w ],
                 [ e,e,e,e,e,e,e,e,e,e,e,e,e,e,e ],
                 [ w,w,w,w,e,w,w,d,w,w,e,w,w,w,w ],
                 [ w,e,e,e,e,w,e,g,e,w,e,e,e,e,w ],
                 [ w,e,w,w,e,w,h,j,k,w,e,w,w,e,w ],
                 [ w,e,w,e,e,w,w,w,w,w,e,e,w,e,w ],
                 [ e,e,e,e,w,w,e,e,e,w,w,e,e,e,e ],
                 [ w,e,w,e,w,e,e,w,e,e,w,e,w,e,w ],
                 [ w,e,w,e,w,e,w,w,w,e,w,e,w,e,w ],
                 [ w,e,e,e,e,e,e,p,e,e,e,e,e,e,w ],
                 [ w,u,w,w,w,e,w,w,w,e,w,w,w,u,w ],
                 [ w,e,e,e,e,e,e,e,e,e,e,e,e,e,w ],
                 [ w,w,w,w,w,w,w,e,w,w,w,w,w,w,w ] ];
    
    static.maps = [map1];
    
</vexi>