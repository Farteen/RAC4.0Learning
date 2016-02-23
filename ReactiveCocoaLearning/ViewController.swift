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
        
        ///ignoreNil Example//注意Signal<Value,Error>中的Value需要为optional?
        let (signal, observer) = Signal<String?, NoError>.pipe()
        let (signal2, observer2) = Signal<String, NoError>.pipe()
        let ignoreNilSignal = signal.ignoreNil()
        ignoreNilSignal.observeNext { (next) -> () in
            print(next)
        }
        signal.observeNext { (next) -> () in
            print(next)
        }
        observer.sendNext(nil)
        observer.sendNext(nil)
        observer.sendNext("1")
        
        
        
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


