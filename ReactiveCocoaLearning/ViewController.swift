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
        
        ///skipUntil Example
//        let (signal, observer) = Signal<String, NoError>.pipe()
//        let (signal2, observer2) = Signal<(), NoError>.pipe()
//        let skipUntilSignal = signal.skipUntil(signal2)
//        
//        skipUntilSignal.observeNext { (string) -> () in
//            print("\(NSDate()) skipUntilSignal \(string)")
//        }
//        
//        signal2.observeNext { () -> () in
//            print("Observer2 has send Next")
//        }
//        
//        dispatch_after(DISPATCH_TIME_NOW, dispatch_get_global_queue(0, 0)) { () -> Void in
//            QueueScheduler.mainQueueScheduler.scheduleAfter(NSDate(timeIntervalSinceNow: 2), action: { () -> () in
//                observer.sendNext("timer 22222")
//            })
//            QueueScheduler.mainQueueScheduler.scheduleAfter(NSDate(timeIntervalSinceNow: 4), action: { () -> () in
//                observer.sendNext("timer 44444")
//            })
//            QueueScheduler.mainQueueScheduler.scheduleAfter(NSDate(timeIntervalSinceNow: 6), action: { () -> () in
//                observer.sendNext("timer 66666")
//            })
//            QueueScheduler.mainQueueScheduler.scheduleAfter(NSDate(timeIntervalSinceNow: 5), action: { () -> () in
//                observer2.sendNext(())
//            })
//            
//        }
        
      }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

