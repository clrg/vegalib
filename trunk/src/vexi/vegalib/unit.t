<!-- LGPL -->

<vexi xmlns:ui="vexi://ui">
    <ui:box layout="place">
        <ui:box id="image" align="bottomright" />
        
        thisbox.image ++= function(v) {
            cascade = v;
            $image.fill = v;
        }
        
        var right;
        var down;
        var left;
        var up;
        
        thisbox.animate = function() {
            if (right) $image.y = 60;
            else if (down) $image.y = 40;
            else if (left) $image.y = 20;
            else if (up) $image.y = 0;
            else return;
            var mx = $image.x + 20;
            if (mx > $image.width-20) mx = 0;
            $image.x = mx;
        }
        
        thisbox.KeyPressed ++= function(v) {
            switch(v) {
                case "right": right=true; break;
                case "down": down=true; break;
                case "left": left=true; break;
                case "up": up=true; break;
                default: break;
            }
            return;
        }
        
        thisbox.KeyReleased ++= function(v) {
            switch(v) {
                case "right": right=false; break;
                case "down": down=false; break;
                case "left": left=false; break;
                case "up": up=false; break;
                default: break;
            }
            return;
        }
        
    </ui:box>
</vexi>