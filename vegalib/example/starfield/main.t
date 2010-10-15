<vexi xmlns:ui="vexi://ui" xmlns="starfield">
    <ui:box align="bottomright" layout="layer">
        <starfield id="starfield" />
        <direction id="direction" />
        
        vexi.ui.frame = thisbox;
        
        var speed_x=0, speed_y=0;
        
        _KeyPressed ++= function(v) {
            cascade = v;
            switch(v) {
            case "C-up":
                if (speed_y>-12) {
                    speed_y--;
                    $direction.speed_y = speed_y;
                    $starfield.speed_y = speed_y;
                }
                break;
            case "C-down":
                if (12>speed_y) {
                    speed_y++;
                    $direction.speed_y = speed_y;
                    $starfield.speed_y = speed_y;
                }
                break;
            case "C-left":
                if (speed_x>-12) {
                    speed_x--;
                    $direction.speed_x = speed_x;
                    $starfield.speed_x = speed_x;
                }
                break;
            case "C-right":
                if (12>speed_x) {
                    speed_x++;
                    $direction.speed_x = speed_x;
                    $starfield.speed_x = speed_x;
                }
                break;
            default:
                break;
            }
        }
        
    </ui:box>
</vexi>