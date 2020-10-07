//
//  ViewController.swift
//  Ally
//
//  Created by James Dale on 6/10/20.
//

import UIKit

final class ChatViewController: UIViewController {
    
    private let tableViewController = ALChatTableViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addChild(tableViewController)
    }


}

