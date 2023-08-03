//
//  ViewController.swift
//  Gestures and Animations
//
//  Created by Ajay Sarkate on 02/08/23.
//

import UIKit

class ViewController: UIViewController {
    
    var differenceX: CGFloat = .zero
    var differenceY: CGFloat = .zero
    
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
//        addPanGesture()
    }
    
    func addTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
        circle.addGestureRecognizer(tap)
    }
    
    @objc func handleTapGesture(gesture: UITapGestureRecognizer) {
        if circle.transform == .identity {
//            let transform = CGAffineTransform(translationX: .zero, y: 400)
//            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [.curveEaseOut]) {
//                self.circle.transform = transform
//            }
            print("")
        } else {
            UIView.animate(withDuration: 0.36) {
                self.circle.transform = .identity
            }
        }
    }
    
    func addLongPressGesture() {
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPressGesture))
        longPress.minimumPressDuration = 0.2
        circle.addGestureRecognizer(longPress)
    }
    
    @objc func handleLongPressGesture(gesture: UILongPressGestureRecognizer) {
        
        let location = gesture.location(in: self.view)
        let location1 = gesture.location(in: gesture.view)
        
        let scale = CGAffineTransform(scaleX: 1.25, y: 1.25)
        
        switch gesture.state {
        case .began:
            UIView.animate(withDuration: 0.36, delay: 0, options: .curveEaseOut) {
                self.circle.transform = scale
            }
            differenceX = 75 - location1.x
            differenceY = 75 - location1.y
        case .changed:
            let x = (location.x - circle.center.x) + differenceX
            let y = (location.y - circle.center.y) + differenceY
            let translation = CGAffineTransform(translationX: x, y: y)
            let transform = scale.concatenating(translation)
            
            self.circle.transform = transform
        case .ended:
            UIView.animate(withDuration: 0.36, delay: 0, options: .curveEaseOut) {
                self.circle.transform = .identity
            }
        default:
            print("default")
        }
        
    }
    
    func addPanGesture() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture))
        circle.addGestureRecognizer(panGesture)
    }

    @objc func handlePanGesture(gesture: UIPanGestureRecognizer) {

        let translation = gesture.translation(in: gesture.view!)

        switch gesture.state {
        case .began, .changed:
            let transform = CGAffineTransform(translationX: translation.x, y:  translation.y)
            circle.transform = transform
        case .ended:
//            UIView.animate(withDuration: 0.36, delay: 0, options: .curveEaseOut) {
//                self.circle.transform = .identity
//            }
            print("")
        default:
            print("Pan Gesture")
        }
    }

}

