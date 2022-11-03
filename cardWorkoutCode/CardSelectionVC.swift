//
//  CardSelectionVC.swift
//  cardWorkoutCode
//
//  Created by Muktar Hussein on 25/10/2022.
//

import UIKit

class CardSelectionVC: UIViewController {
    
    let cardImageView  = UIImageView()
    let stopButton     = CWButton(backgroundColor: .systemRed, title: "Stop!")
    let restartButton  = CWButton(backgroundColor: .systemGreen, title: "Restart")
    let rulesButton    = CWButton(backgroundColor: .systemBlue, title: "Rules")
    
    var cards          = deck.allValues
    
    var timer : Timer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUI()
        startTimer()
    }
    
    // function that configures our ui
    func configureUI(){
        configureCardImageView()
        configureStopButton()
        configureRestartButton()
        configureRulesButton()
    }
    
    // configuration specific to our card image view
    func configureCardImageView(){
        // the first thing you need to do is
        view.addSubview(cardImageView) // is like adding the image view by draging in storyboards
        cardImageView.translatesAutoresizingMaskIntoConstraints = false // use autolayout on this object
        cardImageView.image = UIImage(named: "AS") // adding an image
        
        // giving programatic constraints
        NSLayoutConstraint.activate([
            // setting width and height
            cardImageView.widthAnchor.constraint(equalToConstant: 250),
            cardImageView.heightAnchor.constraint(equalToConstant: 350),
            
            // setting x and y axis
            cardImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),// adding it to the x of the view
            cardImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -75)
        ])
    }
    
    func configureStopButton(){
        view.addSubview(stopButton) // same as dragging the button to view in storyboard
        NSLayoutConstraint.activate([
            stopButton.widthAnchor.constraint(equalToConstant: 260),
            stopButton.heightAnchor.constraint(equalToConstant: 50),
            stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stopButton.centerYAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: 50)
        ])
        stopButton.addTarget(self, action: #selector(stopTimer), for: .touchUpInside)
    }
    
    func configureRestartButton(){
        view.addSubview(restartButton)
        
        NSLayoutConstraint.activate([
            restartButton.widthAnchor.constraint(equalToConstant: 115),
            restartButton.heightAnchor.constraint(equalToConstant: 50),
            restartButton.leadingAnchor.constraint(equalTo: stopButton.leadingAnchor),// on the left of the stop button
            restartButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20) // bottom of stop button
        ])
        restartButton.addTarget(self, action: #selector(stopRestart), for: .touchUpInside)
    }
    // creating the segue
    func configureRulesButton(){
        view.addSubview(rulesButton)
        rulesButton.addTarget(self, action: #selector(presentRulesVC), for: .touchUpInside)// presents the next view like a segue
        
        NSLayoutConstraint.activate([
            rulesButton.widthAnchor.constraint(equalToConstant: 115),
            rulesButton.heightAnchor.constraint(equalToConstant: 50),
            rulesButton.trailingAnchor.constraint(equalTo: stopButton.trailingAnchor),// on the left of the stop button
            rulesButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20) // bottom of stop button
        ])
    }
    
    @objc func presentRulesVC(){
        present(RulesVC(), animated: true)
    }
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomCards), userInfo: nil, repeats: true)
    }
    
    @objc func showRandomCards(){
        cardImageView.image = cards.randomElement()
    }
    @objc func stopTimer(){
        timer.invalidate()
    }
    @objc func stopRestart(){
        timer.invalidate()
        startTimer()
    }
    
}
