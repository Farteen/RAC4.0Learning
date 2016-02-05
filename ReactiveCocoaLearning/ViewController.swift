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
        
        //MARK:map--------------------------------
        //        let (signal, observer) = Signal<String, NoError>.pipe()
        //        signal
        //            .map { (string) -> String in
        //                return string.uppercaseString
        //        }
        //            .observeNext { (string) -> () in
        //                print(string)
        //        }
        //
        //        observer.sendNext("a")
        //        observer.sendNext("b")
        //        observer.sendNext("c")
        
        let (signal, observer) = Signal<Int, NoError>.pipe()
        
        //MARK:filter----------------------------
        //        signal
        //            .filter { $0 % 2 == 0 }
        //            .observeNext { print($0) }
        
        
        //MARK:reduce----------------------------
        signal
            .reduce(2) { $0 * $1 }///和原生的reduce,使用了curry function,tailing closure,implicit parameters的语法
            .observeNext { print($0) }
        observer.sendNext(1)
        observer.sendNext(2)
        observer.sendNext(3)
        observer.sendCompleted()
        
      }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

