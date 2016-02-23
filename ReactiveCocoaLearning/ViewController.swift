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
        
        //skipRepeat with condition Example
        let (signal, observer) = Signal<Int, NoError>.pipe()
        let (signal2, observer2) = Signal<(), NoError>.pipe()
        
        let skipRepeats = signal.skipRepeats { (former, next) -> Bool in
            return former > next
        }
        skipRepeats.observeNext { (next) -> () in
            print("<><><><>\(next)")
        }
        
        observer.sendNext(1)
        observer.sendNext(2)
        observer.sendNext(3)
        observer.sendNext(2)
        observer.sendNext(1)
        ///注意这个former的确是former,没有记忆功能.
//        observer.sendNext(2)
//        observer.sendNext(4)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

