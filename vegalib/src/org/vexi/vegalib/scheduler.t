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
        thisobj.runempty = false;
        
        /** tell the call thread to limit itself to the given fps */
        thisobj.limitFPS = function(fps) {
            maxrate = arguments.length and (fps>1) ? 1000/fps : 0;
        }
        
        /** adds an object to the call list
         *
         * @param o (object)
         *  should have a function 'call' that returns true
         *  if it has finished or false if not yet finished
         */
        thisobj.add = function(o) { updates[ulength++] = o; }
        
        var go = false;   // current requested active state
        var tip = false;  // acronym for 'thread in progress'
        var time = vexi.date().getTime();
        var dtime;        // difference in time since last loop
        var gotime;       // total time spent in active state
        var fpstime;      // time since last fps count
        var fpscount;     // for counting fps
        
        /** clears all scheduled objects from the current thread */
        thisobj.clear = function() {
            for (var i=0; ulength>i; i++) {
                updates[i].over = true;
            }
            updates = [];
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
        thisobj.start = function() {
            if (tip) {
                return;
            }
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
                    } else {
                        fpscount++;
                    }
                    var drop = 0;
                    for (var i=0; ulength>i; i++) {
                        var o = updates[i];
                        var remove = false;
                        try {
                            remove = o.call(gotime, dtime);
                        } catch(e) {
                            vexi.log.info(e);
                            // drop erroring calls
                            remove = true;
                        }
                        if (remove) {
                            drop++;
                        } else {
                            // o is still valid but invalid
                            // objects can be removed
                            if (drop) {
                                updates[i-drop] = o;
                            }
                        }
                    }
                    // if updates length has reduced
                    // clean up duplicate references
                    if (drop>0) {
                        ulength -= drop;
                        updates.splice(ulength, drop);
                    }
                    if (ulength==0 and !runempty) {
                        // nothing left to run
                        go = false;
                    } else {
                        // attempt to sleep so that we are run after
                        // maxrate ms - accounting for any rendering
                        if (maxrate>dtime) {
                            vexi.thread.sleep(maxrate-dtime);
                        } else {
                            vexi.thread.yield();
                        }
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