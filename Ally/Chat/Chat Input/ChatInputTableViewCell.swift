//
//  ChatInputTableViewCell.swift
//  Ally
//
//  Created by James Dale on 7/10/20.
//

import Foundation
import UIKit

final class ChatInputTableViewCell: UITableViewCell {
    static let reuseIdentifier = "ChatInputTableViewCellIdentifier"
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Option"
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor(named: "Primary")
        contentView.layer.cornerRadius = 12
        contentView.addSubview(titleLabel)
        updateConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                 constant: -8),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
}
