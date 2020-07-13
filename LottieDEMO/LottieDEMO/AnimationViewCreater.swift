//
//  AnimationViewCreater.swift
//  LottieDEMO
//
//  Created by EddieCheng on 2019/7/18.
//  Copyright © 2019 EddieCheng. All rights reserved.
//

import UIKit
import Lottie

class AnimationViewCreater {
    @discardableResult
    static func playOnView(_ view: UIView) -> AnimationView {
        let animationView = AnimationView(name: "servishero_loading")
        animationView.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
        animationView.center = view.center
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        
        view.addSubview(animationView)
        
        animationView.play()
        
        return animationView
    }
}
