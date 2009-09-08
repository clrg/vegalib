<vexi xmlns:ui="vexi://ui" xmlns="vexitris">
    <ui:box orient="vertical" frametitle="A font made of boxes!">
        <ui:box id="b" shrink="true" />
        <ui:box id="b2" shrink="true" />
        var str="ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
        for (var i=0; str.length>i; i++) {
            $b[i] = new .vfont(str.charAt(i));
        }
        for (var i=0; str.length>i; i++) {
            $b2[i] = new .vfont(str.charAt(i), 18);
        }
        vexi.ui.frame = thisbox;
    </ui:box>
</vexi>