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
    
    @IBOutlet weak var tfInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// Example
        let (signal, observer) = Signal<Int, NSError>.pipe()
        signal.observe { (event) -> () in
            switch event {
            case let .Next(next):
                print("next ----    \(next)")
            case let .Failed(error):
                print("error \(error)")
            default:
                print(event)
            }
        }
        
        signal.observeNext { (next) -> () in
            print("next \(next)")
        }
        signal.observeFailed { (error) -> () in
            print("error \(error)")
        }
        
        observer.sendNext(1)
        observer.sendNext(2)
        observer.sendFailed(NSError(domain: "com.apple.com", code: 1000, userInfo: nil))
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


