# Purpose
Practice using key value observing KVO.

# References

## Apple iOS Key-Value Observing Programming Guide
https://developer.apple.com/library/ios/documentation/Cocoa/Conceptual/KeyValueObserving/Articles/KVOCompliance.html

## KVO Considered Harmful
2013-12-02  
http://khanlou.com/2013/12/kvo-considered-harmful/

## The Siren Call of KVO and (Cocoa) Bindings
2014-03-15  
http://blog.metaobject.com/2014/03/the-siren-call-of-kvo-and-cocoa-bindings.html

## Key-Value Observing
http://nshipster.com/key-value-observing/

## Back to Basics: Using KVO
http://nachbaur.com/blog/back-to-basics-using-kvo

http://stackoverflow.com/questions/9611965/nsmutabledictionary-kvo?rq=1

## ReactiveCocoa
https://github.com/ReactiveCocoa/ReactiveCocoa  
ReactiveCocoa (RAC) is an Objective-C framework inspired by Functional Reactive Programming.  
It provides APIs for composing and transforming streams of values.  
It works much like KVO, but with blocks instead of overriding
    -observeValueForKeyPath:ofObject:change:context:  

### If KVO is right, why does it feel so wrong?
https://www.ianthehenry.com/2014/5/4/kvo-101/

## Asynchronous Unit testing of KVO methods
Apple XCTestCase+AsynchronousTesting.h

http://astralbodi.es/2014/08/06/asynchronous-unit-testing-core-data-with-xcode-6/

http://www.pumpmybicep.com/2014/08/20/asynchronous-unit-testing-with-xctest/

http://iosunittesting.com/asynchronous-tests-using-xctestexpectation/

http://nshipster.com/xctestcase/

http://blog.dadabeatnik.com/2014/07/13/asynchronous-unit-testing-in-xcode-6/#more-1114

https://www.bignerdranch.com/blog/asynchronous-testing-with-xcode-6/

http://stackoverflow.com/questions/27555499/xctestexpectation-how-to-avoid-calling-the-fulfill-method-after-the-wait-contex

# Results

## Thread safety
UI runs on main thread.
If KVO notification arrives from a background thread, must switch to main thread to update UI.

## NSMutableArray NSMutableDictionary not thread safe
Can use NSArray or NSDictionary or copy a mutable to a non-mutable class and use it.
https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/Multithreading/ThreadSafetySummary/ThreadSafetySummary.html

