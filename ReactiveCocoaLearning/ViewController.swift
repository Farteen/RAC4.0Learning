//
//  ViewController.swift
//  PushTest
//
//  Created by user on 1/18/16.
//  Copyright © 2016 FarTeen. All rights reserved.
//

import UIKit
import ReactiveCocoa
import Result
import Alamofire

//From https://gist.github.com/natecook1000/b0285b518576b22c4dc8
extension NSTimer {
    /**
     Creates and schedules a one-time `NSTimer` instance.
     
     - Parameters:
     - delay: The delay before execution.
     - handler: A closure to execute after `delay`.
     
     - Returns: The newly-created `NSTimer` instance.
     */
    class func schedule(delay delay: NSTimeInterval, handler: NSTimer! -> Void) -> NSTimer {
        let fireDate = delay + CFAbsoluteTimeGetCurrent()
        let timer = CFRunLoopTimerCreateWithHandler(kCFAllocatorDefault, fireDate, 0, 0, 0, handler)
        CFRunLoopAddTimer(CFRunLoopGetCurrent(), timer, kCFRunLoopCommonModes)
        return timer
    }
    
    /**
     Creates and schedules a repeating `NSTimer` instance.
     
     - Parameters:
     - repeatInterval: The interval (in seconds) between each execution of
     `handler`. Note that individual calls may be delayed; subsequent calls
     to `handler` will be based on the time the timer was created.
     - handler: A closure to execute at each `repeatInterval`.
     
     - Returns: The newly-created `NSTimer` instance.
     */
    class func schedule(repeatInterval interval: NSTimeInterval, handler: NSTimer! -> Void) -> NSTimer {
        let fireDate = interval + CFAbsoluteTimeGetCurrent()
        let timer = CFRunLoopTimerCreateWithHandler(kCFAllocatorDefault, fireDate, interval, 0, 0, handler)
        CFRunLoopAddTimer(CFRunLoopGetCurrent(), timer, kCFRunLoopCommonModes)
        return timer
    }
}

class ViewController: UIViewController {
    var tag = 0
    @IBOutlet weak var tfInput: UITextField!
    
    func timerAction(timer: NSTimer) {
        let observer = timer.userInfo as! Observer<Int, NoError>
        observer.sendNext(123)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ///Alamofire Request 
        
//        let signal = Signal<Response<AnyObject, NSError>, NSError> { observer -> Disposable! in
//            let request = Alamofire.request(.GET, "http://g1.163.com/madrs?", parameters: ["app":"7A16FBB6","platform":"ios","category":"FOCUS2","location":"1,2,20,21,22,23,24,25,26,27,28,29,30,31","timestamp":"1456384852","gadflag":"1","uid":"EZ3bZWDXmKdsK4nvCc35nybFCaa+g1RkH5VJZwpkgarbd+IbdtzyYgCr1r9zJ6j/E+wkv79bYbHP/2QJFMugyqmETb+p9wTk+KbL3pX32n6rXQ9xC+tmj1nDvjmKDNIvVu1neUAGVMA87Ecl/FgGKdmHFwy+E8oSeS8NV+0Wxci7IZcTIe9oZiPO0eEqwl8X8U30jXDKz7UTprWoZkmbIcog7KdA48n3i9QFx1Zn7RHKBhSGEq8t6ma5ta3dRGrMoXc/43aiMacDs+EsFIPBAD3LMBM5ucIwIbiexIevs6eUXO9YJKSIlB6APvSyyhjCL/MD09BnpLxJz4Y++Atk60FSgxQvap0j7apuQ1Bbf2I="], encoding: ParameterEncoding.URLEncodedInURL, headers: nil)
//            request.responseJSON(completionHandler: { (response) -> Void in
//                
//                observer.sendNext(response)
//                observer.sendCompleted()
//            })
//            
//            return SimpleDisposable()
//        }
//        
//        signal.observeNext { (response) -> () in
//            print(signal)
//        }
        

        
      }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func generateSignalProducer(shouldDelay: Bool) -> SignalProducer<AnyObject, NSError> {
        let signalProducer = SignalProducer<AnyObject, NSError> { observer, disposal in
            
            let request = Alamofire.request(.GET, "http://api.aixifan.com/channels/allChannels", parameters: nil, encoding:.URL, headers: ["deviceType":"5"])
            
            request.responseJSON(completionHandler: { (response) -> Void in
                
                if let data = response.result.value {
                    let delay = shouldDelay ? 5.0 : 0.0
                    print("did receive \(NSDate())--------------------")
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(delay * Double(NSEC_PER_SEC))), dispatch_get_main_queue()) { () -> Void in
                        print("will send next \(NSDate())--------------------")
                        observer.sendNext(data)
                        observer.sendCompleted()
                    }

                } else {
                    let error = NSError(domain: "errorhappened", code: 10000, userInfo: nil)
                    print("\(error) + occurred")
                    observer.sendFailed(error)
                    disposal.addDisposable({ () -> () in
                        request.cancel()
                    })
                }
                
            })
            
        }
        return signalProducer
    }
    
    @IBAction func buttonAction(sender: AnyObject) {
        
        
        let signalProducer  = self.generateSignalProducer(false)
        let signalProducer2 = self.generateSignalProducer(true)
        
        let zippedProducer = signalProducer.zipWith(signalProducer2)
        
        let onZipped = zippedProducer.on(started: { () -> () in
            
            }, event: { (event) -> () in
                print(event)
            }, failed: { (error) -> () in
                print(error)
            }, completed: { () -> () in
                
            }, interrupted: { () -> () in
                
            }, terminated: { () -> () in
                
            }, disposed: { () -> () in
                
            }) { (next, next2) -> () in
                print("tag \(self.tag) zipped \(NSDate())--------------------")
        }
        onZipped.start()
        
        
    }
    
    
}

class TestClass {
    func testVariadicParameter(names: String..., ages: Int) {
        
    }
}


