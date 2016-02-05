//
//  CustomError.swift
//  ReactiveCocoaLearning
//
//  Created by user on 2/5/16.
//  Copyright © 2016 FarTeen. All rights reserved.
//

import Foundation


enum CustomError: String, ErrorType {
    case Foo = "Foo"
    case Bar = "Bar"
    case Other = "Other"
    
    var nsError: NSError {
        return NSError(domain: "CustomeError.\(rawValue)", code: 0, userInfo: nil)
    }
    
    var description: String {
        return "\(rawValue) Error"
    }
    
}