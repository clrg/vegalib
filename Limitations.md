# Introduction #

The Vexi platform is primarily for creating user interfaces.  It has several limitations when it comes to creating games.

# Sound #

There is currently no support for sound in Vexi.  It will have it soon, but even then it will be fairly limited.  Vexi/Vegalib should not be used for audio-intensive games.

# Graphics #

Vexi runs on Java.  It also presents a very high level of abstraction to the developer, which means that in general it handles graphics very inefficiently.

### No z-clipping ###

In the following example, every box with a fill gets painted although the user only sees the blue box:

```
<ui:box layout="layer">
    <ui:box fill="red" />
    <ui:box fill="yellow" />
    <ui:box fill="green" />
    <ui:box fill="blue" />
</ui:box>
```

### Inconsistent acceleration ###

Java, and by extension Vexi, isn't great at emphasising what images get handled by the graphics card and what gets handled by software drivers.  In general, if you want your images to be hardware accelerated, make them power of 2 squares i.e. 64x64, 128x128 etc.

# Threading #

Vexi is single-threaded.  Although you can create background threads, only one of the foreground or a background thread is ever executing; Vexi thread execution is never concurrent.  The foreground aka rendering thread is executed with a higher priority.

Take a hypothetical situation where the width of box $a is changing constantly:

```
<ui:box id="a" />
vexi.thread = function() { while (true) { vexi.trace("first thread"); vexi.thread.yield(); }; }
vexi.thread = function() { while (true) { vexi.trace("second thread"); vexi.thread.yield(); }; }
$a.width ++= function(v) { cascade = v; vexi.trace("width changed!");
```

The output here would be:

```
"width changed"
"first thread"
"width changed"
"second thread"
"width changed"
"first thread"
...
```