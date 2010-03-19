<!-- Copyright 2009 - see COPYING for details [GPL] -->

<vexi xmlns:ui="vexi://ui" xmlns:meta="vexi://meta" xmlns="org.vexi.lib.layout">
    <meta:doc>
        <author>Charles Goodwin</author>
        <desc>A font made out of boxes</desc>
    </meta:doc>
    
    <pad padding="2" redirect="null" shrink="true">
        <ui:box id="b" orient="vertical" />
        
        var cstr = arguments[0];
        var color = arguments[2];
        var size = arguments[1];
        if (color==null) color = "white";
        if (size==null) size = 12;
        var subsize = size/6;
        
        var ccode = cstr.charCodeAt(0);
        if (ccode>=97 and 122>=ccode) {
            // capitalize
            cstr = vexi.string.fromCharCode(ccode-32);
        }
        
        var cdef = static.chars[cstr];
        if (cdef==null) {
            throw "unknown vfont char: '"+cstr+"'";
        }
        
        var c = cdef.c;
        var w = cdef.w ? cdef.w : static.def_w;
        var h = cdef.h ? cdef.h : static.def_h;
        for (var i=0; h>i; i++) {
            var b = vexi.box;
            $b[i] = b;
            for (var j=0; w>j; j++) {
                var a = vexi.box;
                if (c[w*i+j]) {
                    a.fill = color;
                }
                b[j] = a;
            }
        }
        // make all characters equal height
        for (var i=h; static.act_h>i; i++) {
            $b[i] = vexi.box;
        }
        $b.height = size;
        $b.width = w*subsize;
        
        thisbox.textcolor ++= function(v) {
            cascade = v;
            color = v;
            for (var i=0; h>i; i++) {
                for (var j=0; w>j; j++) {
                    if (c[w*i+j]) {
                        $b[i][j].fill = v;
                    }
                }
            }
        }
        
    </pad>
    
    var c = {}; 
    static.chars = c;
    static.def_w = 4;
    static.def_h = 5;
    static.act_h = 6;
    
    c.A = { c:[0,1,1,0,
               1,0,0,1,
               1,1,1,1,
               1,0,0,1,
               1,0,0,1] };

    c.B = { c:[1,1,1,0,
               1,0,0,1,
               1,1,1,1,
               1,0,0,1,
               1,1,1,0] };
    
    c.C = { c:[0,1,1,0,
               1,0,0,1,
               1,0,0,0,
               1,0,0,1,
               0,1,1,0] };

    c.D = { c:[1,1,1,0,
               1,0,0,1,
               1,0,0,1,
               1,0,0,1,
               1,1,1,0] };
    
    c.E = { c:[1,1,1,1,
               1,0,0,0,
               1,1,1,1,
               1,0,0,0,
               1,1,1,1] };

    c.F = { c:[1,1,1,1,
               1,0,0,0,
               1,1,1,0,
               1,0,0,0,
               1,0,0,0] };
    
    c.G = { c:[0,1,1,1,
               1,0,0,0,
               1,0,1,1,
               1,0,0,1,
               0,1,1,0] };

    c.H = { c:[1,0,0,1,
               1,0,0,1,
               1,1,1,1,
               1,0,0,1,
               1,0,0,1] };
    
    c.I = { w:3,c:[1,1,1,
                   0,1,0,
                   0,1,0,
                   0,1,0,
                   1,1,1] };

    c.J = { c:[0,0,0,1,
               0,0,0,1,
               0,0,0,1,
               1,0,0,1,
               0,1,1,0] };
    
    c.K = { c:[1,0,0,1,
               1,0,1,0,
               1,1,0,0,
               1,0,1,0,
               1,0,0,1] };

    c.L = { c:[1,0,0,0,
               1,0,0,0,
               1,0,0,0,
               1,0,0,0,
               1,1,1,1] };
    
    c.M = { w:5,c:[1,0,0,0,1,
                   1,1,0,1,1,
                   1,0,1,0,1,
                   1,0,0,0,1,
                   1,0,0,0,1] };

    c.N = { w:5,c:[1,0,0,0,1,
                   1,1,0,0,1,
                   1,0,1,0,1,
                   1,0,0,1,1,
                   1,0,0,0,1] };
    
    c.O = { w:5,c:[0,1,1,1,0,
                   1,0,0,0,1,
                   1,0,0,0,1,
                   1,0,0,0,1,
                   0,1,1,1,0] };

    c.P = { c:[1,1,1,0,
               1,0,0,1,
               1,1,1,0,
               1,0,0,0,
               1,0,0,0] };
    
    c.Q = { h:6,c:[0,1,1,0,
                   1,0,0,1,
                   1,0,0,1,
                   1,0,0,1,
                   0,1,1,0,
                   0,0,0,1] };

    c.R = { c:[1,1,1,0,
               1,0,0,1,
               1,1,1,0,
               1,0,0,1,
               1,0,0,1] };
    
    c.S = { c:[0,1,1,1,
               1,0,0,0,
               0,1,1,0,
               0,0,0,1,
               1,1,1,0] };

    c.T = { w:3,c:[1,1,1,
                   0,1,0,
                   0,1,0,
                   0,1,0,
                   0,1,0] };

    c.U = { c:[1,0,0,1,
               1,0,0,1,
               1,0,0,1,
               1,0,0,1,
               0,1,1,0] };
    
    c.V = { w:5,c:[1,0,0,0,1,
                   1,0,0,0,1,
                   0,1,0,1,0,
                   0,1,0,1,0,
                   0,0,1,0,0] };

    c.W = { w:5,c:[1,0,0,0,1,
                   1,0,1,0,1,
                   1,0,1,0,1,
                   1,0,1,0,1,
                   0,1,0,1,0] };
    
    c.X = { w:5,c:[1,0,0,0,1,
                   0,1,0,1,0,
                   0,0,1,0,0,
                   0,1,0,1,0,
                   1,0,0,0,1] };

    c.Y = { c:[1,0,0,1,
               1,0,0,1,
               0,1,1,1,
               0,0,0,1,
               0,1,1,0] };
    
    c.Z = { c:[1,1,1,1,
               0,0,0,1,
               0,1,1,0,
               1,0,0,0,
               1,1,1,1] };
    
    c["1"] = { w:3,c:[0,1,0,
                      1,1,0,
                      0,1,0,
                      0,1,0,
                      1,1,1] };
    
    c["2"] = { c:[1,1,1,0,
                  0,0,0,1,
                  0,1,1,0,
                  1,0,0,0,
                  1,1,1,1] };
    
    c["3"] = { c:[1,1,1,0,
                  0,0,0,1,
                  0,1,1,0,
                  0,0,0,1,
                  1,1,1,0] };
    
    c["4"] = { c:[1,0,1,0,
                  1,0,1,0,
                  1,1,1,1,
                  0,0,1,0,
                  0,0,1,0] };
    
    c["5"] = { c:[1,1,1,1,
                  1,0,0,0,
                  1,1,1,0,
                  0,0,0,1,
                  1,1,1,0] };
    
    c["6"] = { c:[0,1,1,0,
                  1,0,0,0,
                  1,1,1,0,
                  1,0,0,1,
                  0,1,1,0] };
    
    c["7"] = { c:[1,1,1,1,
                  0,0,0,1,
                  0,0,1,0,
                  0,1,0,0,
                  0,1,0,0] };
    
    c["8"] = { c:[0,1,1,0,
                  1,0,0,1,
                  0,1,1,0,
                  1,0,0,1,
                  0,1,1,0] };
    
    c["9"] = { c:[0,1,1,0,
                  1,0,0,1,
                  0,1,1,1,
                  0,0,0,1,
                  0,1,1,0] };
    
    c["0"] = { c:[0,1,1,0,
                  1,0,0,1,
                  1,0,0,1,
                  1,0,0,1,
                  0,1,1,0] };
    
    c["."] = { w:1, c:[0,0,0,0,1] };
    c[","] = { w:2, h:6, c:[0,0, 0,0, 0,0, 0,0, 0,1, 1,0] };
    c["-"] = { w:3, c:[0,0,0, 0,0,0, 1,1,1, 0,0,0, 0,0,0] };
    c[" "] = { w:4, c:[0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0] };
    c["!"] = { w:1, c:[1,1,1,0,1] };
    c["/"] = { w:5, c:[0,0,0,0,1, 0,0,0,1,0, 0,0,1,0,0, 0,1,0,0,0, 1,0,0,0,0] };
    c["["] = { w:2, c:[1,1, 1,0, 1,0, 1,0, 1,1] };
    c["]"] = { w:2, c:[1,1, 0,1, 0,1, 0,1, 1,1] };

</vexi>