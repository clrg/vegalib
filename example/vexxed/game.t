<!-- Public Domain -->

<vexi xmlns:ui="vexi://ui" xmlns="vexi.widget" xmlns:vgl="vexi.vegalib"
    xmlns:role="org.vexi.lib.role">
    <vgl:game align="topleft" fill="lightgray" layout="layer">
        <ui:box orient="vertical">
            <ui:box />
            <ui:box>
                <ui:box />
                <border id="x" border="black" depth="1" fill="darkgray" />
                <ui:box />
                <border id="y" border="black" depth="1" fill="darkgray" />
                <ui:box />
                <border id="z" border="black" depth="1" fill="darkgray" />
                <ui:box />
            </ui:box>
            <ui:box />
            <ui:box>
                <ui:box />
                <ui:box />
                <border id="r" border="black" depth="1" fill="red" />
                <ui:box />
                <border id="g" border="black" depth="1" fill="green" />
                <ui:box />
                <border id="b" border="black" depth="1" fill="blue" />
                <ui:box />
                <ui:box />
            </ui:box>
            <ui:box />
        </ui:box>
        <role:draggable id="c" display="false">
            <border border="white" depth="1" />
        </role:draggable>
        
        var makeSquare = function(v) {
            cascade = v;
            trapee.height = v;
        }
        
        $x.width ++= makeSquare;
        $y.width ++= makeSquare;
        $z.width ++= makeSquare;
        $r.width ++= makeSquare;
        $g.width ++= makeSquare;
        $b.width ++= makeSquare;
        $c.width ++= makeSquare;
        
        var active;
        var sx, sy;
        
        $c.dragUpdate ++= function(m) {
            cascade = v;
            $c.x = m.x + sx;
            $c.y = m.y + sy;
            var cx = $c.x;
            var cxw = $c.x+$c.width;
            var cy = $c.y;
            var cyh = $c.y+$c.height;
            var dx = thisbox.distanceto($x);
            if (cx > dx.x and cy > dx.y and dx.x+$x.width > cxw and dx.y+$x.height > cyh) {
                $x.fill = "gray";
                $y.fill = "darkgray";
                $z.fill = "darkgray";
                active = $x;
                return;
            }
            var dy = thisbox.distanceto($y);
            if (cx > dy.x and cy > dy.y and dy.x+$y.width > cxw and dy.y+$y.height > cyh) {
                $x.fill = "darkgray";
                $y.fill = "gray";
                $z.fill = "darkgray";
                active = $y;
                return;
            }
            var dz = thisbox.distanceto($z);
            if (cx > dz.x and cy > dz.y and dz.x+$z.width > cxw and dz.y+$z.height > cyh) {
                $x.fill = "darkgray";
                $y.fill = "darkgray";
                $z.fill = "gray";
                active = $z;
                return;
            }
            active = null;
            $x.fill = "darkgray";
            $y.fill = "darkgray";
            $z.fill = "darkgray";
        }
        
        $c.dragFinish ++= function(v) {
            cascade = v;
            active = null;
            $c.display = false;
            $x.fill = "darkgray";
            $y.fill = "darkgray";
            $z.fill = "darkgray";
        }
        
        var startDrag = function(v) {
            cascade = v;
            $c.display = true;
            $c.width = trapee.width;
            $c[0].fill = trapee.fill;
            var m = mouse;
            sx = m.x - ($c.width/2);
            sy = m.y - ($c.height/2);
            $c.x = sx;
            $c.y = sy;
            // starts draggable
            $c.Press1 = true;
        }
        
        $r.Press1 ++= startDrag;
        $g.Press1 ++= startDrag;
        $b.Press1 ++= startDrag;
        
        //start();
        
    </vgl:game>
</vexi>