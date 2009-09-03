<!-- Copyright 2009 - see COPYING for details [GPL] -->

<vexi xmlns:ui="vexi://ui" xmlns:meta="vexi://meta" xmlns="vexitris"
    xmlns:vgl="vexi.vegalib" xmlns:wi="vexi.widget">
    <meta:doc>
        <author>Charles Goodwin</author>
        <notes>
        </notes>
    </meta:doc>
    
    <wi:surface />
    <ui:box fill="black" frametitle="Vexitris">
        <dropeffect> // layout="layer"
            <about id="about" name="About" />
            <menu id="menu" name="Menu" display="false" />
            <game id="game" name="Game" display="false" />
            <alien />
        </dropeffect>
        
        thisbox.current ++= function(v) {
            if (current) current.next = v;
            cascade = v;
            if (v==null) surface.facebox = null;
        }
        
        surface.scheduler = new vgl.scheduler();
        
        surface.state ++= function(v) {
            cascade = v;
            switch (v) {
            case "Menu":
                current = $menu;
                break;
            case "Game":
                current = $game;
                break;
            case "Quit":
                surface.frame.Close = true;
                break;
            default:
                throw "Invalid state '"+v+"'";
            }
        }
        
        vexi.ui.frame = thisbox;
        
        current = $about;
        current.start = true;
        
    </ui:box>
</vexi>
