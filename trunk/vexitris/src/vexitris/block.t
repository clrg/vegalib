<!-- Copyright 2008 - see COPYING for details [LGPL] -->

<vexi xmlns:ui="vexi://ui" xmlns:meta="vexi://meta" xmlns="vexi.theme"
    xmlns:lay="org.vexi.lib.layout">
    <meta:doc>
        <author>Charles Goodwin</author>
    </meta:doc>
    
    <ui:box redirect=":$content" width="20" height="20">
        <ui:box fill="black" width="1" hshrink="true" />
        <ui:box orient="vertical">
            <ui:box fill="black" height="1" vshrink="true" />
            <ui:box id="shapefill">
                <ui:box orient="vertical" hshrink="true">
                    <ui:box fill="#ccffffff" height="1" />
                    <ui:box fill="#66ffffff" width="1" />
                    <ui:box fill="#cc000000" height="1" />
                </ui:box>
                <ui:box orient="vertical">
                    <ui:box id="#99ffffff" height="1" vshrink="true" />
                    <ui:box id="content" />
                    <ui:box id="#99000000" height="1" vshrink="true" />
                </ui:box>
                <ui:box orient="vertical" hshrink="true">
                    <ui:box id="#33ffffff" height="1" />
                    <ui:box id="#99000000" width="1" />
                    <ui:box id="#99000000" height="1" />
                </ui:box>
            </ui:box>
            <ui:box fill="black" height="1" vshrink="true" />
        </ui:box>
        <ui:box fill="black" width="1" hshrink="true" />
        
        $shapefill.fill = arguments[0];
        
    </ui:box>
</vexi>
