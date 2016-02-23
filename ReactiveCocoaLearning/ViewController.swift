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
        
        ///delay Example
        let (signal, observer) = Signal<String, NoError>.pipe()
        let (signal2, observer2) = Signal<(), NoError>.pipe()
        
        let delaySignal = signal.delay(2, onScheduler: QueueScheduler.mainQueueScheduler)
        delaySignal.observeNext { (next) -> () in
            print("\(NSDate()) \(next)")
        }
        print("\(NSDate())")
        observer.sendNext("123")
        
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


