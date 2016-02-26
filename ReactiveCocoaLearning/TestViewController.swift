//
//  TestViewController.swift
//  ReactiveCocoaLearning
//
//  Created by user on 2/5/16.
//  Copyright © 2016 FarTeen. All rights reserved.
//

import UIKit
import ReactiveCocoa

class TestViewController: UIViewController {

    @IBOutlet weak var tfInput: UITextField!
    
    func createSignal() -> Signal<String, NoError> {
        var count = 0
        return Signal {
            sink in
            NSTimer.schedule(repeatInterval: 1.0) { timer in
                //                    sendNext(sink, "tick #\(count++)")
                sink.sendNext("tick #\(count++) \(timer)")
            }
            return nil
        }
    }
    
    func createSignalProducer() -> SignalProducer<String, NoError> {
        
        var count = 0
        return SignalProducer { (observer: ReactiveCocoa.Observer<String, NoError>, disposal:ReactiveCocoa.CompositeDisposable) in
            NSTimer.schedule(repeatInterval: 1.0) { timer in
                //                    sendNext(sink, "tick #\(count++)")
                observer.sendNext("producer tick #\(count++) \(timer)")
            }
        }
        
    }
    
    override func viewDidLoad() {
        
        //----------------------------------------Signal----------------------------------------//
//        let signal = createSignal()
//        signal.observeNext { (next) -> () in
//            print(next)
//        }
//        
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(5.0 * Double(NSEC_PER_SEC))), dispatch_get_main_queue()) { () -> Void in
//            signal.observeNext({ (next) -> () in
//                print("delay 5.0 \(next)")
//            })
//        }
        
        
        //----------------------------------------SignalProducer----------------------------------------//
//        let signalProducer = createSignalProducer()
//        signalProducer.startWithNext { (next) -> () in
//            print(next)
//        }
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(5.0 * Double(NSEC_PER_SEC))), dispatch_get_main_queue()) { () -> Void in
//            signalProducer.startWithNext({ (next) -> () in
//                print("delay 5.0 \(next)")                
//            })
//        }
//        signalProducer.delay(5.0, onScheduler: QueueScheduler.mainQueueScheduler).startWithNext { (next) -> () in
//            print("delay 5.0 \(next)")
//        }
//        
//        signalProducer.start()
        
        let (signalProducer, observer) = SignalProducer<Int, NoError>.buffer(2)
        signalProducer.startWithNext { (next) -> () in
            print("1----- \(next) \(NSDate())")
        }
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(2.1 * Double(NSEC_PER_SEC))), dispatch_get_main_queue()) { () -> Void in
            signalProducer.startWithNext({ (next) -> () in
                print("2----- \(next) \(NSDate())")
            })
        }
        
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(1.0 * Double(NSEC_PER_SEC))), dispatch_get_main_queue()) { () -> Void in
            observer.sendNext(1)
        }
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(2.0 * Double(NSEC_PER_SEC))), dispatch_get_main_queue()) { () -> Void in
            observer.sendNext(2)
        }
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(3.0 * Double(NSEC_PER_SEC))), dispatch_get_main_queue()) { () -> Void in
            observer.sendNext(3)
        }
        
        print("view did load end \(NSDate())")
        
    }
}
