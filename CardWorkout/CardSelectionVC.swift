//
//  CardSelectionVC.swift
//  CardWorkout
//
//  Created by Zeeshan Waheed on 26/12/2023.
//

import UIKit

class CardSelectionVC: UIViewController {
//  creating outlets such that we can use variables later
    @IBOutlet var cardImageView: UIImageView!
    @IBOutlet var buttons: [UIButton]!
    // variable that contains an array containing all card images
    var cards: [UIImage] = Card.allValues
    
    // initialising a timer variable
    var timer: Timer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // starting the timer when the app runs
        startTimer()
        
        // setting button radius such that all buttons have smooth edges
        for button in buttons {
            button.layer.cornerRadius = 8
        }
    }
    
     
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // make sure to invalidate or else it will always be running in the background
        timer.invalidate()
    }

    // function used to start timer and changes card in image section after every .1 seconds
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomImage), userInfo: nil, repeats: true)
    }
    
    // selects a random image to be shown
    @objc func showRandomImage() {
        cardImageView.image = cards.randomElement() ?? UIImage(named: "AS")
        
    }
    
    // stops the continous changing of cards
    @IBAction func stopButtonTapped(_ sender: Any) {
        // this is what stops the timer
        timer.invalidate()
    }
    
    // stars the timer
    @IBAction func restartButtonTapped(_ sender: Any) {
        // this is what stops the timer
        timer.invalidate()
        
        startTimer()
    }
    
    // used to show the rules section modally
    @IBAction func rulesButtonTapped(_ sender: Any) {
    }
}
