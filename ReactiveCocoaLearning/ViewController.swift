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
        
        ///Transforming Event Stream Example
//        let (producerA, lettersObserver) = SignalProducer<String, NoError>.buffer(3)
//        let (producerB, numbersObserver) = SignalProducer<String, NoError>.buffer(3)
//        
//        let (signal, observer) = SignalProducer<SignalProducer<String, NoError>, NoError>.buffer(3)
//        
//        signal.flatten(.Merge).startWithNext { (next) -> () in
//            print(next)
//        }
//        
//        observer.sendNext(producerA)
//        observer.sendNext(producerB)
//        observer.sendCompleted()
//        
//        lettersObserver.sendNext("a")
//        numbersObserver.sendNext("1")
//        lettersObserver.sendNext("b")
//        numbersObserver.sendNext("2")
//        numbersObserver.sendNext("3")
//        lettersObserver.sendNext("c")
//        numbersObserver.sendNext("4")
//        lettersObserver.sendNext("d")
//        numbersObserver.sendNext("5")        
        

        
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


