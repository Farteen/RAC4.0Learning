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
        
        ///combineLatestWith Example
        let (signal, observer) = Signal<String, NoError>.pipe()
        let (signal2, observer2) = Signal<String, NoError>.pipe()
        
        let combineLatestWithSignal = signal.combineLatestWith(signal2)
        combineLatestWithSignal.observeNext { (next1, next2) -> () in
            print((next1, next2))
        }
        
        observer.sendNext("1")
        observer.sendNext("2")
        observer2.sendNext("9")
        observer2.sendNext("8")
        
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


