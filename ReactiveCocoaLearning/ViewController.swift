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
        
        ///attemptMap Example
        let (signal, observer) = Signal<Int, NSError>.pipe()
        let (signal2, observer2) = Signal<Int, NoError>.pipe()
        
        let attemptMapSignal = signal.attemptMap { (next) -> Result<Int, NSError> in
            if next < 6 {
                return Result<Int, NSError>.init(next)
            }
            return Result<Int, NSError>.init(error: NSError(domain: "domain", code: next, userInfo: nil))
        }
        
        attemptMapSignal.observeNext { (next) -> () in
            print(next)
        }
        attemptMapSignal.observeFailed { (error) -> () in
            print(error)
        }
        
        observer.sendNext(5)
        observer.sendNext(6)
        
        
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


