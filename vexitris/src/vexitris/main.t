<!-- Copyright 2009 - see COPYING for details [GPL] -->

<vexi xmlns:ui="vexi://ui" xmlns:meta="vexi://meta" xmlns="vexitris"
    xmlns:vgl="vexi.vegalib" xmlns:wi="vexi.widget">
    <meta:doc>
        <author>Charles Goodwin</author>
        <notes>
        </notes>
    </meta:doc>
    
    <wi:surface />
    <ui:box fill="black">
        <about id="about" />
        <menu id="menu" display="false" />
        <game id="game" display="false" />
        
        thisbox.current ++= function(v) {
            if (current) current.display = false;
            cascade = v;
            if (current) current.display = true;
        }
        
        surface.scheduler = vgl.scheduler({});
        
        surface.state ++= function(v) {
            cascade = v;
            vexi.trace(v);
            switch ($menu.state) {
            case "Menu":
                current = $menu;
                break;
            case "Game":
                current = $game;
                break;
            case "Pause":
                current = $menu;
                break;
            case "Quit":
                surface.frame.Close = true;
                break;
            default:
                throw "Invalid state '"+$menu.state+"'";
            }
        }
        
        vexi.ui.frame = thisbox;
        
        $about.start = true;
        
    </ui:box>
</vexi>
