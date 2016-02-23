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
        
        //reduce Example
        let (signal, observer) = Signal<Int, NoError>.pipe()
        let (signal2, observer2) = Signal<(), NoError>.pipe()
        
        let reducedSignal = signal.reduce(1) { (number, next) -> Int  in
            return next * 2 + number
        }
        
        reducedSignal.observeNext { (result) -> () in
            print(">>>>>>>\(result)")
        }
        
        observer.sendNext(1)
        observer.sendNext(1)
        observer.sendNext(1)
        ///如果不发送sendCompleted()会有什么结果
//        observer.sendCompleted()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

