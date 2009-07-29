<vexi xmlns:ui="vexi://ui" xmlns="vexi.layout">
    <ui:box id="game" layout="layer">
        <ui:box>
            <ui:box width="3" fill="darkgreen" />
            <ui:box orient="vertical">
                <ui:box height="3" fill="darkgreen" />
                <ui:box vshrink="true">
                    <ui:box width="5" />
                    <ui:box textcolor="white" fontsize="24" text="0" shrink="true" />
                    <ui:box width="5" />
                    <ui:box textcolor="red" fontsize="18" text="Player 1" shrink="true" />
                    <ui:box width="5" />
                    <ui:box textcolor="gray" fontsize="14" text="versus" />
                    <ui:box width="5" />
                    <ui:box textcolor="blue" fontsize="18" text="Player 2" shrink="true" />
                    <ui:box width="5" />
                    <ui:box textcolor="white" fontsize="24" text="0" shrink="true" />
                    <ui:box width="5" />
                </ui:box>
                <ui:box height="3" fill="darkgreen" />
                <ui:box id="park" align="topleft" layout="place">
                    <ui:box width="3" fill="darkgreen" />
                    <ui:box id="ball" width="5" height="5" fill="yellow" />
                    <ui:box id="p1" width="15" height="60" fill="red" x="10" />
                    <ui:box id="p2" width="15" height="60" fill="blue" x="-10" />
                </ui:box>
                <ui:box height="3" fill="darkgreen" />
            </ui:box>
            <ui:box width="3" fill="darkgreen" />
        </ui:box>
        <pad id="pause" padding="5" display="false" fill="white" shrink="true">
            <pad padding="10" fill="black" textcolor="white" text="Paused" />
        </pad>
        
        var go = function(v) {
            $pause.display = false;
        }
        
        var pauseFunc = function(v) {
            $pause.display = true;
            cascade = v;
        }
        
        width ++= pauseFunc;
        height ++= pauseFunc;
        
        visible ++= function(v) {
            cascade = v;
            $p1.y = ($park.height - $p1.height / 2);
            $p2.y = ($park.height - $p2.height / 2);
        }
        
    </ui:box>
</vexi>