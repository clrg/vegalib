<!-- Copyright 2009 - see COPYING for details [GPL] -->

<vexi xmlns:ui="vexi://ui" xmlns:meta="vexi://meta" xmlns="org.vexi.vegalib"
    xmlns:vtfont="vexitris.font">
    <meta:doc>
        <author>Charles Goodwin</author>
        <notes>
            A space holder for a block.
        </notes>
    </meta:doc>
    
    <fade fontsize="16" hshrink="true" textcolor="white">
         
         // assign font here as we need the .ttf extension
         // and that cannot be done purely in template xml
         thisbox.font = vtfont["slkscr.ttf"];
         
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
