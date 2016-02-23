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
        
        ///timeoutWithError Example
        let (signal, observer) = Signal<Int, NSError>.pipe()
        let (signal2, observer2) = Signal<Int, NSError>.pipe()
        
        let timeoutWithErrorSignal = signal.timeoutWithError(NSError(domain: "domain 123", code: 1000, userInfo: nil), afterInterval: 10, onScheduler: QueueScheduler.mainQueueScheduler)
        
        timeoutWithErrorSignal.observeNext { (next) -> () in
            print("next \(next)")
        }
        timeoutWithErrorSignal.observeFailed { (error) -> () in
            print(error)
        }
        timeoutWithErrorSignal.observeCompleted { () -> () in
            
        }
        
        observer.sendNext(1)
        observer.sendNext(2)
        observer.sendNext(3)
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(10.1 * Double(NSEC_PER_SEC))), dispatch_get_main_queue()) { () -> Void in
            observer.sendCompleted()
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


