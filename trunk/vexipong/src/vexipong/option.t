<vexi xmlns:ui="vexi://ui" xmlns="org.vexi.lib">
    <role.clickable />
    <role.selectable />
    <layout.pad padding="5">
        
        active ++= function(v) { cascade = v; textcolor = "green"; }
        hover  ++= function(v) { cascade = v; textcolor = "yellow"; }
        selected ++= function(v) { cascade = v; normal = true; }
        normal ++= function(v) {
            cascade = v;
            textcolor = selected ? "white" : "gray";
            fontsize = selected ? 24 : 18;
        }
        
    </layout.pad>
</vexi>