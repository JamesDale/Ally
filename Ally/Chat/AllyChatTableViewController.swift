//
//  AllyChatTableViewController.swift
//  Ally
//
//  Created by James Dale on 6/10/20.
//

import Foundation
import UIKit

final class ALChatTableViewController: UITableViewController {
    
    var messages: [Message] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    init() {
        super.init(style: .plain)
        tableView.separatorStyle = .none
        tableView.register(ALChatBubbleTableViewCell.self,
                           forCellReuseIdentifier: ALChatBubbleTableViewCell.reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ALChatBubbleTableViewCell.reuseIdentifier,
                                                 for: indexPath) as! ALChatBubbleTableViewCell
        let message = messages[indexPath.row]
        cell.messageType = message.sender == .user ? .user : .bot
        cell.messageLabel.text = message.content
        
        return cell
    }
}
