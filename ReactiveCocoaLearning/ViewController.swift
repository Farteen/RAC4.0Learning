//
//  ViewController.swift
//  PushTest
//
//  Created by user on 1/18/16.
//  Copyright © 2016 FarTeen. All rights reserved.
//

import UIKit
import ReactiveCocoa
import AFNetworking

class ViewController: UIViewController {
    
    @IBOutlet weak var tfInput: UITextField!
    @IBOutlet weak var btnDo: UIButton!
    var testString = {
        return "123"
    }()
    //    func fetchBaiduHomePage() -> SignalProducer<AnyObject?, NSError> {
    //        let session = NSURLSession.sharedSession()
    //        let request = NSURLRequest(URL: NSURL(string: "http://www.baidu.com")!)
    //
    //    }
    
    
    //
    //    func signInSignal() -> RACSignal {
    //        return RACSignal.createSignal { (subscriber) -> RACDisposable! in
    //
    //            subscriber.sendNext("123")
    //
    //            subscriber.sendCompleted()
    //
    //            return RACDisposable(block: { () -> Void in
    //
    //            })
    //        }
    //    }
    
    //    func createSignal() -> Signal<String, NoError> {
    //        var count = 0
    //        return Signal {
    //            sink in
    //            NSTimer.schedule(repeatInterval: 1.0) { timer in
    //
    ////                sendNext(sink, "tick #\(count++)")
    //            }
    //            return nil
    //        }
    //    }
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        //        signal
        //            .filter { $0 % 2 == 0 }
        //            .observeNext { print($0) }
        
        signal
            .reduce(3) { $0 * $1 }
            .observeNext { print($0) }
        observer.sendNext(1)
        observer.sendNext(2)
        observer.sendNext(3)
        observer.sendCompleted()
        //        observer.sendNext(1)
        //        observer.sendNext(2)
        //        observer.sendNext(3)
        
        
        //        let array = NSArray(array: [1, 2, 3])
        //        let result = array.rac_sequence.map { (object) -> AnyObject! in
        //            return "_" as AnyObject!
        //        }
        
        
        
        //        let arrayNumber = NSArray(array: [1, 2, 3])
        //        let numbersSignal = arrayNumber.rac_sequence
        //
        //        let extended = numbersSignal.flattenMap { (item) -> RACStream! in
        //            return NSArray(array: [item, item]).rac_sequence
        //        }
        //        print(extended)
        //
        //        let edited = numbersSignal.flattenMap { (item) -> RACStream! in
        //            if item.integerValue % 2 == 0 {
        //                return RACSequence.empty()
        //            } else {
        //                return RACSequence.`return`("\(item)_")
        //            }
        //        }
        //        print(edited)
        
        //        let letters = RACSubject()
        //        let numbers = RACSubject()
        //
        //        let signalOfSignals = RACSignal.createSignal { (subscriber) -> RACDisposable! in
        //            subscriber.sendNext(letters)
        //            subscriber.sendNext(numbers)
        //            subscriber.sendCompleted()
        //            return nil
        //        }
        //
        //        let flattened = signalOfSignals.flatten()
        //
        //        flattened.subscribeNext { (object) -> Void in
        //            print(object)
        //        }
        //
        //        letters.sendNext(1)
        //        numbers.sendNext(2)
        //        letters.sendNext(3)
        //        letters.sendNext(4)
        //        numbers.sendNext(5)
        
        //        let inputSignal = tfInput.rac_textSignal()
        //        inputSignal.subscribeNext { (text) -> Void in
        //            print(text)
        //        }
        //
        //        RACScheduler.mainThreadScheduler().afterDelay(5.0) { () -> Void in
        //            inputSignal.subscribeNext { (text) -> Void in
        //                print(text)
        //            }
        //        }
        
