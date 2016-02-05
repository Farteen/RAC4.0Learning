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
        
        let signal = Signal<String, NoError>.pipe()
        
        
////////////////////-----------Signal----------////////////////////
        ///和原生的reduce,使用了curry function,tailing closure,implicit parameters,单行省略return的语法
        
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
        
//        let (signal, observer) = Signal<Int, NoError>.pipe()
        
        //MARK:filter----------------------------
        //        signal
        //            .filter { $0 % 2 == 0 }
        //            .observeNext { print($0) }
        
        
        //MARK:reduce----------------------------
//        signal
//            .reduce(2) { $0 * $1 }
//            .observeNext { print($0) }
//        observer.sendNext(1)
//        observer.sendNext(2)
//        observer.sendNext(3)
//        observer.sendCompleted()
        
//        let (numbersSignal, numbersObserver) = Signal<Int, NoError>.pipe()
//        let (lettersSignal, lettersObserver) = Signal<String, NoError>.pipe()
        //MARK:combineLatest,combineLatestWith----------------------------
        //Combine后,需要两者都有值,才会去更新.
//        let signal = ReactiveCocoa.combineLatest(numbersSignal, lettersSignal)
//        signal.observeNext { (number, string) -> () in
//            print("\(number) \(string)")
//        }
//        signal.observeCompleted { () -> () in
//            print("Complete")
//        }
        ///类比Python中的zip,取最短长度
        //MARK:zip----------------------------
//        let signal = zip(numbersSignal, lettersSignal)
//        signal.observeNext { next in print(next) }
//        signal.observeCompleted{ print("Complete") }
//        numbersObserver.sendNext(0)
//        numbersObserver.sendNext(1)
//        lettersObserver.sendNext("A")
//        numbersObserver.sendNext(2)
//        numbersObserver.sendNext(3)
//        lettersObserver.sendNext("B")
//        lettersObserver.sendNext("C")
//        lettersObserver.sendNext("D")
//        lettersObserver.sendCompleted()
        
////////////////////-----------SignalProducer----------////////////////////
        
        //MARK:merge
//        let (producerA, lettersObserver) = SignalProducer<String, NoError>.buffer(5)
//        let (producerB, numbersObserver) = SignalProducer<String, NoError>.buffer(5)
        
//        let (signal, observer) = SignalProducer<SignalProducer<String, NoError>, NoError>.buffer(5)
        //MARK:merge每次内部的SignalProducer发送一个事件,
//        signal.flatten(FlattenStrategy.Merge).startWithNext { print($0) }
        //MARK:concat从某种意义上定义了order.
//        signal.flatten(FlattenStrategy.Concat).startWithNext { print($0) }
//        observer.sendNext(producerA)
//        observer.sendNext(producerB)
//        observer.sendCompleted()
//        
//        lettersObserver.sendNext("a")
//        numbersObserver.sendNext("1")
//        lettersObserver.sendNext("b")
//        numbersObserver.sendNext("2")
//        lettersObserver.sendNext("c")
//        lettersObserver.sendCompleted()
//        numbersObserver.sendNext("3")
//        numbersObserver.sendCompleted()
        
//        let (producerA, observerA) = SignalProducer<String, NoError>.buffer(5)
//        let (producerB, observerB) = SignalProducer<String, NoError>.buffer(5)
//        let (producerC, observerC) = SignalProducer<String, NoError>.buffer(5)
//        //MARK:switch的确是切换
//        let (signal, observer) = SignalProducer<SignalProducer<String, NoError>, NoError>.buffer(5)
//        signal.flatten(.Latest).startWithNext { print($0) }
//        
//        observer.sendNext(producerA)
//        observerC.sendNext("X")
//        observerA.sendNext("a")
//        observerB.sendNext("1")
//        observer.sendNext(producerB)
//        observerA.sendNext("b")
//        observerB.sendNext("2")
//        observerC.sendNext("Y")
//        observerA.sendNext("c")
//        observer.sendNext(producerC)
//        observerB.sendNext("3")
//        observerC.sendNext("Z")
        //MARK:flatMapError
//        let (producer, observer) = SignalProducer<String, NSError>.buffer(5)
//        let error = NSError(domain: "domain", code: 0, userInfo: nil)
//        producer
//            .flatMapError { (error) -> SignalProducer<String, NoError> in
//                return SignalProducer<String, NoError>(value: "Default")
//        }
//            .startWithNext {
//                print($0)
//        }
//        
//        observer.sendNext("first")
//        observer.sendNext("second")
//        observer.sendFailed(error)
        //MARK:retry
//        var tries = 0
//        let limit = 2
//        let error = NSError(domain: "domain", code: 0, userInfo: nil)
//        let producer = SignalProducer<String, NSError> { (observer, _) in
//            if tries++ < limit {
//                observer.sendFailed(error)
//            } else {
//                observer.sendNext("Success")
//                observer.sendCompleted()
//            }
//        }
//        ///注意associate value使用的方法,可以用let .Next(next)或者 let .Failed(error)
//        producer
//            .on(failed: { e in print("Failure") })
//            .retry(2)
//            .start { (event) -> () in
//                switch event {
//                case .Next(let next):
//                    print(next)
//                case let .Failed(error):
//                    print(error)
//                case .Completed:
//                    print("Complete")
//                case .Interrupted:
//                    print("Interrupted")
//                }
//        }
//        let (signal, observer) = Signal<String, NSError>.pipe()
//        signal
//            .mapError { (error) -> CustomError in
//                switch error.domain {
//                case "com.example.foo":
//                    return .Foo
//                case "com.example.bar":
//                    return .Bar
//                default:
//                    return .Other
//                }
//        }
//            .observeFailed { (error) -> () in
//                print(error)
//        }
//        
//        observer.sendFailed(NSError(domain: "com.example.foo", code: 42, userInfo: nil))
        
        ///promoteErrors
//        let (numbersSignal, numbersObserver) = Signal<Int, NoError>.pipe()
//        let (lettersSignal, lettersObserver) = Signal<String, NoError>.pipe()
//        
//        numbersSignal
//            .promoteErrors(NSError)
//            .combineLatestWith(lettersSignal)
        
      }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

