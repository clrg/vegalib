<!-- Copyright 2009 - see COPYING for details [GPL] -->

<vexi xmlns:ui="vexi://ui" xmlns:meta="vexi://meta" xmlns="vexitris">
    <ui:box layout="layer" align="topleft" shrink="true">
        <ui:box id="boardholder" />
        <shape id="piece" />
        <ui:box id="cover" />
        
        var board = new .board(10, 20);
        $boardholder.add(board);
        
        var px, py;
        var setPosX = function(nx) {
            px = nx;
            $piece.x = px * 20;
        }
        var setPosY = function(ny) {
            py = ny;
            $piece.y = py * 20;
        }
        
        thisbox.pieceUpdate; // assigned in game.t
        
        thisbox.newPiece = function() {
            var s = vexi.math.floor(7 * vexi.math.random());
            $piece.newShape(s);
            pieceUpdate(s);
            setPosX(5);
            setPosY(0);
        }
        
        var miny, maxy;
        
        var placeBlock = function(block, ox, oy) {
            if (miny==null or miny>py+oy) {
                miny = py+oy;
            }
            if (maxy==null or py+oy>maxy) {
                maxy = py+oy;
            }
            board[px+ox][py+oy][0] = block;
        }
        
        var placePiece = function() {
            miny = null;
            maxy = null;
            var s = surface;
            $piece.placeBlocks(placeBlock);
            for (var j=miny; maxy>=j; j++) {
                var rowgaps = false;
                for (var i=0; 10>i; i++) {
                    if (board[i][j].numchildren==0) {
                        rowgaps = true;
                        break;
                    }
                }
                if (rowgaps) {
                    continue;
                }
                for (var i=0; 10>i; i++) {
                    s.attach(board[i][j][0]);
                    board[i][0] = board[i][j];
                }
            }
            newPiece();
        }
        
        /** test to see if a block exists at the requested point */
        var collide = function(ox, oy) {
            // left or right
            if (0>px+ox or px+ox>9) return true;
            // bottom
            if (py+oy>=20) return true;
            // check board square for block
            return board[px+ox][py+oy].numchildren>0;
        }
        
        thisbox.rotateCW = function() { $piece.rotateCW(collide); }
        
        thisbox.rotateCCW = function() { $piece.rotateCCW(collide); }
        
        thisbox.moveDown = function() {
            if (!$piece.testCollision(collide, 0, 1)) {
                setPosY(py+1);
            } else {
                placePiece();
            }
        }
        
        thisbox.moveLeft = function() {
            if (!$piece.testCollision(collide, -1, 0)) {
                setPosX(px-1);
            }
        }
        
        thisbox.moveRight = function() {
            if (!$piece.testCollision(collide, 1, 0)) {
                setPosX(px+1);
            }
        }
        
        thisbox.drop = function() {
            while (moveDown()) { }
        }
        
        var curtime;
        var gamespeed = 1000;
        thisbox.call = function(gotime, dtime) {
            curtime += dtime;
            if (curtime > gamespeed) {
                curtime -= gamespeed;
                moveDown();
            }
        }
        
        thisbox.pausegame = function() {
        }
        
        thisbox.startgame = function() {
            gamespeed = 1000;
            newPiece();
            surface.scheduler.run(thisbox);
        }
        
    </ui:box>
</vexi>