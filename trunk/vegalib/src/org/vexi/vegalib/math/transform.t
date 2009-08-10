<!-- Copyright 2009 - MIT License -->

<vexi xmlns:js="vexi://js">
    <js:Object>
        
        var mref;
        var size;
        
        thisobj.matrix ++= function(v) {
            var l = v.length;
            var valid = (l==4 or l==9);
            if (valid == false) throw "Expected an array of length '4' or '9' but got '"+l+"'";
            cascade = v;
            mref = v;
            size = l;
        }
        
        thisobj.transform = function(v, ret) {
            var l = v.length;
            if (size/l != l) throw "Expected an array of length '"+vexi.math.sqrt(size)+" but got '"+l+"'";
            if (ret == null) ret = [];
            var npos;
            for (var i=0; l>i; i++) {
                dpos = 0;
                var pos = v[i];
                for (var j=0; l>j; j++)
                    dpos += pos*mref[i+j*l];
                ret[i] = dpos;
            }
            return ret;
        }
        
        if (arguments.length) {
            var theta = arguments[0];
            var m = cache.rotation[theta];
            if (m == null) {
                var cos = vexi.math.cos(theta);
                var sin = vexi.math.sin(theta);
                m = [ cos, -sin, cos, sin ];
            }
            cache.rotation[theta] = m;
            matrix = m;
        }
        
    </js:Object>
    
    static.cache = { rotation:{} };
    
</vexi>