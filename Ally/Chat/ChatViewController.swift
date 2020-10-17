//
//  ViewController.swift
//  Ally
//
//  Created by James Dale on 6/10/20.
//

import UIKit

final class ChatViewController: UIViewController {
    
    private let chatTableViewController = ALChatTableViewController()
    private let inputTableViewController = ALChatInputTableViewController()
    
    private var initialFlow: BotFlowNode = Constants.feelings

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(chatTableViewController.tableView)
        addChild(chatTableViewController)
        
        view.addSubview(inputTableViewController.tableView)
        addChild(inputTableViewController)
        
        
        updateViewConstraints()
        
        view.backgroundColor = .systemBackground
        navigationItem.title = "Ally"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        
        chatTableViewController.messages = [.init(content: "How are you feeling today?",
                                              date: Date(),
                                              sender: .bot)]
        inputTableViewController.delegate = self
        
        inputTableViewController.flowNode = initialFlow
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        chatTableViewController.tableView.translatesAutoresizingMaskIntoConstraints = false
        inputTableViewController.tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            chatTableViewController.tableView.topAnchor.constraint(equalTo: view.topAnchor),
            chatTableViewController.tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            chatTableViewController.tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            chatTableViewController.tableView.heightAnchor.constraint(equalTo: view.heightAnchor,
                                                                      multiplier: 0.66)
        ])
        
        NSLayoutConstraint.activate([
            inputTableViewController.tableView.topAnchor.constraint(equalTo: chatTableViewController.tableView.bottomAnchor),
            inputTableViewController.tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                                        constant: 20),
            inputTableViewController.tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                                         constant: -20),
            inputTableViewController.tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }


}


extension ChatViewController: ALChatInputTableViewDelegate {
    func didSelectFlowNode(node: BotFlowNode) {
        inputTableViewController.flowNode = node
        chatTableViewController.messages.append(Message(content: node.suggestedName ?? "Okay", date: Date(), sender: .user))
        chatTableViewController.messages.append(contentsOf: node.messages)
        chatTableViewController.tableView.reloadData()
        
        if node.specialActions.contains(.videoCall) {
            let videoVC = VideoCallViewController()
            present(videoVC, animated: true)
        }
    }
}
