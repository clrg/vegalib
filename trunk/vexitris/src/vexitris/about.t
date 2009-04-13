<!-- Copyright 2009 - see COPYING for details [GPL] -->

<vexi xmlns:ui="vexi://ui" xmlns:meta="vexi://meta" xmlns="vexitris">
    <screen>
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
         
         fadelist = $about;
         
         finished ++= function(v) { surface.state = "Menu"; return; }
         
    </screen>
</vexi>