<!-- Copyright 2009 - MIT License -->

<vexi xmlns:js="vexi://js" xmlns:meta="vexi://meta">
    <meta:doc>
        <author>Charles Goodwin</author>
        <notes>See vexi.vegalib.scheduler for usage details</notes>
    </meta:doc>
    
    <js:object>
	    
	    var updates = [];
	    var ulength = 0;
	    var maxrate = 40;
	    
	    thisobj.fps = 0;
	    
	    /** tell the call thread to limit itself to the given fps */
	    thisobj.limitFPS = function(fps) {
	        maxrate = arguments.length and (fps>1) ? 1000/fps : 0;
	    }
	    
	    /**
	     * adds an object to the call list
	     *
	     * @param o (object)
	     *  should have a function 'call' that returns true
	     *  if it has finished or false if not yet finished
	     */
	    thisobj.add = function(o) { updates[ulength++] = o; }
	    
	    var go = false;
	    var tip = false;
	    var time = vexi.date().getTime();
	    var dtime;
	    var gotime;
	    var fpstime;
	    var fpscount;
        
        /** clears all scheduled objects from the current thread */
        thisobj.clear = function() {
            for (var i=0; ulength>i; i++) {
                updates[i].over = true;
                updates = [];
            }
        }
        
        /** pause the call thread until start is called again */
        thisobj.pause = function() { go = false; }
        
        /** shorthand for add then start */
        thisobj.run = function(o) { add(o); start(); }
	    
	    /** start the call thread
	     *
	     * @param runempty
	     *  if true, the call thread will continue when empty 
	     */
	    thisobj.start = function(runempty) {
	        if (tip) return;
            go = true;
	        tip = true;
	        time = vexi.date().getTime();
	        dtime = 0;
	        gotime = 0;
	        fpstime = 0;
	        fpscount = 0;
            vexi.thread = function() {
                while (go) {
                    dtime = vexi.date().getTime() - time;
                    time += dtime;
                    gotime += dtime;
                    fpstime += dtime;
                    if (fpstime>1000) {
                        fps = fpscount;
                        fpscount = 0;
                        fpstime -= 1000;
                    } else fpscount++;
                    var drop = 0;
                    for (var i=0; ulength>i; i++) {
                        var o = updates[i];
                        if (o.call(gotime, dtime)) {
                            drop++;
                        } else {
                            // o is still valid but invalid
                            // objects can be removed
                            if (drop) updates[i-drop] = o;
                        }
                    }
                    if (drop) {
                        // updates length has reduced
                        ulength -= drop;
                        // clean up duplicate references
                        updates.splice(ulength, drop);
                    }
                    if (ulength==0 and !runempty) go = false;
                    else {
                        // attempt to sleep so that we are run after
                        // maxrate ms - accounting for any rendering
                        if (maxrate>dtime) vexi.thread.sleep(maxrate-dtime);
                    }
                }
                tip = false;
            }
	    }
        
        /** stops the call thread cold */
        thisobj.stop = function() {
            go = false;
            gotime = 0;
            clear();
        }
        
    </js:object>
</vexi>