        //        let subject = RACSubject()
        //        let replaySubject = RACReplaySubject()
        //
        //        RACScheduler.mainThreadScheduler().afterDelay(0.1) { () -> Void in
        //            subject.subscribeNext({ (object) -> Void in
        //                print("subscriber 1 \(object)")
        //            })
        //
        //            replaySubject.subscribeNext({ (object) -> Void in
        //                print("subscriber 1 replay \(object)")
        //            })
        //
        //            subject.subscribeNext({ (object) -> Void in
        //                print("subscriber 2 \(object)")
        //            })
        //
        //            replaySubject.subscribeNext({ (object) -> Void in
        //                print("subscriber 2 \(object)")
        //            })
        //        }
        //
        //        RACScheduler.mainThreadScheduler().afterDelay(1.0) { () -> Void in
        //            subject.sendNext("send package 1")
        //            replaySubject.sendNext("send package 1")
        //        }
        //
        //        RACScheduler.mainThreadScheduler().afterDelay(1.1) { () -> Void in
        //            subject.subscribeNext({ (object) -> Void in
        //                print("subscriber 3 \(object)")
        //            })
        //
        //            replaySubject.subscribeNext({ (object) -> Void in
        //                print("subscriber 3 \(object)")
        //            })
        //
        //            subject.subscribeNext({ (object) -> Void in
        //                print("subscriber 4 \(object)")
        //            })
        //
        //            replaySubject.subscribeNext({ (object) -> Void in
        //                print("subscriber 4 \(object)")
        //            })
        //
        //        }
        //
        //        RACScheduler.mainThreadScheduler().afterDelay(2.0) { () -> Void in
        //            subject.sendNext("send package 2")
        //            replaySubject.sendNext("send package 2")
        //        }
        
        
        //        let sessionManager = AFHTTPSessionManager(baseURL: NSURL(string: "http://www.baidu.com")!)
        //        sessionManager.requestSerializer = AFJSONRequestSerializer()
        //        sessionManager.responseSerializer = AFJSONResponseSerializer()
        //
        //        let fetchData = RACSignal.createSignal { (subscriber) -> RACDisposable! in
        //
        //            let dataTask = sessionManager.GET("fetch", parameters: nil, progress: { (progress) -> Void in
        //
        //                }, success: { (dataTask, response) -> Void in
        //
        //                }, failure: { (dataTask, error) -> Void in
        //
        //                })
        //            return RACDisposable(block: { () -> Void in
        //                dataTask!.cancel()
        //            })
        //        }
        //
        //        let title = fetchData.flattenMap { (data) -> RACStream! in
        //            return RACSignal.`return`(data["title"])
        //        }
        //
        //        let desc = fetchData.flattenMap { (data) -> RACStream! in
        //            return RACSignal.`return`(data["desc"])
        //        }
        //        title.catchTo(RACSignal.`return`("Error")).startWith()
        
        
        
        
        //        let connection = RACSignal.createSignal { (subscriber) -> RACDisposable! in
        //
        //            RACScheduler.mainThreadScheduler().afterDelay(1.0, schedule: { () -> Void in
        //                subscriber.sendNext(1)
        //            })
        //
        //            RACScheduler.mainThreadScheduler().afterDelay(2.0, schedule: { () -> Void in
        //                subscriber.sendNext(2)
        //            })
        //
        //            RACScheduler.mainThreadScheduler().afterDelay(3.0, schedule: { () -> Void in
        //                subscriber.sendNext(3)
        //            })
        //
        //            RACScheduler.mainThreadScheduler().afterDelay(4.0, schedule: { () -> Void in
        //                subscriber.sendCompleted()
        //            })
        //
        //            return RACDisposable(block: { () -> Void in
        //
        //            })
        //
        //        }.publish()
        //        connection.connect()
        //
        //        let signals = connection.signal
        //
        //        RACScheduler.mainThreadScheduler().afterDelay(1.1) { () -> Void in
        //            signals.subscribeNext({ (object) -> Void in
        //                print("\(NSDate()) subscriber 1 receive: \(object)")
        //            })
        //        }
        //
        //        RACScheduler.mainThreadScheduler().afterDelay(2.1) { () -> Void in
        //            signals.subscribeNext({ (object) -> Void in
        //                print("\(NSDate()) subscriber 2 receive: \(object)")
        //            })
        //        }
        
        
        //        let signal = RACSignal.createSignal { (subscriber) -> RACDisposable! in
        //            subscriber.sendNext(1)
        //            subscriber.sendNext(2)
        //            subscriber.sendNext(3)
        //            subscriber.sendCompleted()
        //            return RACDisposable(block: { () -> Void in
        //
        //            })
        //        }
        //
        //        RACScheduler.mainThreadScheduler().afterDelay(0.1) { () -> Void in
        //            signal.subscribeNext({ (object) -> Void in
        //                print(NSDate(),object)
        //            })
        //        }
        //
        //        RACScheduler.mainThreadScheduler().afterDelay(1.0) { () -> Void in
        //            signal.subscribeNext({ (object) -> Void in
        //                print(object)
        //            })
        //        }
        
        return
        let signalTest = tfInput.rac_textSignal()
        signalTest.subscribeNext { (text) -> Void in
            print(text)
        }
        
        //        btnDo.rac_signalForControlEvents(.TouchUpInside)
        //        .map { (signal) -> RACSignal in
        //            return self.signInSignal()
        //        }
        //        .subscribeNext { (signalOfSignal) -> Void in
        //            print("signal in signal \(signalOfSignal)")
        //        }
        
        //        btnDo.rac_signalForControlEvents(.TouchUpInside)
        //            .doNext({ (button: AnyObject!) -> Void in
        //            print("\(button)")
        //        })
        //        .flattenMap { (singnal) -> RACStream! in
        //            return self.signInSignal()
        //        }
        //        .subscribeNext { (flattenedSignal) -> Void in
        //            print("signal in signal \(flattenedSignal)")
        //        }
        
        
        return
        ///这个map的动作做了什么处理,对应RAC什么处理?
        ///toSignalProducer又起到了什么作用?
        //        searchStrings.startWithNext { (text: String) -> () in
        //            print(text)
        //        }
        //        searchStrings.observeOn(UIScheduler())
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func clickAction(sender: AnyObject) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

