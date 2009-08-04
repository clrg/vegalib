<!-- Copyright 2008 - see COPYING for details [LGPL] -->

<vexi xmlns:ui="vexi://ui" xmlns:meta="vexi://meta" xmlns="vexi">
    <meta:doc>
        <author>Charles Goodwin</author>
        <desc></desc>
    </meta:doc>
    
    <ui:box>
        
        // the surface object and key components
        var s = {};
        
        /** proxy to the surface object */
        thisbox.surface ++= function() { return s; };
        
        var event = {
            addMoveTrap:function(v) { thisbox._Move ++= v; },
            delMoveTrap:function(v) { thisbox._Move --= v; },
            addEventTrap:function(e, t) { thisbox[e] ++= v; },
            delEventTrap:function(e, t) { thisbox[e] --= v; }
        };
        s.event ++= function() { return event; }
        s.event ++= .util.common..readOnly;
        
        var frame = {};
        s.frame ++= function() { return frame; }
        s.frame ++= .util.common..readOnly;
        
        // for locking trap forwarding on CLose/s.Close
        var closeLock = false;
        
        /** notify surface.Close when closing surface */
        thisbox.Close ++= function(v) {
            if (!closeLock) {
                closeLock = true;
                frame.Close = true;
                closeLock = false;
            }
            cascade = v;
        }
        
        /** manually redirect s.Close */
        frame.Close ++= function(v) {
            if (closeLock) return;
            closeLock = true;
            Close = true;
            closeLock = false;
            cascade = v;
        };
        
        /** redirect event properties for access */
        .util.redirect..addRedirect(event, thisbox, "_Release1");
        
        /** redirect frame properties for access */
        .util.redirect..addRedirect(frame, thisbox,
            "framewidth", "frameheight", "frameicon", "frametitle",
            "mouse", "distanceto", "width", "height", "x", "y",
            "ToFront", "ToBack", "Focused", "Maximized", "Minimized");
        
        /*
         * THEME HANDLING
         */
        
        // stops warnings about an undeclared property
        thisbox.theme;
        // no theme/icons have been specified by the user
        if (theme == null) theme = static.theme;
        // set up the theme/icons redirects
        .theme ++= theme;
        
        // do the same for icons
        thisbox.icons;
        if (icons == null) icons = static.icon;
        if (icons) .icon ++= icons;
        
        // apply the theme surface template
        .theme.surface(thisbox);
        
    </ui:box>
    
    /** access to the theme parameter setting */
    static.theme ++= function() {
        var themestr = vexi.params["vexi.theme"];
        var themeres = null;
        if (themestr != null) {
            var sub = themestr.split('.');
            var res = vexi[""];
            for (var i=0; sub.length>i; i++)
                res = res[sub[i]];
            themeres = res;
        }
        if (themeres == null) {
            if (.conf.theme[""]!=null)
                themeres = .conf.theme..location;
        }
        var ret = themeres != null ? themeres : vexi..org.vexi.theme.classic;
        var str = (""+ret);
        str = str.substring(0, str.indexOf('$'));
        vexi.log.debug("using theme "+ret.settings..themename+": "+str);
        return ret;
    }
    
    /** access to the icon parameter setting */
    static.icon ++= function() {
        var iconstr = vexi.params["vexi.icon"];
        var iconres = null;
        if (iconstr != null) {
            var sub = iconstr.split('.');
            var res = vexi[""];
            for (var i=0; sub.length>i; i++)
                res = res[sub[i]];
            iconres = res;
        }
        if (iconres == null) {
            if (.conf.icon[""]!=null)
                iconres = .conf.icon..location;
        }
        var ret = iconres != null ? iconres : .theme.settings..iconlocation;
        var str = (""+ret);
        str = str.substring(0, str.indexOf('$'));
        vexi.log.debug("using icon set: "+str);
        return ret;
    }
    
</vexi>
