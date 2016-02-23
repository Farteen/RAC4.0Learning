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
        
        //TakeLast Example
        let (signal, observer) = Signal<Int, NoError>.pipe()
        
        let (signalReplacement, observer2) = Signal<Int, NoError>.pipe()
        
        let takeLast = signal.takeLast(5)
        
        takeLast.observeNext { (next) -> () in
            print("????? \(next)")
        }
        
        observer.sendNext(1)
        observer.sendNext(2)
        observer.sendNext(3)
        observer.sendNext(4)
        observer.sendNext(5)
        observer.sendNext(6)
        observer.sendNext(7)
        ///注意使用原则,需要sendCompleted()
//        observer.sendCompleted()
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

