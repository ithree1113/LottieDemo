//
//  ProgressViewController.swift
//  LottieDEMO
//
//  Created by EddieCheng on 2019/7/19.
//  Copyright © 2019 EddieCheng. All rights reserved.
//

import UIKit
import Lottie

class ProgressViewController: UIViewController {

    @IBOutlet weak var startSlider: UISlider! {
        didSet {
            startSlider.value = 0
            startSlider.maximumValue = 1
            startSlider.minimumValue = 0
        }
    }
    @IBOutlet weak var endSlider: UISlider! {
        didSet {
            endSlider.value = 1
            endSlider.maximumValue = 1
            endSlider.minimumValue = 0
        }
    }
    
    var animationView: AnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animationView = AnimationViewCreater.playOnView(view)
    }

    @IBAction func sliderDidChange(_ sender: UISlider) {
        animationView.play(fromProgress: CGFloat(startSlider.value), toProgress: CGFloat(endSlider.value))
    }
}
