//
//  ViewController.swift
//  PushTest
//
//  Created by user on 1/18/16.
//  Copyright © 2016 FarTeen. All rights reserved.
//

import UIKit
import ReactiveCocoa
import Result

//From https://gist.github.com/natecook1000/b0285b518576b22c4dc8
extension NSTimer {
    /**
     Creates and schedules a one-time `NSTimer` instance.
     
     - Parameters:
     - delay: The delay before execution.
     - handler: A closure to execute after `delay`.
     
     - Returns: The newly-created `NSTimer` instance.
     */
    class func schedule(delay delay: NSTimeInterval, handler: NSTimer! -> Void) -> NSTimer {
        let fireDate = delay + CFAbsoluteTimeGetCurrent()
        let timer = CFRunLoopTimerCreateWithHandler(kCFAllocatorDefault, fireDate, 0, 0, 0, handler)
        CFRunLoopAddTimer(CFRunLoopGetCurrent(), timer, kCFRunLoopCommonModes)
        return timer
    }
    
    /**
     Creates and schedules a repeating `NSTimer` instance.
     
     - Parameters:
     - repeatInterval: The interval (in seconds) between each execution of
     `handler`. Note that individual calls may be delayed; subsequent calls
     to `handler` will be based on the time the timer was created.
     - handler: A closure to execute at each `repeatInterval`.
     
     - Returns: The newly-created `NSTimer` instance.
     */
    class func schedule(repeatInterval interval: NSTimeInterval, handler: NSTimer! -> Void) -> NSTimer {
        let fireDate = interval + CFAbsoluteTimeGetCurrent()
        let timer = CFRunLoopTimerCreateWithHandler(kCFAllocatorDefault, fireDate, interval, 0, 0, handler)
        CFRunLoopAddTimer(CFRunLoopGetCurrent(), timer, kCFRunLoopCommonModes)
        return timer
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var tfInput: UITextField!
    
    func timerAction(timer: NSTimer) {
        let observer = timer.userInfo as! Observer<Int, NoError>
        observer.sendNext(123)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ///InjectingEffects Example
        let signalProducer = SignalProducer<Int, NoError> { observer, disposal in
            NSTimer.schedule(repeatInterval: 2.0, handler: { (timer) -> Void in
                observer.sendNext(123)
            })
        }
        
        signalProducer.startWithNext { (next) -> () in
            print(next)
        }
        
//        let resultSignalProducer = signalProducer.on(started: { () -> () in
//                print("started")
//            }, event: { (event) -> () in
//                
//                print("event")
//            }, failed: { (error) -> () in
//                print("failed")
//            }, completed: { () -> () in
//                print("completed")
//            }, interrupted: { () -> () in
//                print("interupted")
//            }, terminated: { () -> () in
//                print("terminated")
//            }, disposed: { () -> () in
//                print("disposed")
//            }) { (next) -> () in
//                
//                print("happpend \(next)")
//        }
//        
//        cansendObserver.sendNext(123123)
        
      }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

class TestClass {
    func testVariadicParameter(names: String..., ages: Int) {
        
    }
}


