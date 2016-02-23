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
        
        //TakeUntilReplacement Example
        let (signal, observer) = Signal<Int, NoError>.pipe()
        
        let (signalReplacement, observer2) = Signal<Int, NoError>.pipe()
        
        let takeUntilReplacement = signal.takeUntilReplacement(signalReplacement)
        
        takeUntilReplacement.observeNext { (next) -> () in
            print("??????\(next)")
        }
        
        observer.sendNext(1)
        observer.sendNext(1)
        observer.sendNext(1)
        
        dispatch_after(DISPATCH_TIME_NOW, dispatch_get_main_queue()) { () -> Void in
            
            QueueScheduler.mainQueueScheduler.scheduleAfter(NSDate(timeIntervalSinceNow: 5), action: { () -> () in
                observer2.sendNext(2)
            })
            
            QueueScheduler.mainQueueScheduler.scheduleAfter(NSDate(timeIntervalSinceNow: 6), action: { () -> () in
                observer.sendNext(1)
            })
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

