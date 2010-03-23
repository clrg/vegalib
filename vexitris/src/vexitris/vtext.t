<!-- Copyright 2009 - see COPYING for details [GPL] -->

<vexi xmlns:ui="vexi://ui" xmlns:meta="vexi://meta" xmlns="org.vexi.vegalib.effect"
    xmlns:vtris="vexitris">
    <meta:doc>
        <author>Charles Goodwin</author>
        <desc>A text element handler</desc>
    </meta:doc>
    
    <fade fadecolor="black" fadetype="overlay" fontsize="12" shrink="true" textcolor="white">
        
        var str;
        thisbox.text ++= function(v) {
            clear();
            str = v!=null ? v : "";
            for (var i=0; str.length>i; i++) {
                thisbox[i] = new vtris.vfont(str.charAt(i), fontsize, textcolor);
            }
        }
        
        var forwardProp = function(v) {
            cascade = v;
            for (var i,vchar in thisbox) {
                vchar[trapname] = v;
            }
        }
        thisbox.fontsize ++= forwardProp;
        thisbox.textcolor ++= forwardProp;
        
        /** when an action function is assigned, become an active link */
        thisbox.action ++= function(v) {
            cascade = v;
            Enter ++= function(v) { cascade = v; textcolor="red"; }
            Leave ++= function(v) { cascade = v; textcolor="white"; }
            Press1 ++= function(v) { cascade = v; action(); }
        }
        
        /** create action function that changes game state */
        thisbox.state ++= function(v) {
            cascade = v;
            action = function() { surface.state = state; }
        }
         
    </fade>
</vexi>
