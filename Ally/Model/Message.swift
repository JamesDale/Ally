//
//  Message.swift
//  Ally
//
//  Created by James Dale on 7/10/20.
//

import Foundation

struct Message {
    
    enum Sender {
        case user
        case bot
    }
    
    let content: String
    let date: Date
    let sender: Sender
}
