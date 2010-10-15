<vexi xmlns:ui="vexi://ui" xmlns="starfield">
    <ui:box align="topleft" layout="place">
        
        thisbox.density;
        thisbox.loweralpha;
        thisbox.upperalpha;
        
        var ceil = vexi.math.ceil;
        var random = vexi.math.random;
        
        thisbox.create = function(v) {
            clear();
            var alphavar = upperalpha - loweralpha;
            var lowalpha = loweralpha;
            var numstars = width * height * density / 1000;
            for (var i=0; numstars>i; i++) {
                var b = vexi.box;
                b.fill = '#'+(lowalpha+ceil(random()*alphavar)).toString(16)+"ffffff";
                b.width = 1;
                b.height = 1;
                b.x = ceil(random()*width);
                b.y = ceil(random()*height);
                add(b);
            }
        }
        
        vexi.thread = function(v) { vexi.thread.sleep(1000); create(); }
        
    </ui:box>
</vexi>