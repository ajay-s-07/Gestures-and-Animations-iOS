//
//  ViewController.swift
//  Gestures and Animations
//
//  Created by Ajay Sarkate on 02/08/23.
//

import UIKit

class ViewController: UIViewController {

    
    let circle = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        view.addSubview(circle)
        circle.backgroundColor = .systemGreen
        
        circle.translatesAutoresizingMaskIntoConstraints = false
        circle.heightAnchor.constraint(equalToConstant: 150).isActive = true
        circle.widthAnchor.constraint(equalToConstant: 150).isActive = true
        circle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        circle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        
        circle.layer.cornerRadius = 75
        
        addTapGesture()
    }
    
    func addTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
        circle.addGestureRecognizer(tap)
    }
    
    @objc func handleTapGesture(gesture: UITapGestureRecognizer) {
        print("Taped")
    }


}

