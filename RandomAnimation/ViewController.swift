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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func nextAnimation(_ sender: UIButton) {
        animationView.animation = "\(AnimationPreset.allCases.randomElement() ?? AnimationPreset.wobble)"
        animationView.curve = "\(AnimationCurve.allCases.randomElement() ?? AnimationCurve.easeInCirc)"
        animationView.force = CGFloat.random(in: 0.1...2.0)
        animationView.duration = CGFloat.random(in: 0.1...3.0)
        animationView.animate()
        
        descriptionLabel.text = "options animation:\n\nanimation - \(animationView.animation)\ncurve - \(animationView.curve)\nforce - \(animationView.force)\nduration - \(animationView.duration)"
    }
}

