//
//  TestViewController.swift
//  ReactiveCocoaLearning
//
//  Created by user on 2/5/16.
//  Copyright © 2016 FarTeen. All rights reserved.
//

import UIKit
import ReactiveCocoa

class TestViewController: UIViewController {

    @IBOutlet weak var tfInput: UITextField!
    
    override func viewDidLoad() {
        
//        let signal = Signal { subscriber -> Disposable? in
//            subscriber.sendNext("hahah")
//            return SimpleDisposable()
//        }
//        let inputSignal = tfInput.rac_textSignal().toSignalProducer().map { (input) -> AnyObject? in
//            return input as? String
//        }
//        
//        let reqSignal = inputSignal
//            .flatMap(FlattenStrategy.Latest) { (input) -> SignalProducer<(NSData, NSURLResponse), NSError> in
//                let URLRequest = NSMutableURLRequest(URL: NSURL(string: "http://apis.baidu.com/apistore/stockservice/hkstock?stockid=00168&list=1")!)
//                URLRequest.addValue("e642e9844d02e1dfd4e7a8fa5a70eeed", forHTTPHeaderField: "apikey")
//                return NSURLSession.sharedSession().rac_dataWithRequest(URLRequest)
//            }.map { (data, response) -> NSDictionary? in
//                let result = try? NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(rawValue: 1))
////                print((result! ?? "Error Occured"))
//                return result as? NSDictionary
//            }
//             .observeOn(UIScheduler())
//        
//        reqSignal.startWithNext { (string) -> () in
//            print(string)
//        }
        
    }
    
}
