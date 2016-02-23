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
        
        ///attempt Example
        let (signal, observer) = Signal<Int, NSError>.pipe()
        let (signal2, observer2) = Signal<Int, NoError>.pipe()
        
        let attemptedSignal = signal.attempt { (next) -> Result<(), NSError> in
            switch next {
            case 1:
            return Result<(), NSError>.init(error: NSError(domain: "domain1", code: next, userInfo: nil))
            case 2:
            return Result<(), NSError>.init(error: NSError(domain: "domain2", code: next, userInfo: nil))
            default:
                return Result<(), NSError>.init(error: NSError(domain: "domain_default", code: Int.max, userInfo: nil))
            }

        }

        attemptedSignal.observeNext { (next) -> () in
            print("....\(next)")
        }
        attemptedSignal.observeFailed { (error) -> () in
            print(error)
        }
        
        observer.sendNext(1)
        observer.sendNext(2)
        observer.sendNext(3)
        
        
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


