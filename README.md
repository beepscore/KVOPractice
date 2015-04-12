# Purpose
Practice using key value observing KVO.

# References

## KVO Considered Harmful
2013-12-02  
http://khanlou.com/2013/12/kvo-considered-harmful/

## The Siren Call of KVO and (Cocoa) Bindings
2014-03-15  
http://blog.metaobject.com/2014/03/the-siren-call-of-kvo-and-cocoa-bindings.html

## Back to Basics: Using KVO
http://nachbaur.com/blog/back-to-basics-using-kvo

http://stackoverflow.com/questions/9611965/nsmutabledictionary-kvo?rq=1

## ReactiveCocoa
https://github.com/ReactiveCocoa/ReactiveCocoa  
ReactiveCocoa (RAC) is an Objective-C framework inspired by Functional Reactive Programming.  
It provides APIs for composing and transforming streams of values.  
It works much like KVO, but with blocks instead of overriding
    -observeValueForKeyPath:ofObject:change:context:  

# Results

## Thread safety
UI runs on main thread.
If KVO notification arrives from a background thread, must switch to main thread to update UI.

## NSMutableArray NSMutableDictionary not thread safe
Can use NSArray or NSDictionary or copy a mutable to a non-mutable class and use it.
https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/Multithreading/ThreadSafetySummary/ThreadSafetySummary.html

