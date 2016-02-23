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
        
        ///collect Example
        let (signal, observer) = Signal<String, NoError>.pipe()
        let (signal2, observer2) = Signal<String, NoError>.pipe()
        let collectSignal = signal.collect()
        collectSignal.observeNext { (next) -> () in
            print(next)
        }
        collectSignal.observeCompleted { () -> () in
            
        }
        
        observer.sendNext("1")
        observer.sendNext("2")
        observer.sendNext("3")
//        observer.sendNext(nil)
        observer.sendCompleted()
        
        
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


