//
//  CWButton.swift
//  cardWorkoutCode
//
//  Created by Muktar Hussein on 25/10/2022.
//

import UIKit

class CWButton: UIButton {
    
    // we need to have initializers
    override init(frame: CGRect) {
        // this overides the ui button init
        // we call super so that we can get all normal settings from apple
        super.init(frame: frame)
        
        // we call so that our configs can be on this button
        configure()
    }
    // just leave it here
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // initialize the other buttons properties
    init(backgroundColor: UIColor, title: String){
        // anytime you initialize you need to call super
        super.init(frame: .zero) // the .zero puts zero on all the constraints x,y,w,h
        self.backgroundColor = backgroundColor
        setTitle(title, for: .normal)
        configure()
    }
    
    
    
    
    // configure buttons
    func configure(){
        // corners of buttons
        layer.cornerRadius = 9
        // setting title of button
        titleLabel?.font = .systemFont(ofSize: 19, weight: .bold)
        // title color
        setTitleColor(.white, for: .normal)
        // this means use auto layout
        translatesAutoresizingMaskIntoConstraints = false
        
    }
}
