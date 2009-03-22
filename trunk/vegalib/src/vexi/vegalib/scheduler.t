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
    </meta:doc>
    
    <scheduler />
</vexi>