//
//  ColorViewController.swift
//  LottieDEMO
//
//  Created by EddieCheng on 2019/7/16.
//  Copyright © 2019 EddieCheng. All rights reserved.
//

import UIKit
import Lottie

class ColorViewController: UIViewController {

    @IBOutlet weak var colorSegment: UISegmentedControl! {
        didSet {
            colorSegment.setTitle("Red", forSegmentAt: 0)
            colorSegment.setTitle("Blue", forSegmentAt: 1)
            colorSegment.setTitle("Green", forSegmentAt: 2)
        }
    }
    var animationView: AnimationView!
    let colorProvider: [ColorValueProvider] = [ColorValueProvider(Color(r: 1, g: 0.2, b: 0.3, a: 1)), ColorValueProvider(Color(r: 0, g: 0, b: 1, a: 1)),
                                               ColorValueProvider(Color(r: 0.2, g: 1, b: 0.3, a: 1))]
    let colorKeyPath = [AnimationKeypath(keypath: "step_1.Shape 3.Fill 1.Color"), AnimationKeypath(keypath: "step_1.Shape 1.Fill 1.Color"),
                        AnimationKeypath(keypath: "step_3.Shape 9.Fill 1.Color"), AnimationKeypath(keypath: "step_4.Shape 1.Fill 1.Color"),
                        AnimationKeypath(keypath: "step_4.Rectangle 2.Fill 1.Color"), AnimationKeypath(keypath: "step_6.Shape 2.Fill 1.Color"),
                        AnimationKeypath(keypath: "main Shape.Small_circle.Fill 1.Color"), AnimationKeypath(keypath: "main Shape.Base.Fill 1.Color")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animationView = AnimationViewCreater.playOnView(view)
        animationView.logHierarchyKeypaths()
        colorKeyPath.forEach({ animationView.setValueProvider(colorProvider[0], keypath: $0) })
    }
    
    @IBAction func colorSegmentDidChange(_ sender: UISegmentedControl) {
        colorKeyPath.forEach({ animationView.setValueProvider(colorProvider[sender.selectedSegmentIndex], keypath: $0) })
    }
}
