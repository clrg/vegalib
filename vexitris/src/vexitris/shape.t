<!-- Copyright 2009 - see COPYING for details [GPL] -->

<vexi xmlns:ui="vexi://ui" xmlns:meta="vexi://meta" xmlns="vexitris"
    xmlns:vegalib="vexi.vegalib">
    <meta:doc>
        <author>Charles Goodwin</author>
        <notes>
            A shape is a 4x4 grid with blocks arranged within the grid.
            It is reused - blocks are placed in the shape on-demand and
            once the shape has landed, the blocks are transfered to the
            board and the shape returns to the top of the board, with a
            new set of blocks created to form the new shape.
        </notes>
    </meta:doc>
    
    <ui:box shrink="true">
        
        // generates the 4x4 grid
        for (var i=0; 4>i; i++) {
            var b = vexi.box;
            b.orient = "vertical";
            thisbox[i] = b;
            for (var j=0; 4>j; j++) {
                b[j] = .space(vexi.box);
            }
        }
        
        // list of block colors
        var colors = [
            "#e88900", // dull orange
            "#00ade8", // light blue
            "#8f42f9", // purple
            "#bc0000", // blood red
            "#fff800", // bright yellow
            "#008729"  // leaf green
            "#4274f9", // mauve blue
        ];
        
        // shape definitions
        var shapes = [ [0,1,0,0,
                        0,1,0,0,
                        0,1,0,0,
                        0,1,0,0],
        
                       [0,1,0,0,
                        0,1,0,0,
                        0,1,1,0,
                        0,0,0,0],
        
                       [0,0,1,0,
                        0,0,1,0,
                        0,1,1,0,
                        0,0,0,0],
        
                       [0,0,0,0,
                        0,1,1,0,
                        0,1,1,0,
                        0,0,0,0],
        
                       [0,1,0,0,
                        0,1,1,0,
                        0,0,1,0,
                        0,0,0,0],
        
                       [0,1,0,0,
                        0,1,1,0,
                        0,0,1,0,
                        0,0,0,0],
        
                       [0,1,0,0,
                        0,1,1,0,
                        0,1,0,0,
                        0,0,0,0] ];
        
        var flog = vexi..vexi.util.log..flog;
	    
	    /** get blocks returns the current occupying blocks as a list */
	    var blocklist = [];
	    thisbox.getBlocks = function() {
	        var count = 0;
	        for (var i=0; 4>i; i++) {
	            for (var j=0; 4>j; j++) {
	                var b = thisbox[i][j][0];
	                if (b) blocklist[count++] = b;
	            }
	        }
	        return blocklist;
	    }
	    
	    /** create and fill with a new shape of the specified type/color */
	    var blockinds = [];
	    thisbox.newShape = function(color, type) {
	        var s = shapes[type];
	        var count = 0;
            for (var i=0; 4>i; i++) {
                for (var j=0; 4>j; j++) {
                    if (s[(4*i)+j]) {
                        var b = .block..getBlock(colors[color]);
                        thisbox[i][j][0] = b;
                        blockinds[count] = i+4*j;
                        count++;
                    }
                }
            }
	    }
	    
        // [  0,  1,  2,  3,     CW [ 12,  8,  4,  0,    CCW [  3,  7, 11, 15,
        //    4,  5,  6,  7,          13,  9,  5,  1,           2,  6, 10, 14,
        //    8,  9, 10, 11,          14, 10,  6,  2,           1,  5,  9, 13,
        //   12, 13, 14, 15  ]        15, 11,  7,  3  ]         0,  4,  8, 12  ]
	    var clockwise = [ 12, 8, 4, 0, 13, 9, 5, 1, 14, 10, 6, 2, 15, 11, 7, 3 ];
        var countercw = [ 3, 7, 11, 15, 2, 6, 10, 14, 1, 5, 9, 13, 0, 4, 8, 12 ];
	    
	    thisbox.rotateCW = function() {
            var pos, bx, by, b;
            for (var i=0; 4>i; i++) {
                pos = blockinds[i];
                bx = pos%4;
                by = (pos-bx)/4;
                b = thisbox[bx][by][0];
                pos = clockwise[pos];
                bx = pos%4;
                by = (pos-bx)/4;
                blockinds[i] = pos;
                thisbox[bx][by][0] = b;
            }
	    }
        
        thisbox.rotateCCW = function() {
            var pos, bx, by, b;
            for (var i=0; 4>i; i++) {
                pos = blockinds[i];
                bx = pos%4;
                by = (pos-bx)/4;
                b = thisbox[bx][by][0];
                pos = countercw[pos];
                bx = pos%4;
                by = (pos-bx)/4;
                blockinds[i] = pos;
                thisbox[bx][by][0] = b;
            }
        }
	    
    </ui:box>
</vexi>
