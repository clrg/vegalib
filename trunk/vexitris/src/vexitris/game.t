<!-- Copyright 2009 - see COPYING for details [GPL] -->

<vexi xmlns:ui="vexi://ui" xmlns:meta="vexi://meta" xmlns="vexitris">
    <screen layout="place">
        <ui:box id="background" align="bottomleft" layout="place">
        </ui:box>
        <ui:box>
            <ui:box>
                <ui:box id="alien" />
            </ui:box>
            <ui:box align="top" hshrink="true" layout="layer">
                <backboard id="backboard" />
                <gameboard id="gameboard" />
            </ui:box>
            <ui:box orient="vertical">
                <ui:box />
                <vtext id="hiscore" text="Hi-Score" fadecolor="#aaaaaa" />
                <vtext id="hisctxt" text="0" />
                <ui:box />
                <vtext id="score" text="Score" fadecolor="#aaaaaa" />
                <vtext id="sctxt" text="0" />
                <ui:box />
                <vtext id="history" text="Piece History" fadecolor="#aaaaaa" />
                <ui:box height="10" />
                <ui:box>
                    <ui:box width="10" />
                    <ui:box />
                    <ui:box align="left" orient="vertical">
                        <vtext id="piece1" text="0" fadecolor="#e88900" />
                        <vtext id="piece2" text="0" fadecolor="#00ade8" />
                        <vtext id="piece3" text="0" fadecolor="#8f42f9" />
                        <vtext id="piece4" text="0" fadecolor="#bc0000" />
                    </ui:box>
                    <ui:box />
                    <ui:box align="left" orient="vertical">
                        <vtext id="piece5" text="0" fadecolor="#fff800" />
                        <vtext id="piece6" text="0" fadecolor="#008729" />
                        <vtext id="piece7" text="0" fadecolor="#4274f9" />
                        <vtext id="ptotal" text="0" fadecolor="#aaaaaa" />
                    </ui:box>
                    <ui:box />
                </ui:box>
                <ui:box />
            </ui:box>
        </ui:box>
        <ui:box orient="vertical" shrink="true">
            <vtext id="helpme" text="Help me!" />
            <vtext id="build" text="Build my world!" />
        </ui:box>
        
        alienbox = $alien;
        fadelist = [$hiscore,$hisctxt,$score,$sctxt,$history,$helpme,$build,
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