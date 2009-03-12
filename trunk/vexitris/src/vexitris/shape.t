<!-- Copyright 2008 - see COPYING for details [LGPL] -->

<vexi xmlns:ui="vexi://ui" xmlns:meta="vexi://meta" xmlns="vexitris">
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
            "#bc0000", // blood red
            "#fff800", // bright yellow
            "#e88900", // dull orange
            "#00ade8", // light blue
            "#4274f9", // mauve blue
            "#8f42f9", // purple
            "#008729"  // leaf green
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
	    var blockargs = [];
	    thisbox.newShape = function(color, type) {
            blockargs[0] = colors[color];
	        var s = shapes[type];
            for (var i=0; 4>i; i++) {
                for (var j=0; 4>j; j++) {
                    if (s[(4*i)+j]) {
                        var b = .block(vexi.box, blockargs);
                        thisbox[i][j][0] = b;
                        count++;
                    }
                }
            }
	    }
	    
    </ui:box>
</vexi>
