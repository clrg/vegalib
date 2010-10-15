<vexi xmlns:ui="vexi://ui" xmlns="starfield">
    <ui:box width="50" height="50" layout="layer" shrink="true">
        <ui:box orient="vertical">
            <ui:box id="up" align="topleft" layout="place">
                <ui:box id="arrow_y" fill=":.image.arrow_base" shrink="true" y="25" />
            </ui:box>
            <ui:box id="down" align="topleft" layout="place" />
        </ui:box>
        <ui:box>
            <ui:box id="left" align="topleft" layout="place">
                <ui:box id="arrow_x" fill=":.image.arrow_base" shrink="true" x="25" />
            </ui:box>
            <ui:box id="right" align="topleft" layout="place" />
        </ui:box>
        
        thisbox.speed_x ++= function(v) {
            cascade = v;
            if (v > 0) {
                if ($right.numchildren==0) {
                    $right[0] = $arrow_x;
                }
                $arrow_x.x = -50 + 2*v;
            } else {
                if ($left.numchildren==0) {
                    $left[0] = $arrow_x;
                }
                $arrow_x.x = v==0 ? 25 : 24 + 2*v;
            }
        }
        
        thisbox.speed_y ++= function(v) {
            cascade = v;
            if (v > 0) {
                if ($down.numchildren==0) {
                    $down[0] = $arrow_y;
                }
                $arrow_y.y = -50 + 2*v;
            } else {
                if ($up.numchildren==0) {
                    $up[0] = $arrow_y;
                }
                $arrow_y.y = v==0 ? 25 : 24 + 2*v;
            }
        }
        
    </ui:box>
</vexi>