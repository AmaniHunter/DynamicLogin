//
//  LoginViewController.swift
//  DynamicLogin
//
//  Created by Amani Hunter on 6/6/20.
//  Copyright © 2020 INAMA. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

let stack = UIStackView()
let titleLabel = UILabel()
let signInButton = UIButton()
let signUpButton = UIButton()
let videoView = UIView()

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVideoView()
        // Do any additional setup after loading the view.
    }
    
    func setupVideoView(){
        videoView.frame = view.bounds
        videoView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(videoView)
        videoView.backgroundColor = .brown
        
        let path = URL(fileURLWithPath: Bundle.main.path(forResource: "night", ofType: "mov")!)
        let player = AVPlayer(url: path)
        let newLayer = AVPlayerLayer(player: player)
        newLayer.frame = videoView.frame
        videoView.layer.addSublayer(newLayer)
        newLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        player.isMuted = true
        player.play()
        player.actionAtItemEnd = AVPlayer.ActionAtItemEnd.none
        
        NotificationCenter.default.addObserver(self, selector: #selector(videoDidPlayToEnd(_:)), name: NSNotification.Name("AVPlayerItemDidPlayToEndTimeNotification"), object: player.currentItem)
        
        videoView.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo:  view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo:  view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        titleLabel.text = "Insert App Name Here"
        titleLabel.textAlignment = .center
        titleLabel.textColor = .white
        titleLabel.font = .systemFont(ofSize: 30, weight: .heavy)
        titleLabel.numberOfLines = 1
        
        signInButton.addTarget(self, action: #selector(signIn), for: .touchUpInside)
        signInButton.setTitle("Log In", for: .normal)
        signInButton.frame = CGRect(x: 0, y: 0, width: 96, height: 60)
        signInButton.setTitleColor(.white, for: .normal)
        signInButton.widthAnchor.constraint(equalToConstant: 96).isActive = true
        signInButton.backgroundColor = .systemBlue
        signInButton.layer.cornerRadius = 7
        
        signUpButton.addTarget(self, action: #selector(signUp), for: .touchUpInside)
        signUpButton.setTitle("Create an Account", for: .normal)
        signUpButton.frame = CGRect(x: 0, y: 0, width: 100, height: 60)
        signUpButton.setTitleColor(.white, for: .normal)
        signUpButton.widthAnchor.constraint(equalToConstant: 190).isActive = true
        signUpButton.backgroundColor = .systemBlue
        signUpButton.layer.cornerRadius = 7
        
        videoView.addSubview(stack)
        stack.addArrangedSubview(signInButton)
        stack.addArrangedSubview(signUpButton)
        
        stack.axis = NSLayoutConstraint.Axis.vertical
        stack.distribution = UIStackView.Distribution.equalSpacing
        stack.alignment = UIStackView.Alignment.center
        stack.spacing = 65
        
        
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -95).isActive = true
        stack.frame = UIScreen.main.bounds
        stack.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor).isActive = true
        
        
    }
    @objc func videoDidPlayToEnd(_ notification: Notification){
        let player: AVPlayerItem = notification.object as! AVPlayerItem
        player.seek(to: CMTime.zero)
        
    }
    @objc func signIn(){
        print("Sign In pressed!")
        // Use this to push a view controller where a user can sign in.
    }
    @objc func signUp(){
        print("Sign Up pressed!")
        //Use this to push a view controller where a user can sign up.
    }
    
}
