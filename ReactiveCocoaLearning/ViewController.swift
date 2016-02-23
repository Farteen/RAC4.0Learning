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
        
        ///sampleOn Example
        let (signal, observer) = Signal<Int, NoError>.pipe()
        let (signal2, observer2) = Signal<(), NoError>.pipe()
        
        let sampleOnSignal = signal.sampleOn(signal2)
        
        observer2.sendNext(())
        
        sampleOnSignal.observeNext { (next) -> () in
            print("next sent \(next)")
        }
        
        observer2.sendNext(())
        observer.sendNext(1)
        observer.sendNext(2)
        observer2.sendNext(())
        
        
        
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


