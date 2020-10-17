//
//  AllyChatBubbleTableViewCell.swift
//  Ally
//
//  Created by James Dale on 7/10/20.
//

import Foundation
import UIKit

final class ALChatBubbleTableViewCell: UITableViewCell {
    static let reuseIdentifier = "ALChatBuddleTableViewCellIdentifier"
    
    enum MessageType {
        case user
        case bot
    }
    
    var messageType: MessageType = .bot {
        didSet {
            switch messageType {
            case .bot:
                self.messageLabel.textAlignment = .left
                self.leading?.isActive = true
                self.trailing?.isActive = false
            case .user:
                self.messageLabel.textAlignment = .right
                self.leading?.isActive = false
                self.trailing?.isActive = true
            }
        }
    }
    
    let messageLabel: UITextView = {
        let label = UITextView()
        label.text = "The quick brown fox jumped over the lazy dog la la la la la la la la la la"
        label.backgroundColor = UIColor(named: "Secondary")
        label.layer.cornerRadius = 8
        label.layer.masksToBounds = true
        label.isScrollEnabled = false
        label.textColor = .white
        label.textContainerInset = .init(top: 2, left: 8, bottom: 2, right: 8)
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    internal var leading: NSLayoutConstraint?
    internal var trailing: NSLayoutConstraint?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(messageLabel)
        
        leading = messageLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                        constant: 4)
        trailing = messageLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                          constant: -4)
        
        updateConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            messageLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6),
            messageLabel.widthAnchor.constraint(lessThanOrEqualTo: contentView.widthAnchor,
                                                multiplier: 0.8)
        ])
    }
}
