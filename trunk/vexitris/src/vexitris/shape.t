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
        
//        var getBlock = function(ind) {
//            var bx = ind%blocksize;
//            return thisbox[bx][(ind-bx)/blocksize];
//        }
//        
//        var setBlock = function(ind, b) {
//            var bx = ind%blocksize;
//            thisbox[bx][(ind-bx)/blocksize] = b;
//        }
	    
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
	        blocksize = s.length==4 ? 2 : s.length==9 ? 3 : 4;
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
	    
	    /** pass blocks to function 'place' to move them elsewhere i.e. the gameboard */
	    thisbox.placeBlocks = function(place) {
            for (var i,col in thisbox) {
                for (var j,cell in col) {
                    if (cell[0]) {
                        place(cell[0], i, j);
                    }
                }
            }
	    }
	    
	    /** test for collision using function 'collide' in direction specified by dx,dy */
	    thisbox.testCollision = function(collide, dx, dy) {
	        for (var i=0; blocksize>i; i++) {
                for (var j=0; blocksize>j; j++) {
                    if (thisbox[i][j].numchildren and collide(dx+i, dy+j)) {
                        return true;
                    }
                }
	        }
	    }
	    
        // [  0,  1,  2,  3,  -->CW [  c,  8,  4,  0, -->CCW [  3,  7,  b,  f,
        //    4,  5,  6,  7,           d,  9,  5,  1,           2,  6,  a,  e,
        //    8,  9,  a,  b,           e,  a,  6,  2,           1,  5,  9,  d,
        //    c , d,  e,  f  ]         f,  b,  7,  3  ]         0,  4,  8,  c  ]
        var rotate4 = function(clockwise, collide) {
            var b0 = thisbox[0][0][0];
            var b1 = thisbox[0][1][0];
            var b2 = thisbox[0][2][0];
            var b3 = thisbox[0][3][0];
            var b4 = thisbox[1][0][0];
            var b5 = thisbox[1][1][0];
            var b6 = thisbox[1][2][0];
            var b7 = thisbox[1][3][0];
            var b8 = thisbox[2][0][0];
            var b9 = thisbox[2][1][0];
            var ba = thisbox[2][2][0];
            var bb = thisbox[2][3][0];
            var bc = thisbox[3][0][0];
            var bd = thisbox[3][1][0];
            var be = thisbox[3][2][0];
            var bf = thisbox[3][3][0];
            if (clockwise) {
                if (collide) {
                    // collision function provided
                    if (b0 and collide(0, 3) or
                        b1 and collide(1, 3) or
                        b2 and collide(2, 3) or
                        b3 and collide(3, 3) or
                        b4 and collide(0, 2) or
                        b5 and collide(1, 2) or
                        b6 and collide(2, 2) or
                        b7 and collide(3, 2) or
                        b8 and collide(0, 1) or
                        b9 and collide(1, 1) or
                        ba and collide(2, 1) or
                        bb and collide(3, 1) or
                        bc and collide(0, 0) or
                        bd and collide(1, 0) or
                        be and collide(2, 0) or
                        bf and collide(3, 0)) {
                        // no space to rotate into
                        return;
                    }
                }
                if (b0) thisbox[0][3][0] = b0;
                if (b1) thisbox[1][3][0] = b1;
                if (b2) thisbox[2][3][0] = b2;
                if (b3) thisbox[3][3][0] = b3;
                if (b4) thisbox[0][2][0] = b4;
                if (b5) thisbox[1][2][0] = b5;
                if (b6) thisbox[2][2][0] = b6;
                if (b7) thisbox[3][2][0] = b7;
                if (b8) thisbox[0][1][0] = b8;
                if (b9) thisbox[1][1][0] = b9;
                if (ba) thisbox[2][1][0] = ba;
                if (bb) thisbox[3][1][0] = bb;
                if (bc) thisbox[0][0][0] = bc;
                if (bd) thisbox[1][0][0] = bd;
                if (be) thisbox[2][0][0] = be;
                if (bf) thisbox[3][0][0] = bf;
            } else {
                if (collide) {
                    // collision function provided
                    if (b0 and collide(3, 0) or
                        b1 and collide(2, 0) or
                        b2 and collide(1, 0) or
                        b3 and collide(0, 0) or
                        b4 and collide(3, 1) or
                        b5 and collide(2, 1) or
                        b6 and collide(1, 1) or
                        b7 and collide(0, 1) or
                        b8 and collide(3, 2) or
                        b9 and collide(2, 2) or
                        ba and collide(1, 2) or
                        bb and collide(0, 2) or
                        bc and collide(3, 3) or
                        bd and collide(2, 3) or
                        be and collide(1, 3) or
                        bf and collide(0, 3)) {
                        // no space to rotate into
                        return;
                    }
                }
                if (b0) thisbox[3][0][0] = b0;
                if (b1) thisbox[2][0][0] = b1;
                if (b2) thisbox[1][0][0] = b2;
                if (b3) thisbox[0][0][0] = b3;
                if (b4) thisbox[3][1][0] = b4;
                if (b5) thisbox[2][1][0] = b5;
                if (b6) thisbox[1][1][0] = b6;
                if (b7) thisbox[0][1][0] = b7;
                if (b8) thisbox[3][2][0] = b8;
                if (b9) thisbox[2][2][0] = b9;
                if (ba) thisbox[1][2][0] = ba;
                if (bb) thisbox[0][2][0] = bb;
                if (bc) thisbox[3][3][0] = bc;
                if (bd) thisbox[2][3][0] = bd;
                if (be) thisbox[1][3][0] = be;
                if (bf) thisbox[0][3][0] = bf;
            }
        }
        
        // [  0,  1,  2,  -->CW [  6,  3,  0, -->CCW [  2,  5,  8,
        //    3,  4,  5,           7,  4,  1,           1,  4,  7,
        //    6,  7,  8  ]         8,  5,  2  ]         0,  3,  6  ]
        var rotate3 = function(clockwise, collide) {
            var b0 = thisbox[0][0][0];
            var b1 = thisbox[0][1][0];
            var b2 = thisbox[0][2][0];
            var b3 = thisbox[1][0][0];
          //var b4 = thisbox[1][1][0];
            var b5 = thisbox[1][2][0];
            var b6 = thisbox[2][0][0];
            var b7 = thisbox[2][1][0];
            var b8 = thisbox[2][2][0];
            if (clockwise) {
                if (collide) {
                    // collision function provided
                    if (b0 and collide(0, 2) or
                        b1 and collide(1, 2) or
                        b2 and collide(2, 2) or
                        b3 and collide(0, 1) or
                        b4 and collide(1, 1) or
                        b5 and collide(2, 1) or
                        b6 and collide(0, 0) or
                        b7 and collide(1, 0) or
                        b8 and collide(2, 0)) {
                        // no space to rotate into
                        return;
                    }
                }
                if (b0) thisbox[0][2][0] = b0;
                if (b1) thisbox[1][2][0] = b1;
                if (b2) thisbox[2][2][0] = b2;
                if (b3) thisbox[0][1][0] = b3;
              //if (b4) thisbox[1][1][0] = b4;
                if (b5) thisbox[2][1][0] = b5;
                if (b6) thisbox[0][0][0] = b6;
                if (b7) thisbox[1][0][0] = b7;
                if (b8) thisbox[2][0][0] = b8;
            } else {
                if (collide) {
                    // collision function provided
                    if (b0 and collide(2, 0) or
                        b1 and collide(1, 0) or
                        b2 and collide(0, 0) or
                        b3 and collide(2, 1) or
                        b4 and collide(1, 1) or
                        b5 and collide(0, 1) or
                        b6 and collide(2, 2) or
                        b7 and collide(1, 2) or
                        b8 and collide(0, 2)) {
                        // no space to rotate into
                        return;
                    }
                }
                if (b0) thisbox[2][0][0] = b0;
                if (b1) thisbox[1][0][0] = b1;
                if (b2) thisbox[0][0][0] = b2;
                if (b3) thisbox[2][1][0] = b3;
              //if (b4) thisbox[1][1][0] = b4;
                if (b5) thisbox[0][1][0] = b5;
                if (b6) thisbox[2][2][0] = b6;
                if (b7) thisbox[1][2][0] = b7;
                if (b8) thisbox[0][2][0] = b8;
            }
        }
	    
	    thisbox.rotateCW = function(collide) {
            switch (blocksize) {
                case 4: rotate4(true, collide); break;
                case 3: rotate3(true, collide); break;
                // squares don't rotate!
                case 2: default: break;
            }
	    }
        
        thisbox.rotateCCW = function(collide) {
            switch (blocksize) {
                case 4: rotate4(false, collide); break;
                case 3: rotate3(false, collide); break;
                // squares don't rotate!
                case 2: default: break;
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
