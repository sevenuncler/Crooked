//
//  Service.swift
//  Crooked
//
//  Created by fanghe on 2021/11/29.
//

import Foundation

public protocol IService {
    var name: String { get }
}

public class Service: NSObject, IService {
    public var name = "Service"
}
