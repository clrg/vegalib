<!-- Copyright 2009 - see COPYING for details [GPL] -->

<vexi xmlns:ui="vexi://ui" xmlns:meta="vexi://meta" xmlns="vexitris">
    <screen layout="place">
        <ui:box id="background" align="bottomleft" layout="place">
        </ui:box>
        <ui:box>
            <ui:box>
                <ui:box fill=":.image.alien.aaah" shrink="true" />
            </ui:box>
            <ui:box align="top">
                <zoomeffect id="zoom">
                    // backboard
                    var b = .board(vexi.box, [12, 21]);
                    for (var i=0; 20>i; i++)
                        b[0][i][0] = .block(vexi.box);
                    for (var i=0; 20>i; i++)
                        b[11][i][0] = .block(vexi.box);
                    for (var i=0; 12>i; i++)
                        b[i][20][0] = .block(vexi.box);
                    thisbox[0] = b;
                </zoomeffect>
                // gameboard
                thisbox[1] = .board(vexi.box, [10, 20]);
            </ui:box>
            <ui:box>
                <vtext text="Hi Score:" />
                <vtext text="0" />
                <ui:box />
                <vtext text="Score:" />
                <vtext text="0" />
                <ui:box />
                <vtext text="This Game:" />
                <ui:box vshrink="true">
                    <vtext text="0" textcolor="red" />
                    <vtext text="0" textcolor="yellow" />
                    <vtext text="0" textcolor="blue" />
                    <vtext text="0" textcolor="blue" />
                </ui:box>
                <ui:box vshrink="true">
                    <vtext text="0" textcolor="red" />
                    <vtext text="0" textcolor="yellow" />
                    <vtext text="0" textcolor="blue" />
                </ui:box>
            </ui:box>
        </ui:box>
        
        fadelist = $menulinks;
        fadefrom = 1;
        
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