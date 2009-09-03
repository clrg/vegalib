<!-- Copyright 2009 - MIT License -->

<vexi xmlns:meta="vexi://meta" xmlns="org.vexi.vegalib">
    <meta:doc>
        <author>Charles Goodwin</author>
        <notes>
            A scheduler designed to overcome the single-threaded nature
            of the Vexi core.  It essentially allows you to schedule a
            large number of callable objects and have them executed as
            often as the core renders.
            
            Note that it is not implemented statically, allowing you to
            run multiple schedulers as it may be desirable to stop one
            then start another.  You should avoid running schedulers
            concurrently as it will greatly reduce call performance.
        </notes>
        <usage>
            Use add(o) to add an object to the scheduler.  The object
            should implement a method 'call' that takes two arguments;
            'gotime' is the total execution time(ms) and 'dtime' is
            the time(ms) since the object was lasted called.  The
            meothd should return a boolean - true then the object then
            be removed from the scheduler, false to remain scheduled.
            
            Use run(o) to simulatenously add and start the scheduler.
            
            Use start(runempty) to start the scheduler, where runempty
            describes whether to keep the scheduler running when there
            are no objects left to call.  If a scheduler is paused then
            start() will resume the scheduler using the previous value
            of runempty.
            
            Use clear() to remove all scheduled objects, pause() to
            pause the current exection, and stop() to pause and clear.
        </usage>
    </meta:doc>
    
    <scheduler />
</vexi>