//
//  ViewController.swift
//  PushTest
//
//  Created by user on 1/18/16.
//  Copyright © 2016 FarTeen. All rights reserved.
//

import UIKit
import ReactiveCocoa

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ///takeUntil Example
        let (signal, observer) = Signal<String, NoError>.pipe()
        let (signal2, observer2) = Signal<(), NoError>.pipe()
        
        let resultSignal = signal.takeUntil(signal2)
        
        signal2.observeNext { () -> () in
            print("signal2...")
        }
        
        resultSignal.observeNext { (string) -> () in
            print(string)
        }
        
        dispatch_after(DISPATCH_TIME_NOW, dispatch_get_global_queue(0, 0)) { () -> Void in
            QueueScheduler.mainQueueScheduler.scheduleAfter(NSDate(timeIntervalSinceNow: 2.0)) { () -> () in
                print("timer 2222")
                observer.sendNext("ob1")
            }
            QueueScheduler.mainQueueScheduler.scheduleAfter(NSDate(timeIntervalSinceNow: 4.0)) { () -> () in
                print("timer 4444")
                observer.sendNext("ob1")
            }
            QueueScheduler.mainQueueScheduler.scheduleAfter(NSDate(timeIntervalSinceNow: 6.0)) { () -> () in
                print("timer 6666")
                observer.sendNext("ob1")
            }
            
            QueueScheduler.mainQueueScheduler.scheduleAfter(NSDate(timeIntervalSinceNow: 5)) { () -> () in
                print("timer 5555")
                observer2.sendNext(())
                observer2.sendCompleted()
            }
        }
        
      }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

