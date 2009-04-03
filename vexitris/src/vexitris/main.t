<!-- Copyright 2008 - see COPYING for details [LGPL] -->

<vexi xmlns:ui="vexi://ui" xmlns:meta="vexi://meta" xmlns="vexitris"
    xmlns:vgl="vexi.vegalib" xmlns:wi="vexi.widget">
    <meta:doc>
        <author>Charles Goodwin</author>
        <notes>
        </notes>
    </meta:doc>
    
    <wi:surface />
    <ui:box fill="black">
        <ui:box id="about" orient="vertical" vshrink="true">
            <vtext text="A Charles Goodwin Game" />
            <vtext text="www.charlesgoodwin.co.uk" />
            <ui:box height="20" />
            <vtext text="Vexi Platform" />
            <vtext text="vexi.sourceforge.net" />
            <ui:box height="20" />
            <vtext text="VeGaLib library" />
            <vtext text="code.google.com/p/vegalib" />
        </ui:box>
        <zoomeffect id="zoom" display="false">
            <logo />
        </zoomeffect>
        
        surface.scheduler = vgl.scheduler({});
        
        vexi.ui.frame = thisbox;
        
        vexi.thread = function() {
            for (var i=0; $about.numchildren>i; i++) {
                $about[i].fade = true;
            }
        }
        
        Press1 ++= function(v) {
            cascade = v;
            for (var i=0; $about.numchildren>i; i++) {
                $about[i].fade = true;
            }
            $about[0].finished ++= function(v) {
                $about.display = false;
                $zoom.display = true;
                $zoom.zoom = true;
                cascade = v;
                $about[0] --= callee;
            }
            Press1 --= callee;
        }
        
    </ui:box>
</vexi>
