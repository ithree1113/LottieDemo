//
//  SpeedViewController.swift
//  LottieDEMO
//
//  Created by EddieCheng on 2019/7/16.
//  Copyright © 2019 EddieCheng. All rights reserved.
//

import UIKit
import Lottie

class SpeedViewController: UIViewController {

    @IBOutlet weak var speedSlider: UISlider! {
        didSet {
            speedSlider.value = 1
            speedSlider.maximumValue = 5
            speedSlider.minimumValue = 0.1
        }
    }
    var animationView: AnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animationView = AnimationViewCreater.playOnView(view)
        initAnimationBtn()
    }
    
    fileprivate func initAnimationBtn() {
        let btn = AnimatedButton()
        let animation = Animation.named("433-checked-done")
        btn.animation = animation
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(animationBtnDidTapped(_:)), for: .touchUpInside)
        view.addSubview(btn)
        btn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        btn.centerYAnchor.anchorWithOffset(to: view.centerYAnchor).constraint(equalTo: view.heightAnchor, multiplier: -0.3).isActive = true
    }
    
    @IBAction func sliderDidChange(_ sender: UISlider) {
        animationView.animationSpeed = CGFloat(sender.value)
    }
    
    @objc func animationBtnDidTapped(_ sender: AnimatedButton) {
        if sender.isSelected {
            animationView.play()
            sender.isSelected = false
            sender.setPlayRange(fromProgress: 0, toProgress: 1, event: .touchUpInside)
        } else {
            animationView.pause()
            sender.isSelected = true
            sender.setPlayRange(fromProgress: 1, toProgress: 0, event: .touchUpInside)
        }
    }
}
