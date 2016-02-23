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
        
        ///observeOn Example
        let (signal, observer) = Signal<String, NoError>.pipe()
        let (signal2, observer2) = Signal<String, NoError>.pipe()
        let observeOnSignal = signal.observeOn(ImmediateScheduler.init())//QueueScheduler.init(queue: dispatch_get_global_queue(0, 0)))
        observeOnSignal.observeNext { (next) -> () in
            print("current  \(NSThread.currentThread())")
            print("main     \(NSThread.mainThread())")
            print(next)
        }
        
        observer.sendNext("1")
        observer.sendNext("2")
        
        
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


