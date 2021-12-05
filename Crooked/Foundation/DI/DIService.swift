//
//  DIService.swift
//  Crooked
//
//  Created by fanghe on 2021/11/29.
//

import Foundation

public protocol DIServiceCenter {
    associatedtype T
    static func service(proto: IService) -> IService
    func bind(target :AnyObject, proto :Protocol)
    func unBind(proto :Protocol)
    func unBind(target :AnyObject)
}

