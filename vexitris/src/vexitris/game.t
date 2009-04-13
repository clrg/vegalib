<!-- Copyright 2009 - see COPYING for details [GPL] -->

<vexi xmlns:ui="vexi://ui" xmlns:meta="vexi://meta" xmlns="vexitris">
    <ui:box layout="place">
        <ui:box id="background" align="bottomleft" layout="place">
        </ui:box>
        <ui:box>
            <ui:box>
                <ui:box fill=":.image.alien.aaah" shrink="true" />
            </ui:box>
            <zoomeffect id="zoom">
                <board />
            </zoomeffect>
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
        
    </ui:box>
</vexi>