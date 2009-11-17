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
                b[j] = new .space();
            }
        }
        
        var colors = static.colors;
        var shapes = static.shapes;
	    
	    /** get blocks returns the current occupying blocks as a list */
	    var blocklist = [];
	    thisbox.getBlocks = function() {
	        var count = 0;
	        for (var i=0; 4>i; i++) {
	            for (var j=0; 4>j; j++) {
	                var b = thisbox[i][j][0];
	                if (b) {
	                    blocklist[count++] = b;
	                }
	            }
	        }
	        return blocklist;
	    }
	    
	    /** create and fill with a new shape of the specified type/color */
	    var blockinds = [];
	    var blocksize;
	    thisbox.newShape = function(type) {
	        var s = shapes[type];
	        blocksize = vexi.math.sqrt(s.length);
	        var count = 0;
            for (var i=0; blocksize>i; i++) {
                for (var j=0; blocksize>j; j++) {
                    if (s[(blocksize*i)+j]) {
                        var b = .block..getBlock(colors[type]);
                        thisbox[i][j][0] = b;
                        blockinds[count] = i+blocksize*j;
                        count++;
                    }
                }
            }
	    }
	    
        // [  0,  1,  2,  3,  -->CW [ 12,  8,  4,  0, -->CCW [  3,  7, 11, 15,
        //    4,  5,  6,  7,          13,  9,  5,  1,           2,  6, 10, 14,
        //    8,  9, 10, 11,          14, 10,  6,  2,           1,  5,  9, 13,
        //   12, 13, 14, 15  ]        15, 11,  7,  3  ]         0,  4,  8, 12  ]
	    var clockwise = [ 12, 8, 4, 0, 13, 9, 5, 1, 14, 10, 6, 2, 15, 11, 7, 3 ];
        var countercw = [ 3, 7, 11, 15, 2, 6, 10, 14, 1, 5, 9, 13, 0, 4, 8, 12 ];
        
        // [  0,  1,  2,  -->CW [  6,  3,  0, -->CCW [  2,  5,  8,
        //    3,  4,  5,           7,  4,  1,           1,  4,  7,
        //    6,  7,  8  ]         8,  5,  2  ]         0,  3,  6  ]
        var clockwise_3 = [ 6, 3, 0, 7, 4, 1, 8, 5, 2 ];
        var countercw_3 = [ 2, 5, 8, 1, 4, 7, 0, 3, 6 ];
        
        var getBlock = function(ind) {
            var bx = ind%blocksize;
            return thisbox[bx][(ind-bx)/blocksize];
        }
        
        var setBlock = function(ind, b) {
            var bx = ind%blocksize;
            thisbox[bx][(ind-bx)/blocksize] = b;
        }
	    
	    thisbox.rotateCW = function() {
            if (blocksize == 2) {
                // squares don't rotate!
                return;
            }
	        var posref = blocksize==4 ? clockwise : clockwise_3;
            var pos, bx, by, b;
            for (var i=0; blocksize>i; i++) {
                pos = blockinds[i];
                bx = pos%blocksize;
                by = (pos-bx)/blocksize;
                b = thisbox[bx][by][0];
                pos = posref[pos];
                bx = pos%blocksize;
                by = (pos-bx)/blocksize;
                blockinds[i] = pos;
                thisbox[bx][by][0] = b;
            }
	    }
        
        thisbox.rotateCCW = function() {
            if (blocksize == 2) {
                // squares don't rotate!
                return;
            }
            var posref = blocksize==4 ? countercw : countercw_3;
            var pos, bx, by, b;
            for (var i=0; blocksize>i; i++) {
                pos = blockinds[i];
                bx = pos%blocksize;
                by = (pos-bx)/blocksize;
                b = thisbox[bx][by][0];
                pos = posref[pos];
                bx = pos%blocksize;
                by = (pos-bx)/blocksize;
                blockinds[i] = pos;
                thisbox[bx][by][0] = b;
            }
        }
	    
    </ui:box>
    
    // list of block colors
    static.colors = [
        "#e88900", // dull orange
        "#00ade8", // light blue
        "#8f42f9", // purple
        "#bc0000", // blood red
        "#fff800", // bright yellow
        "#008729", // leaf green
        "#4274f9"  // mauve blue
    ];
    
    // shape definitions
    static.shapes =
         [ [0,1,0,0,
            0,1,0,0,
            0,1,0,0,
            0,1,0,0],
           
           [0,1,0,
            0,1,0,
            0,1,1],
           
           [0,1,0,
            0,1,0,
            1,1,0],
           
           [1,1,
            1,1],
           
           [1,1,0,
            0,1,1,
            0,0,0],
           
           [0,1,1,
            1,1,0,
            0,0,0],
           
           [0,1,0,
            1,1,1,
            0,0,0] ];
    
</vexi>
