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
        
        ///skip Example
        let (signal, observer) = Signal<String, NoError>.pipe()
        let (signal2, observer2) = Signal<(), NoError>.pipe()
        
        let skipSignal = signal.skip(2)
        skipSignal.observeNext { (next) -> () in
            print(next)
        }
        
        observer.sendNext("12")
        observer.sendNext("3")
        observer.sendNext("4")
        
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


