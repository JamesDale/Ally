//
//  VideoCallViewController.swift
//  Ally
//
//  Created by James Dale on 14/10/20.
//

import Foundation
import UIKit
import AVFoundation
import AVKit

final class VideoCallViewController: UIViewController {
    
    let videoPlayer: AVPlayer = {
        let url = Bundle.main.url(forResource: "nurse", withExtension: "mov")!
        let player = AVPlayer(url: url)
        
        return player
    }()
    
    let endButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "phone.down.fill"), for: .normal)
        btn.backgroundColor = .red
        btn.layer.cornerRadius = 20
        btn.contentEdgeInsets = .init(top: 8, left: 8, bottom: 8, right: 8)
        btn.tintColor = .white
        return btn
    }()
        
    init() {
        super.init(nibName: nil, bundle: nil)
        
        let playerLayer = AVPlayerLayer(player: videoPlayer)
        playerLayer.frame = view.frame
        playerLayer.videoGravity = .resizeAspectFill
        
        view.layer.addSublayer(playerLayer)
        
        view.addSubview(endButton)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        videoPlayer.play()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        endButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            endButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            endButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                                              constant: -20)
        ])
    }
    
    
}
