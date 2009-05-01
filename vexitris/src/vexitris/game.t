<!-- Copyright 2009 - see COPYING for details [GPL] -->

<vexi xmlns:ui="vexi://ui" xmlns:meta="vexi://meta" xmlns="vexitris">
    <screen layout="place">
        <ui:box id="background" align="bottomleft" layout="place">
        </ui:box>
        <ui:box>
            <ui:box>
                <ui:box fill=":.image.alien.aaah" shrink="true" />
            </ui:box>
            <ui:box align="top" hshrink="true" layout="layer">
                <zoomeffect id="zoom">
                    var args = ["#5E2605"];
                    // backboard
                    var b = .board(vexi.box, [12, 21]);
                    for (var i=0; 20>i; i++)
                        b[0][i][0] = .block(vexi.box, args);
                    for (var i=0; 20>i; i++)
                        b[11][i][0] = .block(vexi.box, args);
                    for (var i=0; 12>i; i++)
                        b[i][20][0] = .block(vexi.box, args);
                    thisbox[0] = b;
                </zoomeffect>
                // gameboard
                thisbox[1] = .board(vexi.box, [10, 20]);
            </ui:box>
            <ui:box orient="vertical">
                <ui:box />
                <vtext id="hiscore" text="Hi-Score" textcolor="#aaaaaa" />
                <vtext id="hisctxt" text="0" />
                <ui:box />
                <vtext id="score" text="Score" textcolor="#aaaaaa" />
                <vtext id="sctxt" text="0" />
                <ui:box />
                <vtext id="history" text="Piece History" textcolor="#aaaaaa" />
                <ui:box height="10" />
                <ui:box vshrink="true">
                    <ui:box />
                    <ui:box>
                        <vtext id="piece1" text="0" textcolor="#e88900" />
                    </ui:box>
                    <ui:box />
                    <ui:box>
                        <vtext id="piece2" text="0" textcolor="#00ade8" />
                    </ui:box>
                    <ui:box />
                </ui:box>
                <ui:box height="10" />
                <ui:box vshrink="true">
                    <ui:box>
                        <vtext id="piece3" text="0" textcolor="#8f42f9" />
                    </ui:box>
                    <ui:box>
                        <vtext id="piece4" text="0" textcolor="#bc0000" />
                    </ui:box>
                    <ui:box>
                        <vtext id="piece5" text="0" textcolor="#fff800" />
                    </ui:box>
                </ui:box>
                <ui:box height="10" />
                <ui:box vshrink="true">
                    <ui:box />
                    <ui:box>
                        <vtext id="piece6" text="0" textcolor="#008729" />
                    </ui:box>
                    <ui:box />
                    <ui:box>
                        <vtext id="piece7" text="0" textcolor="#4274f9" />
                    </ui:box>
                    <ui:box />
                </ui:box>
                <ui:box />
            </ui:box>
        </ui:box>
        <ui:box orient="vertical" shrink="true">
            <vtext id="helpme" text="Help me!" />
            <vtext id="build" text="Build my world..." />
        </ui:box>
        
        fadelist = [$hiscore,$hisctxt,$score,$sctxt,$history,$helpme,$build,
                    $piece1,$piece2,$piece3,$piece4,$piece5,$piece6,$piece7];
        
        next ++= function(v) {
            cascade = v;
            $zoom.zoom = true;
        }
        
        start ++= function(v) {
            cascade = v;
            $zoom.zoom = true;
        }
        
    </screen>
</vexi>