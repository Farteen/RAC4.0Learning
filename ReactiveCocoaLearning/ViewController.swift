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
        
        ///combineLatest Example
        let (signal, observer) = Signal<Int, NSError>.pipe()
        let (signal2, observer2) = Signal<Int, NSError>.pipe()
        
        let combineLatest = signal.combineLatestWith(signal2)
        
        combineLatest.observeNext { (next1, next2) -> () in
            print("next1 \(next1) next2 \(next2)")
        }
        
        observer.sendNext(1)
        observer.sendNext(2)
        observer.sendNext(3)
        observer2.sendNext(9)
        observer2.sendNext(8)
        
        
        
        
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


