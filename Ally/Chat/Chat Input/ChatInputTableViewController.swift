//
//  ChatInputTableViewController.swift
//  Ally
//
//  Created by James Dale on 7/10/20.
//

import Foundation
import UIKit

protocol ALChatInputTableViewDelegate: class {
    func didSelectFlowNode(node: BotFlowNode)
}

final class ALChatInputTableViewController: UITableViewController {
    
    public weak var delegate: ALChatInputTableViewDelegate?
    
    var flowNode: BotFlowNode? {
        didSet {
            tableView.reloadData()
        }
    }
    
    init() {
        super.init(style: .plain)
        
        tableView.register(ChatInputTableViewCell.self,
                           forCellReuseIdentifier: ChatInputTableViewCell.reuseIdentifier)
        tableView.separatorStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return flowNode?.options.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 12
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let option = flowNode?.options[indexPath.section]
        let cell = tableView.dequeueReusableCell(withIdentifier: ChatInputTableViewCell.reuseIdentifier,
                                                 for: indexPath) as! ChatInputTableViewCell
        cell.titleLabel.text = option?.suggestedName ?? ""
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let option = flowNode?.options[indexPath.section] else { return }
        delegate?.didSelectFlowNode(node: option)
    }
    
}
 
