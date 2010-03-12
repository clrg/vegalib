<!-- Copyright 2009 - see COPYING for details [GPL] -->

<vexi xmlns:ui="vexi://ui" xmlns:meta="vexi://meta" xmlns="vexitris">
    <screen orient="vertical">
        <ui:box height="50" />
        <zoomeffect id="zoom">
            <logo />
        </zoomeffect>
        <ui:box>
            <ui:box />
            <ui:box>
                <ui:box id="alien" />
            </ui:box>
            <ui:box id="menulinks" height="100" orient="vertical">
                <vtext text="[P]lay" state="Game" />
                <vtext text="[S]cores" state="Scores" />
                <vtext text="[C]redits" state="Credits" />
                <vtext text="[Q]uit" state="Quit" />
            </ui:box>
            <ui:box />
        </ui:box>
        <ui:box height="50" />
        
        alienbox = $alien;
        fadelist = $menulinks;
        
        next ++= function(v) {
            cascade = v;
            $zoom.zoom = true;
        }
        
        start ++= function(v) {
            cascade = v;
            $zoom.zoom = true;
            surface.face = "aaah";
        }
        
    </screen>
</vexi>