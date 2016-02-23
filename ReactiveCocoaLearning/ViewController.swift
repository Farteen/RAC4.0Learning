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
        
        //combinePrevious Example
        let (signal, observer) = Signal<String, NoError>.pipe()
        let (signal2, observer2) = Signal<(), NoError>.pipe()
        
        let combinePreviousSignal = signal.combinePrevious("Test")
        
        combinePreviousSignal.observeNext { (previous, next) -> () in
            print((previous, next))
        }
        
        observer.sendNext("aaaaa")
        observer.sendNext("bbbbb")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

