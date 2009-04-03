<!-- Copyright 2008 - see COPYING for details [LGPL] -->

<vexi xmlns:ui="vexi://ui" xmlns:meta="vexi://meta" xmlns="vexi.theme"
    xmlns:lay="org.vexi.lib.layout" xmlns:vexitris="vexitris">
    <meta:doc>
        <author>Charles Goodwin</author>
    </meta:doc>
    
    <ui:box redirect=":$content">
        <ui:box fill="black" width="1" hshrink="true" />
        <ui:box orient="vertical">
            <ui:box fill="black" height="1" vshrink="true" />
            <ui:box id="shapefill">
                <ui:box orient="vertical" hshrink="true">
                    <ui:box fill="#bbffffff" height="1" />
                    <ui:box fill="#66ffffff" width="1" />
                    <ui:box fill="#99000000" height="1" />
                </ui:box>
                <ui:box orient="vertical">
                    <ui:box fill="#99ffffff" height="1" vshrink="true" />
                    <ui:box id="content" />
                    <ui:box fill="#99000000" height="1" vshrink="true" />
                </ui:box>
                <ui:box orient="vertical" hshrink="true">
                    <ui:box fill="#99ffffff" height="1" />
                    <ui:box id="#99000000" width="1" />
                    <ui:box fill="#cc000000" height="1" />
                </ui:box>
            </ui:box>
            <ui:box fill="black" height="1" vshrink="true" />
        </ui:box>
        <ui:box fill="black" width="1" hshrink="true" />
        
        fill ++= function(v) { $shapefill.fill = v; return; }
        thisbox ++= static.thisboxNull;
        
    </ui:box>
    
    var blockCount = 0;
    var blockCache = [];
    
    static.getBlock = function(fill) {
        var b = blockCount > 0 ? blockCache[--blockCount] : vexitris.block(vexi.box);
        b.fill = fill;
        return b;
    }
    
    static.thisboxNull = function(v) {
        cascade = v;
        if (v==null) blockCache[blockCount++] = trapee;
    }
    
</vexi>
