//
//  Constants.swift
//  Ally
//
//  Created by James Dale on 14/10/20.
//

import Foundation

struct Constants {
    
    static let feelings: BotFlowNode = {
        let feelingGood = BotFlowNode(suggestedName: "Feeling Great!",
                                      messages: [Message(content: "That's great to hear! What should we take a look at today?",
                                                        date: Date(),
                                                        sender: .bot)],
                                      options: [Constants.optionFlow])
        
        let notFeelingGreat = BotFlowNode(suggestedName: "Feeling Great!",
                                      messages: [Message(content: "Sorry you're not feeling great today. What's bothering you?",
                                                        date: Date(),
                                                        sender: .bot)],
                                      options: [Constants.optionFlow])
        
        let feelingOkay = BotFlowNode(suggestedName: "Feeling okay",
                                      messages: [Message(content: "How can I help you today?",
                                                        date: Date(),
                                                        sender: .bot)],
                                      options: [Constants.optionFlow])
        
        
        
        return BotFlowNode(suggestedName: "Hello",
                           messages: [Message(content: "How are you feeling today?",
                                             date: Date(),
                                             sender: .bot)],
                           options: [feelingGood, feelingOkay, notFeelingGreat])
    }()
    
    static let optionFlow: BotFlowNode = {
        
        let somethingElse = BotFlowNode(suggestedName: "Something Else",
                                        messages: [Message(content: "What else can I help you with?",
                                                    date: Date(),
                                                    sender: .bot)],
                                 options: [])
        
        let talkToNurseFlow = BotFlowNode(suggestedName: "Talk to a nurse", messages: [Message(content: "Okay, that sounds great. I will connect you now", date: Date(), sender: .bot)], options: [.init(suggestedName: "Connect", messages: [], options: [], specialActions: [.videoCall])])
        
        let checkRecordsFlow = BotFlowNode(suggestedName: "Explain Clinical Records", messages: [Message(content: "You appear to have a low white blood cell count. This may be due to recent chemotherapy treatment. If you are experiencing any type of fatigue, chest pain, dizziness or shortness of breath, speak to your care team and doctor immediately.", date: Date(), sender: .bot)], options: [talkToNurseFlow, somethingElse])
        
        let nutritionalAdvice = BotFlowNode(suggestedName: "Check my meal plan",
                                            messages: [],
                                            options: [])
        
        let relax = BotFlowNode(suggestedName: "Relaxation tips & tricks",
                                            messages: [],
                                            options: [])
        
        
        return BotFlowNode(suggestedName: "Continue",
                           messages: [Message(content: "Welcome to Ally, how can I help?",
                                       date: Date(),
                                       sender: .bot)],
                    options: [checkRecordsFlow, talkToNurseFlow, nutritionalAdvice, relax])
    }()
}
