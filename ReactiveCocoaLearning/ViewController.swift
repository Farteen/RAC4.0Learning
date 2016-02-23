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
        
        //scan Example
        let (signal, observer) = Signal<Int, NoError>.pipe()
        let (signal2, observer2) = Signal<(), NoError>.pipe()
        
        let scannedSignal = signal.scan(1) { (initial, next) -> Int in
            return initial * next
        }
        
        scannedSignal.observeNext { (result) -> () in
            print(">>>>>>>\(result)")
        }
        
        scannedSignal.observeNext { (result) -> () in
            print("<<<<<<<<\(result)")
        }
        
        observer.sendNext(2)
        observer.sendNext(2)
        observer.sendNext(2)
        ///对比reduce,sendCompleted()是否能够省略
//        observer.sendCompleted()
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

