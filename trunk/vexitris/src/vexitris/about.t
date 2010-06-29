<!-- Copyright 2009 - see COPYING for details [GPL] -->

<vexi xmlns:ui="vexi://ui" xmlns:meta="vexi://meta" xmlns:vgl="vexi.vegalib" xmlns="vexitris">
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
             <ui:box height="20" />
             <vgl:effect.fade fadecolor="black" fadetype="overlay" fill=":vgl.thelook" shrink="true" />
         </ui:box>
         
         fadelist = $about;
         
         var toMenu = function(v) {
             surface.state = "Menu";
             KeyPressed --= toMenu;
             Press1 --= toMenu;
             Press2 --= toMenu;
             Press3 --= toMenu;
             return;
         }
         
         thisbox.visible ++= function(v) {
             cascade = v;
             if (v) {
                 KeyPressed ++= toMenu;
                 Press1 ++= toMenu;
                 Press2 ++= toMenu;
                 Press3 ++= toMenu;
             }
         }
         
    </screen>
</vexi>