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
        addLongPressGesture()
    }
    
    func addTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
        circle.addGestureRecognizer(tap)
    }
    
    @objc func handleTapGesture(gesture: UITapGestureRecognizer) {
        if circle.transform == .identity {
            let transform = CGAffineTransform(translationX: .zero, y: 400)
            UIView.animate(withDuration: 0.36, delay: 0, options: .curveEaseOut) {
                self.circle.transform = transform
            }
        } else {
            UIView.animate(withDuration: 0.36) {
                self.circle.transform = .identity
            }
        }
    }
    
    func addLongPressGesture() {
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPressGesture))
        longPress.minimumPressDuration = 0.5
        circle.addGestureRecognizer(longPress)
    }
    
    @objc func handleLongPressGesture(gesture: UILongPressGestureRecognizer) {
        let transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        
        switch gesture.state {
        case .began, .changed:
            UIView.animate(withDuration: 0.36, delay: 0, options: .curveEaseOut) {
                self.circle.transform = transform
            }
        case .ended:
            UIView.animate(withDuration: 0.36, delay: 0, options: .curveEaseOut) {
                self.circle.transform = .identity
            }
        default:
            print("default")
        }
        
    }

}

