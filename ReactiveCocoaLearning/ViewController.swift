//
//  ViewController.swift
//  PushTest
//
//  Created by user on 1/18/16.
//  Copyright © 2016 FarTeen. All rights reserved.
//

import UIKit
import ReactiveCocoa

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ///zipWith Example
        let (signal, observer) = Signal<Int, NoError>.pipe()
        let (signal2, observer2) = Signal<Int, NoError>.pipe()
        
        let zippedSignal = signal.zipWith(signal2)
        zippedSignal.observeNext { (left, right) -> () in
            print("\(left),\(right)")
        }
        
        observer.sendNext(1)
        observer.sendNext(2)
        observer.sendNext(3)
        observer2.sendNext(9)
        observer2.sendNext(8)
        ///如果个数不对等会出现什么情况
//        observer2.sendNext(7)

        
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


