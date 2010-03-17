<!-- Copyright 2009 - see COPYING for details [GPL] -->

<vexi xmlns:ui="vexi://ui" xmlns:meta="vexi://meta" xmlns="vexitris">
    <screen layout="place">
        <ui:box id="background" align="bottomleft" layout="place">
        </ui:box>
        <ui:box>
            <ui:box>
                <ui:box id="alien" />
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
                <shape id="foo" />
                <ui:box />
                <vtext id="history" text="Piece History" textcolor="#aaaaaa" />
                <ui:box height="10" />
                <ui:box height="100">
                    <ui:box />
                    <ui:box />
                    <ui:box orient="vertical">
                        <vtext id="piece1" text="0" textcolor="#e88900" />
                        <vtext id="piece2" text="0" textcolor="#00ade8" />
                        <vtext id="piece3" text="0" textcolor="#8f42f9" />
                        <vtext id="piece4" text="0" textcolor="#bc0000" />
                    </ui:box>
                    <ui:box />
                    <ui:box orient="vertical">
                        <vtext id="piece5" text="0" textcolor="#fff800" />
                        <vtext id="piece6" text="0" textcolor="#008729" />
                        <vtext id="piece7" text="0" textcolor="#4274f9" />
                        <vtext id="ptotal" text="0" textcolor="#aaaaaa" />
                    </ui:box>
                    <ui:box />
                    <ui:box />
                </ui:box>
                <ui:box />
            </ui:box>
        </ui:box>
        <ui:box orient="vertical" shrink="true">
            <vtext id="helpme" text="Help me!" />
            <vtext id="build" text="Build my world!" />
            <vtext id="keys1" text="a,s to rotate" />
            <vtext id="keys2" text="arrow keys move" />
        </ui:box>
        
        alienbox = $alien;
        fadelist = [$hiscore,$hisctxt,$score,$sctxt,$history,$helpme,$build,$keys1,$keys2,$nextp,
                    $ptotal,$piece1,$piece2,$piece3,$piece4,$piece5,$piece6,$piece7];
        
        next ++= function(v) {
            cascade = v;
            $backboard.zoom = true;
        }
        
        var playGame = function(v) {
            switch(v) {
            case "left":
                $gameboard.moveLeft();
                break;
            case "right":
                $gameboard.moveRight();
                break;
            case "down":
                $gameboard.moveDown();
                break;
            case "up":
            case " ":
                $gameboard.drop();
                break;
            case "a":
                $gameboard.rotateCCW();
                break;
            case "s":
                $gameboard.rotateCW();
                break;
            case "p":
            case "P":
            case "pause":
                surface.face = "sleepy";
                break;
            }
        }
        
        var startGame = function(v) {
            $helpme.fadeout = true;
            $build.fadeout = true;
            $keys1.fadeout = true;
            $keys2.fadeout = true;
            $gameboard.startgame();
            _KeyPressed --= callee;
            _KeyPressed ++= playGame;
            return;
        }
        
        start ++= function(v) {
            cascade = v;
            $backboard.zoom = true;
            _KeyPressed --= playGame;
            _KeyPressed ++= startGame;
        }
        
    </screen>
</vexi>