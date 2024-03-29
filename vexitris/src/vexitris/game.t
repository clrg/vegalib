<!-- Copyright 2009 - see COPYING for details [GPL] -->

<vexi xmlns:ui="vexi://ui" xmlns:meta="vexi://meta" xmlns="vexitris">
    <screen layout="place">
        <ui:box id="background" align="bottomleft" layout="place">
        </ui:box>
        <ui:box>
            <ui:box orient="vertical">
                <ui:box />
                <ui:box orient="vertical" vshrink="true">
                    <vtext id="ltext" text="level" textcolor="#aaaaaa" />
                    <ui:box height="10" />
                    <vtext id="level" text="0" fontsize="24" />
                </ui:box>
                <ui:box />
                <ui:box id="alien" />
                <ui:box />
            </ui:box>
            <ui:box align="top" layout="layer" shrink="true"> // width="280" height="480">
                <backboard id="backboard" />
                <gameboard id="gameboard" />
            </ui:box>
            <ui:box orient="vertical">
                <ui:box />
                <vtext id="hiscore" text="Hi-Score" textcolor="#aaaaaa" />
                <ui:box height="25">
                    <vtext id="hisctxt" text="0" />
                </ui:box>
                <ui:box />
                <vtext id="score" text="Score" textcolor="#aaaaaa" />
                <ui:box height="25">
                    <vtext id="sctxt" text="0" />
                </ui:box>
                <ui:box />
                <vtext id="nextp" text="Next Piece" textcolor="#aaaaaa" />
                <ui:box height="10" />
                <shape id="nextpiece" />
                <ui:box />
                <vtext id="history" text="Piece History" textcolor="#aaaaaa" />
                <ui:box height="10" />
                <ui:box height="100">
                    <ui:box />
                    <ui:box />
                    <ui:box orient="vertical">
                        <total id="piece1" textcolor="#e88900" />
                        <total id="piece2" textcolor="#00ade8" />
                        <total id="piece3" textcolor="#8f42f9" />
                        <total id="piece4" textcolor="#bc0000" />
                    </ui:box>
                    <ui:box />
                    <ui:box orient="vertical">
                        <total id="piece5" textcolor="#fff800" />
                        <total id="piece6" textcolor="#008729" />
                        <total id="piece7" textcolor="#4274f9" />
                        <total id="ptotal" textcolor="#aaaaaa" />
                    </ui:box>
                    <ui:box />
                    <ui:box />
                </ui:box>
                <ui:box />
            </ui:box>
        </ui:box>
        <ui:box id="gamemsgs" orient="vertical" shrink="true">
            <vtext id="helpme" text="Help me!" />
            <vtext id="build" text="Build my world!" />
            <vtext id="keys1" text="a,s to rotate" />
            <vtext id="keys2" text="arrow keys move" />
        </ui:box>
        
        alienbox = $alien;
        fadelist = [$hiscore,$hisctxt,$score,$sctxt,$history,$helpme,$build,$keys1,$keys2,$nextp,
                    $ptotal,$piece1,$piece2,$piece3,$piece4,$piece5,$piece6,$piece7,$level,$ltext];
        
        var nextp = vexi.math.floor(7 * vexi.math.random());
        $gameboard.nextPiece ++= function() {
            var p = nextp;
            nextp = vexi.math.floor(7 * vexi.math.random());
            $nextpiece.newShape(nextp);
            switch (p) {
            case 0: $piece1.total++;
                break;
            case 1: $piece2.total++;
                break;
            case 2: $piece3.total++;
                break;
            case 3: $piece4.total++;
                break;
            case 4: $piece5.total++;
                break;
            case 5: $piece6.total++;
                break;
            case 6: $piece7.total++;
                break;
            }
            $ptotal.total++;
            return p;
        }
        
        var hiscore = 0;
        var score = 0;
        var nrows = 0;
        var level = 0;
        $gameboard.completeRows ++= function(v) {
            nrows += v;
            if (nrows >= 10) {
                nrows -= 10;
                level ++;
                $level.text = level;
                $gameboard.level = level;
            }
            var mod=1;
            switch (v) {
            case 1: mod=1; break;
            case 2: mod=3; break;
            case 3: mod=6; break;
            case 4: mod=10; break;
            }
            if (v>nrows) {
                score += mod * (v-nrows) * (level+1);
                score += mod * nrows * (level+2);
            } else {
                score += mod * v * (level+1);
            }
            $sctxt.text = score;
            if (score>hiscore) {
                hiscore = score;
                $hisctxt.text = hiscore;
            }
        }
        
        var curtime;
        var endGame; // = function, defined later
        var gameover = true;
        var gamespeed = 1000;
        
        var left, right, down;
        var clockwise, countercw;
        
        var movePieceDown = function() {
            try { $gameboard.moveDown(); }
            catch (e) { endGame(); }
        }
        
        thisbox.level ++= function(v) {
            cascade = v;
            gamespeed = 1000 - v*50;
            vexi.trace("level: "+v+", "+gamespeed);
        }
        
        thisbox.call = function(gotime, dtime) {
            if (gameover) return true;
            
            curtime += dtime;
            if (left) {
                if (lefttime==null) {
                    lefttime = 0;
                }
                lefttime += dtime;
                while (lefttime > 50) {
                    lefttime -= 50;
                    $gameboard.moveLeft();
                }
            }
            if (right) {
                if (righttime==null) {
                    righttime = 0;
                }
                righttime += dtime;
                while (righttime > 50) {
                    righttime -= 50;
                    $gameboard.moveRight();
                }
            }
            var downspeed = down ? 50 : gamespeed;
            vexi.trace(curtime);
            while (curtime > gamespeed) {
                curtime -= gamespeed;
                movePieceDown();
            }
        }
        
        thisbox.pausegame = function() {
            surface.scheduler.pause();
        }
        
        thisbox.startgame = function() {
            gamespeed = 1000;
            $gameboard.newPiece();
            surface.scheduler.run(thisbox);
        }
        
        var keyPress = function(v) {
            switch(v) {
            case "left":
                right = null;
                left = true;
                $gameboard.moveLeft();
                break;
            case "right":
                left = null;
                right = true;
                $gameboard.moveRight();
                break;
            case "down":
                down = true;
                movePieceDown();
                break;
            case " ":
                $gameboard.drop();
                break;
            case "up":
            case "a":
                //countercw = true;
                $gameboard.rotateCCW();
                break;
            case "s":
                //clockwise = true;
                $gameboard.rotateCW();
                break;
            case "p":
            case "P":
            case "pause":
                surface.face = "sleepy";
                break;
            }
        }
        var keyRelease = function(v) {
            switch(v) {
            case "left":
                left = null;
                lefttime = null;
                break;
            case "right":
                right = null;
                righttime = null;
                break;
            case "down":
                down = false;
                break;
            case "p":
            case "P":
            case "pause":
                surface.face = "aaah";
                break;
            // not required
            //case " ":
            //case "a":
            //case "s":
            //    break;
            }
        }
        
        //// transitions //////////////////////////////////////////////
        
        var hideFaders = function(v) {
            cascade = v;
            $gamemsgs.display = false;
            trapee[trapname] --= callee;
        }
        
        /*var*/ endGame = function() {
            gameover = true;
        }
        var startGame = function(v) {
            $helpme.finished ++= hideFaders;
            $helpme.fadeout = true;
            $build.fadeout = true;
            $keys1.fadeout = true;
            $keys2.fadeout = true;
            _KeyPressed --= callee;
            _KeyPressed ++= keyPress;
            _KeyReleased ++= keyRelease;
            startgame();
            return;
        }
        
        thisbox.next ++= function(v) {
            cascade = v;
            $backboard.zoom = true;
            _KeyPressed --= startGame;
        }
        
        thisbox.visible ++= function(v) {
            cascade = v;
            if (v) {
                $backboard.zoom = true;
                $gamemsgs.display = true;
                _KeyPressed ++= startGame;
            }
        }
        
    </screen>
</vexi>