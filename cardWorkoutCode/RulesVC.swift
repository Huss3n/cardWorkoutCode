//
//  RulesVC.swift
//  cardWorkoutCode
//
//  Created by Muktar Hussein on 25/10/2022.
//

import UIKit

class RulesVC: UIViewController {
    let titleLabel = UILabel()
    let ruleLabel = UILabel()
    let exerciseLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        editUI()
    }
    
    func editUI(){
        configureTitleLabel()
        configureRulesLabel()
        configureExerciseLabel()
    }
    
    
    func configureTitleLabel(){
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Rules"
        titleLabel.font = .systemFont(ofSize: 40, weight: .bold)
        titleLabel.textAlignment = .center
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
        ])
    }
    
    func configureRulesLabel(){
        view.addSubview(ruleLabel)
        ruleLabel.translatesAutoresizingMaskIntoConstraints = false
        ruleLabel.text = "The value of each card represents the number of exercise you do.\n\nJ = 11, Q = 12, K = 13, A = 14"
        ruleLabel.font = .systemFont(ofSize: 19, weight: .semibold)
        ruleLabel.textAlignment = .center
        ruleLabel.lineBreakMode = .byWordWrapping
        ruleLabel.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            ruleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 25),
            ruleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            ruleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
    }
    func configureExerciseLabel(){
        view.addSubview(exerciseLabel)
        exerciseLabel.translatesAutoresizingMaskIntoConstraints = false
        exerciseLabel.text = "♠️ = Push-ups\n\n❤️ = Sit-up\n\n♣️ = Weights\n\n♦️ = Trademill"
        exerciseLabel.font = .systemFont(ofSize: 19, weight: .semibold)
        exerciseLabel.textAlignment = .center
        exerciseLabel.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            exerciseLabel.topAnchor.constraint(equalTo: ruleLabel.bottomAnchor, constant: 60),
            exerciseLabel.widthAnchor.constraint(equalToConstant: 200),
            exerciseLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

}
