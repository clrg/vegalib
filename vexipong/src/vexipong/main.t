<vexi xmlns:ui="vexi://ui" xmlns:vp="vexipong" xmlns:lay="vexi.layout" xmlns="vexi.widget">
    <surface />
    <lay:cardpane fill="black">
        vexi.ui.frame = thisbox;
        <ui:box id="menu">
            <ui:box orient="vertical" shrink="true">
                <vp:option id="start" text="Start New Game" selected="true" />
                <vp:option id="p1opt" text="Player 1 Options" />
                <vp:option id="p2opt" text="Player 2 Options" />
                <vp:option id="leave" text="Quit" />
                $p1opt.group = $start.group;
                $p2opt.group = $start.group;
                $leave.group = $start.group;
            </ui:box>
        </ui:box>
        <vp:game id="game" />
        
        $leave.action ++= function(v) { surface.frame.Close = true; return; }
        $p1opt.action ++= function(v) { vexi.log.info("TODO!"); return; }
        $p2opt.action ++= function(v) { vexi.log.info("TODO!"); return; }
        $start.action ++= function(v) { show = $game; return; }
        
    </lay:cardpane>
</vexi>