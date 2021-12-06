//
//  File.swift
//  Crooked
//
//  Created by fanghe on 2021/12/6.
//

import Foundation

protocol IMService: IService {
    // send
    func sendMessage(message: Message, finish: (Error, Message) -> Void)
    // delete
    func invokeMessage(message: Message, finish: (Error, Message) -> Void)
    // fetch
    func fetchMessages(sessionID: String, finish: (Error, [Message]) -> Void)
    // Subscribe
    func registerMessage(type: [Message.Type], receive: [Message])
    // UnSubscribe
    func registerMessage()
}
