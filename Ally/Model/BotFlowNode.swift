//
//  BotFlowNode.swift
//  Ally
//
//  Created by James Dale on 8/10/20.
//

import Foundation

struct BotFlowNode {
    
    internal init(suggestedName: String?, messages: [Message], options: [BotFlowNode], specialActions: [SpecialAction] = []) {
        self.suggestedName = suggestedName
        self.messages = messages
        self.options = options
        self.specialActions = specialActions
    }
    
    let suggestedName: String?
    let messages: [Message]
    let options: [BotFlowNode]
    let specialActions: [SpecialAction]
    
    enum SpecialAction {
        case videoCall
    }
}
