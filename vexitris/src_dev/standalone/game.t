<!-- Copyright 2009 - see COPYING for details [GPL] -->

<vexi xmlns:ui="vexi://ui" xmlns:meta="vexi://meta" xmlns="vexitris"
    xmlns:vgl="vexi.vegalib">
    
    <vgl:surface />
    <ui:box fill="black" frametitle="Vexitris Test">
        <dropeffect>
            <game id="game" name="Game" display="false" />
            <alien />
        </dropeffect>
        
        surface.scheduler = new vgl.scheduler();
        vexi.ui.frame = thisbox;
        vexi.thread = function() { $game.display = true; }
        
    </ui:box>
</vexi>
