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
                <ui:box fill=":.image.alien.aaah" shrink="true" />
            </ui:box>
            <ui:box id="menulinks" orient="vertical">
                <ui:box />
                <vtext text="[P]lay" state="Game" />
                <vtext text="[S]cores" state="Scores" />
                <vtext text="[Q]uit" state="Quit" />
                <ui:box />
            </ui:box>
            <ui:box />
        </ui:box>
        <ui:box height="50" />
        
        fadelist = $menulinks;
        fadefrom = 1;
        
    </screen>
</vexi>