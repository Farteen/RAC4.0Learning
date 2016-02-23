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

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ///throttle Example
        ///1.结果?
        ///2.顺序?
        ///3.结论什么是throttle
        let (signal, observer) = Signal<Int, NSError>.pipe()
        let (signal2, observer2) = Signal<Int, NoError>.pipe()
        
        let throttleSignal = signal.throttle(5.1, onScheduler: QueueScheduler.mainQueueScheduler)
        throttleSignal.observeNext { (next) -> () in
            print("\(NSDate()) throttle \(next)")
        }
        
        observer.sendNext(1)
        observer.sendNext(2)
        observer.sendNext(3)
        
        print("\(NSDate())")
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(2.0 * Double(NSEC_PER_SEC))), dispatch_get_main_queue()) { () -> Void in
            observer.sendNext(1000)
        }
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(5.2 * Double(NSEC_PER_SEC))), dispatch_get_global_queue(0, 0)) { () -> Void in
            observer.sendNext(4)
            observer.sendNext(5)
            dispatch_after(DISPATCH_TIME_NOW, dispatch_get_global_queue(0, 0), { () -> Void in
                observer.sendNext(6)
            })
        }

        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(6.0 * Double(NSEC_PER_SEC))), dispatch_get_global_queue(0, 0)) { () -> Void in
            observer.sendNext(7)
            
        }
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(11.0 * Double(NSEC_PER_SEC))), dispatch_get_global_queue(0, 0)) { () -> Void in
            observer.sendNext(8)
        }
        
        
        
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


