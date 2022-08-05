//
//  ViewController.swift
//  RandomAnimation
//
//  Created by Elenka on 04.08.2022.
//

import UIKit
import SpringAnimation

class ViewController: UIViewController {
    
    @IBOutlet weak var animationView: SpringView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var nextAnimationButton: UIButton!
    
    private var nextAnimation = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextAnimationButton.setTitle("run", for: .normal)
        animationView.layer.cornerRadius = 15
        nextAnimationButton.layer.cornerRadius = 15
    }
    
    @IBAction func nextAnimation(_ sender: UIButton) {
        
        if nextAnimation == "" {
            animationView.animation =
            "\(AnimationPreset.allCases.randomElement() ?? AnimationPreset.wobble)"
        } else {
            animationView.animation = "\(nextAnimation)"
        }
        
        animationView.curve =
        "\(AnimationCurve.allCases.randomElement() ?? AnimationCurve.easeInCirc)"
        animationView.force = CGFloat.random(in: 0.1...2.5)
        animationView.duration = CGFloat.random(in: 0.1...3.5)
        animationView.animate()
        
        nextAnimation =
        "\(AnimationPreset.allCases.randomElement() ?? AnimationPreset.wobble)"
        nextAnimationButton.setTitle(nextAnimation, for: .normal)
        
        descriptionLabel.text = String(format:  "animation options:\n\nanimation - \(animationView.animation)\ncurve - \(animationView.curve)\nforce - %.2f\nduration - %.2f", animationView.force, animationView.duration)
    }
}

