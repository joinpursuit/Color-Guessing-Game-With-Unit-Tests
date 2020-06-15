//
//  ViewController.swift
//  ColorGuessingAppWithTesting
//
//  Created by Benjamin Stone on 6/15/20.
//  Copyright © 2020 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var targetColorView: UIView!
    
    @IBOutlet var colorButtonOne: UIButton!
    @IBOutlet var colorButtonTwo: UIButton!
    @IBOutlet var colorButtonThree: UIButton!
    
    var brain: ColorGuessingBrain! {
        didSet {
            let colors = brain.colorOptions.shuffled()
            colorButtonOne.backgroundColor = colors[0]
            colorButtonTwo.backgroundColor = colors[1]
            colorButtonThree.backgroundColor = colors[2]
            targetColorView.backgroundColor = brain.targetColor
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        brain = ColorGuessingBrain()
    }

    @IBAction func colorGuessed(_ sender: UIButton) {
        let color = sender.backgroundColor!
        
        let title: String
        let message: String
        if brain.guess(color: color) {
            title = "Hooray!"
            message = "You win!"
        } else {
            title = "Oh No!"
            message = "You lose!"
        }
        let alertVC = UIAlertController(title: title, message:message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .default) { _ in self.brain = ColorGuessingBrain() } )
        present(alertVC, animated: true)
    }
    
}

